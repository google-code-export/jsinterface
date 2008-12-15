package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSArray;
	import aw.external.jsinterface.objects.JSHTMLElement;
	import aw.external.jsinterface.objects.JSNode;
	
	import flash.display.Sprite;
	[SWF(width="20", height="20")]
	public class DOMExample extends Sprite{
		public function DOMExample():void{
			super();
			JSInterface.initialize(this);
			this.changeTitleByDOM();
			this.insertIFrame();
		}
		/** Insert <iframe/> element with alternate content
		 * 
		 */
		protected function insertIFrame():void{
			var body:JSDynamic = JSInterface.document.getElementsByTagName('body')[0];
			var frame:JSDynamic = JSInterface.document.createElement("iframe");
			frame.width = 300;
			frame.height = 300;
			if(JSInterface.navigator.appName.indexOf('Microsoft')>=0){
				frame.onreadystatechange = function():void{
					trace(frame.readyState);
				};
			}else{
				frame.onload = function():void{
					trace('iFrame loaded');
				};
			}
			frame.src = 'http://actualwave.com';
			body.appendChild(frame);
		}
		/** Change window title
		 * 
		 */
		protected function changeTitleByDOM():void{
			var arr:JSArray = JSInterface.document.firstChild.childNodes;
			var head:JSNode = arr[0];
			arr = head.childNodes;
			var len:int = arr.length;
			var item:JSHTMLElement;
			for(var i:int=0; i<len; i++){
				item = JSDynamic.convert(arr[i], JSHTMLElement);
				if(item.nodeName.toLowerCase()=='title'){
					item.text = "JSInterface rulez!";
					break;
				}
			}
			// simpliest way
			//JSInterface.document.title = "JSInterface rulez!";
		}
	}
}