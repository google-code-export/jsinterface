package aw.external.jsinterface.flobject{
	import aw.utils.PropertyInspector;
	import aw.utils.propertyinspector.PropertyAccessType;
	import aw.utils.propertyinspector.PropertyInspectorItem;
	import aw.utils.propertyinspector.PropertyItem;
	import aw.utils.propertyinspector.static_ns;
	
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	
	public class FLObjectCommands extends Object{
		static public const AS_SIMPLE:String = 'asSimple';
		static public const PROPERTY_LIST:String = 'propertyList';
		static public const METHOD_LIST:String = 'methodList';
		static public const CLASS_NAME:String = 'describeType';
		static public const DESCRIBE_TYPE:String = 'className';
		static public const SUPER_CLASS_NAME:String = 'superClassName';
		static public function callCommand(obj:Object, cmd:String, args:Array=null):*{
			var val:*;
			if(cmd==AS_SIMPLE){
				val = asSimple(obj);
			}else if(cmd==PROPERTY_LIST){
				val = propertyList(obj, (args && args[0]) ? args[0] : '');
			}else if(cmd==METHOD_LIST){
				val = methodList(obj);
			}else if(cmd==DESCRIBE_TYPE){
				val = FLObjectCommands.describeType(obj);
			}else if(cmd==CLASS_NAME){
				val = className(obj);
			}else if(cmd==SUPER_CLASS_NAME){
				val = superClassName(obj);
			}else{
				val = undefined;
			}
			return val;
		}
		static public function asSimple(obj:Object):Object{
			return obj;
		}
		static public const READWRITE_TYPE:String = 'rw';
		static public const READONLY_TYPE:String = 'r';
		static public const WRITEONLY_TYPE:String = 'w';
		static public const DYNAMIC_TYPE:String = 'd';
		static public function propertyList(obj:Object, access:String=''):Array{
			var pi:PropertyInspectorItem = PropertyInspector.getInfo(obj);
			var f:Function = obj is Class ? pi.static_ns::getProperties : pi.getProperties;
			var ret:Array = new Array();
			if(!access){
				getPropNames(f(PropertyAccessType.READWRITE), ret);
				getDynamicNames(obj, ret);
			}else{
				if(access==READWRITE_TYPE){
					getPropNames(f(PropertyAccessType.READWRITE), ret);
				}else if(access==READONLY_TYPE){
					getPropNames(f(PropertyAccessType.READONLY), ret);
				}else if(access==WRITEONLY_TYPE){
					getPropNames(f(PropertyAccessType.WRITEONLY), ret);
				}else{
					getDynamicNames(obj, ret);
				}
			}
			return ret;
		}
		static private function getDynamicNames(obj:Object, ret:Array=null):Array{
			if(!ret) ret = new Array();
			for(var p:String in obj){
				ret.push({uri:'', localName:p});
			}
			return ret;
		}
		static private function getPropNames(arr:Array, ret:Array=null):Array{
			if(!ret) ret = new Array();
			var len:int = arr.length;
			var item:QName;
			for(var i:int=0; i<len; i++){
				item = (arr[i] as PropertyItem).name;
				ret.push({uri:item.uri, localName:item.localName});
			}
			return ret;
		}
		static public function methodList(obj:Object):Array{
			var pi:PropertyInspectorItem = PropertyInspector.getInfo(obj);
			var ret:Array = new Array();
			var arr:Array = obj is Class ? pi.static_ns::methods : pi.methods;
			var len:int = arr.length;
			var item:QName;
			for(var i:int=0; i<len; i++){
				item = (arr[i] as PropertyItem).name;
				ret.push({uri:item.uri, localName:item.localName});
			}
			return ret;
		}
		static public function describeType(obj:Object):String{
			return flash.utils.describeType(obj).toXMLString();
		}
		static public function className(obj:Object):String{
			return getQualifiedClassName(obj);
		}
		static public function superClassName(obj:Object):String{
			return getQualifiedSuperclassName(obj);
		}
	}
}