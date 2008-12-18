package aw.utils{
	public class MethodCaller extends Object{
		static protected const methodCallers:Array = [call0Method, call1Method, call2Method, call3Method, call4Method, call5Method, call6Method, call7Method, call8Method, call9Method, call10Method, call11Method, call12Method, call13Method, call14Method, call15Method];
		static protected const byNameCallers:Array = [call0ByName, call1ByName, call2ByName, call3ByName, call4ByName, call5ByName, call6ByName, call7ByName, call8ByName, call9ByName, call10ByName, call11ByName, call12ByName, call13ByName, call14ByName, call15ByName];
		static public function call(func:Function, ...a:Array):*{
			return methodCallers[a.length](func, a);
		}
		static public function apply(func:Function, a:Array):*{
			return methodCallers[a.length](func, a);
		}
		static public function callByName(obj:Object, name:*, ...a:Array):*{
			return byNameCallers[a.length](obj, name, a);
		}
		static public function applyByName(obj:Object, name:*, a:Array):*{
			return byNameCallers[a.length](obj, name, a);
		}
		static public function getCaller(a:Array):Function{
			return methodCallers[a.length];
		}
		static public function getCallerByMethod(f:Function):Function{
			return methodCallers[(f as Object).length];
		}
		static public function call0Method(func:Function, a:Array=null):*{
			return func();
		}
		static public function call1Method(func:Function, a:Array):*{
			return func(a[0]);
		}
		static public function call2Method(func:Function, a:Array):*{
			return func(a[0], a[1]);
		}
		static public function call3Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2]);
		}
		static public function call4Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3]);
		}
		static public function call5Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4]);
		}
		static public function call6Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5]);
		}
		static public function call7Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
		}
		static public function call8Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
		}
		static public function call9Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
		}
		static public function call10Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
		}
		static public function call11Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
		}
		static public function call12Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
		}
		static public function call13Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
		}
		static public function call14Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
		}
		static public function call15Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
		}
		static public function call0ByName(obj:Object, name:*, a:Array=null):*{
			return obj[name]();
		}
		static public function call1ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0]);
		}
		static public function call2ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1]);
		}
		static public function call3ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2]);
		}
		static public function call4ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3]);
		}
		static public function call5ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4]);
		}
		static public function call6ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5]);
		}
		static public function call7ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
		}
		static public function call8ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
		}
		static public function call9ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
		}
		static public function call10ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
		}
		static public function call11ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
		}
		static public function call12ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
		}
		static public function call13ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
		}
		static public function call14ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
		}
		static public function call15ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
		}
	}
}