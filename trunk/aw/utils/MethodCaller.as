package aw.utils{
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class MethodCaller extends Object{
		/** 
		* 
		* @private (protected,constant) 
		*/
		static protected const methodCallers:Array = [call0Method, call1Method, call2Method, call3Method, call4Method, call5Method, call6Method, call7Method, call8Method, call9Method, call10Method, call11Method, call12Method, call13Method, call14Method, call15Method];
		/** 
		* 
		* @private (protected,constant) 
		*/
		static protected const byNameCallers:Array = [call0ByName, call1ByName, call2ByName, call3ByName, call4ByName, call5ByName, call6ByName, call7ByName, call8ByName, call9ByName, call10ByName, call11ByName, call12ByName, call13ByName, call14ByName, call15ByName];
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call(func:Function, ...a:Array):*{
			return methodCallers[a.length](func, a);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function apply(func:Function, a:Array):*{
			return methodCallers[a.length](func, a);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function callByName(obj:Object, name:*, ...a:Array):*{
			return byNameCallers[a.length](obj, name, a);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function applyByName(obj:Object, name:*, a:Array):*{
			return byNameCallers[a.length](obj, name, a);
		}
		/** 
		* 
		* @public 
		* @param a 
		* @return Function 
		*/
		static public function getCaller(a:Array):Function{
			return methodCallers[a.length];
		}
		/** 
		* 
		* @public 
		* @param f 
		* @return Function 
		*/
		static public function getCallerByMethod(f:Function):Function{
			return methodCallers[(f as Object).length];
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call0Method(func:Function, a:Array=null):*{
			return func();
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call1Method(func:Function, a:Array):*{
			return func(a[0]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call2Method(func:Function, a:Array):*{
			return func(a[0], a[1]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call3Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call4Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call5Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call6Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call7Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call8Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call9Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call10Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call11Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call12Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call13Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call14Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @param a 
		* @return * 
		*/
		static public function call15Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call0ByName(obj:Object, name:*, a:Array=null):*{
			return obj[name]();
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call1ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call2ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call3ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call4ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call5ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call6ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call7ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call8ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call9ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call10ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call11ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call12ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call13ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call14ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		*/
		static public function call15ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
		}
	}
}