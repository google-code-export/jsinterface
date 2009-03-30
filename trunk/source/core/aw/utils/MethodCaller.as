package aw.utils{

	/** 
	* Класс вызывающий методы и функции по ссылкам, напрямую - без вызовов Function.call() или Function.apply(). 
	* Содержит скрытые методы для вызова функций по числу аргументов(мексимальное число аргументов - 15), каждый такой метод содержит следующий код 
	* для вызова функции по ссылке
<listing version="3.0">
		static private function callNMethod(func:Function, a:Array):&#042;{
			return func(a[0], a[1], a[2], a[3], ...a[N]);
		}
</listing>
	* для вызова функции по имени члена класса
<listing version="3.0">
		static private function callNByName(obj:Object, name:&#042;, a:Array):&#042;{
			return obj[name](a[0], a[1], a[2], a[3], ...a[N]);
		}
</listing>
	* Через методы MethodCaller.getCaller() и MethodCaller.getCallerByMethod() можно получить доступ к конкретному методу по числу аргументов.
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public class MethodCaller extends Object{

		/** 
		* 
		* 
		* 
		* @private (protected,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const methodCallers:Array = [call0Method, call1Method, call2Method, call3Method, call4Method, call5Method, call6Method, call7Method, call8Method, call9Method, call10Method, call11Method, call12Method, call13Method, call14Method, call15Method];

		/** 
		* 
		* 
		* 
		* @private (protected,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const byNameCallers:Array = [call0ByName, call1ByName, call2ByName, call3ByName, call4ByName, call5ByName, call6ByName, call7ByName, call8ByName, call9ByName, call10ByName, call11ByName, call12ByName, call13ByName, call14ByName, call15ByName];

		/** 
		* Вызвать функцию по ссылке
		* 
		* 
		* @public 
		* @param func Ссылука на функцию
		* @param a Список аргументов
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function call(func:Function, ...a:Array):*{
			return methodCallers[a.length](func, a);
		}

		/** 
		* Вызвать функцию по ссылке
		* 
		* 
		* @public 
		* @param func Ссылука на функцию
		* @param a Массив аргументов
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function apply(func:Function, a:Array):*{
			return methodCallers[a.length](func, a);
		}

		/** 
		* Вызвать метод по имени члена класса
		* 
		* 
		* @public 
		* @param obj Объект содержащий метод
		* @param name Имя метода
		* @param a Список аргументов
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function callByName(obj:Object, name:*, ...a:Array):*{
			return byNameCallers[a.length](obj, name, a);
		}

		/** 
		* Вызвать метод по имени члена класса
		* 
		* 
		* @public 
		* @param obj Объект содержащий метод
		* @param name Имя метода
		* @param a Список аргументов
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function applyByName(obj:Object, name:*, a:Array):*{
			return byNameCallers[a.length](obj, name, a);
		}

		/** 
		* Получить метод вызывающий функцию, по числу аргументов
		* 
		* 
		* @public 
		* @param a Массив аргументов
		* @return Function 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getCaller(a:Array):Function{
			return methodCallers[a.length];
		}

		/** 
		* Получить метод вызывающий функцию, по числу аргументов
		* 
		* 
		* @public 
		* @param f Функция, которую требуется выполнять
		* @return Function 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getCallerByMethod(f:Function):Function{
			return methodCallers[(f as Object).length];
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call0Method(func:Function, a:Array=null):*{
			return func();
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call1Method(func:Function, a:Array):*{
			return func(a[0]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call2Method(func:Function, a:Array):*{
			return func(a[0], a[1]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call3Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call4Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call5Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call6Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call7Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call8Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call9Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call10Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call11Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call12Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call13Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call14Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param func 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call15Method(func:Function, a:Array):*{
			return func(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call0ByName(obj:Object, name:*, a:Array=null):*{
			return obj[name]();
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call1ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call2ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call3ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call4ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call5ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call6ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call7ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call8ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call9ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call10ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call11ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call12ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call13ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call14ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param obj 
		* @param name 
		* @param a 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function call15ByName(obj:Object, name:*, a:Array):*{
			return obj[name](a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
		}
	}
}