package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Form.html">Form</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSForm extends JSDynamic{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Form';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ELEMENS_PROPERTY:String = 'elements';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ON_RESET_PROPERTY:String = 'onreset';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ON_SUBMIT_PROPERTY:String = 'onsubmit';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const TARGET_PROPERTY:String = 'target';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ACTION_PROPERTY:String = 'action';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ENCODING_PROPERTY:String = 'encoding';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const LENGTH_PROPERTY:String = 'length';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const METHOD_PROPERTY:String = 'method';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const NAME_PROPERTY:String = 'name';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const RESET_METHOD:String = 'reset';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SUBMIT_METHOD:String = 'submit';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSForm(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public (getter) 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function get elements():JSArray{
			var ret:JSArray = this.internalGet(js_interface::ELEMENS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSHTMLElement;
			return ret;
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function set elements(p:JSArray):void{
			this.internalSet(js_interface::ELEMENS_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return Function 
		*/
		public function get onreset():Function{
			return this.internalGet(js_interface::ON_RESET_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set onreset(p:Function):void{
			this.internalSet(js_interface::ON_RESET_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return Object 
		*/
		public function get onsubmit():Object{
			return this.internalGet(js_interface::ON_SUBMIT_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set onsubmit(p:Object):void{
			this.internalSet(js_interface::ON_SUBMIT_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return Object 
		*/
		public function get target():Object{
			return this.internalGet(js_interface::TARGET_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set target(p:Object):void{
			this.internalSet(js_interface::TARGET_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get action():String{
			return this.internalGet(js_interface::ACTION_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set action(p:String):void{
			this.internalSet(js_interface::ACTION_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get encoding():String{
			return this.internalGet(js_interface::ENCODING_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set encoding(p:String):void{
			this.internalSet(js_interface::ENCODING_PROPERTY, p);
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
		* @public (getter) 
		* @return String 
		*/
		public function get method():String{
			return this.internalGet(js_interface::METHOD_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set method(p:String):void{
			this.internalSet(js_interface::METHOD_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get name():String{
			return this.internalGet(js_interface::NAME_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set name(p:String):void{
			this.internalSet(js_interface::NAME_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @return void 
		*/
		public function reset():void{
			this.internalCall(js_interface::RESET_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @return void 
		*/
		public function submit():void{
			this.internalCall(js_interface::SUBMIT_METHOD, arguments);
		}
	}
}