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
	* Class linking objects from Flash Player environment available to JavaScript. Through this class are all queries relating to these objects from the JavaScript. 
	* Also, this class is the manager of all transferred to the JavaScript object and contains all of the objects of such information and links to the original objects. 
	* The stack that stores references to these objects do not brush away, it can be cleaned by hand using FLObject.clear() or FLObject.removeObject() for an individual object. 
	* Operation cleaning can be done through the main class - JSInterface, so this class has been hidden.
	* 
	* @private (internal) 
	* @see aw.external.JSInterface
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	internal class FLObject extends Object{

		/** 
		* The base name of the object - its link, in which he will be identified in the requests from the JavaScript environment. 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECTS_BASE_NAME:String = 'fo';

		/** 
		* The name of the method for creating a JavaScript object in the Flash Player environment.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_CREATE_METHOD:String = 'jsiCaller_Object_CreateMethod';

		/**
		* The name of the JavaScript method which receives a copy of the object in the Flash Player environment, from string reference to this object.
		* 
		* Uses class aw.utils.EvalUtils.
		* @see aw.utils.EvalUtils
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_INSTANCE_METHOD:String = 'jsiCaller_Object_InstanceMethod';

		/** 
		* The name of the JavaScript method which call the method of the object in the Flash Player environment.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_CALL_METHOD:String = 'jsiCaller_Object_CallMethod';

		/** 
		* The name of the JavaScript method which call commands.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_CALL_COMMAND:String = 'jsiCaller_Object_CallCommand';

		/** 
		* The name of the JavaScript method checks for the existence of the properties of the object in the Flash Player environment.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_HAS_METHOD:String = 'jsiCaller_Object_HasMethod';

		/** 
		* The name of the JavaScript method of the object receiving the value of the property in a Flash Player environment.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_GET_METHOD:String = 'jsiCaller_Object_GetMethod';

		/** 
		* The name of the JavaScript method which set values to object properties in the Flash Player environment.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_SET_METHOD:String = 'jsiCaller_Object_SetMethod';

		/** 
		* The name of the JavaScript method which removes the property of the object in the Flash Player environment.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_DELETE_METHOD:String = 'jsiCaller_Object_DeleteMethod';

		/** 
		* The name of the JavaScript method removes the object from the FLObject stack.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_REMOVE_METHOD:String = 'jsiCaller_Object_RemoveMethod';

		/** 
		* The name of the JavaScript method which cleans the FLObject stack.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECTS_CLEAR:String = 'jsiCaller_Objects_Clear';

		/** 
		* The object passed as an error, if JavaScript attempted to gain access to the object from the Flash Player environment directly, without a permit. 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JS_ACCESS_DENIED_ERROR:Object = {error:{name:'{Flash} Error: Access denied.', message:'Access denied to Flash Player objects.'}};

		/** 
		* The stack of all objects which passed into Flash Player environment
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _objects:Object = {};

		/** 
		* Index of references to objects. Increases by one each time the stack accepts a new link to the object.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _objectsIndex:int = 0;

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
		* The generator of new links.
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get newObjectName():String{
			return OBJECTS_BASE_NAME+String(_objectsIndex++);
		}

		/** 
		* The method of FLObject initialization. It registers the necessary JavaScript methods to work with objects from the Flash Player environment in the JavaScript environment. 
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
		* Add object to the stack.
		* 
		* 
		* @public 
		* @param o Source object.
		* @return String Text link to the object in the stack.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* Get an object from the stack by the link.
		* 
		* 
		* @public 
		* @param name The link to an object in the stack.
		* @return Object Source object.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getObject(name:String):Object{
			return _objects[name];
		}

		/** 
		* Remove the object from the stack by his link.
		* 
		* 
		* @public 
		* @param name The link to an object in the stack.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function removeObject(name:String):void{
			delete _objects[name];
		}

		/** 
		* Remove all objects from the stack.
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function removeAllObjects():void{
			for(var p:String in _objects){
				removeObject(p);
			}
		}

		/** 
		* Method alias of FLObjects.removeAllObjects();
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function clear():void{
			removeAllObjects();
		}

		/** 
		* Method is called from JavaScript when initializing cleaning stacks which stores the objects and functions. Allows you to clean stacks of stored objects directly from JavaScript. 
		* 
		* 
		* @private (internal) 
		* @param jsCallbacks 
		* @param jsObjects 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function clearAllFromJS(jsCallbacks:Boolean=true, jsObjects:Boolean=true):void{
			if(jsCallbacks) JSCaller.clear();
			if(jsObjects) FLObject.clear();
		}

		/** 
		* Method is called from JavaScript to create objects in the Flash Player environment.
		* 
		* 
		* @private (protected) 
		* @param className Class name 
		* @param args Arguments passed to the constructor of class
		* @return Object Information about the created object, or information about the error
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* The method of creating an object.
		* 
		* 
		* @private (protected) 
		* @param className Class name
		* @param args Arguments passed to the constructor of class
		* @return Object Information about the created object
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectCreateMethod(className:String, args:Array):Object{
			var v:Object = ClassUtils.applyByName(className, JSInfoObject.convertByList(args));
			return {value:JSInfoObject.create(v)};
		}

		/** 
		* Method is called from JavaScript to obtain a reference to an object in the Flash Player environment.
		* 
		* 
		* @private (protected) 
		* @param path The path to the object, class name, the path to any member of the class or keyword: "stage", "root", "applicationDomain".
		* @param target Information about the object to which to apply the specified path.
		* @return Object Information about the data, or information about the error
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* The method of obtaining data from the string.
		* 
		* 
		* @private (protected) 
		* @param path The path to the object, class name, the path to any member of the class or keyword: "stage", "root", "applicationDomain".
		* @param target Information about the object to which to apply the specified path.
		* @return Object Information about the recieved data
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* Method is called from JavaScript to call the object method in a Flash Player environment.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Method name.
		* @param args Arguments passed to the method.
		* @param uri URI Namespace in which the method is.
		* @return Object The object of the information on the return of a result or error occurred.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectCallMethod(objectName:String, name:String, args:Array, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectCallMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectCallMethod, arguments);
			}
		}

		/** 
		* The method call object method.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Method name.
		* @param args Arguments passed to the method.
		* @param uri URI Namespace in which the method is.
		* @return Object The object of the information on the return of a result.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 	Method call commands.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param cmd Called command.
		* @param args Arguments passed to the command.
		* @return * Возвращаемый результат.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectCallCommand(objectName:String, cmd:String, args:Array=null):*{
			return FLObjectCommands.callCommand(getObject(objectName), cmd, args);
		}

		/** 
		* Method is called from JavaScript to verify the existence of the properties of the object in the Flash Player environment.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Property name.
		* @param uri Namespace URI at which the property lies.
		* @return * Information about property or the error if it will occur
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectHasMethod(objectName:String, name:String, uri:String):*{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectGetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectGetMethod, arguments);
			}
		}

		/** 
		* Method for verification of the properties of the object.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Property name.
		* @param uri Namespace URI at which the property lies.
		* @return Object Information about property or the error if it will occur
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectHasMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create((new QName(uri, name)) in obj)};
		}

		/** 
		* Method is called from JavaScript to obtain values of the properties of the object in the Flash Player environment.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Property name.
		* @param uri Namespace URI at which the property lies.
		* @return Object Information about property value or the error if it will occur
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectGetMethod(objectName:String, name:String, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectGetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectGetMethod, arguments);
			}
		}

		/** 
		* The method for obtaining values of the properties of the object.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Property name.
		* @param uri Namespace URI at which the property lies.
		* @return Object Information about property value or the error if it will occur
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectGetMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create(obj[new QName(uri, name)])};
		}

		/** 
		* Method is called from JavaScript to set object property values in the Flash Player environment.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Property name.
		* @param value New value of property.
		* @param uri Namespace URI at which the property lies.
		* @return Object Information about error if it will occur
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectSetMethod(objectName:String, name:String, value:Object, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectSetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectSetMethod, arguments);
			}
		}

		/** 
		* Method to set object property values in the Flash Player environment.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Property name.
		* @param value New value of property.
		* @param uri Namespace URI at which the property lies.
		* @return Object Information about error if it will occur
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectSetMethod(objectName:String, name:String, value:Object, uri:String):Object{
			var obj:Object = getObject(objectName);
			value = JSInfoObject.convert(value);
			return {value:JSInfoObject.create(obj[new QName(uri, name)] = value)};
		}

		/** 
		* Method is called from JavaScript to remove the properties of the object in the Flash Player environment.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Property name.
		* @param uri Namespace URI at which the property lies.
		* @return Object Information about called operation or about error if it will occur
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectDeleteMethod(objectName:String, name:String, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectDeleteMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectDeleteMethod, arguments);
			}
		}

		/** 
		* Method removes object properties.
		* 
		* 
		* @private (protected) 
		* @param objectName The link to an object in the stack.
		* @param name Property name.
		* @param uri Namespace URI at which the property lies.
		* @return Object Information about the command performed or the error occurred.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectDeleteMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create(delete obj[new QName(uri, name)])};
		}

		/** 
		* It calls the methods and catch errors occured for onward transmission to the JavaScript environment.
		* 
		* 
		* @private (protected) 
		* @param f 
		* @param args 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* It calls the methods and catch errors occur to determine their future - call or display OUTPUT.
		* 
		* 
		* @private (protected) 
		* @param f 
		* @param args 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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