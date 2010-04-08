package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSHTMLElement;
	import aw.external.jsinterface.objects.JSNode;
	import aw.external.jsinterface.objects.JSText;
	
	import flash.display.Sprite;
	
	[SWF(width="20", height="20")]
	public class JSTextNodeExample extends Sprite{
		public function JSTextNodeExample():void{
			super();
			JSInterface.initialize(this);
			init();
		}
		protected function init():void{
			var element:JSHTMLElement = JSInterface.document.getElementById('title');
			var textNode1:JSDynamic = element.childNodes[0];
			if (textNode1.nodeType == 3) {
				var offset:int = textNode1.data.indexOf('everything');
				var textNode2:JSText = JSDynamic.convert(textNode1.splitText(offset), JSText);
				var boldElement:JSNode = element.appendChild(JSInterface.document.createElement('b'));
				boldElement.appendChild(textNode2);
			}
		}
	}
}