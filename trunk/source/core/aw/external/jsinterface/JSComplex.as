package aw.external.jsinterface{
	import aw.external.js_interface;
	import flash.errors.IllegalOperationError;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;

	/** 
	* It guarantees transfer of value to JavaScript as complex data type connected to the original object. 
	* This object serves as wrapper for objects transferred to the JavaScript environment; it indicates to 
	* JSInterface that its value should necessarily be registered in the stack of transferred objects and 
	* it should transfer to JavaScript only the information about it, using “alive communication” with the 
	* object. Such connection means that the transferred object is not really transferred to JavaScript 
	* environment, but a special object that informs about all the requests for the object and its properties/methods 
	* is created in JavaScript environment. These request, in their turn, are transferred to Flash Player 
	* environment, transferred there and sent back to JavaScript as a result of request fulfilling. Thus the 
	* most recent information on the object and its properties’ values can be received.
	* 
	* @example Example of transformation:
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
			// You can change the properties of this object in the JavaScript environment,  
			// immediately after updating the values of the properties of the original 
			// object will be received by the new values.
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
		* Link in the transferred object
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