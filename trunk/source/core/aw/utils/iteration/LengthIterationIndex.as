package aw.utils.iteration{
	import aw.utils.IterationIndex;
	

	/** 
	* The object containing the iteration index(position), limiting the maximum value set through the constructor, and zero as the minimum value.
	* 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @see aw.utils.IterationIndex 
	*/
	public class LengthIterationIndex extends IterationIndex{

		/** 
		* 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public var length:int;

		/** 
		* 
		* 
		* 
		* @public 
		* @param len 
		* @param i 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function LengthIterationIndex(len:int, i:uint=0):void{
			super(i);
			length = len;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override public function next():int{
			this.index++;
			if(this.index>=this.length) this.index = 0;
			return this.index;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function isLastItem():Boolean{
			return this.index>=this.length-1;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override public function previous():int{
			this.index--;
			if(this.index<0) this.index = this.length+this.index;
			return this.index;
		}
	}
}