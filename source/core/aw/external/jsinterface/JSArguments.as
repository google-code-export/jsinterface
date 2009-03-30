package aw.external.jsinterface{
	import flash.utils.Dictionary;
	

	/** 
	* Класс использующийся при вызове функций из среды Flash Player'а в JavaScript среде. В обычном 
	* случае функция из среды Flash Player'а, вызванная в JavaScript среде получает весь набор 
	* аргументов передаваемых функции в JavaScript. Но такая функция не сможет получить доступ к 
	* target объекту, в области видимости которого она выполнялась. JSArguments содержит в себе список 
	* аргументов функции и ссылку на объект-оболочку JavaScript объекта, в области видимости которого 
	* она выполнялась.
	* Для того, чтоб функция получала объект JSArguments, необходимо метод зарегистрировать с помошью JSArguments.register();
<listing version="3.0">
package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSArguments;
	
	import flash.display.Sprite;

	public class JSArgumentsExample extends Sprite{
		public function JSArgumentsExample():void{
			super();
			JSInterface.initialize(this);
			JSArguments.registerByTarget(this, this.test);
			// setup method
			JSInterface.window.test = this.test;
			// call method
			JSInterface.window.test();
		}
		protected function test(args:JSArguments):void{
			trace(args.target); // [object Window]
		}
	}
}
</listing>
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public dynamic class JSArguments extends Array{

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const _argumented:Dictionary = new Dictionary(true);

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _target:JSDynamic;

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @param target 
		* @return void 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSArguments(args:Array=null, target:JSDynamic=null):void{
			super();
			setArguments(args, target);
		}

		/** 
		* JSDynamic объект, оболочка JavaScript объекта, в области видимости которого выполнялась данная функция.
		* 
		* 
		* @public (AS3,getter) 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		AS3 function get target():JSDynamic{
			return this._target;
		}

		/** 
		* Задать параметры объекта. Метод выполняется перед передачей объекта в функцию.
		* 
		* 
		* @public (AS3) 
		* @param args 
		* @param target 
		* @return void 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		AS3 function setArguments(args:Array, target:JSDynamic=null):void{
			this._target = target;
			if(args) this.push.apply(this, args);
		}

		/** 
		* Зарегистрировать метод, который должен принимать в качестве аргумента объект JSArguments.
		* Этот метод позволяет указать класс производный от JSArguments, экземпляры которого будут 
		* передаваться в указанный метод. Функции зарегистрированные с помощью метода JSArguments.register() 
		* будут автоматически удалены вместе с объектом, когда Garbage Collector будет отчищать память.
		* 
		* @public 
		* @param target Объект которому принадлежит данный метод. 
		* @param name Может быть Function - ссылка на метод, или String или QName - имя метода передаваемого объекта.
		* @param definition Класс дочерний от JSArguments, экземпляры которого будут передаваться в функцию. 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function registerByTarget(target:Object, name:*, definition:Class=null):void{
			var list:Dictionary;
			if(target in _argumented) list = _argumented[target];
			else _argumented[target] = list = new Dictionary();
			if(!definition) definition = JSArguments;
			list[name is Function ? name : target[name]] = definition;
		}
		/**
		* Зарегистрировать метод, по ссылке на метод. Любая функция зарегистрированная 
		* этим методом может быть удалена только вручную, иначе она никогда не будет 
		* удалена Garbage Collector'ом.
		* 
		* 
		* @public 
		* @param method Ссылка на метод.
		* @param definition Класс дочерний от JSArguments, экземпляры которого будут передаваться в функцию.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		 */
		static public function register(method:Function, definition:Class=null):void{
			var list:Dictionary;
			var target:Object = null;
			if(target in _argumented) list = _argumented[target];
			else _argumented[target] = list = new Dictionary();
			if(!definition) definition = JSArguments;
			list[method] = definition;
		}

		/** 
		* Зарегистрировать список методов одного объекта, принимающих в качестве аргумента, объект JSArguments.
		* 
		* 
		* @public 
		* @param target Объект которому принадлежат передаваемые методы.
		* @param args Список методов или их имён.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function registerList(target:Object, ...args:Array):void{
			var list:Dictionary;
			if(target in _argumented) list = _argumented[target];
			else _argumented[target] = list = new Dictionary();
			for each(var name:* in args) list[name is Function ? name : target[name]] = JSArguments;
		}

		/** 
		* Проверяет, зарегистрирован ли метод.
		* 
		* 
		* @public 
		* @param target Объект которому принадлежит данный метод.
		* @param name Может быть Function - ссылка на метод, или String или QName - имя метода передаваемого объекта.
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isRegisteredByTarget(target:Object, name:*):Boolean{
			return target in _argumented && (name is Function ? name : target[name]) in _argumented[target];
		}
		
		/** 
		* 
		* 
		* @public 
		* @param method Ссылка на метод.
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isRegistered(method:Function):Boolean{
			for each(var list:Dictionary in _argumented){
				if(method in list) return true;
			}
			return false;
		}

		/** 
		* Возвращает класс, экземпляры которого будут передаваться данному методу. Если переданный метод не был зарегистрирован, то будет возвращено NULL.
		* 
		* 
		* @public 
		* @param target Объект которому принадлежит данный метод.
		* @param name Может быть Function - ссылка на метод, или String или QName - имя метода передаваемого объекта.
		* @return Class 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getDefinitionByTarget(target:Object, name:*):Class{
			if(target in _argumented){
				var list:Dictionary = _argumented[target];
				var method:Function = name is Function ? name : target[name];
				if(method in list) return list[method];
			}
			return null;
		}
		
		/**
		* 
		* 
		* @public 
		* @param method Ссылка на метод.
		* @return Class 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getDefinition(method:Function):Class{
			for each(var list:Dictionary in _argumented){
				if(method in list) return list[method];
			}
			return null;
		}

		/** 
		* Удаляет регистрацию метода. 
		* 
		* 
		* @public 
		* @param target Объект которому принадлежит данный метод.
		* @param name Может быть Function - ссылка на метод, или String или QName - имя метода передаваемого объекта.
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function unregisterByTarget(target:Object, name:*):Boolean{
			if(target in _argumented){
				return delete _argumented[target][name is Function ? name : target[name]];
			}
			return false;
		}

		/** 
		* 
		* 
		* @public 
		* @param method Ссылка на метод.
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function unregister(method:Function):Boolean{
			for each(var list:Dictionary in _argumented){
				if(method in list) return delete list[method];
			}
			return false;
		}

		/** 
		* Создаёт экземпляр JSArguments по переданным параметрам.
		* 
		* 
		* @private 
		* @param method Ссылка на метод.
		* @param args Список аргументов функции.
		* @param target Объект относительно которого была вызвана функция. 
		* @return JSArguments 
		* @see aw.external.jsinterface.JSDynamic 
		* @see aw.external.jsinterface.JSArguments 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(method:Function, args:Array, target:JSDynamic):JSArguments{
			var definition:Class = getDefinition(method);
			var result:JSArguments;
			if(!definition || definition==JSArguments) result = new JSArguments(args, target);
			else{
				result = new definition();
				result.setArguments(args, target);
			}
			return result;
		}
		
		/** 
		* Если переданный метод зарегистрирован, то вернёт объект JSArguments, а если нет - тот же список аргументов. 
		* 
		* 
		* @private 
		* @param method Ссылка на метод.
		* @param args Список аргументов функции.
		* @param target Объект относительно которого была вызвана функция. 
		* @return Array 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function convert(method:Function, args:Array, target:JSDynamic):Array{
			return isRegistered(method) ? create(method, args, target) : args;
		}
	}
}