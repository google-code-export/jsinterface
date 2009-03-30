package aw.utils{
	import flash.utils.*;
	import flash.system.*;
	import flash.errors.*;

		/**
		* Класс для работы с объектами классов.
		* Позволяет инстанциировать классы по имени или по объекту класса.
		* @example Пример использования:
<listing version="3.0">
package {
	import aw.utils.ClassUtils;
	
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			var filter1:DropShadowFilter = ClassUtils.apply(DropShadowFilter, [4, 45, 0, 1, 4, 4, 1]);
			var filter2:DropShadowFilter = ClassUtils.applyByName("flash.filters.DropShadowFilter", [4, 45, 0, 1, 4, 4, 1]);
			var filter3:DropShadowFilter = ClassUtils.call(DropShadowFilter, 4, 45, 0, 1, 4, 4, 1);
			var filter4:DropShadowFilter = ClassUtils.callByName("flash.filters.DropShadowFilter", 4, 45, 0, 1, 4, 4, 1);
		}
	}
}
</listing>
		* Содержит метод для получения объекта класса из экземпляра класса.
		* @example Пример использования:
<listing version="3.0">
package {
	import aw.utils.ClassUtils;
	
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			trace(ClassUtils.getClassDefinition(this));
			var filter:DropShadowFilter = new DropShadowFilter();
			trace(ClassUtils.getClassDefinition(filter));
		}
	}
}
/&#042; trace output
[class Test]
[class DropShadowFilter]
&#042;/
</listing>
		* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
	public class ClassUtils extends Object{
		
		
		/**
		* @private
		*/
		static public const WRONG_NAME_ERROR:String = 'ClassUtils Error: can\'t found [$cls] class definition by name';

		/**
		* @private (protected)
		*/
		static protected const classCallers:Array = [call0Class, call1Class, call2Class, call3Class, call4Class, call5Class, call6Class, call7Class, call8Class, call9Class, call10Class, call11Class, call12Class, call13Class, call14Class, call15Class];

		/**
		* Возвращает объект класса по его имени или экземпляру.
		* 
		* @param any Имя класса или его экземпляр.
		* @return Class
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function getClassDefinition(any:*):Class{
			var cls:Object = null;
			if(any is Proxy) cls = getDefinitionByName(getQualifiedClassName(any));
			else cls = Object(any).constructor;
			return cls as Class;
		}

		/**
		* Возвращает имя класса.
		* 
		* @param cls Объект класса, его экземпляр или имя(если скормить имя несуществующего класса, то вернёт имя класса "String").
		* @return String
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function getClassName(cls:*):String{
			if(cls is String && ApplicationDomain.currentDomain.hasDefinition(cls)) return cls;
			else return getQualifiedClassName(cls);
		}

		/**
		* Эмулирует действие одноимённого метода объектов типа Function.
		* 
		* @param cls Объект класса, экземпляр которого нужно получить.
		* @param arr Список параметров передаваемых в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function apply(cls:Object, arr:Array=null):*{
			if(!arr) arr = [];
			var f:Function = classCallers[arr.length];
			if(f!=null) return f(cls, arr);
			else throw new Error(cantCreateErrorString(getQualifiedClassName(cls)));
		}

		/**
		* Создаёт экземпляр класса по его имени, передавая в конструктор параметры из массива.
		* 
		* @param name Имя класса, экземпляр которого нужно получить.
		* @param arr Список параметров передаваемых в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function applyByName(name:String, arr:Array=null):*{
			var ad:ApplicationDomain = ApplicationDomain.currentDomain;
			var cls:Class;
			if(ad.hasDefinition(name)){
				cls = ad.getDefinition(name) as Class;
			}
			if(!cls) throw new IllegalOperationError(WRONG_NAME_ERROR.split('$cls').join(name));
			if(!arr) arr = [];
			var f:Function = classCallers[arr.length];
			if(f!=null) return f(cls, arr);
			else throw new Error(cantCreateErrorString(name));
		}
		
		/**
		* Эмулирует действие одноимённого метода объектов типа Function.
		* 
		* @param cls Объект класса, экземпляр которого нужно получить.
		* @param ...args Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function call(cls:Object, ...args:Array):*{
			var f:Function = classCallers[args.length];
			if(f!=null) return f(cls, args);
			else throw new Error(cantCreateErrorString(getQualifiedClassName(cls)));
		}

		/**
		* Создаёт экземпляр класса по его имени, передавая в конструктор все последующие параметры, за именем класса.
		* 
		* @param cls Объект класса, экземпляр которого нужно получить.
		* @param ...args Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function callByName(name:String, ...args:Array):*{
			var ad:ApplicationDomain = ApplicationDomain.currentDomain;
			var cls:Class;
			if(ad.hasDefinition(name)){
				cls = ad.getDefinition(name) as Class;
			}
			if(!cls) throw new IllegalOperationError(WRONG_NAME_ERROR);
			var f:Function = classCallers[args.length];
			if(f!=null) return f(cls, args);
			else throw new Error(cantCreateErrorString(getQualifiedClassName(cls)));
		}

		/**
		* Получить ссылку на метод создающий экземпляр класса по количеству передаваемых аргументов.
		* @private
		* @param i Количество аргументов.
		* @return Function
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function getClassCaller(i:uint):Function{
			return classCallers[i];
		}

		/**
		* Получить экземпляр класса, конструктор которого не принимает параметров.
		* @private
		* @param cls Объект класса.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call0Class(cls:Object, a:Array=null):*{
			return new cls();
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 1 параметр.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call1Class(cls:Object, a:Array):*{
			return new cls(a[0]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 2 параметра.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call2Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 3 параметра.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call3Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 4 параметра.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call4Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 5 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call5Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 6 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call6Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 7 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call7Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 8 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call8Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 9 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call9Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 10 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call10Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 11 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call11Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 12 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call12Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 13 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call13Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 14 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call14Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]);
		}

		/**
		* Получить экземпляр класса, конструктор которого принимает 15 параметров.
		* @private
		* @param cls Объект класса.
		* @param a Параметры передаваемые в конструкторе.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function call15Class(cls:Object, a:Array):*{
			return new cls(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]);
		}

		/**
		* Создаёт сообщение об ошибке.
		* @private
		* @param cls Имя класса вызвавшего ошибку.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static private function cantCreateErrorString(name:String):String{
			return 'ClassUtils can\'t create "'+name+'" instance.'
		}
	}
}