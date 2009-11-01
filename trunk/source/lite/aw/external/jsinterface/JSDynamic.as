package aw.external.jsinterface{
	import aw.external.*;
	import aw.utils.MethodCaller;
	import aw.utils.StringUtils;
	
	import flash.external.ExternalInterface;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	import flash.utils.getQualifiedClassName;
	/*
	
	For ASDOC documentation  look into full version
	
	*/
	public dynamic class JSDynamic extends Proxy{
		JSFunction;
		
		static public const CLASS_NAME:String = 'Object';

		static public const FUNCTION_TARGET_NAME:String = 'jsDynamicTarget';

		static public const DO_NOT_CREATE_OBJECT:Class = DoNotCreateObject;

		static public const VALUE_PROP:String = 'value';

		static public const INSTANCE_ERROR:String = 'JavaScript object [{$0}] instance can\'t be created.';

		protected var _info:JSInfoObject;

		protected var _forEachCallback:Function;

		protected var _forInProperties:Array;

		public function JSDynamic(className:Object=CLASS_NAME, args:*=null):void{
			super();
			if(className && className!==DO_NOT_CREATE_OBJECT){
				if(arguments.length>1 && !(args is Array)) args = [args];
				js_interface::createInfo(className, args);
			}
			init();
		}

		protected function init():void{
			// for overwrite
		}

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

		js_interface function get name():String{
			return this._info.value;
		}

		js_interface function set name(p:String):void{
			this._info.value = p;
		}

		js_interface function get info():JSInfoObject{
			return this._info;
		}

		js_interface function set info(p:JSInfoObject):void{
			if(p){
				var name:String = p.value;
				JSInstanceCache.removeFromCache(name);
				this._info = p;
				JSInstanceCache.addToCache(name, this);
			}
		}

		js_interface function getValue(path:String, cls:Class=null):*{
			return JSCore.getParamValue(this, path, cls);
		}

		js_interface function get properties():Array{
			return JSCore.propertyList(this._info.value);
		}

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

		static private const CURRENT_CALLBACK_NAME:QName = new QName(js_interface, 'currentCallback');

		js_interface var currentCallback:Function;

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

		js_interface function remove():void{
			var n:String = this._info.value;
			JSInstanceCache.removeFromCache(n);
			JSCore.removeObject(n);
		}

		js_interface function isExists():Boolean{
			return JSCore.objectExists(this._info.value);
		}

		js_interface function isEqual(jsd:JSDynamic):Boolean{
			return (jsd && this._info.value==jsd.js_interface::name);
		}

		protected function jsForEachCallback(param:String, value:*):void{
			this._forEachCallback(this, param, value);
		}
		//------------------------------------ Proxy

		override flash_proxy function callProperty(name:*, ... args):*{
			return this.internalCall(name, args);
		}

		protected function internalCall(name:*, args:Array):*{
			var val:* = JSCore.callProperty(this.js_interface::name, this._info.type, name, args, JSDynamic);
			return val;
		}

		override flash_proxy function getProperty(name:*):*{
			return this.internalGet(name);
		}

		protected function internalGet(name:*):*{
			var obj:Object = ExternalInterface.call(JSCaller.getPropertyMethod, JSCore.name, this.js_interface::name, this._info.type, name.toString());
			if(JSCore.ERROR_PARAM in obj){
				JSCaller.throwException(obj.error);
				return undefined;
			}else obj = obj.value;
			if(obj){
				var ret:* = JSInfoObject.convert(obj, JSDynamic);
				return ret;
			}else return undefined;
		}

		override flash_proxy function hasProperty(name:*):Boolean{
			return this.internalHas(name);
		}

		protected function internalHas(name:*):Boolean{
			var ret:Object = ExternalInterface.call(JSCaller.hasPropertyMethod, JSCore.name, this.js_interface::name, this._info.type, name.toString());
			if(JSCore.ERROR_PARAM in ret){
				JSCaller.throwException(ret.error);
			}else{
				return ret.value;
			}
			return undefined;
		}

		override flash_proxy function deleteProperty(name:*):Boolean{
			return this.internalDelete(name);
		}

		protected function internalDelete(name:*):Boolean{
			var ret:Object = ExternalInterface.call(JSCaller.deletePropertyMethod, JSCore.name, this.js_interface::name, this._info.type, name.toString());
			if(JSCore.ERROR_PARAM in ret){
				JSCaller.throwException(ret.error);
			}else{
				return ret.value;
			}
			return undefined;
		}

		override flash_proxy function setProperty(name:*, value:*):void{
			this.internalSet(name, value);
		}

		protected function internalSet(name:*, value:*):void{
			var ret:Object = ExternalInterface.call(JSCaller.setPropertyMethod, JSCore.name, this.js_interface::name, this._info.type, name.toString(), JSInfoObject.create(value));
			if(JSCore.ERROR_PARAM in ret){
				JSCaller.throwException(ret.error);
			}
		}

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

		override flash_proxy function nextName(index:int):String{
			return this._forInParameters[index-1];
		}

		override flash_proxy function nextValue(index:int):*{
			return this.flash_proxy::getProperty(this._forInParameters[index-1]);
		}

		static public function create(className:String, args:Array=null, cls:Class=null):JSDynamic{
			var obj:Object = JSCore.createObject(className, args);
			var jsd:JSDynamic = new (cls ? cls : JSDynamic)(DO_NOT_CREATE_OBJECT);
			jsd.js_interface::info = (obj is JSInfoObject) ? obj as JSInfoObject : new JSInfoObject(obj);
			return jsd;
		}

		static public function convert(jsd:JSDynamic, cls:Class):*{
			if(getQualifiedClassName(jsd)==getQualifiedClassName(cls)) return jsd;
			else{
				return JSInstanceCache.getByInfo(jsd.js_interface::info, cls);
			}
		}

		static public function convertFunctionToObject(f:Function):JSDynamic{
			var jsd:JSDynamic;
			if(f!=null && FUNCTION_TARGET_NAME in f){
				jsd = (f as Object)[FUNCTION_TARGET_NAME];
			}
			return jsd;
		}
	}
}

class DoNotCreateObject extends Object{}