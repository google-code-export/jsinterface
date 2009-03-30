package aw.utils.propertyinspector{
	import aw.data.BasicValue;
	
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	

	/** 
	* Объекты этого класса содержат информацию о классах находящихся в системе.
	* Можно инстанциировать объекты этого класса напрямую через конструктор, но рекоммендуется это делать, через методы класса PropertyInspector, в котором существует механизм кеширования информации.
	* @example Пример получения ссылки на объект PropertyInspectorItem
<listing version="3.0">
package {
	import aw.utils.PropertyInspector;
	import aw.utils.propertyinspector.PropertyInspectorItem;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public class Test extends Sprite{
		public function Test():void{
			super();
			var pii:PropertyInspectorItem = PropertyInspector.getInfo(MovieClip);
			// Динамический ли объект
			trace(pii.isDynamic);
			// методы возвращающие объекты типа Rectangle
			trace(pii.getMethodsByType(Rectangle));
			// получить объект PropertyItem, содержащий информацию о свойстве объекта
			pii.getByName('width');
		}
	}
}
</listing>
	* Для получения информации о статических членах класса используются методы в пространстве имён static_ns.
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com
	* @see aw.utils.PropertyInspector
	* @see aw.utils.propertyinspector.static_ns
	*/
	public class PropertyInspectorItem extends Object{

		/** 
		* Имя узла описывающего переменную, член класса, из XML дерева возвращаемом функцией flash.utils.describeType()
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const VAR_NODE_NAME:String = 'variable';

		/** 
		* Имя узла описывающего константу, член класса, из XML дерева возвращаемом функцией flash.utils.describeType()
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CONST_NODE_NAME:String = 'constant';

		/** 
		* Имя узла описывающего GET/SET метод, член класса, из XML дерева возвращаемом функцией flash.utils.describeType()
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const GETSET_NODE_NAME:String = 'accessor';

		/** 
		* Имя узла описывающего метод, член класса, из XML дерева возвращаемом функцией flash.utils.describeType()
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const METHOD_NODE_NAME:String = 'method';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const PROTOTYPE_NODE_NAME:String = 'factory';

		/** 
		* Имя атрибута содержащего имя члена класса.
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const NAME_ATTR_NAME:String = 'name';

		/** 
		* Имя атрибута содержащего тип члена класса.
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const ACCESS_ATTR_NAME:String = 'access';

		/** 
		* Имя атрибута содержащего тип возвращаемого значения членом класса.
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const TYPE_ATTR_NAME:String = 'type';

		/** 
		* Имя атрибута содержащего URI пространства имён в котором находится имя члена класса.
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const URI_ATTR_NAME:String = 'uri';

		/** 
		* Имя атрибута содержащего тип возвращаемого значения членом класса.
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const RETURNTYPE_ATTR_NAME:String = 'returnType';

		/** 
		* 
		* Значение указывающее на отстутствие возвращаемого значения.
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const VOID_RETURN_TYPE_NAME:String = 'void';

		/** 
		* Значение указывающее любое возвращаемое значение.
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const ANY_RETURN_TYPE_NAME:String = '*';

		/** 
		* Значение указывающее уровень доступа "только для чтения".
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const READ_VALUE:String = 'readonly';

		/** 
		* Значение указывающее уровень доступа "только для записи".
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const WRITE_VALUE:String = 'writeonly';

		/** 
		* Значение указывающее уровень доступа "запись/чтение".
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const READWRITE_VALUE:String = 'readwrite';

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _isDynamic:Boolean;

		/** 
		* Содержит имена всех членов класса, принадлежащих экземплярам класса.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _names:Object;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		* @see aw.utils.propertyinspector.PropertyItem
		*/
		protected var _properties:Array;

		/** 
		* Массив объектов PropertyItem, описывающих методы, принадлежащие экземплярам класса.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		* @see aw.utils.propertyinspector.PropertyItem
		*/
		protected var _methods:Array;

		/** 
		* Содержит имена всех членов класса, принадлежащих объекту класса.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _staticNames:Object;

		/** 
		* Массив объектов PropertyItem, описывающих свойства, принадлежащие объекту класса.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		* @see aw.utils.propertyinspector.PropertyItem
		*/
		protected var _staticProperties:Array;

		/** 
		* Массив объектов PropertyItem, описывающих методы, принадлежащие объекту класса.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		* @see aw.utils.propertyinspector.PropertyItem
		*/
		protected var _staticMethods:Array;

		/** 
		* Создаёт объект содержащий всю информацию о классе и его членах.
		* 
		* 
		* @public 
		* @param o 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* Указывает на возможность задавать динамические свойства для объектов описываемого класса.
		* Возвращает TRUE, если экземпляры класса способны создавать динамические свойства.   
		* 
		* @public (getter) 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get isDynamic():Boolean{
			return this._isDynamic;
		}

		/** 
		* Массив объектов PropertyItem, описывающих свойства, принадлежащие экземплярам класса.
		* 
		* 
		* @public (getter) 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get properties():Array{
			return this._properties.concat();
		}

		/** 
		* 
		* 
		* @copy #_staticProperties
		* @public (static_ns,getter) 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static_ns function get properties():Array{
			return this._staticProperties.concat();
		}

		/** 
		* Получить объект PropertyItem, по имени члена класса принадлежащего экземпляру класса.
		* 
		* 
		* @public 
		* @param name 
		* @return PropertyItem 
		* @see aw.utils.propertyinspector.PropertyItem 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getByName(name:*):PropertyItem{
			return this._names[String(name)];
		}

		/** 
		* Получить объект PropertyItem, по имени члена класса принадлежащего объекту класса.
		* 
		* 
		* @public (static_ns) 
		* @param name 
		* @return PropertyItem 
		* @see aw.utils.propertyinspector.PropertyItem 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static_ns function getByName(name:*):PropertyItem{
			return this._staticNames[String(name)];
		}

		/** 
		* Проверяет существование члена класса, принадлежащего экземпляру класса, по его имени.
		* 
		* 
		* @public 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function isExists(name:*):Boolean{
			return (String(name) in this._names);
		}

		/** 
		* Проверяет существование члена класса, принадлежащего объекту класса, по его имени.
		* 
		* 
		* @public (static_ns) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static_ns function isExists(name:*):Boolean{
			return (String(name) in this._staticNames);
		}

		/** 
		* Возврашает TRUE, если переданное имя свойства и FALSE - если имя метода. Работает с членами класса принадлежащими экземпляру класса.
		* 
		* 
		* @public 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function isProperty(name:*):Boolean{
			var prop:PropertyItem = this._names[String(name)];
			return (prop && prop.access!=PropertyAccessType.METHOD);
		}

		/** 
		* Возврашает TRUE, если переданное имя свойства и FALSE - если имя метода. Работает с членами класса принадлежащими объекту класса.
		* 
		* 
		* @public (static_ns) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static_ns function isProperty(name:*):Boolean{
			var prop:PropertyItem = this._staticNames[String(name)];
			return (prop && prop.access!=PropertyAccessType.METHOD);
		}

		/** 
		* Возвращает список свойств принадлежащих экземпляру класса по уровню доступа.
		* 
		* 
		* @public 
		* @param acc 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getProperties(acc:int=-1):Array{
			return this.propertiesByAccess(this._properties, acc);
		}

		/** 
		* Возвращает список свойств принадлежащих объекту класса по уровню доступа.
		* 
		* 
		* @public (static_ns) 
		* @param acc 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static_ns function getProperties(acc:int=-1):Array{
			return this.propertiesByAccess(this._staticProperties, acc);
		}

		/** 
		* Отделяет свойства по уровню доступа из полученного массива.
		* 
		* 
		* @private (protected) 
		* @param arr 
		* @param acc 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* Возвращает список свойств принадлежащих экземпляру класса по виду члена класса.
		* 
		* 
		* @public 
		* @param cont 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getPropertiesByContainer(cont:int=-1):Array{
			return this.propertiesByContainer(this._properties, cont);
		}

		/** 
		* Возвращает список свойств принадлежащих объекту класса по виду члена класса.
		* 
		* 
		* @public (static_ns) 
		* @param cont 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static_ns function getPropertiesByContainer(cont:int=-1):Array{
			return this.propertiesByContainer(this._staticProperties, cont);
		}

		/** 
		* Отделяет свойства по виду члена класса из полученного массива.
		* 
		* 
		* @private (protected) 
		* @param arr 
		* @param cont 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* Возвращает список методов принадлежащих экземпляру класса возвращающих определённый тип данных.
		* 
		* 
		* @public 
		* @param cls 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getPropertiesByType(cls:Class):Array{
			return this.propertiesByType(this._properties, cls);
		}

		/** 
		* Возвращает список свойств принадлежащих объекту класса возвращающих определённый тип данных.
		* 
		* 
		* @public (static_ns) 
		* @param cls 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static_ns function getPropertiesByType(cls:Class):Array{
			return this.propertiesByType(this._staticProperties, cls);
		}

		/** 
		* Отделяет свойства по типу значения из полученного массива.
		* 
		* 
		* @private (protected) 
		* @param arr 
		* @param cls 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* Возвращает список методов принадлежащих экземпляру класса возвращающих определённый тип данных.
		* 
		* 
		* @public 
		* @param cls 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getMethodsByType(cls:Class):Array{
			return this.methodsByType(this._methods, cls);
		}

		/** 
		* Возвращает список методов принадлежащих объекту класса возвращающих определённый тип данных.
		* 
		* 
		* @public (static_ns) 
		* @param cls 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static_ns function getMethodsByType(cls:Class):Array{
			return this.methodsByType(this._staticMethods, cls);
		}

		/** 
		* Отделяет методы по возвращаемому типу из полученного массива.
		* 
		* 
		* @private (protected) 
		* @param arr 
		* @param cls 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* @copy #_methods
		* @public (getter) 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get methods():Array{
			return this._methods.concat();
		}

		/** 
		* 
		* 
		* @copy #_staticMethods
		* @public (static_ns,getter) 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static_ns function get methods():Array{
			return this._staticMethods.concat();
		}

		/** 
		* Обрабатывает и сохраняет информацию о переданном классе.
		* 
		* 
		* @private (protected) 
		* @param o 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected function saveInfo(o:Class):void{
			var x:XML = describeType(o);
			this._isDynamic = BasicValue.expectsBoolean(x.@isDynamic);
			saveInfoTo(x, this._staticNames, this._staticProperties, this._staticMethods);
			saveInfoTo(x.factory[0], this._names, this._properties, this._methods);
		}

		/** 
		* Разбирает полученный XML и создаёт объекты PropertyItem по найденым данным о членах класса.
		* 
		* 
		* @private (protected) 
		* @param x 
		* @param names 
		* @param properties 
		* @param methods 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* 
		* @private (protected) 
		* @param str 
		* @return Class 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function getDefinition(str:String):Class{
			if(str==VOID_RETURN_TYPE_NAME) return undefined;
			else if(str==ANY_RETURN_TYPE_NAME) return Object;
			else return getDefinitionByName(str) as Class;
		}
	}
}