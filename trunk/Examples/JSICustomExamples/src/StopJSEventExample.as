package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	
	import flash.display.Sprite;
	[SWF(width="10",height="10")]
	public class StopJSEventExample extends Sprite{
		public function StopJSEventExample():void{
			super();
			JSInterface.initialize(this);
			/*
			* For this example, look into HTML template.
			*/
			JSInterface.window.callback = func;
		}
		protected function func(event:JSDynamic=null):void{
			// Stop JavaScript click event.
			if(event) event.stopPropagation();
			JSInterface.window.alert('END!');
		}
	}
}