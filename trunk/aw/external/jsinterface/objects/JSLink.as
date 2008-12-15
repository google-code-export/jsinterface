package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Link.html">Link</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSLink extends JSHTMLElement{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Link';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const TARGET_PROPERTY:String = 'target';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const HREF_PROPERTY:String = 'href';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSLink(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
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
		public function get href():String{
			return this.internalGet(js_interface::HREF_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set href(p:String):void{
			this.internalSet(js_interface::HREF_PROPERTY, p);
		}
	}
}