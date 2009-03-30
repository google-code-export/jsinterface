package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSFunction;
	
	import flash.display.Sprite;
	[SWF(width=10,height=10)]
	public class RegisterFLObjectWrapperExample extends Sprite{
		public function RegisterFLObjectWrapperExample():void{
			super();
			JSInterface.initialize(this);
			// Create custom JavaScript class
			var cls:Function = JSFunction.create(
				'this.toString = function(){' + 
					'return this._flObject.call("toString");' + 
				'};'
			);
			// FLObject class as function 
			var flObject:Function = JSInterface.window.FLObject;
			// FLObject class as object
			var flObjectClass:JSDynamic = JSDynamic.convertFunctionToObject(flObject);
			// Register custom wrapper for Sprite objects
			flObjectClass.registerWrapper('flash.display.Sprite', cls, false, null, true);
			// Test function for custom wrapper
			var test:Function = JSFunction.create('window.testObject = arg1; alert("Is Sprite uses custom wrapper: "+String(arg1 instanceof arg2));', 'arg1', 'arg2');
			// Test "is custom wrapper used"?
			test(new Sprite(), cls);
			// Calling wrapper toString() function
			trace(JSInterface.window.testObject);
		}
	}
}