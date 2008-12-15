package aw.external.jsinterface{
	import aw.external.*;
	import aw.external.jsinterface.objects.JSDocument;
	import aw.external.jsinterface.objects.JSEvent;
	import aw.external.jsinterface.objects.JSHTMLElement;
	import aw.external.jsinterface.objects.JSNavigator;
	import aw.external.jsinterface.objects.JSObjectTypeMapper;
	import aw.external.jsinterface.objects.JSWindow;
	
	import flash.external.ExternalInterface;
	[ExcludeClass]
	/**
	 *  @private
	 */
	public class JSCore extends Object{
		/** 
		* 
		* @public (constant) 
		*/
		static public const ERROR_PARAM:String = 'error';
		/** 
		* 
		* @private (protected) 
		*/
		static protected var _name:String;
		/** 
		* 
		* @private (protected) 
		*/
		static protected var _hasDocument:Boolean = false;
		/** 
		* 
		* @public 
		* @param url 
		* @return void 
		*/
		static public function init(url:String=''):void{
			if(!initialized){
				installJSICommands();
				createJSInterface(url);
				JSCaller.initialize();
				FLObject.initialize();
				JSObjectTypeMapper.initialize();
				ExternalInterface.call(JSCaller.ON_INSTALLED);
			}
		}
		/** 
		* 
		* @private (protected) 
		* @return void 
		*/
		static protected function installJSICommands():void{
			if(!ExternalInterface.call(JSCoreCommands.VERIFY_JSI_INSTALLATION)){
				JSCoreCommands.callJSCommands(JSCoreCommands.JSI_COMMANDS);
			}
			_hasDocument = ExternalInterface.call(JSCoreCommands.VERIFY_DOCUMENT_AVAILABILITY);
		}
		/** 
		* 
		* @private (protected) 
		* @param url 
		* @return void 
		*/
		static protected function createJSInterface(url:String):void{
			_name = ExternalInterface.call(JSCaller.JSI_CREATE, ExternalInterface.objectID, url);
		}
		/** 
		* 
		* @public (getter) 
		* @return Boolean 
		*/
		static public function get initialized():Boolean{
			return Boolean(_name);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		static public function get name():String{
			return _name;
		}
		/** 
		* 
		* @public 
		* @return Boolean 
		*/
		static public function hasDocument():Boolean{
			return _hasDocument;
		}
		/** 
		* 
		* @public 
		* @param path 
		* @param cls 
		* @return Object 
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
		* @public 
		* @return JSWindow 
		* @see aw.external.jsinterface.objects.JSWindow 
		*/
		static public function getWindow():JSWindow{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getWindowLinkMethod, _name), JSWindow) as JSWindow;
		}
		/** 
		* 
		* @public 
		* @return JSDocument 
		* @see aw.external.jsinterface.objects.JSDocument 
		*/
		static public function getDocument():JSDocument{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getDocumentLinkMethod, _name), JSDocument) as JSDocument;
		}
		/** 
		* 
		* @public 
		* @return JSNavigator 
		* @see aw.external.jsinterface.objects.JSNavigator 
		*/
		static public function getNavigator():JSNavigator{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getNavigatorLinkMethod, _name), JSNavigator) as JSNavigator;
		}
		/** 
		* 
		* @public 
		* @return JSHTMLElement 
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		*/
		static public function getMain():JSHTMLElement{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getMainLinkMethod, _name), JSHTMLElement) as JSHTMLElement;
		}
		/** 
		* 
		* @public 
		* @return JSEvent 
		* @see aw.external.jsinterface.objects.JSEvent 
		*/
		static public function getEvent():JSEvent{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getEventLinkMethod, _name), JSEvent) as JSEvent;
		}
		/** 
		* 
		* @public 
		* @param url 
		* @param func 
		* @param type 
		* @return JSHTMLElement 
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		*/
		static public function loadJavaScript(url:String, func:Function=null, type:String=''):JSHTMLElement{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.loadJavaScriptMethod, _name, url, (func!=null) ? JSCaller.addCallback(func) : '', type), JSHTMLElement) as JSHTMLElement;
		}
		/** 
		* 
		* @public 
		* @param url 
		* @param func 
		* @param type 
		* @return JSHTMLElement 
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		*/
		static public function loadCSS(url:String, func:Function=null, type:String=''):JSHTMLElement{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.loadCSSMethod, _name, url, (func!=null) ? JSCaller.addCallback(func) : '', type), JSHTMLElement) as JSHTMLElement;
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param propName 
		* @param args 
		* @param func 
		* @param timeout 
		* @return void 
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
		* @public 
		* @param flCallbacks 
		* @param flObjects 
		* @param jsCallbacks 
		* @param jsObjects 
		* @return void 
		*/
		static public function clear(flCallbacks:Boolean=true, flObjects:Boolean=true, jsCallbacks:Boolean=true, jsObjects:Boolean=true):void{
			if(flObjects) JSInstanceCache.clear();
			ExternalInterface.call(JSCaller.JSI_CLEAR, _name, flCallbacks, flObjects);
			FLObject.clearAllFromJS(jsCallbacks, jsObjects);
			
		}
		/** 
		* 
		* @public 
		* @param str 
		* @param wRet 
		* @return * 
		*/
		static public function callAnonymous(str:String, wRet:Boolean=false):*{
			return ExternalInterface.call(JSCaller.getAnonymousCall(str, wRet));
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return String 
		*/
		static public function getQuotedString(str:String):String{
			var qt:String = JSCaller.JS_STRING_QUOTE;
			return qt+str.split('\\').join('\\\\').split(qt).join('\\'+qt)+qt;
		}
		//-------------------------------------------
		/** 
		* 
		* @private (internal) 
		* @param name 
		* @return void 
		*/
		static internal function removeFunction(name:String):void{
			ExternalInterface.call(JSCaller.removeFuncMethod, _name, name);
		}
		/** 
		* 
		* @private (internal) 
		* @param name 
		* @return Boolean 
		*/
		static internal function functionExists(name:String):Boolean{
			return ExternalInterface.call(JSCaller.isExistsFuncMethod, _name, name);
		}
		/** 
		* 
		* @private (internal) 
		* @param name 
		* @return void 
		*/
		static internal function removeObject(name:String):void{
			ExternalInterface.call(JSCaller.removeObjectMethod, _name, name);
		}
		/** 
		* 
		* @private (internal) 
		* @param name 
		* @return Boolean 
		*/
		static internal function objectExists(name:String):Boolean{
			return ExternalInterface.call(JSCaller.isExistsObjectMethod, _name, name);
		}
		/** 
		* 
		* @private (internal) 
		* @param args 
		* @param code 
		* @return Object 
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
		* @private (internal) 
		* @param className 
		* @param args 
		* @return Object 
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
		* @private (internal) 
		* @param inst 
		* @param args 
		* @return Object 
		* @see aw.external.jsinterface.JSDynamic 
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
		* @private (internal) 
		* @param objectName 
		* @return Array 
		*/
		static internal function propertyList(objectName:String):Array{
			return ExternalInterface.call(JSCaller.getPropertyListMethod, _name, objectName);
		}
		/** 
		* 
		* @private (internal) 
		* @param objectName 
		* @param callbackName 
		* @return void 
		*/
		static internal function forEach(objectName:String, callbackName:String):void{
			ExternalInterface.call(JSCaller.forEachMethod, _name, objectName, callbackName);
		}
		/** 
		* 
		* @private (internal) 
		* @param funcName 
		* @param objectName 
		* @param args 
		* @param cls 
		* @return * 
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
		* @private (internal) 
		* @param objectName 
		* @param methodName 
		* @param type 
		* @param args 
		* @param cls 
		* @return * 
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