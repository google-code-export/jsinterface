package aw.external.jsinterface{
	import aw.external.JSInterface;
	import aw.external.jsinterface.flobject.FLObjectCommands;
	import aw.utils.ClassUtils;
	import aw.utils.EvalUtils;
	
	import flash.external.ExternalInterface;
	import flash.system.ApplicationDomain;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	
	/** 
	* 
	* @private (internal) 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	internal class FLObject extends Object{
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECTS_BASE_NAME:String = 'jsiObject_';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECT_CREATE_METHOD:String = 'jsiCaller_Object_CreateMethod';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECT_INSTANCE_METHOD:String = 'jsiCaller_Object_InstanceMethod';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECT_CALL_METHOD:String = 'jsiCaller_Object_CallMethod';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECT_CALL_COMMAND:String = 'jsiCaller_Object_CallCommand';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECT_HAS_METHOD:String = 'jsiCaller_Object_HasMethod';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECT_GET_METHOD:String = 'jsiCaller_Object_GetMethod';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECT_SET_METHOD:String = 'jsiCaller_Object_SetMethod';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECT_DELETE_METHOD:String = 'jsiCaller_Object_DeleteMethod';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECT_REMOVE_METHOD:String = 'jsiCaller_Object_RemoveMethod';
		/** 
		* 
		* @private (constant) 
		*/
		static private const OBJECTS_CLEAR:String = 'jsiCaller_Objects_Clear';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JS_ACCESS_DENIED_ERROR:Object = {error:{name:'{Flash} Error: Access denied.', message:'Access denied to Flash Player objects.'}};
		/** 
		* 
		* @private (protected) 
		*/
		static protected var _objects:Object = {};
		/** 
		* 
		* @private (protected) 
		*/
		static protected var _objectsIndex:int = 0;
		/** 
		* 
		* @private (protected) 
		*/
		static protected var _initialized:Boolean = false;
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		static public function get newObjectName():String{
			return OBJECTS_BASE_NAME+String(_objectsIndex++);
		}
		/** 
		* 
		* @public 
		* @return void 
		*/
		static public function initialize():void{
			if(_initialized) return;
			if(JSCore.hasDocument()){
				ExternalInterface.addCallback(OBJECT_CREATE_METHOD, objectCreateMethod);
				ExternalInterface.addCallback(OBJECT_INSTANCE_METHOD, objectInstanceMethod);
				ExternalInterface.addCallback(OBJECT_CALL_METHOD, objectCallMethod);
				ExternalInterface.addCallback(OBJECT_CALL_COMMAND, objectCallCommand);
				ExternalInterface.addCallback(OBJECT_HAS_METHOD, objectHasMethod);
				ExternalInterface.addCallback(OBJECT_GET_METHOD, objectGetMethod);
				ExternalInterface.addCallback(OBJECT_SET_METHOD, objectSetMethod);
				ExternalInterface.addCallback(OBJECT_DELETE_METHOD, objectDeleteMethod);
				ExternalInterface.addCallback(OBJECT_REMOVE_METHOD, removeObject);
				ExternalInterface.addCallback(OBJECTS_CLEAR, clearAllFromJS);
			}
			_initialized = true;
		}
		/** 
		* 
		* @public 
		* @param o 
		* @return String 
		*/
		static public function addObject(o:Object):String{
			for(var p:String in _objects){
				if(_objects[p]===o) return p;
			}
			var name:String = newObjectName;
			_objects[name] = o;
			return name;
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return Object 
		*/
		static public function getObject(name:String):Object{
			return _objects[name];
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return void 
		*/
		static public function removeObject(name:String):void{
			delete _objects[name];
		}
		/** 
		* 
		* @public 
		* @return void 
		*/
		static public function removeAllObjects():void{
			for(var p:String in _objects){
				removeObject(p);
			}
		}
		/** 
		* 
		* @public 
		* @return void 
		*/
		static public function clear():void{
			removeAllObjects();
		}
		/** 
		* 
		* @private (internal) 
		* @param jsCallbacks 
		* @param jsObjects 
		* @return void 
		*/
		static internal function clearAllFromJS(jsCallbacks:Boolean=true, jsObjects:Boolean=true):void{
			if(jsCallbacks) JSCaller.clear();
			if(jsObjects) FLObject.clear();
		}
		/** 
		* 
		* @private (protected) 
		* @param className 
		* @param args 
		* @return Object 
		*/
		static protected function objectCreateMethod(className:String, args:Array):Object{
			if(!JSInterface.allowJavaScriptAccess) return JS_ACCESS_DENIED_ERROR;
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectCreateMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectCreateMethod, arguments);
			}
		}
		/** 
		* 
		* @private (protected) 
		* @param className 
		* @param args 
		* @return Object 
		*/
		static protected function callObjectCreateMethod(className:String, args:Array):Object{
			var v:Object = ClassUtils.applyByName(className, JSInfoObject.convertByList(args));
			return {value:JSInfoObject.create(v)};
		}
		/** 
		* 
		* @private (protected) 
		* @param path 
		* @param target 
		* @return Object 
		*/
		static protected function objectInstanceMethod(path:String, target:Object):Object{
			if(!JSInterface.allowJavaScriptAccess) return JS_ACCESS_DENIED_ERROR;
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectInstanceMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectInstanceMethod, arguments);
			}
		}
		/** 
		* 
		* @private (protected) 
		* @param path 
		* @param target 
		* @return Object 
		*/
		static protected function callObjectInstanceMethod(path:String, target:Object):Object{
			var v:Object;
			if(!target){
				if(path=='stage') v = JSInterface.stage;
				else if(path=='root') v = JSInterface.root;
				else if(path=='applicationDomain') v = ApplicationDomain.currentDomain;
			}
			if(!v) v = EvalUtils.evaluate(path, JSInfoObject.convert(target));
			return {value:JSInfoObject.create(v)};
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param args 
		* @param uri 
		* @return Object 
		*/
		static protected function objectCallMethod(objectName:String, name:String, args:Array, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectCallMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectCallMethod, arguments);
			}
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param args 
		* @param uri 
		* @return Object 
		*/
		static protected function callObjectCallMethod(objectName:String, name:String, args:Array, uri:String):Object{
			var obj:Object = getObject(objectName);
			var qn:QName = new QName(uri, name);
			//trace(obj, qn);
			//trace(args);
			//trace(JSInfoObject.convertByList(args));
			var val:* = obj[qn].apply(obj, JSInfoObject.convertByList(args));
			return {value:JSInfoObject.create(val)};
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param cmd 
		* @param args 
		* @return * 
		*/
		static protected function objectCallCommand(objectName:String, cmd:String, args:Array=null):*{
			return FLObjectCommands.callCommand(getObject(objectName), cmd, args);
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param uri 
		* @return * 
		*/
		static protected function objectHasMethod(objectName:String, name:String, uri:String):*{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectGetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectGetMethod, arguments);
			}
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param uri 
		* @return Object 
		*/
		static protected function callObjectHasMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create((new QName(uri, name)) in obj)};
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param uri 
		* @return Object 
		*/
		static protected function objectGetMethod(objectName:String, name:String, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectGetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectGetMethod, arguments);
			}
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param uri 
		* @return Object 
		*/
		static protected function callObjectGetMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create(obj[new QName(uri, name)])};
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param value 
		* @param uri 
		* @return Object 
		*/
		static protected function objectSetMethod(objectName:String, name:String, value:Object, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectSetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectSetMethod, arguments);
			}
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param value 
		* @param uri 
		* @return Object 
		*/
		static protected function callObjectSetMethod(objectName:String, name:String, value:Object, uri:String):Object{
			var obj:Object = getObject(objectName);
			value = JSInfoObject.convert(value);
			return {value:JSInfoObject.create(obj[new QName(uri, name)] = value)};
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param uri 
		* @return Object 
		*/
		static protected function objectDeleteMethod(objectName:String, name:String, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectDeleteMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectDeleteMethod, arguments);
			}
		}
		/** 
		* 
		* @private (protected) 
		* @param objectName 
		* @param name 
		* @param uri 
		* @return Object 
		*/
		static protected function callObjectDeleteMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create(delete obj[new QName(uri, name)])};
		}
		/** 
		* 
		* @private (protected) 
		* @param f 
		* @param args 
		* @return Object 
		*/
		static protected function callObjectMethodWithExceptionRedirecting(f:Function, args:Array):Object{
			var ret:Object;
			try{
				ret = f.apply(null, args);
			}catch(e:Error){
				ret = {value:undefined, error:{id:e.errorID, def:getQualifiedClassName(e), name:e.name, message:e.message, stackTrace:e.getStackTrace()}};
			}
			return ret;
		}
		/** 
		* 
		* @private (protected) 
		* @param f 
		* @param args 
		* @return Object 
		*/
		static protected function callObjectMethodWithExceptionHandling(f:Function, args:Array):Object{
			var ret:Object;
			try{
				ret = f.apply(null, args);
			}catch(e:Error){
				if(JSInterface.traceExceptionOnly){
					trace(e.getStackTrace());
				}else{
					if(JSInterface.exceptionHandler!=null) setTimeout(JSInterface.exceptionHandler, 1, e);
					else throw e;
				}
			}
			return ret;
		}
	}
}