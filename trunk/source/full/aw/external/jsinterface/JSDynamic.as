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
	* It’s a wrapper object for all objects transferred from JavaScript environment to Flash Player environment. 
	* It works as an object mirror (proxy), and you can get access to any properties of the original JavaScript 
	* object though it, call for its methods and create new JavaScript objects.
	* 
	* @example Example of creating JavaScript objects:
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
	* @example Example of getting a reference to the existing JavaScript objects:
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
			// JavaScript object using standard JSDynamic
			var object1:JSDynamic = JSInterface.getInstance('window.document.body.firstChild');
			// JavaScript object using the class extended from JSDynamic
			var object2:JSHTMLElement = JSInterface.getInstance('window.document.body.firstChild', JSHTMLElement);
			// Return type Object, but it's JSDynamic
			var object3:Object = JSInterface.window.document.body.firstChild;
			// Conversion of wrapper type of JavaScript object from JSDynamic in JSHTMLElement (this will not affect the original object in JavaScript)
			var object4:JSHTMLElement = JSDynamic.convert(object1, JSHTMLElement);
		}
	}
}
</listing>
	* This object is also the basic one for all specialized wrapper objects to such JavaScript objects as 
	* HTMLElement, Document, Navigator etc. This class can be extended for specific objects, for example, 
	* for special objects of JavaScript framework, to announce its properties and set types for the 
	* properties (types mapping). Upon extension of the class for properties’ types mapping it’s necessary to 
	* indicate the properties’ types by name in JSObjectTypeMapper class, by the name of the new class, before 
	* addressing the properties. 
	* 
	* Each instance of this class, created for a new JavaScript object, will be cashed in JSInstanceCache class, 
	* but if one more JSDynamic object will be created for the same object, then the new JSDynamic object will 
	* replace the previous instance in cash.
	* @example 	Example showing the work of caching:
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
			// return TRUE because the second time the object passed JSHTMLElement for JavaScript object will not be created - would be received a copy from the cache.
			trace(htmlTag1===htmlTag2);
		}
	}
}
</listing>
	* 
	* @see aw.external.jsinterface.JSTypeMap Examples of specifying the types of properties for a class extending JSDynamic
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
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'Object';

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
		* The Constructor assumes the name of the JavaScript object class and the array of arguments for the constructor 
		* of the JavaScript object being created. The created JSDynamic object will be the wrapper for the created JavaScript object. 
		* A JavaScript function (transferred to Flash Player environment earlier) can be transferred instead of class name, in this 
		* case this function will be used as the new object constructor upon creation of a new object. Another JSDynamic object can be 
		* also transferred instead of class name, in this case a new object of the same type will be created. A utility object of 
		* JSInfoObject type used for service purposes for creating wrapper to existing objects can also be transferred.
		* 
		* @public 
		* @param className JavaScript class name, JavaScript function, or other object JSDynamic
		* @param args The list of arguments to the JavaScript object constructor or argument value, if only one
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSDynamic(className:Object=CLASS_NAME, args:*=null):void{
			super();
			if(className && className!==DO_NOT_CREATE_OBJECT){
				if(arguments.length>1 && !(args is Array)) args = [args];
				js_interface::createInfo(className, args);
			}
			init();
		}

		/** 
		* Initialize the object and receiving the type map
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
		* Creates a JavaScript object or get information about existing JavaScript object
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
		* String reference to the JavaScript object in stack of transmitted objects
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
		* Info object of passed object
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
		* 	Get the value by path from JavaScript Object 
		* 
		* @example
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
			// Obtain the value of the string path to an object
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
		* Returns a list of the names of the properties of JavaScript object
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
		* Used for “transformation” of JSDynamic object to a function in cases when a reference to function was 
		* transferred from JavaScript environment. Getting an object of JSDynamic type instead of a Function from 
		* JavaScript can prevent using it, that’s why the received JSDynamic automatically turns into a function 
		* and the developers gets a possibility to use a JavaScript function in Flash Player environment as a usual 
		* function. All calls for such function will be sent to JavaScript environment and executed as usual function 
		* calls. This function works automatically, there is no need to call for it yourself.
		* 
		* This function has additional methods, besides the standard Function.call() and Function.apply():
		* <ul>
		* <li>Function.remove() – removes JavaScript function from the stack of transferred functions.</li>
		* <li>Function.isExists() – checks for presence of a JavaScript function in the stack.</li>
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
		* The property is open for internal usage. Use for temporary storage of anonymous functions.
		* 
		* 
		* @private (js_interface) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface var currentCallback:Function;

		/** 
		* Method for internal use - calls a temporary, anonymous function in the scope of the object, without using Function.call() and Function.apply().
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
		* Cycle properties of JavaScript object using the callback function
		* 
		* 
		* @public (js_interface) 
		* @param callbackFunction Callback function
		* @param useList If you specify TRUE, it will be used for not "live" cycle, a sort out of properties in the Flash Player environment with the list of property names.
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
		* Remove JavaScript object from the stack
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
		* Verifies the existence of JavaScript object in the stack
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
		* Verifies references to JavaScript objects and returns TRUE, if the links are identical, ie refer to the same object
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
		* Converts an object of JSDynamic type in extended type
		* 
		* @example
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
		* Returns the JSDynamic object of JavaScript function
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