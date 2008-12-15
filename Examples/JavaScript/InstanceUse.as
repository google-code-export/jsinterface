package{
	import aw.external.JSInterface;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import jsi.instanceuse.Button;
	
	public class InstanceUse extends Sprite{
		[Embed(source="images/avatar.gif")]
		static public const bmpClass:Class;
		public var image:Bitmap = new bmpClass();
		public var button:Button = new Button();
		public var text:TextField = new TextField();
		public function InstanceUse():void{
			super();
			this.addChild(image);
			this.addChild(button);
			this.addChild(text);
			JSInterface.initialize(this, true);
		}
	}
}