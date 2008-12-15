package jsi.instanceuse{
	import flash.display.SimpleButton;
	import flash.display.DisplayObject;

	public class Button extends SimpleButton{
		[Embed(source="images/btn_up.png")]
		static public const upClass:Class;
		[Embed(source="images/btn_over.png")]
		static public const overClass:Class;
		[Embed(source="images/btn_down.png")]
		static public const downClass:Class;
		public function Button():void{
			super(new upClass(), new overClass(), new downClass());
			hitTestState = upState;
		}
		
	}
}