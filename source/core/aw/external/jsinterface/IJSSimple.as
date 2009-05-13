package aw.external.jsinterface{
	/**
	* Interface of object that is able to turn into a simple object automatically (pasteurization process)
	*  for transferring to JavaScript environment. This interface should be realized in objects that will 
	* be transferred data to JavaScript environment as a set of simple without connection with the original 
	* objects. The result of object transformation should be retrieved as a result of getSimpleData() method 
	* operation. 
	 * @example Example of getSimpleData method:
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