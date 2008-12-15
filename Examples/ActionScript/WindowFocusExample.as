package{
	import aw.external.JSInterface;
	
	import flash.display.Sprite;

	public class WindowFocusExample extends Sprite{
		public function WindowFocusExample():void{
			super();
			JSInterface.initialize(this);
			JSInterface.window.onblur = this.windowBlurHandler;
			JSInterface.window.onfocus = this.windowFocusHandler;
			JSInterface.window.onunload = this.windowUnloadHandler;
		}
		public function windowBlurHandler():void{
			/*
				Window lose focus
				Pause application animation, sounds, etc.
			*/
			trace('pause');
		}
		public function windowFocusHandler():void{
			/*
				Window gather focus
				Restore application animation, sounds, etc.
			*/
			trace('restore');
		}
		public function windowUnloadHandler():void{
			/*
				Window will close
				Save application data.
			*/
			trace('exit');
		}
	}
}