package aw.emulate{
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	* @see aw.emulate.IEmulate 
	* @see aw.emulate.ICondition 
	*/
	public class Condition extends Object implements IEmulate, ICondition{
		/** 
		* 
		* @private (internal,constant) 
		*/
		static internal const TYPE_LIST:Array = [GREATER, GREATER_EQUAL, LESSER, LESSER_EQUAL, EQUAL, INEQUAL, STRICT_EQUAL, STRICT_INEQUAL, AS, IN, INSTANCEOF, IS, LOGICAL_AND, LOGICAL_OR, LOGICAL_NOT, LOGICAL];
		/** 
		* 
		* @public (constant) 
		*/
		static public const GREATER:String = '>';
		/** 
		* 
		* @public (constant) 
		*/
		static public const GREATER_EQUAL:String = '>=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const LESSER:String = '<';
		/** 
		* 
		* @public (constant) 
		*/
		static public const LESSER_EQUAL:String = '<=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const EQUAL:String = '==';
		/** 
		* 
		* @public (constant) 
		*/
		static public const INEQUAL:String = '!=';
		/** 
		* 
		* @public (constant) 
		*/
		static public const STRICT_EQUAL:String = '===';
		/** 
		* 
		* @public (constant) 
		*/
		static public const STRICT_INEQUAL:String = '!==';
		/** 
		* 
		* @public (constant) 
		*/
		static public const AS:String = 'as';
		/** 
		* 
		* @public (constant) 
		*/
		static public const IN:String = 'in';
		/** 
		* 
		* @public (constant) 
		*/
		static public const INSTANCEOF:String = 'instanceof';
		/** 
		* 
		* @public (constant) 
		*/
		static public const IS:String = 'is';
		/** 
		* 
		* @public (constant) 
		*/
		static public const LOGICAL_AND:String = '&&';
		/** 
		* 
		* @public (constant) 
		*/
		static public const LOGICAL_OR:String = '||';
		/** 
		* 
		* @public (constant) 
		*/
		static public const LOGICAL_NOT:String = '!';
		/** 
		* 
		* @public (constant) 
		*/
		static public const LOGICAL:String = '';
		/** 
		* 
		* @private (protected) 
		*/
		protected var _type:String;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _single:Boolean = false;
		/** 
		* 
		* @public 
		*/
		public var left:*;
		/** 
		* 
		* @public 
		*/
		public var right:*;
		/** 
		* 
		* @public 
		* @param t 
		* @param l 
		* @param r 
		* @return void 
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
		* @public 
		* @return Boolean 
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
		* @public (getter) 
		* @return String 
		*/
		public function get type():String{
			return this._type;
		}
		/** 
		* 
		* @public (getter) 
		* @return Boolean 
		*/
		public function get isSingle():Boolean{
			return this._single;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function greater(a:*, b:*):Boolean{
			return a>b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function greaterEq(a:*, b:*):Boolean{
			return a>=b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function lesser(a:*, b:*):Boolean{
			return a<b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function lesserEq(a:*, b:*):Boolean{
			return a<=b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function equal(a:*, b:*):Boolean{
			return a==b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function inequal(a:*, b:*):Boolean{
			return a!=b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function strictEqual(a:*, b:*):Boolean{
			return a===b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function strictInequal(a:*, b:*):Boolean{
			return a!==b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function dataAsType(a:*, b:*):*{
			return a as b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function propertiesInObject(a:*, b:*):Boolean{
			return a in b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return * 
		*/
		static public function instanceOfPrototype(a:*, b:*):*{
			return a is b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function dataIsType(a:*, b:*):Boolean{
			return a is b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function logicalAnd(a:*, b:*):Boolean{
			return a && b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function logicalOr(a:*, b:*):Boolean{
			return a || b;
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function logical(a:*, b:*=null):Boolean{
			return Boolean(a);
		}
		/** 
		* 
		* @public 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function logicalNot(a:*, b:*=null):Boolean{
			return !a;
		}
		/** 
		* 
		* @public 
		* @param type 
		* @return Boolean 
		*/
		static public function isSingleCondition(type:String):Boolean{
			return (type==LOGICAL_NOT || type==LOGICAL) ? true : false;
		}
		/** 
		* 
		* @private (protected,constant) 
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
		* @public 
		* @param str 
		* @param a 
		* @param b 
		* @return Boolean 
		*/
		static public function byString(str:String, a:*, b:*=null):Boolean{
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
		static public function isCondition(str:String):Boolean{
			return TYPE_LIST.indexOf(str)>=0;
		}
	}
}