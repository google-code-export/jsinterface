package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Image.html">Image</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSImage extends JSHTMLElement{
		static public const CLASS_NAME:String = 'Image';
		static js_interface const ON_ABORT_PROPERTY:String = 'onabort';
		static js_interface const ON_ERROR_PROPERTY:String = 'onerror';
		static js_interface const ON_LOAD_PROPERTY:String = 'onload';
		static js_interface const BORDER_PROPERTY:String = 'border';
		static js_interface const COMPLETE_PROPERTY:String = 'complete';
		static js_interface const HEIGHT_PROPERTY:String = 'height';
		static js_interface const HSPACE_PROPERTY:String = 'hspace';
		static js_interface const LOWSRC_PROPERTY:String = 'lowsrc';
		static js_interface const NAME_PROPERTY:String = 'name';
		static js_interface const SRC_PROPERTY:String = 'src';
		static js_interface const VSPACE_PROPERTY:String = 'vspace';
		static js_interface const WIDTH_PROPERTY:String = 'width';
		public function JSImage(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get onabort():Function{
			return this.internalGet(js_interface::ON_ABORT_PROPERTY);
		}
		public function set onabort(p:Function):void{
			this.internalSet(js_interface::ON_ABORT_PROPERTY, p);
		}
		public function get onerror():Function{
			return this.internalGet(js_interface::ON_ERROR_PROPERTY);
		}
		public function set onerror(p:Function):void{
			this.internalSet(js_interface::ON_ERROR_PROPERTY, p);
		}
		public function get onload():Function{
			return this.internalGet(js_interface::ON_LOAD_PROPERTY);
		}
		public function set onload(p:Function):void{
			this.internalSet(js_interface::ON_LOAD_PROPERTY, p);
		}
		public function get border():int{
			return this.internalGet(js_interface::BORDER_PROPERTY);
		}
		public function set border(p:int):void{
			this.internalSet(js_interface::BORDER_PROPERTY, p);
		}
		public function get complete():Boolean{
			return this.internalGet(js_interface::COMPLETE_PROPERTY);
		}
		public function set complete(p:Boolean):void{
			this.internalSet(js_interface::COMPLETE_PROPERTY, p);
		}
		public function get height():int{
			return this.internalGet(js_interface::HEIGHT_PROPERTY);
		}
		public function set height(p:int):void{
			this.internalSet(js_interface::HEIGHT_PROPERTY, p);
		}
		public function get hspace():int{
			return this.internalGet(js_interface::HSPACE_PROPERTY);
		}
		public function set hspace(p:int):void{
			this.internalSet(js_interface::HSPACE_PROPERTY, p);
		}
		public function get lowsrc():String{
			return this.internalGet(js_interface::LOWSRC_PROPERTY);
		}
		public function set lowsrc(p:String):void{
			this.internalSet(js_interface::LOWSRC_PROPERTY, p);
		}
		public function get name():String{
			return this.internalGet(js_interface::NAME_PROPERTY);
		}
		public function set name(p:String):void{
			this.internalSet(js_interface::NAME_PROPERTY, p);
		}
		public function get src():String{
			return this.internalGet(js_interface::SRC_PROPERTY);
		}
		public function set src(p:String):void{
			this.internalSet(js_interface::SRC_PROPERTY, p);
		}
		public function get vspace():int{
			return this.internalGet(js_interface::VSPACE_PROPERTY);
		}
		public function set vspace(p:int):void{
			this.internalSet(js_interface::VSPACE_PROPERTY, p);
		}
		public function get width():int{
			return this.internalGet(js_interface::WIDTH_PROPERTY);
		}
		public function set width(p:int):void{
			this.internalSet(js_interface::WIDTH_PROPERTY, p);
		}
	}
}