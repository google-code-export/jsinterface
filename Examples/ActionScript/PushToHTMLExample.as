package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.objects.JSHTMLElement;
	import aw.external.jsinterface.objects.JSNode;
	
	import flash.display.Sprite;
	[SWF(width="20",height="20")]
	public class PushToHTMLExample extends Sprite{
		public function PushToHTMLExample():void{
			super();
			JSInterface.initialize();
			this.testJavaScript();
			this.testCSS();
		}
		protected function testJavaScript():void{
			var scriptTag:JSHTMLElement = JSInterface.pushJavaScript('function alertHello(){alert("Hello world!");}');
			JSInterface.window.alertHello();
			trace(scriptTag.outerHTML);
		}
		// asVirtual = true
		protected function testJavaScriptAsVirual():void{
			JSInterface.pushJavaScript('window.alertHello = function (){alert("Hello world!");}', '', true);
			JSInterface.window.alertHello();
		}
		protected function testCSS():void{
			var styleTag:JSHTMLElement = JSInterface.pushCSS('.text{font-weight:bold;color:#ff00ff;font-size:90;text-decoration:underline;}');
			var font:JSHTMLElement = JSInterface.document.createElement('font');
			font.innerHTML = 'Hello world!';
			font.setAttribute('class', 'text');
			font.className = 'text';
			JSInterface.document.body.appendChild(font);
			trace(styleTag);
		}
	}
}