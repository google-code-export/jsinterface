package aw.utils{
	import aw.utils.propertyinspector.*;
	
	import flash.display.*;
	import flash.geom.*;
	import flash.utils.*;
	public final class PropertyInspector extends Object{
		static public const OBJECT_NULL_ERROR:String = 'Object is NULL.';
		static protected var _types:Dictionary = new Dictionary();
		static public function getInfo(o:Object):PropertyInspectorItem{
			if(!o) throw new Error(OBJECT_NULL_ERROR);
			var pii:PropertyInspectorItem;
			var cls:Class = (o is Class) ? o as Class : o.constructor;
			if(!(cls in _types)) _types[cls] = new PropertyInspectorItem(cls);
			pii = _types[cls];
			return pii;
		}
		static public function getProperties(o:Object, acc:int=-1):Array{
			if(!o) throw new Error(OBJECT_NULL_ERROR);
			var pii:PropertyInspectorItem = getInfo(o);
			return (o is Class) ? pii.static_ns::getProperties(acc) : pii.getProperties(acc);
		}
		static public function getByName(o:Object, name:*):PropertyItem{
			if(!o) throw new Error(OBJECT_NULL_ERROR);
			var pii:PropertyInspectorItem = getInfo(o);
			var pi:PropertyItem = pii.getByName(name);
			return Boolean(pi) ? pi : pii.static_ns::getByName(name);
		}
		static public function isExists(o:Object, name:*):Boolean{
			if(!o) throw new Error(OBJECT_NULL_ERROR);
			var pii:PropertyInspectorItem = getInfo(o);
			return (pii.static_ns::isExists(name) || pii.isExists(name));
		}
		static public function isProperty(o:Object, name:*):Boolean{
			if(!o) throw new Error(OBJECT_NULL_ERROR);
			var pii:PropertyInspectorItem = getInfo(o);
			return (pii.static_ns::isProperty(name) || pii.isProperty(name));
		}
		static public function getPropertiesByContainer(o:Object, cont:int=-1):Array{
			if(!o) throw new Error(OBJECT_NULL_ERROR);
			var pii:PropertyInspectorItem = getInfo(o);
			return (o is Class) ? pii.static_ns::getPropertiesByContainer(cont) : pii.getPropertiesByContainer(cont);
		}
		static public function getPropertiesByType(o:Object, type:Class):Array{
			if(!o) throw new Error(OBJECT_NULL_ERROR);
			var pii:PropertyInspectorItem = getInfo(o);
			return (o is Class) ? pii.static_ns::getPropertiesByType(type) : pii.getPropertiesByType(type);
		}
		static public function getMethods(o:Object):Array{
			if(!o) throw new Error(OBJECT_NULL_ERROR);
			var pii:PropertyInspectorItem = getInfo(o);
			return (o is Class) ? pii.static_ns::methods : pii.methods;
		}
		static public function getMethodsByType(o:Object, type:Class):Array{
			if(!o) throw new Error(OBJECT_NULL_ERROR);
			var pii:PropertyInspectorItem = getInfo(o);
			return (o is Class) ? pii.static_ns::getMethodsByType(type) : pii.getMethodsByType(type);
		}
		static public function save(obj:Object, type:Class=null):Object{
			var ret:Object = {};
			var arr:Array = getProperties(obj);
			var len:int = arr.length;
			var name:QName;
			var prop:PropertyItem;
			for(var i:int=0; i<len; i++){
				prop = arr[i] as PropertyItem;
				name = prop.name;
				if((prop.access == PropertyAccessType.READWRITE || prop.access == PropertyAccessType.READONLY) && (!type || prop.type==type)){
					ret[String(name)] = obj[name];
				}
			}
			return ret;
		}
		static public function intersect(obj1:Object, obj2:Object, type:Class=null):Object{
			if(!obj1 || !obj2) throw new Error(OBJECT_NULL_ERROR);
			var ret:Object = new Object();
			var arr:Array = compatible(obj1, obj2);
			var len:int = arr.length;
			var name:QName;
			var prop:PropertyItem;
			var val1:*;
			var val2:*;
			for(var i:int=0; i<len; i++){
				prop = arr[i] as PropertyItem;
				if(!type || (type && prop.type==type)){
					name = prop.name;
					val1 = obj1[name];
					val2 = obj2[name];
					if(val1==val2) ret[name] = val1;
				}
			}
			return ret;
		}
		static public function difference(obj1:Object, obj2:Object, type:Class=null):Object{
			if(!obj1 || !obj2) throw new Error(OBJECT_NULL_ERROR);
			var ret:Object = new Object();
			var arr:Array = compatible(obj1, obj2);
			var len:int = arr.length;
			var name:QName;
			var prop:PropertyItem;
			var val1:*;
			var val2:*;
			for(var i:int=0; i<len; i++){
				prop = arr[i] as PropertyItem;
				if(!type || (type && prop.type==type)){
					name = prop.name;
					val1 = obj1[name];
					val2 = obj2[name];
					if(val1!=val2) ret[name] = val1;
				}
			}
			return ret;
		}
		static public function invert(obj1:Object, obj2:Object, type:Class=null, names:Array=null):void{
			if(!obj1 || !obj2) throw new Error(OBJECT_NULL_ERROR);
			var i:int;
			var val1:*;
			var val2:*;
			var len:int;
			var name:QName;
			var prop:PropertyItem;
			var noNames:Object = {};
			if(names){
				len = names.length;
				for(i=0; i<len; i++) noNames[String(names[i])] = true;
			}
			var tempNames:Array = [];
			var tempValues:Array = [];
			var arr:Array = compatible(obj1, obj2);
			len = arr.length;
			for(i=0; i<len; i++){
				prop = arr[i] as PropertyItem;
				name = prop.name;
				if((!type || (type && prop.type==type)) && !(String(name) in noNames)){
					tempNames.push(name);
					tempValues.push(obj1[name]);
					obj1[name] = obj2[name];
				}
			}
			len = tempNames.length;
			for(i=0; i<len; i++){
				obj2[tempNames[i]] = tempValues[i];
			}
		}
		static public function compatible(obj1:Object, obj2:Object):Array{
			if(!obj1 || !obj2) throw new Error(OBJECT_NULL_ERROR);
			var ret:Array = new Array();
			var arr:Array = getProperties(obj1);
			var len:int = arr.length;
			var prop1:PropertyItem;
			var prop2:PropertyItem;
			for(var i:int=0; i<len; i++){
				prop1 = arr[i] as PropertyItem;
				prop2 = getByName(obj2, prop1.name);
				if(prop2 && 
					prop1.access == PropertyAccessType.READWRITE && 
					prop2.access == PropertyAccessType.READWRITE && 
					prop1.type==prop2.type
				){
					ret.push(prop1);
				}
			}
			return ret;
		}
		static public function incompatible(obj1:Object, obj2:Object):Array{
			if(!obj1 || !obj2) throw new Error(OBJECT_NULL_ERROR);
			var ret:Array = new Array();
			var temp:Object = {};
			var arr:Array = getProperties(obj1).concat(getProperties(obj2));
			var len:int = arr.length;
			var name:String;
			var prop:PropertyItem;
			for(var i:int=0; i<len; i++){
				prop = arr[i] as PropertyItem;
				if(prop.access!=PropertyAccessType.READWRITE) continue;
				name = String(prop.name);
				if(!(name in temp)){
					temp[name] = prop;
					ret.push(prop);
				}
			}
			return ret;
		} 
	}
}