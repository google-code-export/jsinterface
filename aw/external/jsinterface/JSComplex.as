package aw.external.jsinterface{
	import aw.external.js_interface;
	import flash.errors.IllegalOperationError;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public dynamic class JSComplex extends Proxy{
		/** 
		* 
		* @public (constant) 
		*/
		static public const EMUNERATION_ERROR:String = 'Enumeration of properties is not supported.';
		/** 
		* 
		* @private (protected) 
		*/
		protected var _target:Object;
		/** 
		* 
		* @public 
		* @param obj 
		* @return void 
		*/
		public function JSComplex(obj:Object):void{
			super();
			_target = obj;
		}
		/** 
		* 
		* @public (js_interface,getter) 
		* @return Object 
		*/
		js_interface function get target():Object{
			return this._target;
		}
		/** 
		* 
		* @public (flash_proxy) 
		* @param name 
		* @param args 
		* @return * 
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
		* @public (flash_proxy) 
		* @param name 
		* @return * 
		*/
		override flash_proxy function getProperty(name:*):*{
			return this._target[name];
		}
		/** 
		* 
		* @public (flash_proxy) 
		* @param name 
		* @return Boolean 
		*/
		override flash_proxy function hasProperty(name:*):Boolean{
			return name in this._target;
		}
		/** 
		* 
		* @public (flash_proxy) 
		* @param name 
		* @return Boolean 
		*/
		override flash_proxy function deleteProperty(name:*):Boolean{
			return delete this._target[name];
		}
		/** 
		* 
		* @public (flash_proxy) 
		* @param name 
		* @param value 
		* @return void 
		*/
		override flash_proxy function setProperty(name:*, value:*):void{
			this._target[name] = value;
		}
		/** 
		* 
		* @public (flash_proxy) 
		* @param index 
		* @return int 
		*/
		override flash_proxy function nextNameIndex(index:int):int{
			throw new IllegalOperationError(EMUNERATION_ERROR);
			return -1;
		}
		/** 
		* 
		* @public (flash_proxy) 
		* @param index 
		* @return String 
		*/
		override flash_proxy function nextName(index:int):String{
			throw new IllegalOperationError(EMUNERATION_ERROR);
			return '';
		}
		/** 
		* 
		* @public (flash_proxy) 
		* @param index 
		* @return * 
		*/
		override flash_proxy function nextValue(index:int):*{
			throw new IllegalOperationError(EMUNERATION_ERROR);
			return undefined;
		}
	}
}