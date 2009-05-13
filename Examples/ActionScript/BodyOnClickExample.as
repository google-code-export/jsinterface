package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSElement;
	
	import flash.display.Sprite;
	[SWF(width="20", height="20")]
	public class BodyOnClickExample extends Sprite{
		public function BodyOnClickExample():void{
			super();
			JSInterface.initialize(this);
			JSInterface.document.onclick = this.onclickHandler;
			JSInterface.document.onclick();
		}
		protected function onclickHandler(event:JSDynamic=null):void{
			trace(' TEST ');
		}
	}
}