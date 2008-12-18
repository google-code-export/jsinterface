package aw.external.jsinterface{
	import aw.data.json.JSONPacker;
	import aw.errors.JSError;
	import aw.external.*;
	import aw.utils.MethodCaller;
	
	import flash.external.ExternalInterface;
	[ExcludeClass]
	/**
	 *  @private
	 */
	internal class JSCaller extends Object{
		static public const CALLBACK_REMOVED_ERROR:String = 'Removed callback can\'t be called.';
		static public const CALLBACK_EMPTY_ERROR:String = 'Callback link can\'t be empty.';
		static private const CALLBACKS_BASE_NAME:String = 'jsiCallback_';
		static private const HANDLERS_BASE_NAME:String = 'jsiHandler_';
		static private const LEFT_ANONYMOUS:String = '(function(){';
		static private const RIGHT_ANONYMOUS:String = ';})';
		static public const JS_STRING_QUOTE:String = '"';
		static private const LEFT_GET_JSI_OBJECT:String = 'JSI.get(';
		static public const RIGHT_GET_JSI_OBJECT:String = ')';
		static private const GET_JSINAME_METHOD:String = 'getJSIName';
		static private const CALL_METHOD:String = 'jsiCaller_CallMethod';
		static private const FOR_EACH_METHOD:String = 'jsiCaller_ForEachMethod';
		static private const THROW_EXCEPTION:String = 'jsiCaller_ThrowException';
		
		static public const JSI_CREATE:String = 'JSI.create';
		static public const JSI_GET:String = 'JSI.get';
		static public const JSI_CLEAR:String = 'JSI.clear';
		static public const ON_INSTALLED:String = 'JSI.onInstalled';
		
		static public const JSI_REMOVE_OBJECT:String = 'JSI.removeObject';
		static public const JSI_ISEXISTS_OBJECT:String = 'JSI.isExistsObject';
		static public const JSI_REMOVE_FUNC:String = 'JSI.removeFunc';
		static public const JSI_ISEXISTS_FUNC:String = 'JSI.isExistsFunc';
		
		static public const JSI_HAS_DOCUMENT:String = 'JSI.hasDocument';
		static public const JSI_GET_DOCUMENT_LINK:String = 'JSI.getDocumentLink';
		static public const JSI_GET_WINDOW_LINK:String = 'JSI.getWindowLink';
		static public const JSI_GET_NAVIGATOR_LINK:String = 'JSI.getNavigatorLink';
		static public const JSI_GET_MAIN_LINK:String = 'JSI.getMainLink';
		static public const JSI_GET_EVENT_LINK:String = 'JSI.getEventLink';
		static public const JSI_GET_INFO:String = 'JSI.getInfo';
		static public const JSI_TRY_GET_INFO:String = 'JSI.tryGetInfo';
		static public const JSI_GET_PARAM_VALUE:String = 'JSI.getParamValue';
		static public const JSI_TRY_GET_PARAM_VALUE:String = 'JSI.tryGetParamValue';
		static public const JSI_CREATE_FUNCTION:String = 'JSI.createFunction';
		static public const JSI_TRY_CREATE_FUNCTION:String = 'JSI.tryCreateFunction';
		static public const JSI_CREATE_INSTANCE:String = 'JSI.createInstance';
		static public const JSI_TRY_CREATE_INSTANCE:String = 'JSI.tryCreateInstance';
		static public const JSI_CREATE_INSTANCE_BY_LINK:String = 'JSI.createInstanceByLink';
		static public const JSI_TRY_CREATE_INSTANCE_BY_LINK:String = 'JSI.tryCreateInstanceByLink';
		static public const JSI_CALL_FUNCTION:String = 'JSI.callFunction';
		static public const JSI_TRY_CALL_FUNCTION:String = 'JSI.tryCallFunction';
		static public const JSI_CALL_LATER:String = 'JSI.callLater';
		static public const JSI_TRY_CALL_LATER:String = 'JSI.tryCallLater';
		static public const JSI_GET_PROPERTY:String = 'JSI.getProperty';
		static public const JSI_TRY_GET_PROPERTY:String = 'JSI.tryGetProperty';
		static public const JSI_HAS_PROPERTY:String = 'JSI.hasProperty';
		static public const JSI_TRY_HAS_PROPERTY:String = 'JSI.tryHasProperty';
		static public const JSI_SET_PROPERTY:String = 'JSI.setProperty';
		static public const JSI_TRY_SET_PROPERTY:String = 'JSI.trySetProperty';
		static public const JSI_DELETE_PROPERTY:String = 'JSI.deleteProperty';
		static public const JSI_TRY_DELETE_PROPERTY:String = 'JSI.tryDeleteProperty';
		static public const JSI_CALL_PROPERTY:String = 'JSI.callProperty';
		static public const JSI_TRY_CALL_PROPERTY:String = 'JSI.tryCallProperty';
		static public const JSI_FOR_EACH:String = 'JSI.forEach';
		static public const JSI_GET_PROPERTY_LIST:String = 'JSI.getPropertyList';
		static public const JSIINCLUDE_LOAD_JAVASCRIPT:String = 'JSIInclude.loadJavaScript';
		static public const JSIINCLUDE_TRY_LOAD_JAVASCRIPT:String = 'JSIInclude.tryLoadJavaScript';
		static public const JSIINCLUDE_LOAD_CSS:String = 'JSIInclude.loadCSS';
		static public const JSIINCLUDE_TRY_LOAD_CSS:String = 'JSIInclude.tryLoadCSS';
		static protected var _callbacks:Object = {};
		static protected var _forEach:Object = {};
		static protected var _initialized:Boolean = false;
		static public function addCallback(f:Function):String{
			for(var p:String in _callbacks){
				if(_callbacks[p]===f) return p;
			}
			var name:String = newCallbackName;
			_callbacks[name] = f;
			return name;
		}
		static public function addForEachHandler(handler:Function):String{
			var name:String = newHandlerName;
			_forEach[name] = handler;
			return name;
		}
		static public function getCallback(name:String):Function{
			return _callbacks[name];
		}
		static public function getForEachHandler(name:String):Function{
			return _forEach[name];
		}
		static public function initialize():void{
			if(_initialized) return;
			if(JSCore.hasDocument()){
				ExternalInterface.addCallback(CALL_METHOD, callMethod);
				ExternalInterface.addCallback(FOR_EACH_METHOD, forEachCallbackMethod);
				ExternalInterface.addCallback(GET_JSINAME_METHOD, getJSINameMethod);
				ExternalInterface.addCallback(THROW_EXCEPTION, throwException);
			}
			_initialized = true;
		}
		static public function removeCallback(name:String):void{
			delete _callbacks[name];
		}
		static public function removeForEachHandler(name:String):void{
			delete _forEach[name];
		}
		static public function removeAllCalbacks():void{
			var i:int = 0;
			for(var p:String in _callbacks){
				removeCallback(p);
				i++;
			}
			_callbacks = {};
		}
		static public function removeForEachHandlers():void{
			for(var p:String in _forEach){
				removeForEachHandler(p);
			}
		}
		static public function clear():void{
			removeAllCalbacks();
		}
		static protected function getJSINameMethod():String{
			return JSCore.name;
		}
		static protected function forEachCallbackMethod(callback:String, param:String, val:Object):void{
			_forEach[callback](param, JSInfoObject.convert(val)); 
		}
		static protected function callMethod(obj:Object, name:String, args:Array):*{
			if(!name) throw new Error(CALLBACK_EMPTY_ERROR);
			if(!(name in _callbacks)) throw new Error(CALLBACK_REMOVED_ERROR);
			if(args) args = JSInfoObject.convertByList(args);
			else args = [];
			if(obj){
				var p:JSDynamic = JSInstanceCache.getByInfo(obj);
				return p.js_interface::callCallback(_callbacks[name], args);
			}else return MethodCaller.apply(_callbacks[name], args);
		}
		static internal function throwException(o:Object):void{
			var e:Error;
			if('flId' in o){
				e = getFLError(o);
			}else{
				e = getJSError(o);
			}
			if(JSInterface.exceptionHandler!=null) JSInterface.exceptionHandler(e);
			else{
				if(JSInterface.traceExceptionOnly){
					trace(e);
				}else throw e;
			} 
		}
		static private function getFLError(o:Object):Error{
			var mess:String = '{Flash ['+o.flDef+']} '+o.flStackTrace+'\n\n';
			var e:Error = new Error(mess, o.flId);
			return e;
		}
		static private function getJSError(o:Object):JSError{
			var target:*=null;
			if('target' in o){
				if(o.target is String){
					target = o.target;
				}else{
					target = JSInfoObject.convert(o.target);
				}
			}
			//trace(o.message, o.number, o.description, o.fileName, o.lineNumber, o.name, o.stack, o.target, o.property);
			var e:JSError = new JSError(o.message, o.number, o.description, o.fileName, o.lineNumber, o.name, o.stack, o.target, o.property);
			return e;
		}
		static public function getAnonymousCall(str:String, wRet:Boolean=false):String{
			var ls:String = LEFT_ANONYMOUS;
			if(wRet) ls += 'return ';
			return ls+str+RIGHT_ANONYMOUS;
		}
		static protected var _callbacksIndex:int = 0;
		static public function get newCallbackName():String{
			return CALLBACKS_BASE_NAME+String(_callbacksIndex++);
		}
		static protected var _handlersIndex:int = 0;
		static public function get newHandlerName():String{
			return HANDLERS_BASE_NAME+String(_handlersIndex++);
		}
		//------------------------------------- Имена методов не требующих анонимной функции в качестве обёртки
		static public function get hasDocumentMethod():String{
			return JSI_HAS_DOCUMENT;
		}
		static public function get getDocumentLinkMethod():String{
			return JSI_GET_DOCUMENT_LINK;
		}
		static public function get getWindowLinkMethod():String{
			return JSI_GET_WINDOW_LINK;
		}
		static public function get getNavigatorLinkMethod():String{
			return JSI_GET_NAVIGATOR_LINK;
		}
		static public function get getMainLinkMethod():String{
			return JSI_GET_MAIN_LINK;
		}
		static public function get getEventLinkMethod():String{
			return JSI_GET_EVENT_LINK;
		}
		static public function get getInfoMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_GET_INFO : JSI_GET_INFO;
		}
		static public function get getParamValueMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_GET_PARAM_VALUE : JSI_GET_PARAM_VALUE;
		}
		static public function get createFunctionMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CREATE_FUNCTION : JSI_CREATE_FUNCTION;
		}
		static public function get createInstanceMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CREATE_INSTANCE : JSI_CREATE_INSTANCE;
		}
		static public function get createInstanceByLinkMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CREATE_INSTANCE_BY_LINK : JSI_CREATE_INSTANCE_BY_LINK;
		}
		static public function get removeObjectMethod():String{
			return JSI_REMOVE_OBJECT;
		}
		static public function get isExistsObjectMethod():String{
			return JSI_ISEXISTS_OBJECT;
		}
		static public function get callFunctionMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CALL_FUNCTION : JSI_CALL_FUNCTION;
		}
		static public function get callLaterMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CALL_LATER : JSI_CALL_LATER;
		}
		static public function get removeFuncMethod():String{
			return JSI_REMOVE_FUNC;
		}
		static public function get isExistsFuncMethod():String{
			return JSI_ISEXISTS_FUNC;
		}
		static public function get getPropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_GET_PROPERTY : JSI_GET_PROPERTY;
		}
		static public function get hasPropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_HAS_PROPERTY : JSI_HAS_PROPERTY;
		}
		static public function get setPropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_SET_PROPERTY : JSI_SET_PROPERTY;
		}
		static public function get deletePropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_DELETE_PROPERTY : JSI_DELETE_PROPERTY;
		}
		static public function get callPropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CALL_PROPERTY : JSI_CALL_PROPERTY;
		}
		static public function get forEachMethod():String{
			return JSI_FOR_EACH;
		}
		static public function get getPropertyListMethod():String{
			return JSI_GET_PROPERTY_LIST;
		}
		static public function get loadJavaScriptMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSIINCLUDE_TRY_LOAD_JAVASCRIPT : JSIINCLUDE_LOAD_JAVASCRIPT;
		}
		static public function get loadCSSMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSIINCLUDE_TRY_LOAD_CSS : JSIINCLUDE_LOAD_CSS;
		}
		//------------------------------------- Вызовы методов требующих обёртку
		static public function callLaterCall(path:String, propName:String, args:Array, handlerName:String, timeout:uint):String{
			return callLaterMethod+'("'+JSCore.name+'",'+path+',"'+propName+'",'+JSONPacker.packArray(args, true)+',"'+handlerName+'",'+timeout+')';
		}
	}
}