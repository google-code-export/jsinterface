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
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Array';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const INDEX_PROPERTY:String = 'index';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const INPUT_PROPERTY:String = 'input';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const LENGTH_PROPERTY:String = 'length';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const CONCAT_METHOD:String = 'concat';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const JOIN_METHOD:String = 'join';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const POP_METHOD:String = 'pop';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const PUSH_METHOD:String = 'push';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const REVERSE_METHOD:String = 'reverse';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SHIFT_METHOD:String = 'shift';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SLICE_METHOD:String = 'slice';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SORT_METHOD:String = 'sort';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SPLICE_METHOD:String = 'splice';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const TO_LOCALE_STRING_METHOD:String = 'toLocaleString';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const UNSHIFT_METHOD:String = 'unshift';
		/** 
		* 
		* @private (protected) 
		*/
		protected var _itemType:Class = JSDynamic;
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSArray(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public (js_interface,getter) 
		* @return Class 
		*/
		js_interface function get itemType():Class{
			return this._itemType;
		}
		/** 
		* 
		* @public (js_interface,setter) 
		* @param p 
		* @return void 
		*/
		js_interface function set itemType(p:Class):void{
			this._itemType = p;
		}
		/** 
		* 
		* @private (protected) 
		* @param name 
		* @param cls 
		* @return * 
		*/
		override protected function internalGet(name:*, cls:Class=null):*{
			if(isNaN(name)){
				return super.internalGet(name, cls);
			}else{
				return super.internalGet(name, this._itemType);
			}
		}
		/** 
		* 
		* @public (getter) 
		* @return int 
		*/
		public function get index():int{
			return this.internalGet(js_interface::INDEX_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set index(p:int):void{
			this.internalSet(js_interface::INDEX_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get input():String{
			return this.internalGet(js_interface::INPUT_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set input(p:String):void{
			this.internalSet(js_interface::INPUT_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return int 
		*/
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function concat(...args:Array):JSArray{
			return this.internalCall(js_interface::CONCAT_METHOD, args);
		}
		/** 
		* 
		* @public 
		* @param separator 
		* @return String 
		*/
		public function join(separator:String):String{
			return this.internalCall(js_interface::JOIN_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @return Object 
		*/
		public function pop():Object{
			return this.internalCall(js_interface::POP_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return Number 
		*/
		public function push(...args:Array):Number{
			return this.internalCall(js_interface::PUSH_METHOD, args);
		}
		/** 
		* 
		* @public 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function reverse():JSArray{
			return this.internalCall(js_interface::REVERSE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @return Object 
		*/
		public function shift():Object{
			return this.internalCall(js_interface::SHIFT_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param begin 
		* @param end 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function slice(begin:int, end:int):JSArray{
			return this.internalCall(js_interface::SLICE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param func 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function sort(func:Function=null):JSArray{
			return this.internalCall(js_interface::SORT_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function splice(...args:Array):JSArray{
			return this.internalCall(js_interface::SPLICE_METHOD, args);
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		public function toLocaleString():String{
			return this.internalCall(js_interface::TO_LOCALE_STRING_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return Number 
		*/
		public function unshift(...args:Array):Number{
			return this.internalCall(js_interface::UNSHIFT_METHOD, args);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		static public function create(...args:Array):JSArray{
			return new JSArray(CLASS_NAME, args);
		}
	}
}