package aw.emulate{
	
	import aw.emulate.Arithmetic;
	/** 
	* 
	* 
	* 
	* @private 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @see aw.emulate.IEmulate 
	*/
	public class Bitwise extends Object implements IEmulate{

		/** 
		* 
		* 
		* 
		* @private (internal,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal const TYPE_LIST:Array = [LEFT_SHIFT, LEFT_SHIFT_ASSIGN, RIGHT_SHIFT, RIGHT_SHIFT_ASSIGN, URIGHT_SHIFT, URIGHT_SHIFT_ASSIGN, BITWISE_AND, BITWISE_AND_ASSIGN, BITWISE_XOR, BITWISE_XOR_ASSIGN, BITWISE_OR, BITWISE_OR_ASSIGN];

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const LEFT_SHIFT:String = Arithmetic.LEFT_SHIFT;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const LEFT_SHIFT_ASSIGN:String = Arithmetic.LEFT_SHIFT_ASSIGN;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const RIGHT_SHIFT:String = Arithmetic.RIGHT_SHIFT;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const RIGHT_SHIFT_ASSIGN:String = Arithmetic.RIGHT_SHIFT_ASSIGN;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const URIGHT_SHIFT:String = Arithmetic.URIGHT_SHIFT;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const URIGHT_SHIFT_ASSIGN:String = Arithmetic.URIGHT_SHIFT_ASSIGN;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const BITWISE_AND:String = Arithmetic.BITWISE_AND;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const BITWISE_AND_ASSIGN:String = Arithmetic.BITWISE_AND_ASSIGN;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const BITWISE_XOR:String = Arithmetic.BITWISE_XOR;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const BITWISE_XOR_ASSIGN:String = Arithmetic.BITWISE_XOR_ASSIGN;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const BITWISE_OR:String = Arithmetic.BITWISE_OR;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const BITWISE_OR_ASSIGN:String = Arithmetic.BITWISE_OR_ASSIGN;

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const STRINGS:Object = function():Object{
			var obj:Object = {};
			obj[LEFT_SHIFT] = Arithmetic.leftShift;
			obj[LEFT_SHIFT_ASSIGN] = Arithmetic.leftShift;
			obj[RIGHT_SHIFT] = Arithmetic.rightShift;
			obj[RIGHT_SHIFT_ASSIGN] = Arithmetic.rightShift;
			obj[URIGHT_SHIFT] = Arithmetic.unsignedRightShift;
			obj[URIGHT_SHIFT_ASSIGN] = Arithmetic.unsignedRightShift;
			obj[BITWISE_AND] = Arithmetic.bitwiseAnd;
			obj[BITWISE_AND_ASSIGN] = Arithmetic.bitwiseAnd;
			obj[BITWISE_XOR] = Arithmetic.bitwiseXor;
			obj[BITWISE_XOR_ASSIGN] = Arithmetic.bitwiseXor;
			obj[BITWISE_OR] = Arithmetic.bitwiseOr;
			obj[BITWISE_OR_ASSIGN] = Arithmetic.bitwiseOr;
		}();

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @param a 
		* @param b 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function byString(str:String, a:*, b:*):*{
			return STRINGS[str](a, b);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getList():Array{
			return TYPE_LIST.concat();
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
			return TYPE_LIST.indexOf(str)>=0;
		}
	}
}