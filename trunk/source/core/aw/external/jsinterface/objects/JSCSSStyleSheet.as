package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/CSSStyleSheet.html">CSSStyleSheet</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSCSSStyleSheet extends JSStyleSheet{
		static public const CLASS_NAME:String = 'CSSStyleSheet';
		static js_interface const CSS_RULES_PROPERTY:String = 'cssRules';
		static js_interface const OWNER_RULE_PROPERTY:String = 'ownerRule';
		static js_interface const DELETE_RULE_METHOD:String = 'deleteRule';
		static js_interface const INSERT_RULE_METHOD:String = 'insertRule';
		public function JSCSSStyleSheet(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get cssRules():JSCSSRuleList{
			return this.internalGet(js_interface::CSS_RULES_PROPERTY);
		}
		public function set cssRules(p:JSCSSRuleList):void{
			this.internalSet(js_interface::CSS_RULES_PROPERTY, p);
		}
		public function get ownerRule():JSCSSRule{
			return this.internalGet(js_interface::OWNER_RULE_PROPERTY);
		}
		public function set ownerRule(p:JSCSSRule):void{
			this.internalSet(js_interface::OWNER_RULE_PROPERTY, p);
		}
		public function deleteRule(index:int):void{
			this.internalCall(js_interface::DELETE_RULE_METHOD, arguments);
		}
		public function insertRule(rule:String, index:Number):Object{
			return this.internalCall(js_interface::INSERT_RULE_METHOD, arguments);
		}
		static public function create(...args:Array):JSCSSStyleSheet{
			return new JSCSSStyleSheet(CLASS_NAME, args);
		}
	}
}