package aw.emulate{
	public final class Operators extends Object{
		static public const ARITHMETIC_TYPE:Class = Arithmetic;
		static public const BITWISE_TYPE:Class = Arithmetic;
		static public const CONDITION_TYPE:Class = Condition;
		static public function getType(str:String):Class{
			var t:Class = null;
			if(Arithmetic.TYPE_LIST.indexOf(str)>=0) t = ARITHMETIC_TYPE;
			else if(Condition.TYPE_LIST.indexOf(str)>=0) t = CONDITION_TYPE;
			return t;
		}
		static public function isArithmetic(str:String):Boolean{
			return Arithmetic.TYPE_LIST.indexOf(str)>=0;
		}
		static public function isBitwise(str:String):Boolean{
			return Bitwise.TYPE_LIST.indexOf(str)>=0;
		}
		static public function isCondition(str:String):Boolean{
			return Condition.TYPE_LIST.indexOf(str)>=0;
		}
	}
}