package aw.utils.iteration{
	import aw.utils.IterationIndex;
	
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class LengthIterationIndex extends IterationIndex{
		/** 
		* 
		* @public 
		*/
		public var length:int;
		/** 
		* 
		* @public 
		* @param len 
		* @param i 
		* @return void 
		*/
		public function LengthIterationIndex(len:int, i:int=0):void{
			super(i);
			length = len;
		}
		/** 
		* 
		* @public 
		* @return int 
		*/
		override public function next():int{
			this.index++;
			if(this.index>=this.length) this.index = 0;
			return this.index;
		}
		/** 
		* 
		* @public 
		* @return Boolean 
		*/
		public function isLastItem():Boolean{
			return this.index>=this.length-1;
		}
		/** 
		* 
		* @public 
		* @return int 
		*/
		override public function previous():int{
			this.index--;
			if(this.index<0) this.index = this.length+this.index;
			return this.index;
		}
	}
}