package aw.utils.propertyinspector{
	import aw.data.*;
	
	import flash.utils.*;
	public class PropertyInspectorItem extends Object{
		static public const VAR_NODE_NAME:String = 'variable';
		static public const CONST_NODE_NAME:String = 'constant';
		static public const GETSET_NODE_NAME:String = 'accessor';
		static public const METHOD_NODE_NAME:String = 'method';
		static public const PROTOTYPE_NODE_NAME:String = 'factory';
		static public const NAME_ATTR_NAME:String = 'name';
		static public const ACCESS_ATTR_NAME:String = 'access';
		static public const TYPE_ATTR_NAME:String = 'type';
		static public const URI_ATTR_NAME:String = 'uri';
		static public const RETURNTYPE_ATTR_NAME:String = 'returnType';
		static public const VOID_RETURN_TYPE_NAME:String = 'void';
		static public const ANY_RETURN_TYPE_NAME:String = '*';
		static public const READ_VALUE:String = 'readonly';
		static public const WRITE_VALUE:String = 'writeonly';
		static public const READWRITE_VALUE:String = 'readwrite';
		protected var _isDynamic:Boolean;
		protected var _names:Object;
		protected var _properties:Array;
		protected var _methods:Array;
		protected var _staticNames:Object;
		protected var _staticProperties:Array;
		protected var _staticMethods:Array;
		public function PropertyInspectorItem(o:Class):void{
			super();
			_names = new Object();
			_properties = new Array();
			_methods = new Array();
			_staticNames = new Object();
			_staticProperties = new Array();
			_staticMethods = new Array();
			saveInfo(o);
		}
		public function get isDynamic():Boolean{
			return this._isDynamic;
		}
		public function get properties():Array{
			return this._properties.concat();
		}
		static_ns function get properties():Array{
			return this._staticProperties.concat();
		}
		public function getByName(name:*):PropertyItem{
			return this._names[String(name)];
		}
		static_ns function getByName(name:*):PropertyItem{
			return this._staticNames[String(name)];
		}
		public function isExists(name:*):Boolean{
			return (String(name) in this._names);
		}
		static_ns function isExists(name:*):Boolean{
			return (String(name) in this._staticNames);
		}
		public function isProperty(name:*):Boolean{
			var prop:PropertyItem = this._names[String(name)];
			return (prop && prop.access!=PropertyAccessType.METHOD);
		}
		static_ns function isProperty(name:*):Boolean{
			var prop:PropertyItem = this._staticNames[String(name)];
			return (prop && prop.access!=PropertyAccessType.METHOD);
		}
		public function getProperties(acc:int=-1):Array{
			return this.propertiesByAccess(this._properties, acc);
		}
		static_ns function getProperties(acc:int=-1):Array{
			return this.propertiesByAccess(this._staticProperties, acc);
		}
		protected function propertiesByAccess(arr:Array, acc:int=-1):Array{
			var ret:Array;
			if(acc<0){
				ret = arr.concat();
			}else{
				var len:int = arr.length;
				ret = new Array();
				var item:PropertyItem;
				for(var i:int=0; i<len; i++){
					item = arr[i] as PropertyItem;
					if(item.access==acc) ret.push(item);
				}
			}
			return ret;
		}
		public function getPropertiesByContainer(cont:int=-1):Array{
			return this.propertiesByContainer(this._properties, cont);
		}
		static_ns function getPropertiesByContainer(cont:int=-1):Array{
			return this.propertiesByContainer(this._staticProperties, cont);
		}
		protected function propertiesByContainer(arr:Array, cont:int=-1):Array{
			var ret:Array;
			if(cont<0){
				ret = arr.concat();
			}else{
				var len:int = arr.length;
				ret = new Array();
				var item:PropertyItem;
				for(var i:int=0; i<len; i++){
					item = arr[i] as PropertyItem;
					if(item.container==cont) ret.push(item);
				}
			}
			return ret;
		}
		public function getPropertiesByType(cls:Class):Array{
			return this.propertiesByType(this._properties, cls);
		}
		static_ns function getPropertiesByType(cls:Class):Array{
			return this.propertiesByType(this._staticProperties, cls);
		}
		protected function propertiesByType(arr:Array, cls:Class):Array{
			var len:int = arr.length;
			var ret:Array = new Array();
			var item:PropertyItem;
			for(var i:int=0; i<len; i++){
				item = arr[i] as PropertyItem;
				if(item.type==cls) ret.push(item);
			}
			return ret;
		}
		public function getMethodsByType(cls:Class):Array{
			return this.methodsByType(this._methods, cls);
		}
		static_ns function getMethodsByType(cls:Class):Array{
			return this.methodsByType(this._staticMethods, cls);
		}
		protected function methodsByType(arr:Array, cls:Class):Array{
			var len:int = arr.length;
			var ret:Array = new Array();
			var item:PropertyItem;
			for(var i:int=0; i<len; i++){
				item = arr[i] as PropertyItem;
				if(item.type==cls) ret.push(item);
			}
			return ret;
		}
		public function get methods():Array{
			return this._methods.concat();
		}
		static_ns function get methods():Array{
			return this._staticMethods.concat();
		}
		protected function saveInfo(o:Class):void{
			var x:XML = describeType(o);
			this._isDynamic = BasicValue.expectsBoolean(x.@isDynamic);
			saveInfoTo(x, this._staticNames, this._staticProperties, this._staticMethods);
			saveInfoTo(x.factory[0], this._names, this._properties, this._methods);
		}
		static protected function saveInfoTo(x:XML, names:Object, properties:Array, methods:Array):void{
			var types:Object = PropertyAccessType.TYPES;
			var item:PropertyItem;
			x.variable.(item = new PropertyItem(attribute(NAME_ATTR_NAME), getDefinition(attribute(TYPE_ATTR_NAME)), types[attribute(ACCESS_ATTR_NAME)], PropertyContainerType.VARIABLE, String(attribute(URI_ATTR_NAME))), names[String(item.name)] = item, properties.push(item));
			x.accessor.(item = new PropertyItem(attribute(NAME_ATTR_NAME), getDefinition(attribute(TYPE_ATTR_NAME)), types[attribute(ACCESS_ATTR_NAME)], PropertyContainerType.ACCESSOR, String(attribute(URI_ATTR_NAME))), names[String(item.name)] = item, properties.push(item));
			x.constant.(item = new PropertyItem(attribute(NAME_ATTR_NAME), getDefinition(attribute(TYPE_ATTR_NAME)), PropertyAccessType.READONLY, PropertyContainerType.CONSTANT, String(attribute(URI_ATTR_NAME))), names[String(item.name)] = item, properties.push(item));
			x.method.(item = new PropertyItem(attribute(NAME_ATTR_NAME), getDefinition(attribute(RETURNTYPE_ATTR_NAME)), PropertyAccessType.METHOD, PropertyContainerType.METHOD, String(attribute(URI_ATTR_NAME))), names[String(item.name)] = item, methods.push(item));
			/*
			var types:Object = PropertyAccessType.TYPES;
			var i:int;
			var node:XML;
			var name:String;
			var item:PropertyItem;
			var xlist:XMLList = x.variable;
			var prop:int = PropertyContainerType.VARIABLE;
			var len:int = xlist.length();
			for(i=0; i<len; i++){
				node = xlist[i];
				name = node.@name;
				item = new PropertyItem(name, getDefinition(node.@type), types[node.@access], prop, String(node.@uri));
				names[String(item.name)] = item;
				properties.push(item);
			}
			xlist = x.accessor;
			prop = PropertyContainerType.ACCESSOR;
			len = xlist.length();
			for(i=0; i<len; i++){
				node = xlist[i];
				name = node.@name;
				item = new PropertyItem(name, getDefinition(node.@type), types[node.@access], prop, String(node.@uri));
				names[String(item.name)] = item;
				properties.push(item);
			}
			xlist = x.constant;
			prop = PropertyContainerType.CONSTANT;
			len = xlist.length();
			for(i=0; i<len; i++){
				node = xlist[i];
				name = node.@name;
				item = new PropertyItem(name, getDefinition(node.@type), PropertyAccessType.READONLY, prop, String(node.@uri));
				names[String(item.name)] = item;
				properties.push(item);
			}
			xlist = x.method;
			prop = PropertyContainerType.METHOD;
			len = xlist.length();
			var type:String;
			for(i=0; i<len; i++){
				node = xlist[i];
				name = node.@name;
				type = node.@returnType;
				item = new PropertyItem(name, getDefinition(type), PropertyAccessType.METHOD, prop, String(node.@uri));
				names[String(item.name)] = item;
				methods.push(item);
			}
			*/
		}
		static protected function getDefinition(str:String):Class{
			if(str==VOID_RETURN_TYPE_NAME) return undefined;
			else if(str==ANY_RETURN_TYPE_NAME) return Object;
			else return getDefinitionByName(str) as Class;
		}
	}
}