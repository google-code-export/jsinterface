package {
	import aw.external.JSInterface;
	
	import flash.display.Sprite;

	public class AS3ClassesExample extends Sprite{
		public function AS3ClassesExample():void{
			super();
			JSInterface.initialize(this, true);
		}
		
	}
}