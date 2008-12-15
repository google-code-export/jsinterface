package aw.emulate{
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public final class Operators extends Object{
		/** 
		* 
		* @public (constant) 
		*/
		static public const ARITHMETIC_TYPE:Class = Arithmetic;
		/** 
		* 
		* @public (constant) 
		*/
		static public const BITWISE_TYPE:Class = Arithmetic;
		/** 
		* 
		* @public (constant) 
		*/
		static public const CONDITION_TYPE:Class = Condition;
		/** 
		* 
		* @public 
		* @param str 
		* @return Class 
		*/
		static public function getType(str:String):Class{
			var t:Class = null;
			if(Arithmetic.TYPE_LIST.indexOf(str)>=0) t = ARITHMETIC_TYPE;
			else if(Condition.TYPE_LIST.indexOf(str)>=0) t = CONDITION_TYPE;
			return t;
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return Boolean 
		*/
		static public function isArithmetic(str:String):Boolean{
			return Arithmetic.TYPE_LIST.indexOf(str)>=0;
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return Boolean 
		*/
		static public function isBitwise(str:String):Boolean{
			return Bitwise.TYPE_LIST.indexOf(str)>=0;
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return Boolean 
		*/
		static public function isCondition(str:String):Boolean{
			return Condition.TYPE_LIST.indexOf(str)>=0;
		}
	}
}