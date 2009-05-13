package aw.external.jsinterface{
	import aw.external.*;
	
	import flash.external.ExternalInterface;
	[ExcludeClass]
	/**
	 * Calls JavaScript functions and returns ready for use values.
	 * All methods of this class is for internal usage and are designed for classes JSInterface and JSDynamic.
	 * All basic methods has duplicate in JSInterface, and before using method from this class make sure that it is not implemented in the JSInterface class.
	 * 
	 * @private
	 * @see aw.external.JSInterface
	 * @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	 */
	public class JSCore extends Object{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const ERROR_PARAM:String = 'error';

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _name:String;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _hasDocument:Boolean = false;

		/** 
		* 
		* 
		* 
		* @public 
		* @param url 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function init(url:String=''):void{
			if(!initialized){
				installJSICommands();
				createJSInterface(url);
				JSCaller.initialize();
				FLObject.initialize();
				ExternalInterface.call(JSCaller.ON_INSTALLED);
			}
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function installJSICommands():void{
			if(!ExternalInterface.call(JSCoreCommands.VERIFY_JSI_INSTALLATION)){
				JSCoreCommands.callJSCommands(JSCoreCommands.JSI_COMMANDS);
			}
			_hasDocument = ExternalInterface.call(JSCoreCommands.VERIFY_DOCUMENT_AVAILABILITY);
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @param url 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function createJSInterface(url:String):void{
			_name = ExternalInterface.call(JSCaller.JSI_CREATE, ExternalInterface.objectID, url);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get initialized():Boolean{
			return Boolean(_name);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get name():String{
			return _name;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function hasDocument():Boolean{
			return _hasDocument;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param path 
		* @param cls 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getInstance(path:String, cls:Class=null):Object{
			var ret:Object = ExternalInterface.call(JSCaller.getInfoMethod, _name, path);
			if(ret){
				if(ERROR_PARAM in ret){
					JSCaller.throwException(ret.error);
				}else{
					return JSInfoObject.convert(ret.value, cls);
				}
			}
			return undefined;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @param path 
		* @param cls 
		* @return * 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getParamValue(obj:JSDynamic, path:String, cls:Class=null):*{
			var ret:Object = ExternalInterface.call(JSCaller.getParamValueMethod, _name, obj.js_interface::info.toObject(), path);
			if(ret){
				if(ERROR_PARAM in ret){
					JSCaller.throwException(ret.error);
				}else{
					return JSInfoObject.convert(ret.value, cls);
				}
			}
			return undefined;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getWindow(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getWindowLinkMethod, _name), cls);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getDocument(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getDocumentLinkMethod, _name), cls);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getNavigator(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getNavigatorLinkMethod, _name), cls);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getMain(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getMainLinkMethod, _name), cls);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getEvent(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getEventLinkMethod, _name), cls);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param url 
		* @param func 
		* @param type 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function loadJavaScript(url:String, func:Function=null, type:String='', cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.loadJavaScriptMethod, _name, url, (func!=null) ? JSCaller.addCallback(func) : '', type), cls);
		}
		
		/**
		* 
		* @param code
		* @param type
		* @param cls
		* @return 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function pushSCRIPTTag(code:String, type:String='', cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.pushSCRIPTTagMethod, _name, code, type), cls);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param url 
		* @param func 
		* @param type 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function loadCSS(url:String, func:Function=null, type:String='', cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.loadCSSMethod, _name, url, (func!=null) ? JSCaller.addCallback(func) : '', type), cls);
		}
		
		/**
		* 
		* @param style
		* @param type
		* @param cls
		* @return 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function pushSTYLETag(style:String, type:String='', cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.pushSTYLETagMethod, _name, style, type), cls);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @param propName 
		* @param args 
		* @param func 
		* @param timeout 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function callLater(obj:*, propName:String, args:Array=null, func:Function=null, timeout:uint=1):void{
			var handlerName:String = '';
			if(func!=null){
				var handler:Object = function(obj:Object):void{
					arguments.callee.func(JSInfoObject.convert(obj));
				}
				handler.func = func;
				handlerName = JSCaller.addCallback(handler as Function);
			}
			if(!args) args = [];
			else args = JSInfoObject.createByList(args);
			if(obj is JSDynamic){
				ExternalInterface.call(JSCaller.callLaterMethod, _name, (obj as JSDynamic).js_interface::name, propName, args, handlerName, timeout);
			}else{
				ExternalInterface.call(JSCaller.callLaterCall(obj as String, propName, args, handlerName, timeout));
			}
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param flCallbacks 
		* @param flObjects 
		* @param jsCallbacks 
		* @param jsObjects 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function clear(flCallbacks:Boolean=true, flObjects:Boolean=true, jsCallbacks:Boolean=true, jsObjects:Boolean=true):void{
			if(flObjects) JSInstanceCache.clear();
			ExternalInterface.call(JSCaller.JSI_CLEAR, _name, flCallbacks, flObjects);
			FLObject.clearAllFromJS(jsCallbacks, jsObjects);
			
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @param wRet 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function callAnonymous(str:String, wRet:Boolean=false):*{
			return ExternalInterface.call(JSCaller.getAnonymousCall(str, wRet));
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getQuotedString(str:String):String{
			var qt:String = JSCaller.JS_STRING_QUOTE;
			return qt+str.split('\\').join('\\\\').split(qt).join('\\'+qt)+qt;
		}
		//-------------------------------------------

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param name 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function removeFunction(name:String):void{
			ExternalInterface.call(JSCaller.removeFuncMethod, _name, name);
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function functionExists(name:String):Boolean{
			return ExternalInterface.call(JSCaller.isExistsFuncMethod, _name, name);
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param name 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function removeObject(name:String):void{
			ExternalInterface.call(JSCaller.removeObjectMethod, _name, name);
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function objectExists(name:String):Boolean{
			return ExternalInterface.call(JSCaller.isExistsObjectMethod, _name, name);
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param args 
		* @param code 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function createFunction(args:Array, code:String):Object{
			if(!args) args = [];
			var argsStr:String = args.join(',');
			var ret:Object = ExternalInterface.call(JSCaller.createFunctionMethod, _name, args, code);
			if(ret){
				if(ERROR_PARAM in ret){
					JSCaller.throwException(ret.error);
				}else{
					return ret.value;
				}
			}
			return undefined;
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param className 
		* @param args 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function createObject(className:String, args:Array=null):Object{
			if(!args) args = [];
			else args = JSInfoObject.createByList(args);
			var ret:Object = ExternalInterface.call(JSCaller.createInstanceMethod, _name, className, args);
			if(ret){
				if(ERROR_PARAM in ret){
					JSCaller.throwException(ret.error);
				}else{
					return ret.value;
				}
			}
			return undefined;
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param inst 
		* @param args 
		* @return Object 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function createObjectByLink(inst:JSDynamic, args:Array=null):Object{
			if(!args) args = [];
			else args = JSInfoObject.createByList(args);
			var info:JSInfoObject = inst.js_interface::info;
			var ret:Object = ExternalInterface.call(JSCaller.createInstanceByLinkMethod, _name, info.value, info.type, args);
			if(ret){
				if(ERROR_PARAM in ret){
					JSCaller.throwException(ret.error);
				}else{
					return ret.value;
				}
			}
			return undefined;
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param objectName 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function propertyList(objectName:String):Array{
			return ExternalInterface.call(JSCaller.getPropertyListMethod, _name, objectName);
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param objectName 
		* @param callbackName 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function forEach(objectName:String, callbackName:String):void{
			ExternalInterface.call(JSCaller.forEachMethod, _name, objectName, callbackName);
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param funcName 
		* @param objectName 
		* @param args 
		* @param cls 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function callFunction(funcName:String, objectName:String, args:Array=null, cls:Class=null):*{
			if(!args) args = [];
			else args = JSInfoObject.createByList(args);
			var ret:Object = ExternalInterface.call(JSCaller.callFunctionMethod, _name, funcName, objectName, args);
			if(ret){
				if(ERROR_PARAM in ret){
					JSCaller.throwException(ret.error);
				}else{
					return JSInfoObject.convert(ret.value, cls);
				}
			}
			return undefined;
		}

		/** 
		* 
		* 
		* 
		* @private (internal) 
		* @param objectName 
		* @param methodName 
		* @param type 
		* @param args 
		* @param cls 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function callProperty(objectName:String, methodName:String, type:String, args:Array=null, cls:Class=null):*{
			if(!args) args = [];
			else args = JSInfoObject.createByList(args);
			var ret:Object = ExternalInterface.call(JSCaller.callPropertyMethod, _name, objectName, methodName, type, args);
			if(ret){
				if(ERROR_PARAM in ret){
					JSCaller.throwException(ret.error);
				}else{
					return JSInfoObject.convert(ret.value, cls);
				}
			}
			return undefined;
		}
	}
}