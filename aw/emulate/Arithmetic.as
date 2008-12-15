package aw.emulate{
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class Arithmetic extends Object implements IEmulate{
		/** 
		* 
		* @private (internal,constant) 
		*/
		static internal const TYPE_LIST:Array = [PLUS, PLUS_MINUS, PLUS_ASSIGN, MINUS, MINUS_PLUS, MINUS_ASSIGN, MILTIPLY, MILTIPLY_ASSIGN, DIVIDE, DIVIDE_ASSIGN, MODULO, MODULO_ASSIGN, ASSIGN, LEFT_SHIFT, LEFT_SHIFT_ASSIGN, RIGHT_SHIFT, RIGHT_SHIFT_ASSIGN, URIGHT_SHIFT, URIGHT_SHIFT_ASSIGN, BITWISE_AND, BITWISE_AND_ASSIGN, BITWISE_XOR, BITWISE_XOR_ASSIGN, BITWISE_OR, BITWISE_OR_ASSIGN];
		/** 
		* 
		* @public (constant) 
		*/
		static public const INCREMENT:String = '++';
		/** 
		* 
		* @public (constant) 
		*/
		static public const DECREMENT:String = '--';
		/** 
		* 
		* @public (constant) 
		*/
		static public const PLUS:String = '+';
		/** 
		* 
		* @public (constant) 
		*/
		static public const PLUS_MINUS:String = '+-';
		/** 
		* 
		* @public (constant) 
		*/
		static public const PLUS_ASSIGN:String = '+=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const MINUS:String = '-';
		/** 
		* 
		* @public (constant) 
		*/
		static public const MINUS_PLUS:String = '-+';
		/** 
		* 
		* @public (constant) 
		*/
		static public const MINUS_ASSIGN:String = '-=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const MILTIPLY:String = '*';
		/** 
		* 
		* @public (constant) 
		*/
		static public const MILTIPLY_ASSIGN:String = '*=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const DIVIDE:String = '/';
		/** 
		* 
		* @public (constant) 
		*/
		static public const DIVIDE_ASSIGN:String = '/=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const MODULO:String = '%';
		/** 
		* 
		* @public (constant) 
		*/
		static public const MODULO_ASSIGN:String = '%=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const ASSIGN:String = '=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const LEFT_SHIFT:String = '<<';
		/** 
		* 
		* @public (constant) 
		*/
		static public const LEFT_SHIFT_ASSIGN:String = '<<=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const RIGHT_SHIFT:String = '>>';
		/** 
		* 
		* @public (constant) 
		*/
		static public const RIGHT_SHIFT_ASSIGN:String = '>>=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const URIGHT_SHIFT:String = '>>>';
		/** 
		* 
		* @public (constant) 
		*/
		static public const URIGHT_SHIFT_ASSIGN:String = '>>>=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const BITWISE_AND:String = '&';
		/** 
		* 
		* @public (constant) 
		*/
		static public const BITWISE_AND_ASSIGN:String = '&=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const BITWISE_XOR:String = '^';
		/** 
		* 
		* @public (constant) 
		*/
		static public const BITWISE_XOR_ASSIGN:String = '^=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const BITWISE_OR:String = '|';
		/** 
		* 
		* @public (constant) 
		*/
		static public const BITWISE_OR_ASSIGN:String = '|=';
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function increment(a:*, b:*):*{
			return a+1;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function decrement(a:*, b:*):*{
			return a-1;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function plus(a:*, b:*):*{
			return a+b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function minus(a:*, b:*):*{
			return a-b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function multiply(a:*, b:*):*{
			return a*b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function divide(a:*, b:*):*{
			return a/b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function modulo(a:*, b:*):*{
			return a%b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function assign(a:*, b:*):*{
			return b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function leftShift(a:*, b:*):*{
			return a<<b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function rightShift(a:*, b:*):*{
			return a>>b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function unsignedRightShift(a:*, b:*):*{
			return a>>>b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function bitwiseAnd(a:*, b:*):*{
			return a&b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function bitwiseXor(a:*, b:*):*{
			return a^b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function bitwiseOr(a:*, b:*):*{
			return a|b;
		}
		/** 
		* 
		* @private (protected,constant) 
		*/
		static protected const STRINGS:Object = function():Object{
			var obj:Object = {};
			obj[INCREMENT] = increment;
			obj[DECREMENT] = decrement;
			obj[PLUS] = plus;
			obj[PLUS_ASSIGN] = plus;
			obj[MINUS] = minus;
			obj[PLUS_MINUS] = minus;
			obj[MINUS_PLUS] = minus;
			obj[MINUS_ASSIGN] = minus;
			obj[MILTIPLY] = multiply;
			obj[MILTIPLY_ASSIGN] = multiply;
			obj[DIVIDE] = divide;
			obj[DIVIDE_ASSIGN] = divide;
			obj[MODULO] = modulo;
			obj[MODULO_ASSIGN] = modulo;
			obj[ASSIGN] = assign;
			obj[LEFT_SHIFT] = leftShift;
			obj[LEFT_SHIFT_ASSIGN] = leftShift;
			obj[RIGHT_SHIFT] = rightShift;
			obj[RIGHT_SHIFT_ASSIGN] = rightShift;
			obj[URIGHT_SHIFT] = unsignedRightShift;
			obj[URIGHT_SHIFT_ASSIGN] = unsignedRightShift;
			obj[BITWISE_AND] = bitwiseAnd;
			obj[BITWISE_AND_ASSIGN] = bitwiseAnd;
			obj[BITWISE_XOR] = bitwiseXor;
			obj[BITWISE_XOR_ASSIGN] = bitwiseXor;
			obj[BITWISE_OR] = bitwiseOr;
			obj[BITWISE_OR_ASSIGN] = bitwiseOr;
			return obj;
		}();
		/** 
		* 
		* @public 
		* @param str 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function byString(str:String, a:*, b:*):*{
			return STRINGS[str](a, b);
		}
		/** 
		* 
		* @public 
		* @return Array 
		*/
		static public function getList():Array{
			return TYPE_LIST.concat();
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return Boolean 
		*/
		static public function isArithmetic(str:String):Boolean{
			return TYPE_LIST.indexOf(str)>=0;
		}
	}
}