package aw.utils.iteration{
	import aw.utils.IterationIndex;
	
	public class LengthIterationIndex extends IterationIndex{
		public var length:int;
		public function LengthIterationIndex(len:int, i:int=0):void{
			super(i);
			length = len;
		}
		override public function next():int{
			this.index++;
			if(this.index>=this.length) this.index = 0;
			return this.index;
		}
		public function isLastItem():Boolean{
			return this.index>=this.length-1;
		}
		override public function previous():int{
			this.index--;
			if(this.index<0) this.index = this.length+this.index;
			return this.index;
		}
	}
}