package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Image.html">Image</a>.
	 * Class ported by documentation <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSImage extends JSHTMLElement{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'Image';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const ON_ABORT_PROPERTY:String = 'onabort';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const ON_ERROR_PROPERTY:String = 'onerror';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const ON_LOAD_PROPERTY:String = 'onload';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const BORDER_PROPERTY:String = 'border';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const COMPLETE_PROPERTY:String = 'complete';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const HEIGHT_PROPERTY:String = 'height';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const HSPACE_PROPERTY:String = 'hspace';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const LOWSRC_PROPERTY:String = 'lowsrc';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const NAME_PROPERTY:String = 'name';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SRC_PROPERTY:String = 'src';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const VSPACE_PROPERTY:String = 'vspace';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const WIDTH_PROPERTY:String = 'width';

		/** 
		* 
		* 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSImage(...args:Array):void{
			if(!args.length || args[0]!==JSDynamic.DO_NOT_CREATE_OBJECT){
				super(CLASS_NAME, args);
			}else init();
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return Function 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get onabort():Function{
			return this.internalGet(js_interface::ON_ABORT_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set onabort(p:Function):void{
			this.internalSet(js_interface::ON_ABORT_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return Function 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get onerror():Function{
			return this.internalGet(js_interface::ON_ERROR_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set onerror(p:Function):void{
			this.internalSet(js_interface::ON_ERROR_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return Function 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get onload():Function{
			return this.internalGet(js_interface::ON_LOAD_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set onload(p:Function):void{
			this.internalSet(js_interface::ON_LOAD_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get border():int{
			return this.internalGet(js_interface::BORDER_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set border(p:int):void{
			this.internalSet(js_interface::BORDER_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get complete():Boolean{
			return this.internalGet(js_interface::COMPLETE_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set complete(p:Boolean):void{
			this.internalSet(js_interface::COMPLETE_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get height():int{
			return this.internalGet(js_interface::HEIGHT_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set height(p:int):void{
			this.internalSet(js_interface::HEIGHT_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get hspace():int{
			return this.internalGet(js_interface::HSPACE_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set hspace(p:int):void{
			this.internalSet(js_interface::HSPACE_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get lowsrc():String{
			return this.internalGet(js_interface::LOWSRC_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set lowsrc(p:String):void{
			this.internalSet(js_interface::LOWSRC_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get name():String{
			return this.internalGet(js_interface::NAME_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set name(p:String):void{
			this.internalSet(js_interface::NAME_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get src():String{
			return this.internalGet(js_interface::SRC_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set src(p:String):void{
			this.internalSet(js_interface::SRC_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get vspace():int{
			return this.internalGet(js_interface::VSPACE_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set vspace(p:int):void{
			this.internalSet(js_interface::VSPACE_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get width():int{
			return this.internalGet(js_interface::WIDTH_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set width(p:int):void{
			this.internalSet(js_interface::WIDTH_PROPERTY, p);
		}
	}
}