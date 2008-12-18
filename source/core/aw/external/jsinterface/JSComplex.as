package aw.external.jsinterface{
	import aw.external.js_interface;
	import flash.errors.IllegalOperationError;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	public dynamic class JSComplex extends Proxy{
		static public const EMUNERATION_ERROR:String = 'Enumeration of properties is not supported.';
		protected var _target:Object;
		public function JSComplex(obj:Object):void{
			super();
			_target = obj;
		}
		js_interface function get target():Object{
			return this._target;
		}
		override flash_proxy function callProperty(name:*, ... args):*{
			var val:* = this._target[name];
			if(val is Function && args){
				return (val as Function).apply(this._target, args);
			}else{
				return this._target[name];
			}
		}
		override flash_proxy function getProperty(name:*):*{
			return this._target[name];
		}
		override flash_proxy function hasProperty(name:*):Boolean{
			return name in this._target;
		}
		override flash_proxy function deleteProperty(name:*):Boolean{
			return delete this._target[name];
		}
		override flash_proxy function setProperty(name:*, value:*):void{
			this._target[name] = value;
		}
		override flash_proxy function nextNameIndex(index:int):int{
			throw new IllegalOperationError(EMUNERATION_ERROR);
			return -1;
		}
		override flash_proxy function nextName(index:int):String{
			throw new IllegalOperationError(EMUNERATION_ERROR);
			return '';
		}
		override flash_proxy function nextValue(index:int):*{
			throw new IllegalOperationError(EMUNERATION_ERROR);
			return undefined;
		}
	}
}