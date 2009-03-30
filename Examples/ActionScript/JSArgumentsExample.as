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
			JSInterface.document.test = this.test;
			JSInterface.navigator.test = this.test;
			JSInterface.main.test = this.test;
			// call method
			JSInterface.window.test(); // [object Window]
			JSInterface.document.test(); // [object HTMLDocument]
			JSInterface.navigator.test(); // [object Navigator]
			JSInterface.main.test(); // [object HTMLEmbedElement]
		}
		protected function test(args:JSArguments):void{
			trace(args.target);
		}
	}
}