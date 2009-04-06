package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.objects.JSDocument;
	
	import flash.display.Sprite;
	import flash.system.System;
	import flash.utils.setTimeout;
	/*
	 * ANY CLASS IN THIS PROJECT IN ROOT PACKAGE IS A SINGLE EXAMPLE. SETUP IT AS APPLICATION 
	 * AND RUN UNDER HTTP PROTOCOL(some examples will NOT work locally).
	 */
	public class JSIActionScript extends Sprite{
		static public const INIT:* = JSInterface.initialize();
		public function JSIActionScript():void{
			super();
			setTimeout(this.addFunctions, 5000);
		}
		private function getFunc():Function{
			return function():Boolean{return true;};
		}
		protected function addFunctions():void{
			var d:JSDocument = JSInterface.document;
			for(var i:int=0; i<1000; i++){
				d.func = getFunc();
			}
			trace('addFunctions');
			setTimeout(this.clearFunctions, 5000);
		}
		protected function clearFunctions():void{
			JSInterface.clear(true);
			trace('clearFunctions');
			setTimeout(this.clearMemory, 5000);
		}
		protected function clearMemory():void{
			System.gc();
			trace('clearMemory');
		}
	}
}
