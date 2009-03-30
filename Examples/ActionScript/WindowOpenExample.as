package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	
	import flash.display.Sprite;

	public class WindowOpenExample extends Sprite{
		public var childWindow:JSDynamic;
		public function WindowOpenExample(){
			super();
			JSInterface.initialize(this);
			showWindow();
		}
		/** Open window with specific content. This example may not work correctly in Internet Explorer.
		 * 
		 */
		protected function showWindow():void{
			this.childWindow = JSInterface.window.open(null,'_blank','width=300,height=200,toolbar=1');
			this.childWindow.document.write('<html><head><title>Child window!</title></head><body><h3>This is a Flash child window!</h3></body></html>');
		}
	}
}