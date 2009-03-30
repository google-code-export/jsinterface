package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSArguments;
	import aw.external.jsinterface.objects.JSHTMLElement;
	import aw.external.jsinterface.JSDynamic;
	
	import flash.display.Sprite;

	public class CustomJSArgumentsExample extends Sprite{
		public function CustomJSArgumentsExample():void{
			super();
			JSInterface.initialize(this);
			JSArguments.registerByTarget(this, this.test, CustomJSArguments);
			JSInterface.window.test = this.test;
			JSInterface.window.test(15, "some string", JSInterface.document.body);
		}
		protected function test(args:CustomJSArguments):void{
			trace(args.argument3.nodeName); // BODY
		}
	}
}
	import aw.external.jsinterface.JSArguments;
	import aw.external.jsinterface.objects.JSHTMLElement;
	import aw.external.jsinterface.JSDynamic;
	
dynamic class CustomJSArguments extends JSArguments{
	public function get argument1():int{
		return this[0];
	}
	public function get argument2():String{
		return this[1];
	}
	public function get argument3():JSHTMLElement{
		return JSDynamic.convert(this[2], JSHTMLElement);
	}
}