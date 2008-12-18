package aw.emulate{
	public class OperatorPriority extends Object{
		static public const NO_VALUE:int = -1;
		static internal const OPERATORS:Object = function():Object{
			var ret:Object = {};
			//Unary
			ret['++'] = 14;
			ret['--'] = 14;
			ret['~'] = 14;
			ret['!'] = 14;
			ret['delete'] = 14;
			ret['typeof'] = 14;
			ret['void'] = 14;
			//Multiplicative
			ret['*'] = 13;
			ret['/'] = 13;
			ret['%'] = 13;
			//Additive
			ret['+'] = 12;
			ret['-'] = 12;
			//Bitwise shift
			ret['<<'] = 11;
			ret['>>'] = 11;
			ret['>>>'] = 11;  
			//Relational
			ret['<'] = 10;
			ret['>'] = 10;
			ret['<='] = 10;
			ret['>='] = 10;
			ret['as'] = 10;
			ret['in'] = 10;
			ret['instanceof'] = 10;
			ret['is'] = 10;
			//Equality
			ret['=='] = 9;
			ret['!='] = 9;
			ret['==='] = 9;
			ret['!=='] = 9;
			//Bitwise AND
			ret['&'] = 8;
			//Bitwise XOR
			ret['^'] = 7;
			//Bitwise OR
			ret['|'] = 6;
			//Logical AND
			ret['&&'] = 5;
			//Logical OR
			ret['||'] = 4;
			//Conditional 
			ret['?'] = 3;  
			//Assignment
			ret['='] = 2;
			ret['*='] = 2;
			ret['/='] = 2;
			ret['%='] = 2;
			ret['+='] = 2;
			ret['-='] = 2;
			ret['<<='] = 2;
			ret['>>='] = 2;
			ret['>>>='] = 2;
			ret['&='] = 2;
			ret['^='] = 2;
			ret['|='] = 2;
			//Comma
			ret[','] = 1;
			return ret;
		}();
		static public function getValue(op:String):int{
			return op in OPERATORS ? OPERATORS[op] : NO_VALUE;
		}
	}
}