package aw.external.jsinterface{
	import aw.external.*;
	
	import flash.external.ExternalInterface;
	[ExcludeClass]
	/**
	 *  @private
	 */
	public class JSCore extends Object{
		static public const ERROR_PARAM:String = 'error';
		static protected var _name:String;
		static protected var _hasDocument:Boolean = false;
		static public function init(url:String=''):void{
			if(!initialized){
				installJSICommands();
				createJSInterface(url);
				JSCaller.initialize();
				FLObject.initialize();
				ExternalInterface.call(JSCaller.ON_INSTALLED);
			}
		}
		static protected function installJSICommands():void{
			if(!ExternalInterface.call(JSCoreCommands.VERIFY_JSI_INSTALLATION)){
				JSCoreCommands.callJSCommands(JSCoreCommands.JSI_COMMANDS);
			}
			_hasDocument = ExternalInterface.call(JSCoreCommands.VERIFY_DOCUMENT_AVAILABILITY);
		}
		static protected function createJSInterface(url:String):void{
			_name = ExternalInterface.call(JSCaller.JSI_CREATE, ExternalInterface.objectID, url);
		}
		static public function get initialized():Boolean{
			return Boolean(_name);
		}
		static public function get name():String{
			return _name;
		}
		static public function hasDocument():Boolean{
			return _hasDocument;
		}
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
		static public function getWindow(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getWindowLinkMethod, _name), cls);
		}
		static public function getDocument(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getDocumentLinkMethod, _name), cls);
		}
		static public function getNavigator(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getNavigatorLinkMethod, _name), cls);
		}
		static public function getMain(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getMainLinkMethod, _name), cls);
		}
		static public function getEvent(cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.getEventLinkMethod, _name), cls);
		}
		static public function loadJavaScript(url:String, func:Function=null, type:String='', cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.loadJavaScriptMethod, _name, url, (func!=null) ? JSCaller.addCallback(func) : '', type), cls);
		}
		static public function loadCSS(url:String, func:Function=null, type:String='', cls:Class=null):JSDynamic{
			return JSInstanceCache.getByInfo(ExternalInterface.call(JSCaller.loadCSSMethod, _name, url, (func!=null) ? JSCaller.addCallback(func) : '', type), cls);
		}
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
		static public function clear(flCallbacks:Boolean=true, flObjects:Boolean=true, jsCallbacks:Boolean=true, jsObjects:Boolean=true):void{
			if(flObjects) JSInstanceCache.clear();
			ExternalInterface.call(JSCaller.JSI_CLEAR, _name, flCallbacks, flObjects);
			FLObject.clearAllFromJS(jsCallbacks, jsObjects);
			
		}
		static public function callAnonymous(str:String, wRet:Boolean=false):*{
			return ExternalInterface.call(JSCaller.getAnonymousCall(str, wRet));
		}
		static public function getQuotedString(str:String):String{
			var qt:String = JSCaller.JS_STRING_QUOTE;
			return qt+str.split('\\').join('\\\\').split(qt).join('\\'+qt)+qt;
		}
		//-------------------------------------------
		static internal function removeFunction(name:String):void{
			ExternalInterface.call(JSCaller.removeFuncMethod, _name, name);
		}
		static internal function functionExists(name:String):Boolean{
			return ExternalInterface.call(JSCaller.isExistsFuncMethod, _name, name);
		}
		static internal function removeObject(name:String):void{
			ExternalInterface.call(JSCaller.removeObjectMethod, _name, name);
		}
		static internal function objectExists(name:String):Boolean{
			return ExternalInterface.call(JSCaller.isExistsObjectMethod, _name, name);
		}
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
		static internal function propertyList(objectName:String):Array{
			return ExternalInterface.call(JSCaller.getPropertyListMethod, _name, objectName);
		}
		static internal function forEach(objectName:String, callbackName:String):void{
			ExternalInterface.call(JSCaller.forEachMethod, _name, objectName, callbackName);
		}
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