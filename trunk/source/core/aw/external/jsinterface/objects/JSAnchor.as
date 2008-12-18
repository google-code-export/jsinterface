package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Anchor.html">Anchor</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSAnchor extends JSHTMLElement{
		static public const CLASS_NAME:String = 'Anchor';
		static js_interface const NAME_PROPERTY:String = 'name';
		static js_interface const TEXT_PROPERTY:String = 'text';
		public function JSAnchor(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get name():String{
			return this.internalGet(js_interface::NAME_PROPERTY);
		}
		public function set name(p:String):void{
			this.internalSet(js_interface::NAME_PROPERTY, p);
		}
		public function get text():String{
			return this.internalGet(js_interface::TEXT_PROPERTY);
		}
		public function set text(p:String):void{
			this.internalSet(js_interface::TEXT_PROPERTY, p);
		}
	}
}