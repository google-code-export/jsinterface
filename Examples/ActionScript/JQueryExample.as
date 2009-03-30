package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSArguments;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSDocument;
	import aw.external.jsinterface.objects.JSElement;
	import aw.external.jsinterface.objects.JSHTMLElement;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	[SWF(width="100",height="20",backgroundColor="#eeeeee")]
	public class JQueryExample extends Sprite{
		static public var instance:Object;
		protected var $:Function;
		public function JQueryExample():void{
			super();
			instance = this;
			JSInterface.initialize(this);
			JSArguments.registerList(this, this.verifyCheckboxes, this.invertCheckbox);
			JSInterface.loadJavaScript('jquery-1.2.6.js', this.jqueryLoadCompleteHandler);
			createCheckboxes('JSInterface 1.0', 'JSInterface 1.1','JSInterface 1.6', 'JSInterface 2.0', 'JSInterface 2.3', 'JSInterface 2.4');
		}
		// create HTML checkboxes
		protected function createCheckboxes(...args):void{
			var document:JSDocument = JSInterface.document;
			var body:JSElement = document.body;
			body.appendChild(document.createElement('br'));
			body.appendChild(document.createElement('br'));
			for each(var title:String in args){
				var checkbox:JSHTMLElement = document.createElement('input');
				checkbox.type = 'checkbox';
				checkbox.value = title.split(' ')[1];
				body.appendChild(checkbox);
				var text:JSHTMLElement = document.createElement('label');
				text.innerHTML = title;
				body.appendChild(text);
				body.appendChild(document.createElement('br'));
			}
		}
		// on load jQuery
		protected function jqueryLoadCompleteHandler(event:JSDynamic=null):void{
			this.registerPlugin();
			$ = JSInterface.window.$;
			createButton();
		}
		// create flash button
		protected function createButton():void{
			var field:TextField = new TextField();
			field.width = 100;
			field.autoSize = TextFieldAutoSize.CENTER;
			field.text = 'Invert!';
			field.mouseEnabled = false;
			addChild(field); 
			this.useHandCursor = true;
			stage.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		// register jQuery plugin
		protected function registerPlugin():void{
			var jq:Object = JSDynamic.convertFunctionToObject(JSInterface.window.jQuery);
			jq.fn.invert = this.verifyCheckboxes;
		}
		protected function verifyCheckboxes(args:JSArguments):*{
			return args.target.each(this.invertCheckbox);
		}
		protected function invertCheckbox(args:JSArguments):void{
			args.target.checked = !args.target.checked;
		}
		protected function clickHandler(event:MouseEvent):void{
			$("input[@type='checkbox']").invert();
		}
	}
}