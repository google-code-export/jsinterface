package{
	import fl.core.*;
	public class LivePreview extends UIComponent{
		public function LivePreview():void{
			super();
			addChild(new Symbol2())
		}
		override public function setSize(w:Number, h:Number):void{
			super.setSize(32, 32);
		}
		[Inspectable(type="Number",defaultValue="32")]
		override public function set width(p:Number):void{

		}
		[Inspectable(type="Number",defaultValue="32")]
		override public function set height(p:Number):void{

		}
	}
}