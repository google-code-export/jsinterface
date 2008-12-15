package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	
	import flash.display.Sprite;

	public class WindowSizingExample extends Sprite{
		public function WindowSizingExample():void{
			super();
			JSInterface.initialize(this);
			resizeWindow();
		}
		/** Resize window to "fullscreen" mode
		 * 
		 */
		protected function resizeWindow():void{
			var window:JSDynamic = JSInterface.window;
			var screen:JSDynamic = JSInterface.getInstance('screen') as JSDynamic;
			window.moveTo(0, 0);
			window.resizeTo(screen.width, screen.height);
		}
	}
}