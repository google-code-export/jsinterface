package{
	/**
	 * It’s a prototype of objects transferred from Flash Player environment in JavaScript environment. 
	 * It works in the same way as JSDynamic, but from JavaScript side. If there is only one instance of 
	 * Flash Palyer with initialized JSInterface in an HTML page (in simple words, only one flash-file is 
	 * launched), then the parameter indicating the name of JavaScript  instance of JSInterface manager may 
	 * be omitted – it will be used by default.
	 * @public
	 */
	public class FLObject extends Object{
		/**
		 * Name of  JavaScript manager instance of the JSInterface
		 * @public
		 */
		public var jsi:String;
		/**
		 * Information about target Flash object
		 * @public
		 */
		public var info:Object;
		/**
		 * String reference, the name of flash object on the stack of transferred objects.
		 * @public
		 */
		public var name:String;
		/**
		 * FLObject objects are created automatically each time the object is passed into JavaScript environment object the Flash Player environment
		 * @public
		 * @param j Name of JavaScript manager instance of the JSInterface
		 * @param i Information about target Flash object
		 */
		function FLObject(j:String, i:Object){
			super();
			this.jsi = j;
			this.info = i;
			this.name = i.value;
		}
		/** 
		 * Call the property/method of the Flash object
		 * @param n Method name
		 * @param a Arguments list
		 * @param u Namespace URI where the method. Not mandatory, can be omitted if the method is located in the base namespace.
		 * @return Returned value
		 */
		public function call(n:String, a:Array, u:String=''):*{
		}
		/** 
		 * Check the availability of property in the flash object
		 * @param n Property name
		 * @param u Namespace URI where the property. Not mandatory, can be skipped if the property is located in the base namespace.
		 * @return Returns TRUe if property exists
		 */
		public function has(n:String, u:String=''):Boolean{
			return true;
		}
		/** Returns property value from flash object
		 * 
		 * @param n Property name
		 * @param u Namespace URI where the property. Not mandatory, can be skipped if the property is located in the base namespace.
		 * @return Property value
		 */
		public function get(n:String, u:String=''):*{
		}
		/** Sets property value in flash object
		 * 
		 * @param n Property name
		 * @param v Property value
		 * @param u Namespace URI where the property. Not mandatory, can be skipped if the property is located in the base namespace.
		 * @return void
		 */
		public function set(n:String, v:*, u:String=''):void{
		}
		/** Removes property from flash object
		 * 
		 * @param n Property name
		 * @param u Namespace URI where the property. Not mandatory, can be skipped if the property is located in the base namespace.
		 * @return Returns TRUE if success
		 */
		public function del(n:String, u:String=''):Boolean{
			return true;
		}
		/** Get this flash object, not as a reference, and directly - with subsequent pasteurization, and the loss connection with flash environment.
		 *  @return Returns simple object
		 */
		public function getAsSimple():Object{
			return {};
		}
		/** Returns properties list of flash object 
		 * 
		 * @param ac Modifier access, specify a key R, W, RW, D (only the dynamic properties, are not declared).
		 * @return List of properties of flash object
		 */
		public function getPropertyList(ac:String):Array{
			return [];
		}
		/** 
		 * Returns methods list of flash object 
		 * @return Methods list of flash object
		 */
		public function getMethodList():Array{
			return [];
		}
		/** 
		 * Returns an XML string created by flash function flash.utils.describeType()
		 * @return XML tree with information about the class of flash object as a string
		 */
		public function describeType():String{
			return '';
		}
		/** 
		 * Get the class name of flash object
		 * @return Class name
		 */
		public function getClassName():String{
			return '';
		}
		/** 
		 * Get the superclass name of flash object
		 * @return Superclass name
		 */
		public function getSuperClassName():String{
			return '';
		}
		/** 
		 * Removes flash object from stack of transferred objects
		 * @return void
		 */
		public function remove():void{
		}
		/**
		 * Create object in Flash Player environment
		 * Ability to perform this function depends on the property JSInterface.allowJavaScriptAccess in the Flash Player environment.
		 * @param cn Class name
		 * @param a Arguments list for constructor
		 * @param jn Name of JavaScript manager instance of the JSInterface
		 * @return FLObject instance of target flash object
		 */
		static public function create(cn:String, a:Array, jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** 
		 * Get the flash object by a string path
		 * Ability to perform this function depends on the property JSInterface.allowJavaScriptAccess in the Flash Player environment.
		 * @param p Path to object
		 * @param t Target object, path start from
		 * @param jn Name of JavaScript manager instance of the JSInterface
		 * @return FLObject instance of target flash object
		 */
		static public function instance(p:String, t:FLObject, jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** 
		 * Remove all references to objects and functions stored in the stack, both from the JavaScript environment, and from the Flash Player environment.
		 * @param flc Remove Flash callbacks
		 * @param flo Remove Flash objects
		 * @param jsc Remove JavaScript callbacks
		 * @param jso Remove JavaScript objects
		 * @param jn Name of JavaScript manager instance of the JSInterface
		 * @return void
		 */
		static public function clear(flc:Boolean=true, flo:Boolean=true, jsc:Boolean=true, jso:Boolean=true, jn:String=''):void{
		}
		/** 
		 * Returns Stage object from Flash Player environment
		 * Ability to perform this function depends on the property JSInterface.allowJavaScriptAccess in the Flash Player environment.
		 * @param jn Name of JavaScript manager instance of the JSInterface
		 * @return FLObject instance of target flash object
		 */
		static public function stage(jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** 
		 * Returns Root timeline object from Flash Player environment
		 * Ability to perform this function depends on the property JSInterface.allowJavaScriptAccess in the Flash Player environment.
		 * @param jn Name of JavaScript manager instance of the JSInterface
		 * @return FLObject instance of target flash object
		 */
		static public function root(jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** 
		 * Get an ApplicationDomain.currentDomain object from the Flash Player environment
		 * Ability to perform this function depends on the property JSInterface.allowJavaScriptAccess in the Flash Player environment.
		 * @param jn Name of JavaScript manager instance of the JSInterface
		 * @return FLObject instance of target flash object
		 */
		static public function applicationDomain(jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** 
		 * Register a JavaScript class of wrapper objects for a certain type of objects from the Flash Player environment.
		 * These custom wrappers have to wrap/aggregate transferred FLObject objects and use it 
		 * to contact the original object.
		 * @example Creates an object using the obtained function as a constructor and passes to it an FLObject object as a single argument.
<listing version="3.0">
function SpriteObject(flObject){
	this._flObject = flObject;
}
FLObject.registerWrapper('flash.display.Sprite', SpriteObject);
</listing>
		 * @example FLObject saves to an already created object, using it as the value of the property "_flObject"
<listing version="3.0">
function SpriteObject(){
	var _flObject;
}
FLObject.registerWrapper('flash.display.Sprite', SpriteObject, false, null, true);
</listing>
		 * @example FLObject saves to an already created object, using it as the value of that property, in this case "_currentFlashObject"
<listing version="3.0">
function SpriteObject(){
	var _currentFlashObject;
}
FLObject.registerWrapper('flash.display.Sprite', SpriteObject, false, null, true, '_currentFlashObject');
</listing>
		 * @example Transferred function calls via the "()" operator, as a return value should return expected object. As the argument gets the object FLObject.
<listing version="3.0">
function SpriteObject(){
	var _flObject;
}
function createSpriteObject(flObject){
	var sprite = new SpriteObject();
	sprite._flObject = flObject;
	return sprite;
}
FLObject.registerWrapper('flash.display.Sprite', SpriteObject, true);
</listing>
		 * 
		 * @param cn Class name of flash object
		 * @param jf Constructor of JavaScript class or function
		 * @param af If TRUE, then run a JavaScript function through the operator "()", if FALSE (by default) - via "new" operator.
		 * @paran jn Name of JavaScript manager instance of the JSInterface
		 * @param up If TRUE, the FLObject object passed after the creation of the object to specified property, and if FALSE - is passed as constructor argument
		 * @param pn Property name for FLObject instance
		 * @return void
		 */
		static public function registerWrapper(cn:String, jf:Function, af:Boolean=false, jn:String='', up:Boolean=false, pn:String='_flObject'):void{
		}
		/** Verifyes existence of information about an alternative wrapper for the specified class
		 * 
		 * @param cn Class name of flash object
		 * @paran jn Name of JavaScript manager instance of the JSInterface
		 * @return Boolean
		 */
		static public function hasRegisteredWrapper(cn:String, jn:String=''):Boolean{
			return true;
		}
		/** Removes information about an alternative wrapper for the specified class
		 * 
		 * @param cn Class name of flash object
		 * @paran jn Name of JavaScript manager instance of the JSInterface
		 * @return void
		 */
		static public function unregisterWrapper(cn:String, jn:String=''):void{
		}
		/** Clear all the information about alternative types of flash objects wrappers.
		 * 
		 * @paran jn Name of JavaScript manager instance of the JSInterface
		 * @return void
		 */
		static public function unregisterAllWrappers(jn:String=''):void{
		}
	}
}