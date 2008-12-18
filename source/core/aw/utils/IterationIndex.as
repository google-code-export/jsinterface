package aw.utils{
	public class IterationIndex extends Object{
		public var index:int;
		public function IterationIndex(i:int=0):void{
			super();
			index = i;
		}
		public function next():int{
			return this.index++;
		}
		public function previous():int{
			return this.index--;
		}
	}
}