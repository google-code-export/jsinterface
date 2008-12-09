package {
	import aw.external.*;
	import aw.external.jsinterface.*;
	
	import flash.display.Sprite;
	import flash.external.*;
	import flash.text.TextField;
	import flash.utils.*;

	public class JSInterfaceExample extends Sprite{
		public var txt:TextField;
		public function JSInterfaceExample():void{
			super();
			this.init();
			this.txt.text = 'start session...\n';
			JSInterface.initialize(this);
			this.txt.appendText('name: '+JSCore.name+'\n');
			/*
			var f:Function = JSInterface.document.toString;
			trace(f, f(), f.apply(JSInterface.navigator, []));
			//*/
			/*
			var f1:Function = function(){trace('!!!');};
			JSInterface.document.someFunc = f1;
			JSInterface.document.someFunc();
			var f2:Function = JSInterface.document.someFunc;
			trace(f1, f2, f1==f2);
			//*/
			/*
			var jso:JSDynamic = new JSDynamic('Object');
			trace(jso);
			var f1:Function = function(){trace('!!!');};
			jso.func = f1;
			var f2:Function = jso.func;
			jso.func();
			trace(f1, f2, f1==f2);
			//*/
			//this.test();
		}
		public var jsRequest:JSDynamic;
		protected function createJSRequest():void{
			if('XMLHttpRequest' in JSInterface.window){
				this.jsRequest = JSDynamic.create("XMLHttpRequest");
		    }else if('ActiveXObject' in JSInterface.window){
				this.jsRequest = JSDynamic.create("ActiveXObject", ["Msxml2.XMLHTTP"]);
				if(!this.jsRequest) this.jsRequest = JSDynamic.create("ActiveXObject", ["Microsoft.XMLHTTP"]);
			}
		}
		protected function test():void{
			this.createJSRequest();
			if(this.jsRequest){
				this.txt.appendText('XMLHttpRequest created\n');
				this.jsRequest.onreadystatechange = this.stateChange;
				trace(this.jsRequest.onreadystatechange);
				this.jsRequest.open('GET', 'http://localhost/flex3tests/JSInterfaceTest/', true);
				this.jsRequest.send(null);
			}else{
				this.txt.appendText('XMLHttpRequest not created\n');
			}
		}
		protected function stateChange(...args):void{
			if(jsRequest.readyState == 4){
				if(jsRequest.status == 200){
					//trace(jsRequest.responseText);
					this.txt.htmlText = jsRequest.responseText;
					return;
				}
			}
			this.txt.text = 'Ready state: '+jsRequest.readyState+'\nStatus: '+jsRequest.status;
		}
		protected function init():void{
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
