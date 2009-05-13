package aw.external.jsinterface{
	import aw.data.json.JSONPacker;
	import aw.errors.JSError;
	import aw.external.*;
	import aw.utils.MethodCaller;
	
	import flash.external.ExternalInterface;
	import flash.utils.getQualifiedClassName;
	[ExcludeClass]
	/**
	 * The class contains the main methods through which JSInterface communicates and co-operates with JavaScript environment.
	 * Manager for:
	 * <ul>
	 * <li>Links of functions and methods transferred into JavaScript environment</li>
	 * <li>Links of methods of moving properties of JavaScript objects via the cycle <code>for...in</code>, or <code>for each...in</code> at the moment</li>
	 * </ul>  
	 * This class is responsible for transferring the call to the function of feedback over the properties of JavaScript objects and for handling errors occurring in the JavaScript environment.
	 * Also, this class forms a requests to the JavaScript environment.
	 * 
	 *  @private
	 * @see aw.external.JSInterface
	 * @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	 */
	internal class JSCaller extends Object{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CALLBACK_REMOVED_ERROR:String = 'Removed callback can\'t be called.';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CALLBACK_EMPTY_ERROR:String = 'Callback link can\'t be empty.';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const CALLBACKS_BASE_NAME:String = 'fc';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const HANDLERS_BASE_NAME:String = 'fh';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const LEFT_ANONYMOUS:String = '(function(){';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const RIGHT_ANONYMOUS:String = ';})';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JS_STRING_QUOTE:String = '"';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const LEFT_GET_JSI_OBJECT:String = 'JSI.get(';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const RIGHT_GET_JSI_OBJECT:String = ')';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_JSINAME_METHOD:String = 'getJSIName';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const CALL_METHOD:String = 'jsiCaller_CallMethod';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const FOR_EACH_METHOD:String = 'jsiCaller_ForEachMethod';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const THROW_EXCEPTION:String = 'jsiCaller_ThrowException';
		

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_CREATE:String = 'JSI.create';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET:String = 'JSI.get';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_CLEAR:String = 'JSI.clear';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const ON_INSTALLED:String = 'JSI.onInstalled';
		

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_REMOVE_OBJECT:String = 'JSI.removeObject';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_ISEXISTS_OBJECT:String = 'JSI.isExistsObject';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_REMOVE_FUNC:String = 'JSI.removeFunc';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_ISEXISTS_FUNC:String = 'JSI.isExistsFunc';
		

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_HAS_DOCUMENT:String = 'JSI.hasDocument';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET_DOCUMENT_LINK:String = 'JSI.getDocumentLink';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET_WINDOW_LINK:String = 'JSI.getWindowLink';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET_NAVIGATOR_LINK:String = 'JSI.getNavigatorLink';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET_MAIN_LINK:String = 'JSI.getMainLink';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET_EVENT_LINK:String = 'JSI.getEventLink';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET_INFO:String = 'JSI.getInfo';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_GET_INFO:String = 'JSI.tryGetInfo';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET_PARAM_VALUE:String = 'JSI.getParamValue';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_GET_PARAM_VALUE:String = 'JSI.tryGetParamValue';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_CREATE_FUNCTION:String = 'JSI.createFunction';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_CREATE_FUNCTION:String = 'JSI.tryCreateFunction';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_CREATE_INSTANCE:String = 'JSI.createInstance';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_CREATE_INSTANCE:String = 'JSI.tryCreateInstance';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_CREATE_INSTANCE_BY_LINK:String = 'JSI.createInstanceByLink';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_CREATE_INSTANCE_BY_LINK:String = 'JSI.tryCreateInstanceByLink';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_CALL_FUNCTION:String = 'JSI.callFunction';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_CALL_FUNCTION:String = 'JSI.tryCallFunction';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_CALL_LATER:String = 'JSI.callLater';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_CALL_LATER:String = 'JSI.tryCallLater';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET_PROPERTY:String = 'JSI.getProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_GET_PROPERTY:String = 'JSI.tryGetProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_HAS_PROPERTY:String = 'JSI.hasProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_HAS_PROPERTY:String = 'JSI.tryHasProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_SET_PROPERTY:String = 'JSI.setProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_SET_PROPERTY:String = 'JSI.trySetProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_DELETE_PROPERTY:String = 'JSI.deleteProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_DELETE_PROPERTY:String = 'JSI.tryDeleteProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_CALL_PROPERTY:String = 'JSI.callProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_TRY_CALL_PROPERTY:String = 'JSI.tryCallProperty';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_FOR_EACH:String = 'JSI.forEach';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSI_GET_PROPERTY_LIST:String = 'JSI.getPropertyList';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSIINCLUDE_LOAD_JAVASCRIPT:String = 'JSIInclude.loadJavaScript';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSIINCLUDE_TRY_LOAD_JAVASCRIPT:String = 'JSIInclude.tryLoadJavaScript';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSIINCLUDE_LOAD_CSS:String = 'JSIInclude.loadCSS';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSIINCLUDE_TRY_LOAD_CSS:String = 'JSIInclude.tryLoadCSS';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSIINCLUDE_PUSH_SCRIPT_TAG:String = 'JSIInclude.pushSCRIPTTag';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSIINCLUDE_TRY_PUSH_SCRIPT_TAG:String = 'JSIInclude.tryPushSCRIPTTag';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSIINCLUDE_PUSH_STYLE_TAG:String = 'JSIInclude.pushSTYLETag';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSIINCLUDE_TRY_PUSH_STYLE_TAG:String = 'JSIInclude.tryPushSTYLETag';

		/** 
		* Stack of all functions transferred to the JavaScript environment.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _callbacks:Object = {};

		/** 
		* Stack of all functions of the properties of JavaScript objects moving at the moment.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _forEach:Object = {};

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _initialized:Boolean = false;

		/** 
		* Add function to the stack.
		* 
		* 
		* @public 
		* @param f Function/method object.
		* @return String Link to function in the stack.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function addCallback(f:Function):String{
			for(var p:String in _callbacks){
				if(_callbacks[p]===f) return p;
			}
			var name:String = newCallbackName;
			_callbacks[name] = f;
			return name;
		}

		/** 
		* Add a callback function for the sorting in the stack.
		* 
		* 
		* @public 
		* @param handler Link to a callback function for the sorting.
		* @return String Link to function in the stack.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function addForEachHandler(handler:Function):String{
			var name:String = newHandlerName;
			_forEach[name] = handler;
			return name;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return Function 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getCallback(name:String):Function{
			return _callbacks[name];
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return Function 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getForEachHandler(name:String):Function{
			return _forEach[name];
		}

		/** 
		* The method of initialization, registers the necessary JavaScript functions.
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
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

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function removeCallback(name:String):void{
			delete _callbacks[name];
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function removeForEachHandler(name:String):void{
			delete _forEach[name];
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function removeAllCalbacks():void{
			var i:int = 0;
			for(var p:String in _callbacks){
				removeCallback(p);
				i++;
			}
			_callbacks = {};
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function removeForEachHandlers():void{
			for(var p:String in _forEach){
				removeForEachHandler(p);
			}
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function clear():void{
			removeAllCalbacks();
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function getJSINameMethod():String{
			return JSCore.name;
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @param callback 
		* @param param 
		* @param val 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function forEachCallbackMethod(callback:String, param:String, val:Object):void{
			_forEach[callback](param, JSInfoObject.convert(val)); 
		}

		/** 
		* Invoking a method from the stack by the link.
		* 
		* 
		* @private (protected) 
		* @param obj 
		* @param name 
		* @param args 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callMethod(obj:Object, name:String, args:Array):*{
			var method:Function;
			var target:JSDynamic = JSInstanceCache.getByInfo(obj);
			if(!name) throw new Error(CALLBACK_EMPTY_ERROR);
			if(name in _callbacks) method = _callbacks[name];
			else throw new Error(CALLBACK_REMOVED_ERROR);
			if(args) args = JSInfoObject.convertByList(args, false);
			else args = [];
			args = JSArguments.convert(method, args, target);
			var value:*;
			if(target) value = target.js_interface::callCallback(method, args);
			else{
				if(args is JSArguments) MethodCaller.call(method, args);
				else MethodCaller.apply(method, args);
			}
			return 
		}

		/** 
		* Throw occured error.
		* 
		* 
		* @private (internal) 
		* @param o 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
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

		/** 
		* 	Convert error adding pointer to environment in which the error occurred.
		* 
		* 
		* @private 
		* @param o 
		* @return Error 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function getFLError(o:Object):Error{
			var mess:String = '{Flash ['+o.flDef+']} '+o.flStackTrace+'\n\n';
			var e:Error = new Error(mess, o.flId);
			return e;
		}

		/** 
		* 	Convert error object to object JSError, which point to an error in the JavaScript. 
		* 
		* 
		* @private 
		* @param o 
		* @return JSError 
		* @see aw.errors.JSError 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
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

		/** 
		* The method of creating a string of JavaScript call.
		* 
		* 
		* @public 
		* @param str JavaScript code string.
		* @param wRet Points to the need to return a result.
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getAnonymousCall(str:String, wRet:Boolean=false):String{
			var ls:String = LEFT_ANONYMOUS;
			if(wRet) ls += 'return ';
			return ls+str+RIGHT_ANONYMOUS;
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _callbacksIndex:int = 0;

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get newCallbackName():String{
			return CALLBACKS_BASE_NAME+String(_callbacksIndex++);
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _handlersIndex:int = 0;

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get newHandlerName():String{
			return HANDLERS_BASE_NAME+String(_handlersIndex++);
		}
		//------------------------------------- Имена методов не требующих анонимной функции в качестве обёртки

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get hasDocumentMethod():String{
			return JSI_HAS_DOCUMENT;
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
		static public function get getDocumentLinkMethod():String{
			return JSI_GET_DOCUMENT_LINK;
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
		static public function get getWindowLinkMethod():String{
			return JSI_GET_WINDOW_LINK;
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
		static public function get getNavigatorLinkMethod():String{
			return JSI_GET_NAVIGATOR_LINK;
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
		static public function get getMainLinkMethod():String{
			return JSI_GET_MAIN_LINK;
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
		static public function get getEventLinkMethod():String{
			return JSI_GET_EVENT_LINK;
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
		static public function get getInfoMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_GET_INFO : JSI_GET_INFO;
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
		static public function get getParamValueMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_GET_PARAM_VALUE : JSI_GET_PARAM_VALUE;
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
		static public function get createFunctionMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CREATE_FUNCTION : JSI_CREATE_FUNCTION;
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
		static public function get createInstanceMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CREATE_INSTANCE : JSI_CREATE_INSTANCE;
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
		static public function get createInstanceByLinkMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CREATE_INSTANCE_BY_LINK : JSI_CREATE_INSTANCE_BY_LINK;
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
		static public function get removeObjectMethod():String{
			return JSI_REMOVE_OBJECT;
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
		static public function get isExistsObjectMethod():String{
			return JSI_ISEXISTS_OBJECT;
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
		static public function get callFunctionMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CALL_FUNCTION : JSI_CALL_FUNCTION;
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
		static public function get callLaterMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CALL_LATER : JSI_CALL_LATER;
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
		static public function get removeFuncMethod():String{
			return JSI_REMOVE_FUNC;
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
		static public function get isExistsFuncMethod():String{
			return JSI_ISEXISTS_FUNC;
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
		static public function get getPropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_GET_PROPERTY : JSI_GET_PROPERTY;
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
		static public function get hasPropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_HAS_PROPERTY : JSI_HAS_PROPERTY;
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
		static public function get setPropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_SET_PROPERTY : JSI_SET_PROPERTY;
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
		static public function get deletePropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_DELETE_PROPERTY : JSI_DELETE_PROPERTY;
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
		static public function get callPropertyMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSI_TRY_CALL_PROPERTY : JSI_CALL_PROPERTY;
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
		static public function get forEachMethod():String{
			return JSI_FOR_EACH;
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
		static public function get getPropertyListMethod():String{
			return JSI_GET_PROPERTY_LIST;
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
		static public function get loadJavaScriptMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSIINCLUDE_TRY_LOAD_JAVASCRIPT : JSIINCLUDE_LOAD_JAVASCRIPT;
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
		static public function get loadCSSMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSIINCLUDE_TRY_LOAD_CSS : JSIINCLUDE_LOAD_CSS;
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
		static public function get pushSCRIPTTagMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSIINCLUDE_TRY_PUSH_SCRIPT_TAG : JSIINCLUDE_PUSH_SCRIPT_TAG;
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
		static public function get pushSTYLETagMethod():String{
			return JSInterface.redirectJavaScriptExceptions ? JSIINCLUDE_TRY_PUSH_STYLE_TAG : JSIINCLUDE_PUSH_STYLE_TAG;
		}
		//------------------------------------- Вызовы методов требующих обёртку

		/** 
		* 
		* 
		* 
		* @public 
		* @param path 
		* @param propName 
		* @param args 
		* @param handlerName 
		* @param timeout 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function callLaterCall(path:String, propName:String, args:Array, handlerName:String, timeout:uint):String{
			return callLaterMethod+'("'+JSCore.name+'",'+path+',"'+propName+'",'+JSONPacker.packArray(args, true)+',"'+handlerName+'",'+timeout+')';
		}
	}
}