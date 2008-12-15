package aw.utils.propertyinspector{
	import aw.data.*;
	
	import flash.utils.*;
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class PropertyInspectorItem extends Object{
		/** 
		* 
		* @public (constant) 
		*/
		static public const VAR_NODE_NAME:String = 'variable';
		/** 
		* 
		* @public (constant) 
		*/
		static public const CONST_NODE_NAME:String = 'constant';
		/** 
		* 
		* @public (constant) 
		*/
		static public const GETSET_NODE_NAME:String = 'accessor';
		/** 
		* 
		* @public (constant) 
		*/
		static public const METHOD_NODE_NAME:String = 'method';
		/** 
		* 
		* @public (constant) 
		*/
		static public const PROTOTYPE_NODE_NAME:String = 'factory';
		/** 
		* 
		* @public (constant) 
		*/
		static public const NAME_ATTR_NAME:String = 'name';
		/** 
		* 
		* @public (constant) 
		*/
		static public const ACCESS_ATTR_NAME:String = 'access';
		/** 
		* 
		* @public (constant) 
		*/
		static public const TYPE_ATTR_NAME:String = 'type';
		/** 
		* 
		* @public (constant) 
		*/
		static public const URI_ATTR_NAME:String = 'uri';
		/** 
		* 
		* @public (constant) 
		*/
		static public const RETURNTYPE_ATTR_NAME:String = 'returnType';
		/** 
		* 
		* @public (constant) 
		*/
		static public const VOID_RETURN_TYPE_NAME:String = 'void';
		/** 
		* 
		* @public (constant) 
		*/
		static public const ANY_RETURN_TYPE_NAME:String = '*';
		/** 
		* 
		* @public (constant) 
		*/
		static public const READ_VALUE:String = 'readonly';
		/** 
		* 
		* @public (constant) 
		*/
		static public const WRITE_VALUE:String = 'writeonly';
		/** 
		* 
		* @public (constant) 
		*/
		static public const READWRITE_VALUE:String = 'readwrite';
		/** 
		* 
		* @private (protected) 
		*/
		protected var _isDynamic:Boolean;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _names:Object;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _properties:Array;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _methods:Array;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _staticNames:Object;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _staticProperties:Array;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _staticMethods:Array;
		/** 
		* 
		* @public 
		* @param o 
		* @return void 
		*/
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
		/** 
		* 
		* @public (getter) 
		* @return Boolean 
		*/
		public function get isDynamic():Boolean{
			return this._isDynamic;
		}
		/** 
		* 
		* @public (getter) 
		* @return Array 
		*/
		public function get properties():Array{
			return this._properties.concat();
		}
		/** 
		* 
		* @public (static_ns,getter) 
		* @return Array 
		*/
		static_ns function get properties():Array{
			return this._staticProperties.concat();
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return PropertyItem 
		* @see aw.utils.propertyinspector.PropertyItem 
		*/
		public function getByName(name:*):PropertyItem{
			return this._names[String(name)];
		}
		/** 
		* 
		* @public (static_ns) 
		* @param name 
		* @return PropertyItem 
		* @see aw.utils.propertyinspector.PropertyItem 
		*/
		static_ns function getByName(name:*):PropertyItem{
			return this._staticNames[String(name)];
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return Boolean 
		*/
		public function isExists(name:*):Boolean{
			return (String(name) in this._names);
		}
		/** 
		* 
		* @public (static_ns) 
		* @param name 
		* @return Boolean 
		*/
		static_ns function isExists(name:*):Boolean{
			return (String(name) in this._staticNames);
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return Boolean 
		*/
		public function isProperty(name:*):Boolean{
			var prop:PropertyItem = this._names[String(name)];
			return (prop && prop.access!=PropertyAccessType.METHOD);
		}
		/** 
		* 
		* @public (static_ns) 
		* @param name 
		* @return Boolean 
		*/
		static_ns function isProperty(name:*):Boolean{
			var prop:PropertyItem = this._staticNames[String(name)];
			return (prop && prop.access!=PropertyAccessType.METHOD);
		}
		/** 
		* 
		* @public 
		* @param acc 
		* @return Array 
		*/
		public function getProperties(acc:int=-1):Array{
			return this.propertiesByAccess(this._properties, acc);
		}
		/** 
		* 
		* @public (static_ns) 
		* @param acc 
		* @return Array 
		*/
		static_ns function getProperties(acc:int=-1):Array{
			return this.propertiesByAccess(this._staticProperties, acc);
		}
		/** 
		* 
		* @private (protected) 
		* @param arr 
		* @param acc 
		* @return Array 
		*/
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
		/** 
		* 
		* @public 
		* @param cont 
		* @return Array 
		*/
		public function getPropertiesByContainer(cont:int=-1):Array{
			return this.propertiesByContainer(this._properties, cont);
		}
		/** 
		* 
		* @public (static_ns) 
		* @param cont 
		* @return Array 
		*/
		static_ns function getPropertiesByContainer(cont:int=-1):Array{
			return this.propertiesByContainer(this._staticProperties, cont);
		}
		/** 
		* 
		* @private (protected) 
		* @param arr 
		* @param cont 
		* @return Array 
		*/
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
		/** 
		* 
		* @public 
		* @param cls 
		* @return Array 
		*/
		public function getPropertiesByType(cls:Class):Array{
			return this.propertiesByType(this._properties, cls);
		}
		/** 
		* 
		* @public (static_ns) 
		* @param cls 
		* @return Array 
		*/
		static_ns function getPropertiesByType(cls:Class):Array{
			return this.propertiesByType(this._staticProperties, cls);
		}
		/** 
		* 
		* @private (protected) 
		* @param arr 
		* @param cls 
		* @return Array 
		*/
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
		/** 
		* 
		* @public 
		* @param cls 
		* @return Array 
		*/
		public function getMethodsByType(cls:Class):Array{
			return this.methodsByType(this._methods, cls);
		}
		/** 
		* 
		* @public (static_ns) 
		* @param cls 
		* @return Array 
		*/
		static_ns function getMethodsByType(cls:Class):Array{
			return this.methodsByType(this._staticMethods, cls);
		}
		/** 
		* 
		* @private (protected) 
		* @param arr 
		* @param cls 
		* @return Array 
		*/
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
		/** 
		* 
		* @public (getter) 
		* @return Array 
		*/
		public function get methods():Array{
			return this._methods.concat();
		}
		/** 
		* 
		* @public (static_ns,getter) 
		* @return Array 
		*/
		static_ns function get methods():Array{
			return this._staticMethods.concat();
		}
		/** 
		* 
		* @private (protected) 
		* @param o 
		* @return void 
		*/
		protected function saveInfo(o:Class):void{
			var x:XML = describeType(o);
			this._isDynamic = BasicValue.expectsBoolean(x.@isDynamic);
			saveInfoTo(x, this._staticNames, this._staticProperties, this._staticMethods);
			saveInfoTo(x.factory[0], this._names, this._properties, this._methods);
		}
		/** 
		* 
		* @private (protected) 
		* @param x 
		* @param names 
		* @param properties 
		* @param methods 
		* @return void 
		*/
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
		/** 
		* 
		* @private (protected) 
		* @param str 
		* @return Class 
		*/
		static protected function getDefinition(str:String):Class{
			if(str==VOID_RETURN_TYPE_NAME) return undefined;
			else if(str==ANY_RETURN_TYPE_NAME) return Object;
			else return getDefinitionByName(str) as Class;
		}
	}
}