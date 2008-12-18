package aw.emulate{
	public class Arithmetic extends Object implements IEmulate{
		static internal const TYPE_LIST:Array = [PLUS, PLUS_MINUS, PLUS_ASSIGN, MINUS, MINUS_PLUS, MINUS_ASSIGN, MILTIPLY, MILTIPLY_ASSIGN, DIVIDE, DIVIDE_ASSIGN, MODULO, MODULO_ASSIGN, ASSIGN, LEFT_SHIFT, LEFT_SHIFT_ASSIGN, RIGHT_SHIFT, RIGHT_SHIFT_ASSIGN, URIGHT_SHIFT, URIGHT_SHIFT_ASSIGN, BITWISE_AND, BITWISE_AND_ASSIGN, BITWISE_XOR, BITWISE_XOR_ASSIGN, BITWISE_OR, BITWISE_OR_ASSIGN];
		static public const INCREMENT:String = '++';
		static public const DECREMENT:String = '--';
		static public const PLUS:String = '+';
		static public const PLUS_MINUS:String = '+-';
		static public const PLUS_ASSIGN:String = '+=';
		static public const MINUS:String = '-';
		static public const MINUS_PLUS:String = '-+';
		static public const MINUS_ASSIGN:String = '-=';
		static public const MILTIPLY:String = '*';
		static public const MILTIPLY_ASSIGN:String = '*=';
		static public const DIVIDE:String = '/';
		static public const DIVIDE_ASSIGN:String = '/=';
		static public const MODULO:String = '%';
		static public const MODULO_ASSIGN:String = '%=';
		static public const ASSIGN:String = '=';
		static public const LEFT_SHIFT:String = '<<';
		static public const LEFT_SHIFT_ASSIGN:String = '<<=';
		static public const RIGHT_SHIFT:String = '>>';
		static public const RIGHT_SHIFT_ASSIGN:String = '>>=';
		static public const URIGHT_SHIFT:String = '>>>';
		static public const URIGHT_SHIFT_ASSIGN:String = '>>>=';
		static public const BITWISE_AND:String = '&';
		static public const BITWISE_AND_ASSIGN:String = '&=';
		static public const BITWISE_XOR:String = '^';
		static public const BITWISE_XOR_ASSIGN:String = '^=';
		static public const BITWISE_OR:String = '|';
		static public const BITWISE_OR_ASSIGN:String = '|=';
		static public function increment(a:*, b:*):*{
			return a+1;
		}
		static public function decrement(a:*, b:*):*{
			return a-1;
		}
		static public function plus(a:*, b:*):*{
			return a+b;
		}
		static public function minus(a:*, b:*):*{
			return a-b;
		}
		static public function multiply(a:*, b:*):*{
			return a*b;
		}
		static public function divide(a:*, b:*):*{
			return a/b;
		}
		static public function modulo(a:*, b:*):*{
			return a%b;
		}
		static public function assign(a:*, b:*):*{
			return b;
		}
		static public function leftShift(a:*, b:*):*{
			return a<<b;
		}
		static public function rightShift(a:*, b:*):*{
			return a>>b;
		}
		static public function unsignedRightShift(a:*, b:*):*{
			return a>>>b;
		}
		static public function bitwiseAnd(a:*, b:*):*{
			return a&b;
		}
		static public function bitwiseXor(a:*, b:*):*{
			return a^b;
		}
		static public function bitwiseOr(a:*, b:*):*{
			return a|b;
		}
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
		static public function byString(str:String, a:*, b:*):*{
			return STRINGS[str](a, b);
		}
		static public function getList():Array{
			return TYPE_LIST.concat();
		}
		static public function isArithmetic(str:String):Boolean{
			return TYPE_LIST.indexOf(str)>=0;
		}
	}
}