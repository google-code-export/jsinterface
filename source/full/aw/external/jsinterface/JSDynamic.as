package aw.external.jsinterface{
	import aw.external.*;
	import aw.external.jsinterface.objects.JSObjectTypeMapper;
	import aw.utils.MethodCaller;
	import aw.utils.StringUtils;
	
	import flash.external.ExternalInterface;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	import flash.utils.getQualifiedClassName;


	/** 
	* Объект оболочка для всех объектов перенесённых из JavaScript среды в среду Flash Player'а. 
	* Он работает как зеркало(прокси) объекта - через него вы можете получить доступ к любым свойствам 
	* оригинального JavaScript объекта, вызвать его методы и создавать новые JavaScript объекты.
	* @example Пример создания JavaScript объектов:
<listing version="3.0">
package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	
	import flash.display.Sprite;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			JSInterface.initialize(true);
			var request:JSDynamic;
			if('XMLHttpRequest' in JSInterface.window){
				request = new JSDynamic("XMLHttpRequest");
		    }else if('ActiveXObject' in JSInterface.window){
				request = new JSDynamic("ActiveXObject", "Msxml2.XMLHTTP");
				if(!request) request = new JSDynamic("ActiveXObject", "Microsoft.XMLHTTP");
			}
			request.open('GET', 'http://some.server.com', true);
			request.send(null);
		}
	}
}
</listing>
	* @example Пример получения ссылки на существующие JavaScript объекты:
<listing version="3.0">
package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSHTMLElement;
	
	import flash.display.Sprite;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			JSInterface.initialize(true);
			// JavaScript объект с использованием стандартного JSDynamic
			var object1:JSDynamic = JSInterface.getInstance('window.document.body.firstChild');
			// JavaScript объект с использованием расширеного предка JSDynamic
			var object2:JSHTMLElement = JSInterface.getInstance('window.document.body.firstChild', JSHTMLElement);
			// Возвращяемый тип Object, но на самом деле это JSDynamic
			var object3:Object = JSInterface.window.document.body.firstChild;
			// конвертация типа оболочки JavaScript объекта из JSDynamic в JSHTMLElement(это никак не скажеться на JavaScript оригинальном объекте) 
			var object4:JSHTMLElement = JSDynamic.convert(object1, JSHTMLElement);
		}
	}
}
</listing>
	* Так же, этот объект является базовым для всех специализированных объектов-оболочек к таким 
	* JavaScript объектам как HTMLElement, Document, Navigator и т.д.
	* Этот класс можно расширять для специфических объектов, к примеру, для специальных объектов 
	* JavaScript фреймворка, чтоб объявить его свойства и задать типы для этих свойств(маппинг типов).
	* При расширении данного класса, для маппинга типов свойств необходимо, до обращения к этим свойствам, 
	* указать типы свойств по именам в классе JSObjectTypeMapper, по имени нового класса.
	* 
	* Каждый экземпляр этого класса, созданный для нового JavaScript объекта будет кеширован в классе 
	* JSInstanceCache, но если для одного и того же объекта будет создан ещё один объект JSDynamic, 
	* то новый объект JSDynamic заменит в кеше старый экземпляр.
	* @example Пример показывающий работу кеширования:
<listing version="3.0">
package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSHTMLElement;
	
	import flash.display.Sprite;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			JSInterface.initialize(true);
			var htmlTag1:JSHTMLElement = JSInterface.getInstance('window.document.body.firstChild', JSHTMLElement);
			var htmlTag2:Object = JSInterface.document.body.firstChild;
			// вернёт TRUE т.к. второй раз объект JSHTMLElement для переданного JavaScript объекта создаваться не будет - будет получен уже созданный экземпляр из кеша. 
			trace(htmlTag1===htmlTag2);
		}
	}
}
</listing>
	* 
	* @see aw.external.jsinterface.JSTypeMap Пример указания типов для свойств класса расширяющего JSDynamic
	* @see aw.external.jsinterface.objects.JSObjectTypeMapper
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public dynamic class JSDynamic extends Proxy{
		JSFunction;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const FUNCTION_TARGET_NAME:String = 'jsDynamicTarget';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const DO_NOT_CREATE_OBJECT:Class = DoNotCreateObject;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const VALUE_PROP:String = 'value';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const INSTANCE_ERROR:String = 'JavaScript object [{$0}] instance can\'t be created.';

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.JSInfoObject 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _info:JSInfoObject;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _forEachCallback:Function;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _forInProperties:Array;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.JSTypeMap 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _typeMap:JSTypeMap;

		/** 
		* Конструктор принимает имя класса JavaScript объекта и массив аргументов для конструктора создаваемого JavaScript объекта.
		* Созданный объект JSDynamic и будет оболочкой для созданного JavaScript объекта.
		* Вместо имени класса можено передавать JavaScript функцию(которая ранее была перенесена в среду Flash Player'а), тогда при создании нового JavaScript объекта эта функция будет использована как конструктор нового объекта.
		* Так же, можно передавать вместо имени класса другой объект JSDynamic, в таком случае будет создан новый объект такого же типа.
		* Ещё можно передавать служебный объект типа JSInfoObject, который используется в служебных целях для создания оболочки к уже существующим объектам.
		* @public 
		* @param className Имя класса JavaScript объекта, JavaScript функция или другой объект JSDynamic.
		* @param args Список аргументов для конструктора JavaScript объекта или значение аргумента, если он один.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSDynamic(className:Object='', args:*=null):void{
			super();
			if(className && className!==DO_NOT_CREATE_OBJECT){
				if(arguments.length>1 && !(args is Array)) args = [args];
				js_interface::createInfo(className, args);
			}
			init();
		}

		/** 
		* Инициализация объекта и получение карты типов.
		* 
		* 
		* @private (protected) 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected function init():void{
			_typeMap = JSObjectTypeMapper.getMapByObject(this);
		}

		/** 
		* Создаёт JavaScriptc объект или получает информацию о существующем JavaScript объекте.
		* 
		* 
		* @public (js_interface) 
		* @param className 
		* @param args 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function createInfo(className:Object, args:Array=null):void{
			var obj:Object;
			if(className is Function && FUNCTION_TARGET_NAME in className){
				obj = JSCore.createObjectByLink(className[FUNCTION_TARGET_NAME] as JSDynamic, args);
			}else if(className is JSDynamic){
				obj = JSCore.createObjectByLink(className as JSDynamic, args);
			}else if(className is JSInfoObject){
				obj = className;
			}else obj = JSCore.createObject(String(className), args);
			if(obj && VALUE_PROP in obj){
				this._info = (obj is JSInfoObject) ? obj as JSInfoObject : new JSInfoObject(obj);
				JSInstanceCache.addToCache(obj.value, this);
			}else throw new Error(StringUtils.createByTemplate(INSTANCE_ERROR, className));
		}

		/** 
		* Строковая ссылка на JavaScript объект в стеке передаваемых объектов.
		* 
		* 
		* @public (js_interface,getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function get name():String{
			return this._info.value;
		}

		/** 
		* 
		* 
		* 
		* @public (js_interface,setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function set name(p:String):void{
			this._info.value = p;
		}

		/** 
		* Инфо объект переданного объекта.
		* 
		* 
		* @public (js_interface,getter) 
		* @return JSInfoObject 
		* @see aw.external.jsinterface.JSInfoObject 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function get info():JSInfoObject{
			return this._info;
		}

		/** 
		* 
		* 
		* 
		* @public (js_interface,setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.JSInfoObject 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function set info(p:JSInfoObject):void{
			if(p){
				var name:String = p.value;
				JSInstanceCache.removeFromCache(name);
				this._info = p;
				JSInstanceCache.addToCache(name, this);
			}
		}

		/** 
		* Получить значение по пути в точечной нотации относителньо текущего JavaScript объекта. 
		* 
		* @example Пример использования:
<listing version="3.0">
package {
	import aw.external.JSInterface;
	import aw.external.js_interface;
	import aw.external.jsinterface.objects.JSHTMLElement;
	
	import flash.display.Sprite;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			JSInterface.initialize(this, true);
			// получить значение по строковому пути к объекту
			var element:JSHTMLElement = JSInterface.document.js_interface::getValue("body.childNodes[1]", JSHTMLElement);
			trace(element); // [object]
		}
	}
}
</listing>
		* @public (js_interface) 
		* @param path 
		* @param cls 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function getValue(path:String, cls:Class=null):*{
			return JSCore.getParamValue(this, path, cls);
		}

		/** 
		* Возвращает список имён свойств JavaScript объектов.
		* 
		* 
		* @public (js_interface,getter) 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function get properties():Array{
			return JSCore.propertyList(this._info.value);
		}

		/** 
		* Используется для "преобразования" объекта JSDynamic в функцию в случаях, когда из JavaScript 
		* среды была передана ссылка на функцию. Поскольку функция и в JavaScript среде является объектом, 
		* то она приходит как объект с информацией об объекте функции. Получение из JavaScript объект типа 
		* JSDynamic вместо Function может препятствовать её использованию, поэтому полученный JSDynamic 
		* автоматически оборачивается функцией и разработчика появляется возможность использовать JavaScript 
		* функцию в среде Flash Player'а как обычную функцию. Все вызовы такой функции будут отправлены в 
		* JavaScript среду и выполнены как обычные вызовы функции. Эта функция работает автоматически, нет 
		* нужды вызывать её самостоятельно.
		* Такая функция имеет дополнительные методы, кроме стандартных Function.call() и Function.apply():
		* <ul>
		* <li>Function.remove() - удаляет JavaScript функцию из стека переданных функций.</li>
		* <li>Function.isExists() - проверяет наличие JavaScript функции в стеке.</li>
		* </ul>
		* @private (js_interface) 
		* @return Function 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function asFunction():Function{
			var f:Object = function(a:*, b:*, c:*, d:*, e:*, f:*, g:*, h:*, i:*, j:*, k:*, l:*, m:*, n:*, o:*, p:*, q:*, r:*, s:*, t:*, u:*, v:*, w:*, x:*, y:*, z:*):*{
				var name:String = arguments.callee.name;
				if(!this || !(this is JSDynamic)){
					return JSCore.callFunction(name, '', arguments);
				}else{
					return JSCore.callFunction(name, this.js_interface::name, arguments);
				}
			}
			var name:String = this.js_interface::name;
			f.remove = function():void{
				var name:String = arguments.callee.name;
				JSCore.removeFunction(name);
			}
			f.remove.name = name;
			f.isExists = function():Boolean{
				var name:String = arguments.callee.name;
				return JSCore.functionExists(name);
			}
			f.isExists.name = name;
			f.name = name;
			f[FUNCTION_TARGET_NAME] = this;
			return f as Function;
		}

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const CURRENT_CALLBACK_NAME:QName = new QName(js_interface, 'currentCallback');

		/** 
		* Свойство открыто для служебных целей. Служит для временного хранения анонимных функций.
		* 
		* 
		* @private (js_interface) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface var currentCallback:Function;

		/** 
		* Метод для служебного пользования - вызывает временную, предполагаемо, анонимную функцию в области видимости данного объекта, без использования Function.call() и Function.apply().
		* 
		* 
		* @private (js_interface) 
		* @param f 
		* @param args 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function callCallback(f:Function, args:Array):*{
			this.js_interface::currentCallback = f;
			var value:*;
			if(args is JSArguments){
				value = MethodCaller.callByName(this, CURRENT_CALLBACK_NAME, args);
			}else{
				value = MethodCaller.applyByName(this, CURRENT_CALLBACK_NAME, args);
			}
			this.js_interface::currentCallback = null;
			return value;
		}

		/** 
		* Вызывает перебор свойств JavaScript объекта с помощью функции обратного вызова.
		* 
		* 
		* @public (js_interface) 
		* @param callbackFunction Функция обратного вызова.
		* @param useList Если указать TRUE, то будет использован не "живой" перебор, а перебор свойств в среде Flash Player'а с предварительным получением списка имён перебираемых свойств.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function forEach(callbackFunction:Function, useList:Boolean=false):void{
			var name:String;
			if(!JSCore.hasDocument() || useList){
				var arr:Array = this.js_interface::properties;
				var len:int = arr.length;
				for(var i:int=0; i<len; i++){
					name = arr[i];
					callbackFunction(this, name, this.flash_proxy::getProperty(name));
				}
			}else{
				this._forEachCallback = callbackFunction;
				name = JSCaller.addForEachHandler(this.jsForEachCallback);
				JSCore.forEach(this._info.value, name);
				JSCaller.removeForEachHandler(name);
				this._forEachCallback = null;
			}
		}

		/** 
		* Удалить JavaScript объект из стека.
		* 
		* 
		* @public (js_interface) 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function remove():void{
			var n:String = this._info.value;
			JSInstanceCache.removeFromCache(n);
			JSCore.removeObject(n);
		}

		/** 
		* Проверяет наличие JavaScript объекта в стеке.
		* 
		* 
		* @public (js_interface) 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function isExists():Boolean{
			return JSCore.objectExists(this._info.value);
		}

		/** 
		* Проверяет ссылки на JavaScript объекты и возвращает TRUE, если ссылки идентичны, т.е. ссылаются на один и тот же объект.
		* 
		* 
		* @public (js_interface) 
		* @param jsd 
		* @return Boolean 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function isEqual(jsd:JSDynamic):Boolean{
			return (jsd && this._info.value==jsd.js_interface::name);
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @param param 
		* @param value 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected function jsForEachCallback(param:String, value:*):void{
			this._forEachCallback(this, param, value);
		}
		//------------------------------------ Proxy

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @param args 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function callProperty(name:*, ... args):*{
			return this.internalCall(name, args);
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @param name 
		* @param args 
		* @param cls 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected function internalCall(name:*, args:Array, cls:Class=null):*{
			//trace(name);
			if(!cls){
				cls = this._typeMap ? this._typeMap.getType(name) : JSDynamic;
				//trace(getQualifiedClassName(this), this._typeMap);
			}
			var val:* = JSCore.callProperty(this.js_interface::name, this._info.type, name, args, cls);
			return val;
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function getProperty(name:*):*{
			return this.internalGet(name);
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @param name 
		* @param cls 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected function internalGet(name:*, cls:Class=null):*{
			//trace(name);
			var obj:Object = ExternalInterface.call(JSCaller.getPropertyMethod, JSCore.name, this.js_interface::name, this._info.type, name.toString());
			if(JSCore.ERROR_PARAM in obj){
				JSCaller.throwException(obj.error);
				return undefined;
			}else obj = obj.value;
			//trace(obj);
			//trace(this._typeMap, this._typeMap.getType(name));
			if(obj){
				if(!cls){
					cls = this._typeMap ? this._typeMap.getType(name) : JSDynamic;
				}
				var ret:* = JSInfoObject.convert(obj, cls);
				//trace(getQualifiedClassName(this), name, obj, obj.value, this._typeMap, this._typeMap.getType(name), getQualifiedClassName(ret));
				return ret;
			}else return undefined;
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function hasProperty(name:*):Boolean{
			return this.internalHas(name);
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected function internalHas(name:*):Boolean{
			var ret:Object = ExternalInterface.call(JSCaller.hasPropertyMethod, JSCore.name, this.js_interface::name, this._info.type, name.toString());
			if(JSCore.ERROR_PARAM in ret){
				JSCaller.throwException(ret.error);
			}else{
				return ret.value;
			}
			return undefined;
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function deleteProperty(name:*):Boolean{
			return this.internalDelete(name);
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected function internalDelete(name:*):Boolean{
			var ret:Object = ExternalInterface.call(JSCaller.deletePropertyMethod, JSCore.name, this.js_interface::name, this._info.type, name.toString());
			if(JSCore.ERROR_PARAM in ret){
				JSCaller.throwException(ret.error);
			}else{
				return ret.value;
			}
			return undefined;
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @param value 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function setProperty(name:*, value:*):void{
			this.internalSet(name, value);
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @param name 
		* @param value 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected function internalSet(name:*, value:*):void{
			var ret:Object = ExternalInterface.call(JSCaller.setPropertyMethod, JSCore.name, this.js_interface::name, this._info.type, name.toString(), JSInfoObject.create(value));
			if(JSCore.ERROR_PARAM in ret){
				JSCaller.throwException(ret.error);
			}
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param index 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function nextNameIndex(index:int):int{
			if (index==0){
				this._forInParameters = this.js_interface::properties;
			}
			if(index<this._forInParameters.length){
				return index+1;
			}else{
				return 0;
			}
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param index 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function nextName(index:int):String{
			return this._forInParameters[index-1];
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param index 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function nextValue(index:int):*{
			return this.flash_proxy::getProperty(this._forInParameters[index-1]);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param className 
		* @param args 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(className:String, args:Array=null, cls:Class=null):JSDynamic{
			var obj:Object = JSCore.createObject(className, args);
			var jsd:JSDynamic = new (cls ? cls : JSDynamic)(DO_NOT_CREATE_OBJECT);
			jsd.js_interface::info = (obj is JSInfoObject) ? obj as JSInfoObject : new JSInfoObject(obj);
			return jsd;
		}

		/** 
		* Конвертирует объект типа JSDynamic в расширяющий его тип.
		* 
		* @example Пример использования:
<listing version="3.0">
package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSDocument;
	
	import flash.display.Sprite;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			JSInterface.initialize(true);
			var jsObject:JSDynamic = JSInterface.getInstance('window.document');
			var document:JSDocument = JSDynamic.convert(jsObject, JSDocument);
		}
	}
}
</listing>
		* @public 
		* @param jsd 
		* @param cls 
		* @return * 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function convert(jsd:JSDynamic, cls:Class):*{
			if(getQualifiedClassName(jsd)==getQualifiedClassName(cls)) return jsd;
			else{
				return JSInstanceCache.getByInfo(jsd.js_interface::info, cls);
			}
		}

		/** 
		* Возвращает JSDynamic объект переданной JavaScript функции.
		* 
		* 
		* @public 
		* @param f 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function convertFunctionToObject(f:Function):JSDynamic{
			var jsd:JSDynamic;
			if(f!=null && FUNCTION_TARGET_NAME in f){
				jsd = (f as Object)[FUNCTION_TARGET_NAME];
			}
			return jsd;
		}
	}
}

/** 
* 
* 
* 
* @public 
* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
*/
class DoNotCreateObject extends Object{}