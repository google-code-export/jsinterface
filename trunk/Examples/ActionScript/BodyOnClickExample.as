package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSHTMLElement;
	
	import flash.display.Sprite;
	[SWF(width="20", height="20")]
	public class BodyOnClickExample extends Sprite{
		public function BodyOnClickExample():void{
			super();
			JSInterface.initialize(this);
			JSInterface.document.body.onclick = this.onclickHandler;
			var body:JSHTMLElement = JSDynamic.convert(JSInterface.document.body, JSHTMLElement);
			body.onclick();
			trace(JSInterface.document.links.length);
		}
		protected function onclickHandler():void{
			trace(' TEST ');
		}
	}
}