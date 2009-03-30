package aw.external.jsinterface{
	import aw.external.js_interface;
	import flash.errors.IllegalOperationError;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;

	/** 
	* Гарантирует передачу значения в JavaScript, как сложный тип данных - связанный с оригинальным объектом.
	* Этот объект служит оболочкой для объектов передаваемых в JavaScript среду, он указывает JSInterface, 
	* что его значение необходимо обязательно зарегистрировать в стеке передаваемых объектов и передавать 
	* в JavaScript только информацию о нём, используя "живое общение" с объектом. Такая связь обозначает, 
	* что передаваемый объект на самом деле не передаётся в JavaScript среду, а в JavaScript среде создаётся 
	* специальный объект, который сообщает о всех запросах к объекту и его свойствам/методам. Эти запросы, 
	* в свою очередь, передаются в среду Flash Player'а, там обрабатываются и отправляются назад в JavaScript, 
	* как результат выполнения запроса. Таким образом можно получить самую актуальную информацию о объекте и 
	* значениях его свойств.
	* @example Пример метода преобразования:
<listing version="3.0">
package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSComplex;
	
	import flash.display.Sprite;
	
	public class Test extends Sprite{
		private var _drawProperties:Object = {fillColor:0x00000, fillAlpha:1, strokeColor:0xffffff, strokeAlpha:1};
		public function Test():void{
			super();
			JSInterface.initialize(this);
			// можно изменять свойства этого объекта и в JavaScript среде, сразу после обновления значений свойств оригинального объекта, будут получены новые значения.
			JSInterface.window.drawInFlash(this.graphics, new JSComplex(this._drawProperties));
		}
	}
}
</listing>
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public dynamic class JSComplex extends Proxy{

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const EMUNERATION_ERROR:String = 'Enumeration of properties is not supported.';

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _target:Object;

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSComplex(obj:Object):void{
			super();
			_target = obj;
		}

		/** 
		* Ссылка на передаваемый объект
		* 
		* 
		* @public (js_interface,getter) 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		js_interface function get target():Object{
			return this._target;
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @param args 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function callProperty(name:*, ... args):*{
			var val:* = this._target[name];
			if(val is Function && args){
				return (val as Function).apply(this._target, args);
			}else{
				return this._target[name];
			}
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function getProperty(name:*):*{
			return this._target[name];
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function hasProperty(name:*):Boolean{
			return name in this._target;
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function deleteProperty(name:*):Boolean{
			return delete this._target[name];
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param name 
		* @param value 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function setProperty(name:*, value:*):void{
			this._target[name] = value;
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param index 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function nextNameIndex(index:int):int{
			throw new IllegalOperationError(EMUNERATION_ERROR);
			return -1;
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param index 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function nextName(index:int):String{
			throw new IllegalOperationError(EMUNERATION_ERROR);
			return '';
		}

		/** 
		* 
		* 
		* 
		* @private (flash_proxy) 
		* @param index 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override flash_proxy function nextValue(index:int):*{
			throw new IllegalOperationError(EMUNERATION_ERROR);
			return undefined;
		}
	}
}