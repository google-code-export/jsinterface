package aw.emulate{

	/** 
	* 
	* 
	* 
	* @private 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @see aw.emulate.IEmulate 
	* @see aw.emulate.ICondition 
	*/
	public class Condition extends Object implements IEmulate, ICondition{

		/** 
		* 
		* 
		* 
		* @private (internal,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal const TYPE_LIST:Array = [GREATER, GREATER_EQUAL, LESSER, LESSER_EQUAL, EQUAL, INEQUAL, STRICT_EQUAL, STRICT_INEQUAL, AS, IN, INSTANCEOF, IS, LOGICAL_AND, LOGICAL_OR, LOGICAL_NOT, LOGICAL];

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const GREATER:String = '>';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const GREATER_EQUAL:String = '>=';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const LESSER:String = '<';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const LESSER_EQUAL:String = '<=';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const EQUAL:String = '==';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const INEQUAL:String = '!=';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const STRICT_EQUAL:String = '===';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const STRICT_INEQUAL:String = '!==';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const AS:String = 'as';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const IN:String = 'in';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const INSTANCEOF:String = 'instanceof';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const IS:String = 'is';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const LOGICAL_AND:String = '&&';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const LOGICAL_OR:String = '||';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const LOGICAL_NOT:String = '!';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const LOGICAL:String = '';

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _type:String;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _single:Boolean = false;

		/** 
		* 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public var left:*;

		/** 
		* 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public var right:*;

		/** 
		* 
		* 
		* 
		* @public 
		* @param t 
		* @param l 
		* @param r 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function Condition(t:String, l:*, r:*=null):void{
			super();
			_type = t;
			_single = isSingleCondition(t);
			left = l;
			right = r;
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
		public function apply():Boolean{
			if(this._single){
				return byString(this._type, (this.right is Condition) ? this.right.apply() : this.right);
			}else return byString(this._type, 
									  (this.left is Condition) ? this.left.apply() : this.left, 
									  (this.right is Condition) ? this.right.apply() : this.right
								  );
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get type():String{
			return this._type;
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get isSingle():Boolean{
			return this._single;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function greater(a:*, b:*):Boolean{
			return a>b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function greaterEq(a:*, b:*):Boolean{
			return a>=b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function lesser(a:*, b:*):Boolean{
			return a<b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function lesserEq(a:*, b:*):Boolean{
			return a<=b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function equal(a:*, b:*):Boolean{
			return a==b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function inequal(a:*, b:*):Boolean{
			return a!=b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function strictEqual(a:*, b:*):Boolean{
			return a===b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function strictInequal(a:*, b:*):Boolean{
			return a!==b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function dataAsType(a:*, b:*):*{
			return a as b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function propertiesInObject(a:*, b:*):Boolean{
			return a in b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function instanceOfPrototype(a:*, b:*):*{
			return a is b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function dataIsType(a:*, b:*):Boolean{
			return a is b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function logicalAnd(a:*, b:*):Boolean{
			return a && b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function logicalOr(a:*, b:*):Boolean{
			return a || b;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function logical(a:*, b:*=null):Boolean{
			return Boolean(a);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function logicalNot(a:*, b:*=null):Boolean{
			return !a;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param type 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isSingleCondition(type:String):Boolean{
			return (type==LOGICAL_NOT || type==LOGICAL) ? true : false;
		}

		/** 
		* 
		* 
		* 
		* @private (protected,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected const STRINGS:Object = function():Object{
			var obj:Object = {};
			obj[GREATER] = greater;
			obj[GREATER_EQUAL] = greaterEq;
			obj[LESSER] = lesser;
			obj[LESSER_EQUAL] = lesserEq;
			obj[EQUAL] = equal;
			obj[INEQUAL] = inequal;
			obj[STRICT_EQUAL] = strictEqual;
			obj[STRICT_INEQUAL] = strictInequal;
			obj[AS] = dataAsType;
			obj[IN] = propertiesInObject;
			obj[INSTANCEOF] = instanceOfPrototype;
			obj[IS] = dataIsType;
			obj[LOGICAL_AND] = logicalAnd;
			obj[LOGICAL_OR] = logicalOr;
			obj[LOGICAL_NOT] = logicalNot;
			obj[LOGICAL] = logical;
			return obj;
		}();

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @param a 
		* @param b 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function byString(str:String, a:*, b:*=null):Boolean{
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
		static public function isCondition(str:String):Boolean{
			return TYPE_LIST.indexOf(str)>=0;
		}
	}
}