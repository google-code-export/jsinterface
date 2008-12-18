package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/CSSValue.html">CSSValue</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSCSSValue extends JSDynamic{
		static public const CLASS_NAME:String = 'CSSValue';
		static js_interface const CSS_TEXT_PROPERTY:String = 'cssText';
		static js_interface const CSS_VALUE_TYPE_PROPERTY:String = 'cssValueType';
		public function JSCSSValue(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get cssText():String{
			return this.internalGet(js_interface::CSS_TEXT_PROPERTY);
		}
		public function set cssText(p:String):void{
			this.internalSet(js_interface::CSS_TEXT_PROPERTY, p);
		}
		public function get cssValueType():Number{
			return this.internalGet(js_interface::CSS_VALUE_TYPE_PROPERTY);
		}
		public function set cssValueType(p:Number):void{
			this.internalSet(js_interface::CSS_VALUE_TYPE_PROPERTY, p);
		}
		static public function create(...args:Array):JSCSSValue{
			return new JSCSSValue(CLASS_NAME, args);
		}
	}
}