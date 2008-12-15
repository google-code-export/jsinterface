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
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'CSSStyleSheet';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const CSS_RULES_PROPERTY:String = 'cssRules';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const OWNER_RULE_PROPERTY:String = 'ownerRule';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const DELETE_RULE_METHOD:String = 'deleteRule';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const INSERT_RULE_METHOD:String = 'insertRule';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSCSSStyleSheet(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public (getter) 
		* @return JSCSSRuleList 
		* @see aw.external.jsinterface.objects.JSCSSRuleList 
		*/
		public function get cssRules():JSCSSRuleList{
			return this.internalGet(js_interface::CSS_RULES_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSCSSRuleList 
		*/
		public function set cssRules(p:JSCSSRuleList):void{
			this.internalSet(js_interface::CSS_RULES_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return JSCSSRule 
		* @see aw.external.jsinterface.objects.JSCSSRule 
		*/
		public function get ownerRule():JSCSSRule{
			return this.internalGet(js_interface::OWNER_RULE_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSCSSRule 
		*/
		public function set ownerRule(p:JSCSSRule):void{
			this.internalSet(js_interface::OWNER_RULE_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param index 
		* @return void 
		*/
		public function deleteRule(index:int):void{
			this.internalCall(js_interface::DELETE_RULE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param rule 
		* @param index 
		* @return Object 
		*/
		public function insertRule(rule:String, index:Number):Object{
			return this.internalCall(js_interface::INSERT_RULE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSCSSStyleSheet 
		* @see aw.external.jsinterface.objects.JSCSSStyleSheet 
		*/
		static public function create(...args:Array):JSCSSStyleSheet{
			return new JSCSSStyleSheet(CLASS_NAME, args);
		}
	}
}