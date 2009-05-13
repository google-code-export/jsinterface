package aw.external.jsinterface{
	import aw.external.*;
	/**
	 * Class for creating anonymous JavaScript functions.
	 * 
	 * @public
	 * @see aw.external.jsinterface.JSDynamic
	 * @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	 */
	public class JSFunction extends Object{

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'Function';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const INSTANCE_ERROR:String = 'JavaScript function instance can\'t be created.';

		/** 
		* The method creates an anonymous JavaScript function from the transferred code in the form of a line. 
		* This function can be used as any other JavaScript function. If you apply it to a window object property, 
		* the function will become a global JavaScript function.
		* @example
<listing version="3.0">
package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSFunction;
	
	import flash.display.Sprite;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			JSInterface.initialize(true);
			var func:Function = JSFunction.create(
				'var text = prompt("Please, write something:");' + 
				'text = text.split("").reverse().join("");' + 
				'sendResult(text);');
			JSInterface.window.showPrompt = func;
			JSInterface.window.sendResult = this.promptResult;
			JSInterface.callLater(JSInterface.window, 'showPrompt', [], null, 3000);
		}
		private function promptResult(prompt:String):void{
			trace('JavaScript PROMPT:', prompt);
		}
	}
}
</listing>
		* @public 
		* @param javaScriptCode JavaScript code in a string, which would body of the function.
		* @param args The names of arguments of JavaScript functions.
		* @return Function Returns an function in the Flash Player environment related to the created JavaScript function
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(javaScriptCode:String, ...args:Array):Function{
			var func:Function;
			var obj:Object;
			if(args.length){
				obj = JSCore.createFunction(args, javaScriptCode);
			}else{
				obj = JSCore.createObject(CLASS_NAME, [javaScriptCode]);
			}
			if(obj && obj.constructor==Object && obj.isComplex && obj.value){
				var jsd:JSDynamic = new JSDynamic(JSDynamic.DO_NOT_CREATE_OBJECT);
				jsd.js_interface::info = new JSInfoObject(obj);
				func = jsd.js_interface::asFunction();
			}else throw new Error(INSTANCE_ERROR);
			return func;
		}
	}
}