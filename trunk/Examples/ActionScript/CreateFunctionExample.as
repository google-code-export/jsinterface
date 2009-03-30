package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSFunction;
	
	import flash.display.Sprite;
	
	public class CreateFunctionExample extends Sprite{
		public function CreateFunctionExample():void{
			super();
			JSInterface.initialize(this, true);
			var func:Function = JSFunction.create(
				'this.title = arg;' + 
				'return this.title;'
			, 'arg');
			trace(func.call(JSInterface.document, 'Hello world!'));
		}

	}
}