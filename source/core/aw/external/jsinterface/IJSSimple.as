package aw.external.jsinterface{
	/**
	 * Интерфейс объекта который способен автоматически преобразовываться в простой объект(процесс пастеризации) для передачи в JavaScript среду.
	 * Этот интерфейс необходимо реализовать в объектах которые будут передаваться, как набор простых данных, в JavaScript среду, без связи с оригинальными объектами. 
	 * Результат преобразования объекта должен быть возвращён как результат работы метода getSimpleData().
	 * @example Пример метода преобразования:
<listing version="3.0">
package {
	import flash.display.Sprite;
	import aw.external.jsinterface.IJSSimple;
	
	public class Test extends Sprite implements IJSSimple{
		public var numberValue:Number;
		public var booleanValue:Boolean;
		public var regExpValue:RegExp;
		public var stringValue:String;
		public function Test():void{
			super();
		}
		public function getSimpleData():&#042;{
			var object:Object = {numberValue:this.numberValue, booleanValue: this.booleanValue, stringValue:this.stringValue};
			if(this.regExpValue) object.regExpValue = this.regExpValue.source;
			return object;
		}
	}
}
</listing>
	 * @public
	 * @see aw.external.jsinterface.JSSimple
	 */
	public interface IJSSimple{

		/** 
		* 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		function getSimpleData():*;
	}
}