package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/CSSRule.html">CSSRule</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSCSSRule extends JSDynamic{
		static public const CLASS_NAME:String = 'CSSRule';
		static js_interface const CSS_TEXT_PROPERTY:String = 'cssText';
		static js_interface const PARENT_RULE_PROPERTY:String = 'parentRule';
		static js_interface const PARENT_STYLE_SHEET_PROPERTY:String = 'parentStyleSheet';
		static js_interface const TYPE_PROPERTY:String = 'type';
		public function JSCSSRule(className:Object='', args:*=null):void{
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
		public function get parentRule():JSCSSRule{
			return this.internalGet(js_interface::PARENT_RULE_PROPERTY);
		}
		public function set parentRule(p:JSCSSRule):void{
			this.internalSet(js_interface::PARENT_RULE_PROPERTY, p);
		}
		public function get parentStyleSheet():JSCSSStyleSheet{
			return this.internalGet(js_interface::PARENT_STYLE_SHEET_PROPERTY);
		}
		public function set parentStyleSheet(p:JSCSSStyleSheet):void{
			this.internalSet(js_interface::PARENT_STYLE_SHEET_PROPERTY, p);
		}
		public function get type():Number{
			return this.internalGet(js_interface::TYPE_PROPERTY);
		}
		public function set type(p:Number):void{
			this.internalSet(js_interface::TYPE_PROPERTY, p);
		}
		static public function create(...args:Array):JSCSSRule{
			return new JSCSSRule(CLASS_NAME, args);
		}
	}
}