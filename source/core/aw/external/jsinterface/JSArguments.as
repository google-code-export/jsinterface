package aw.external.jsinterface{
	import flash.utils.Dictionary;
	

	/** 
	* It’s a class used upon calling functions from Flash Player environment in JavaScript environment. 
	* In the usual case a function from Flash Player environment called in JavaScript environment gets 
	* the whole set of arguments transferred to the function in JavaScript. But such function cannot 
	* get access to the target object in the scope of which it was executed. JSArguments contains a list 
	* of function arguments and a reference to the wrapper object of the JavaScript object in the scope 
	* of which it was executed. 
	* 
	* For the function to receive the JSArguments objects the method should be registered with  JSArguments.register();
	* @example
<listing version="3.0">
package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSArguments;
	
	import flash.display.Sprite;

	public class JSArgumentsExample extends Sprite{
		public function JSArgumentsExample():void{
			super();
			JSInterface.initialize(this);
			JSArguments.registerByTarget(this, this.test);
			// setup method
			JSInterface.window.test = this.test;
			// call method
			JSInterface.window.test();
		}
		protected function test(args:JSArguments):void{
			trace(args.target); // [object Window]
		}
	}
}
</listing>
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public dynamic class JSArguments extends Array{

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const _argumented:Dictionary = new Dictionary(true);

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _target:JSDynamic;

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @param target 
		* @return void 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSArguments(args:Array=null, target:JSDynamic=null):void{
			super();
			setArguments(args, target);
		}

		/** 
		* JSDynamic object, wrapper of JavaScript object in the scope of which was performed this function.
		* 
		* 
		* @public (AS3,getter) 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		AS3 function get target():JSDynamic{
			return this._target;
		}

		/** 
		* Set parameters of the object. The method is performed before sending the object to the function.
		* 
		* 
		* @public (AS3) 
		* @param args 
		* @param target 
		* @return void 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		AS3 function setArguments(args:Array, target:JSDynamic=null):void{
			this._target = target;
			if(args) this.push.apply(this, args);
		}

		/** 
		* Registers the method that should accept a JSArguments object as an argument. 
		* This method allows indicating a class derivative from JSArguments, instances 
		* of which will be transferred to the indicated method. The functions registered 
		* with JSArguments.register() method will be automatically removed with the object 
		* when Garbage Collector will be clearing the memory.
		* 
		* @public 
		* @param target The object that owns the method. 
		* @param name Maybe Function - refers to a method or a String or QName - the name of the method of transmited object.
		* @param definition Class which extends JSArguments, copies of which will be passed to the function. 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function registerByTarget(target:Object, name:*, definition:Class=null):void{
			var list:Dictionary;
			if(target in _argumented) list = _argumented[target];
			else _argumented[target] = list = new Dictionary();
			if(!definition) definition = JSArguments;
			list[name is Function ? name : target[name]] = definition;
		}
		/**
		* Register method by the link. A function registered by this 
		* method can be removed only by hand, otherwise it will never be removed.
		* 
		* 
		* @public 
		* @param method Link to the method.
		* @param definition Class which extends JSArguments, copies of which will be passed to the function.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		 */
		static public function register(method:Function, definition:Class=null):void{
			var list:Dictionary;
			var target:Object = null;
			if(target in _argumented) list = _argumented[target];
			else _argumented[target] = list = new Dictionary();
			if(!definition) definition = JSArguments;
			list[method] = definition;
		}

		/** 
		* Register a list of methods of one object which hosts as an argument object JSArguments
		* 
		* 
		* @public 
		* @param target The object which owns transmitted methods.
		* @param args A list of methods or their names.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function registerList(target:Object, ...args:Array):void{
			var list:Dictionary;
			if(target in _argumented) list = _argumented[target];
			else _argumented[target] = list = new Dictionary();
			for each(var name:* in args) list[name is Function ? name : target[name]] = JSArguments;
		}

		/** 
		* Checks whether the method is registered.
		* 
		* 
		* @public 
		* @param target The object that owns the method.
		* @param name Maybe Function - refers to a method or a String or QName - the name of the method of transmited object.
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isRegisteredByTarget(target:Object, name:*):Boolean{
			return target in _argumented && (name is Function ? name : target[name]) in _argumented[target];
		}
		
		/** 
		* 
		* 
		* @public 
		* @param method Link to the method.
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isRegistered(method:Function):Boolean{
			for each(var list:Dictionary in _argumented){
				if(method in list) return true;
			}
			return false;
		}

		/** 
		* Returns the class, copies of which will be transferred using this method. If the method was not registered, it will return NULL.
		* 
		* 
		* @public 
		* @param target The object that owns the method.
		* @param name Maybe Function - refers to a method or a String or QName - the name of the method of transmited object.
		* @return Class 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getDefinitionByTarget(target:Object, name:*):Class{
			if(target in _argumented){
				var list:Dictionary = _argumented[target];
				var method:Function = name is Function ? name : target[name];
				if(method in list) return list[method];
			}
			return null;
		}
		
		/**
		* 
		* 
		* @public 
		* @param method Link to the method.
		* @return Class 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getDefinition(method:Function):Class{
			for each(var list:Dictionary in _argumented){
				if(method in list) return list[method];
			}
			return null;
		}

		/** 
		* Removes method registration. 
		* 
		* 
		* @public 
		* @param target The object that owns the method.
		* @param name Maybe Function - refers to a method or a String or QName - the name of the method of transmited object.
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function unregisterByTarget(target:Object, name:*):Boolean{
			if(target in _argumented){
				return delete _argumented[target][name is Function ? name : target[name]];
			}
			return false;
		}

		/** 
		* 
		* 
		* @public 
		* @param method Link to the method.
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function unregister(method:Function):Boolean{
			for each(var list:Dictionary in _argumented){
				if(method in list) return delete list[method];
			}
			return false;
		}

		/** 
		* Creates a copy of JSArguments by passed parameters.
		* 
		* 
		* @private 
		* @param method Link to the method.
		* @param args The list of arguments of function.
		* @param target The object concerning which function has been called. 
		* @return JSArguments 
		* @see aw.external.jsinterface.JSDynamic 
		* @see aw.external.jsinterface.JSArguments 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(method:Function, args:Array, target:JSDynamic):JSArguments{
			var definition:Class = getDefinition(method);
			var result:JSArguments;
			if(!definition || definition==JSArguments) result = new JSArguments(args, target);
			else{
				result = new definition();
				result.setArguments(args, target);
			}
			return result;
		}
		
		/** 
		* If the transferred method is registered, will return JSArguments object and if is not present - the same list of arguments. 
		* 
		* 
		* @private 
		* @param method Link to the method.
		* @param args The list of arguments of function.
		* @param target Объект относительно которого была вызвана функция. 
		* @return Array 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function convert(method:Function, args:Array, target:JSDynamic):Array{
			return isRegistered(method) ? create(method, args, target) : args;
		}
	}
}