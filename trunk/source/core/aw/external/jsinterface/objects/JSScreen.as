package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Screen.html">Screen</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSScreen extends JSDynamic{
		static public const CLASS_NAME:String = 'Screen';
		static js_interface const AVAIL_HEIGHT_PROPERTY:String = 'availHeight';
		static js_interface const AVAIL_LEFT_PROPERTY:String = 'availLeft';
		static js_interface const AVAIL_TOP_PROPERTY:String = 'availTop';
		static js_interface const AVAIL_WIDTH_PROPERTY:String = 'availWidth';
		static js_interface const COLOR_DEPTH_PROPERTY:String = 'colorDepth';
		static js_interface const HEIGHT_PROPERTY:String = 'height';
		static js_interface const PIXEL_DEPTH_PROPERTY:String = 'pixelDepth';
		static js_interface const WIDTH_PROPERTY:String = 'width';
		public function JSScreen(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get availHeight():Object{
			return this.internalGet(js_interface::AVAIL_HEIGHT_PROPERTY);
		}
		public function set availHeight(p:Object):void{
			this.internalSet(js_interface::AVAIL_HEIGHT_PROPERTY, p);
		}
		public function get availLeft():Object{
			return this.internalGet(js_interface::AVAIL_LEFT_PROPERTY);
		}
		public function set availLeft(p:Object):void{
			this.internalSet(js_interface::AVAIL_LEFT_PROPERTY, p);
		}
		public function get availTop():Object{
			return this.internalGet(js_interface::AVAIL_TOP_PROPERTY);
		}
		public function set availTop(p:Object):void{
			this.internalSet(js_interface::AVAIL_TOP_PROPERTY, p);
		}
		public function get availWidth():Object{
			return this.internalGet(js_interface::AVAIL_WIDTH_PROPERTY);
		}
		public function set availWidth(p:Object):void{
			this.internalSet(js_interface::AVAIL_WIDTH_PROPERTY, p);
		}
		public function get colorDepth():int{
			return this.internalGet(js_interface::COLOR_DEPTH_PROPERTY);
		}
		public function set colorDepth(p:int):void{
			this.internalSet(js_interface::COLOR_DEPTH_PROPERTY, p);
		}
		public function get height():Object{
			return this.internalGet(js_interface::HEIGHT_PROPERTY);
		}
		public function set height(p:Object):void{
			this.internalSet(js_interface::HEIGHT_PROPERTY, p);
		}
		public function get pixelDepth():Object{
			return this.internalGet(js_interface::PIXEL_DEPTH_PROPERTY);
		}
		public function set pixelDepth(p:Object):void{
			this.internalSet(js_interface::PIXEL_DEPTH_PROPERTY, p);
		}
		public function get width():Object{
			return this.internalGet(js_interface::WIDTH_PROPERTY);
		}
		public function set width(p:Object):void{
			this.internalSet(js_interface::WIDTH_PROPERTY, p);
		}
		static public function create(...args:Array):JSScreen{
			return new JSScreen(CLASS_NAME, args);
		}
	}
}