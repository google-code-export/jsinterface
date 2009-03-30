package aw.emulate{

	/** 
	* 
	* 
	* 
	* @private 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public final class Operators extends Object{

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const ARITHMETIC_TYPE:Class = Arithmetic;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const BITWISE_TYPE:Class = Arithmetic;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CONDITION_TYPE:Class = Condition;

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @return Class 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getType(str:String):Class{
			var t:Class = null;
			if(Arithmetic.TYPE_LIST.indexOf(str)>=0) t = ARITHMETIC_TYPE;
			else if(Condition.TYPE_LIST.indexOf(str)>=0) t = CONDITION_TYPE;
			return t;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isArithmetic(str:String):Boolean{
			return Arithmetic.TYPE_LIST.indexOf(str)>=0;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isBitwise(str:String):Boolean{
			return Bitwise.TYPE_LIST.indexOf(str)>=0;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isCondition(str:String):Boolean{
			return Condition.TYPE_LIST.indexOf(str)>=0;
		}
	}
}