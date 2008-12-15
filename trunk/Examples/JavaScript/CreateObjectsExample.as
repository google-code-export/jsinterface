package {
	import aw.external.JSInterface;
	
	import flash.display.Sprite;

	public class CreateObjectsExample extends Sprite{
		public function CreateObjectsExample():void{
			super();
			JSInterface.initialize(this, true);
		}
	}
}
