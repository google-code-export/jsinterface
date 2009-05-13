package aw.utils{

	/** 
	* 	The object containing iteration index (position)
	* 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public class IterationIndex extends Object{

		/** 
		* 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public var index:int;

		/** 
		* 
		* 
		* 
		* @public 
		* @param i 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function IterationIndex(i:int=0):void{
			super();
			index = i;
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
		public function next():int{
			return this.index++;
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
		public function previous():int{
			return this.index--;
		}
	}
}