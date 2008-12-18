package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/JSCore.index.html">JavaScript Core Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Array.html">Array</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSArray extends JSDynamic{
		static public const CLASS_NAME:String = 'Array';
		static js_interface const INDEX_PROPERTY:String = 'index';
		static js_interface const INPUT_PROPERTY:String = 'input';
		static js_interface const LENGTH_PROPERTY:String = 'length';
		static js_interface const CONCAT_METHOD:String = 'concat';
		static js_interface const JOIN_METHOD:String = 'join';
		static js_interface const POP_METHOD:String = 'pop';
		static js_interface const PUSH_METHOD:String = 'push';
		static js_interface const REVERSE_METHOD:String = 'reverse';
		static js_interface const SHIFT_METHOD:String = 'shift';
		static js_interface const SLICE_METHOD:String = 'slice';
		static js_interface const SORT_METHOD:String = 'sort';
		static js_interface const SPLICE_METHOD:String = 'splice';
		static js_interface const TO_LOCALE_STRING_METHOD:String = 'toLocaleString';
		static js_interface const UNSHIFT_METHOD:String = 'unshift';
		protected var _itemType:Class = JSDynamic;
		public function JSArray(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		js_interface function get itemType():Class{
			return this._itemType;
		}
		js_interface function set itemType(p:Class):void{
			this._itemType = p;
		}
		override protected function internalGet(name:*, cls:Class=null):*{
			if(isNaN(name)){
				return super.internalGet(name, cls);
			}else{
				return super.internalGet(name, this._itemType);
			}
		}
		public function get index():int{
			return this.internalGet(js_interface::INDEX_PROPERTY);
		}
		public function set index(p:int):void{
			this.internalSet(js_interface::INDEX_PROPERTY, p);
		}
		public function get input():String{
			return this.internalGet(js_interface::INPUT_PROPERTY);
		}
		public function set input(p:String):void{
			this.internalSet(js_interface::INPUT_PROPERTY, p);
		}
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		public function concat(...args:Array):JSArray{
			return this.internalCall(js_interface::CONCAT_METHOD, args);
		}
		public function join(separator:String):String{
			return this.internalCall(js_interface::JOIN_METHOD, arguments);
		}
		public function pop():Object{
			return this.internalCall(js_interface::POP_METHOD, arguments);
		}
		public function push(...args:Array):Number{
			return this.internalCall(js_interface::PUSH_METHOD, args);
		}
		public function reverse():JSArray{
			return this.internalCall(js_interface::REVERSE_METHOD, arguments);
		}
		public function shift():Object{
			return this.internalCall(js_interface::SHIFT_METHOD, arguments);
		}
		public function slice(begin:int, end:int):JSArray{
			return this.internalCall(js_interface::SLICE_METHOD, arguments);
		}
		public function sort(func:Function=null):JSArray{
			return this.internalCall(js_interface::SORT_METHOD, arguments);
		}
		public function splice(...args:Array):JSArray{
			return this.internalCall(js_interface::SPLICE_METHOD, args);
		}
		public function toLocaleString():String{
			return this.internalCall(js_interface::TO_LOCALE_STRING_METHOD, arguments);
		}
		public function unshift(...args:Array):Number{
			return this.internalCall(js_interface::UNSHIFT_METHOD, args);
		}
		static public function create(...args:Array):JSArray{
			return new JSArray(CLASS_NAME, args);
		}
	}
}