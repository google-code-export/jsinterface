package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSCore;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSXMLHttpRequest;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.utils.setTimeout;

	public class HTTPRequestExample extends Sprite{
		public var txt:TextField;
		public var jsRequest:JSDynamic;
		public function HTTPRequestExample():void{
			super();
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			this.createTextField();
			JSInterface.initialize(this);
			this.txt.text = 'start session...\n';
			this.txt.appendText('name: '+JSCore.name+'\n');
			setTimeout(this.test, 2000, /*"YOUR URL"*/'http://localhost/JSInterface/');
		}
		/** Main function
		 * 
		 */
		protected function test(url:String):void{
			this.createJSRequest();
			if(this.jsRequest){
				this.txt.appendText('XMLHttpRequest created\n');
				this.jsRequest.onreadystatechange = this.stateChange;
				this.jsRequest.open('GET', url, true);
				this.jsRequest.send(null);
			}else{
				this.txt.appendText('XMLHttpRequest not created\n');
			}
		}
		/** Create XMLHttpRequest object specified for current browser
		 * 
		 */
		protected function createJSRequest():void{
			if('XMLHttpRequest' in JSInterface.window){
				this.jsRequest = new JSXMLHttpRequest();
		    }else if('ActiveXObject' in JSInterface.window){
				this.jsRequest = new JSDynamic("ActiveXObject", "Msxml2.XMLHTTP");
				if(!this.jsRequest) this.jsRequest = new JSDynamic("ActiveXObject", "Microsoft.XMLHTTP");
			}
		}
		/** XMLHttpRequest.onReadyStateChange handler
		 * 
		 */
		protected function stateChange(...args):void{
			if(jsRequest.readyState == 4){
				if(jsRequest.status == 200){
					this.txt.htmlText = jsRequest.responseText;
					return;
				}
			}
			this.txt.text = 'Ready state: '+jsRequest.readyState+'\nStatus: '+jsRequest.status;
		}
		/** Creates HTML textfield
		 * 
		 */
		protected function createTextField():void{
			this.txt = new TextField();
			this.txt.width = 500;
			this.txt.height = 500;
			this.txt.border = true;
			this.txt.borderColor = 0;
			this.txt.background = true;
			this.txt.backgroundColor = 0xffffff;
			this.txt.multiline = true;
			this.txt.wordWrap = true;
			this.addChild(this.txt);
		}
	}
}