package aw.utils{
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class IterationIndex extends Object{
		/** 
		* 
		* @public 
		*/
		public var index:int;
		/** 
		* 
		* @public 
		* @param i 
		* @return void 
		*/
		public function IterationIndex(i:int=0):void{
			super();
			index = i;
		}
		/** 
		* 
		* @public 
		* @return int 
		*/
		public function next():int{
			return this.index++;
		}
		/** 
		* 
		* @public 
		* @return int 
		*/
		public function previous():int{
			return this.index--;
		}
	}
}