package aw.emulate{
	public class Condition extends Object implements IEmulate, ICondition{
		static internal const TYPE_LIST:Array = [GREATER, GREATER_EQUAL, LESSER, LESSER_EQUAL, EQUAL, INEQUAL, STRICT_EQUAL, STRICT_INEQUAL, AS, IN, INSTANCEOF, IS, LOGICAL_AND, LOGICAL_OR, LOGICAL_NOT, LOGICAL];
		static public const GREATER:String = '>';
		static public const GREATER_EQUAL:String = '>=';
		static public const LESSER:String = '<';
		static public const LESSER_EQUAL:String = '<=';
		static public const EQUAL:String = '==';
		static public const INEQUAL:String = '!=';
		static public const STRICT_EQUAL:String = '===';
		static public const STRICT_INEQUAL:String = '!==';
		static public const AS:String = 'as';
		static public const IN:String = 'in';
		static public const INSTANCEOF:String = 'instanceof';
		static public const IS:String = 'is';
		static public const LOGICAL_AND:String = '&&';
		static public const LOGICAL_OR:String = '||';
		static public const LOGICAL_NOT:String = '!';
		static public const LOGICAL:String = '';
		protected var _type:String;
		protected var _single:Boolean = false;
		public var left:*;
		public var right:*;
		public function Condition(t:String, l:*, r:*=null):void{
			super();
			_type = t;
			_single = isSingleCondition(t);
			left = l;
			right = r;
		}
		public function apply():Boolean{
			if(this._single){
				return byString(this._type, (this.right is Condition) ? this.right.apply() : this.right);
			}else return byString(this._type, 
									  (this.left is Condition) ? this.left.apply() : this.left, 
									  (this.right is Condition) ? this.right.apply() : this.right
								  );
		}
		public function get type():String{
			return this._type;
		}
		public function get isSingle():Boolean{
			return this._single;
		}
		static public function greater(a:*, b:*):Boolean{
			return a>b;
		}
		static public function greaterEq(a:*, b:*):Boolean{
			return a>=b;
		}
		static public function lesser(a:*, b:*):Boolean{
			return a<b;
		}
		static public function lesserEq(a:*, b:*):Boolean{
			return a<=b;
		}
		static public function equal(a:*, b:*):Boolean{
			return a==b;
		}
		static public function inequal(a:*, b:*):Boolean{
			return a!=b;
		}
		static public function strictEqual(a:*, b:*):Boolean{
			return a===b;
		}
		static public function strictInequal(a:*, b:*):Boolean{
			return a!==b;
		}
		static public function dataAsType(a:*, b:*):*{
			return a as b;
		}
		static public function propertiesInObject(a:*, b:*):Boolean{
			return a in b;
		}
		static public function instanceOfPrototype(a:*, b:*):*{
			return a is b;
		}
		static public function dataIsType(a:*, b:*):Boolean{
			return a is b;
		}
		static public function logicalAnd(a:*, b:*):Boolean{
			return a && b;
		}
		static public function logicalOr(a:*, b:*):Boolean{
			return a || b;
		}
		static public function logical(a:*, b:*=null):Boolean{
			return Boolean(a);
		}
		static public function logicalNot(a:*, b:*=null):Boolean{
			return !a;
		}
		static public function isSingleCondition(type:String):Boolean{
			return (type==LOGICAL_NOT || type==LOGICAL) ? true : false;
		}
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
		static public function byString(str:String, a:*, b:*=null):Boolean{
			return STRINGS[str](a, b);
		}
		static public function getList():Array{
			return TYPE_LIST.concat();
		}
		static public function isCondition(str:String):Boolean{
			return TYPE_LIST.indexOf(str)>=0;
		}
	}
}