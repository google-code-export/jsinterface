package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	
	import flash.display.Sprite;

	public class WindowFocusExample extends Sprite{
		public function WindowFocusExample():void{
			super();
			JSInterface.initialize(this);
			JSInterface.window.onblur = this.windowBlurHandler;
			JSInterface.window.onfocus = this.windowFocusHandler;
			JSInterface.window.onunload = this.windowUnloadHandler;
		}
		public function windowBlurHandler(event:JSDynamic=null):void{
			/*
				Window lose focus
				Pause application animation, sounds, etc.
			*/
			trace('pause');
		}
		public function windowFocusHandler(event:JSDynamic=null):void{
			/*
				Window gather focus
				Restore application animation, sounds, etc.
			*/
			trace('restore');
		}
		public function windowUnloadHandler(event:JSDynamic=null):void{
			/*
				Window will close
				Save application data.
			*/
			trace('exit');
		}
	}
}