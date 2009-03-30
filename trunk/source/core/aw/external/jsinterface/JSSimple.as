package aw.external.jsinterface{
	import aw.utils.ClassUtils;
	
	import flash.utils.Dictionary;
	

	/** 
	* Готовый объект оболочка для объектов передаваемых в JavaScript напрямую. Позволяет передавать 
	* объекты в виде "как есть", без ссылок и сохранения в стеке. Если необходимо передать объект 
	* из среды Flash Player'а прямо в JavaScript минуя всяческие преобразования, то его необходимо 
	* обернуть в этот объект.
	* @example Пример использования:
<listing version="3.0">
package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSSimple;
	
	import flash.display.Sprite;
	
	public class Test extends Sprite{
		public var initData:Object = {color:0xff00ff, size:[100, 300], thickness:2};
		public function Test():void{
			super();
			JSInterface.initialize(this, true);
			JSInterface.window.definedJavaScriptDrawFunction(this.graphics, new JSSimple(this.initData));
		}
	}
}
</listing>
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @see aw.external.jsinterface.IJSSimple 
	*/
	public class JSSimple implements IJSSimple{

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const _types:Dictionary = new Dictionary(true);

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isSimpleType(obj:Object):Boolean{
			if(obj){
				if(obj is IJSSimple) return true;
				if(!(obj is Class)){
					obj = ClassUtils.getClassDefinition(obj); 
				}
				return obj in _types;
			}
			return false;
		}

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
		static public function addSimpleType(obj:Object):void{
			if(obj){
				if(!(obj is Class)) obj = ClassUtils.getClassDefinition(obj);
				_types[obj] = true;
			}
		}

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
		static public function removeSimpleType(obj:Object):void{
			if(obj){
				if(!(obj is Class)) obj = ClassUtils.getClassDefinition(obj);
				delete _types[obj];
			}
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _data:Object;

		/** 
		* 
		* 
		* 
		* @public 
		* @param d 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSSimple(d:Object):void{
			super();
			_data = d;
		}

		/** 
		* Метод возвращающий переданный в конструктор объект, как набор простых данных. 
		* Используется при формировании запроса в JavaScript среду и для всех всех сложных 
		* объектов генерируется служебная информация, которая и будет передана. Этот объект 
		* используемый как оболочка гарантирует передачу оригинального объекта в JavaScript 
		* среду напрямую, без записи его в стек и передачи дополнительной информации. 
		* 
		* 
		* @public 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getSimpleData():*{
			return (this._data is IJSSimple) ? (this._data as IJSSimple).getSimpleData() : this._data;
		}
	}
}















