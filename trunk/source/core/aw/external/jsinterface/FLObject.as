package aw.external.jsinterface{
	import aw.external.JSInterface;
	import aw.external.jsinterface.flobject.FLObjectCommands;
	import aw.utils.ClassUtils;
	import aw.utils.EvalUtils;
	
	import flash.external.ExternalInterface;
	import flash.system.ApplicationDomain;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	
	internal class FLObject extends Object{
		static private const OBJECTS_BASE_NAME:String = 'jsiObject_';
		static private const OBJECT_CREATE_METHOD:String = 'jsiCaller_Object_CreateMethod';
		static private const OBJECT_INSTANCE_METHOD:String = 'jsiCaller_Object_InstanceMethod';
		static private const OBJECT_CALL_METHOD:String = 'jsiCaller_Object_CallMethod';
		static private const OBJECT_CALL_COMMAND:String = 'jsiCaller_Object_CallCommand';
		static private const OBJECT_HAS_METHOD:String = 'jsiCaller_Object_HasMethod';
		static private const OBJECT_GET_METHOD:String = 'jsiCaller_Object_GetMethod';
		static private const OBJECT_SET_METHOD:String = 'jsiCaller_Object_SetMethod';
		static private const OBJECT_DELETE_METHOD:String = 'jsiCaller_Object_DeleteMethod';
		static private const OBJECT_REMOVE_METHOD:String = 'jsiCaller_Object_RemoveMethod';
		static private const OBJECTS_CLEAR:String = 'jsiCaller_Objects_Clear';
		static private const JS_ACCESS_DENIED_ERROR:Object = {error:{name:'{Flash} Error: Access denied.', message:'Access denied to Flash Player objects.'}};
		static protected var _objects:Object = {};
		static protected var _objectsIndex:int = 0;
		static protected var _initialized:Boolean = false;
		static public function get newObjectName():String{
			return OBJECTS_BASE_NAME+String(_objectsIndex++);
		}
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
		static public function addObject(o:Object):String{
			for(var p:String in _objects){
				if(_objects[p]===o) return p;
			}
			var name:String = newObjectName;
			_objects[name] = o;
			return name;
		}
		static public function getObject(name:String):Object{
			return _objects[name];
		}
		static public function removeObject(name:String):void{
			delete _objects[name];
		}
		static public function removeAllObjects():void{
			for(var p:String in _objects){
				removeObject(p);
			}
		}
		static public function clear():void{
			removeAllObjects();
		}
		static internal function clearAllFromJS(jsCallbacks:Boolean=true, jsObjects:Boolean=true):void{
			if(jsCallbacks) JSCaller.clear();
			if(jsObjects) FLObject.clear();
		}
		static protected function objectCreateMethod(className:String, args:Array):Object{
			if(!JSInterface.allowJavaScriptAccess) return JS_ACCESS_DENIED_ERROR;
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectCreateMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectCreateMethod, arguments);
			}
		}
		static protected function callObjectCreateMethod(className:String, args:Array):Object{
			var v:Object = ClassUtils.applyByName(className, JSInfoObject.convertByList(args));
			return {value:JSInfoObject.create(v)};
		}
		static protected function objectInstanceMethod(path:String, target:Object):Object{
			if(!JSInterface.allowJavaScriptAccess) return JS_ACCESS_DENIED_ERROR;
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectInstanceMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectInstanceMethod, arguments);
			}
		}
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
		static protected function objectCallMethod(objectName:String, name:String, args:Array, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectCallMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectCallMethod, arguments);
			}
		}
		static protected function callObjectCallMethod(objectName:String, name:String, args:Array, uri:String):Object{
			var obj:Object = getObject(objectName);
			var qn:QName = new QName(uri, name);
			//trace(obj, qn);
			//trace(args);
			//trace(JSInfoObject.convertByList(args));
			var val:* = obj[qn].apply(obj, JSInfoObject.convertByList(args));
			return {value:JSInfoObject.create(val)};
		}
		static protected function objectCallCommand(objectName:String, cmd:String, args:Array=null):*{
			return FLObjectCommands.callCommand(getObject(objectName), cmd, args);
		}
		static protected function objectHasMethod(objectName:String, name:String, uri:String):*{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectGetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectGetMethod, arguments);
			}
		}
		static protected function callObjectHasMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create((new QName(uri, name)) in obj)};
		}
		static protected function objectGetMethod(objectName:String, name:String, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectGetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectGetMethod, arguments);
			}
		}
		static protected function callObjectGetMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create(obj[new QName(uri, name)])};
		}
		static protected function objectSetMethod(objectName:String, name:String, value:Object, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectSetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectSetMethod, arguments);
			}
		}
		static protected function callObjectSetMethod(objectName:String, name:String, value:Object, uri:String):Object{
			var obj:Object = getObject(objectName);
			value = JSInfoObject.convert(value);
			return {value:JSInfoObject.create(obj[new QName(uri, name)] = value)};
		}
		static protected function objectDeleteMethod(objectName:String, name:String, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectDeleteMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectDeleteMethod, arguments);
			}
		}
		static protected function callObjectDeleteMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create(delete obj[new QName(uri, name)])};
		}
		static protected function callObjectMethodWithExceptionRedirecting(f:Function, args:Array):Object{
			var ret:Object;
			try{
				ret = f.apply(null, args);
			}catch(e:Error){
				ret = {value:undefined, error:{id:e.errorID, def:getQualifiedClassName(e), name:e.name, message:e.message, stackTrace:e.getStackTrace()}};
			}
			return ret;
		}
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