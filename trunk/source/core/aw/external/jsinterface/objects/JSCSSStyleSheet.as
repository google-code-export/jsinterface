package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/CSSStyleSheet.html">CSSStyleSheet</a>.
	 * Class ported by documentation <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSCSSStyleSheet extends JSStyleSheet{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'CSSStyleSheet';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const CSS_RULES_PROPERTY:String = 'cssRules';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const OWNER_RULE_PROPERTY:String = 'ownerRule';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const DELETE_RULE_METHOD:String = 'deleteRule';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const INSERT_RULE_METHOD:String = 'insertRule';

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
		public function JSCSSStyleSheet(...args:Array):void{
			if(!args.length || args[0]!==JSDynamic.DO_NOT_CREATE_OBJECT){
				super(CLASS_NAME, args);
			}else init();
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return JSCSSRuleList 
		* @see aw.external.jsinterface.objects.JSCSSRuleList 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get cssRules():JSCSSRuleList{
			return this.internalGet(js_interface::CSS_RULES_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSCSSRuleList 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set cssRules(p:JSCSSRuleList):void{
			this.internalSet(js_interface::CSS_RULES_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return JSCSSRule 
		* @see aw.external.jsinterface.objects.JSCSSRule 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get ownerRule():JSCSSRule{
			return this.internalGet(js_interface::OWNER_RULE_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSCSSRule 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set ownerRule(p:JSCSSRule):void{
			this.internalSet(js_interface::OWNER_RULE_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param index 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function deleteRule(index:int):void{
			this.internalCall(js_interface::DELETE_RULE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param rule 
		* @param index 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function insertRule(rule:String, index:Number):Object{
			return this.internalCall(js_interface::INSERT_RULE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return JSCSSStyleSheet 
		* @see aw.external.jsinterface.objects.JSCSSStyleSheet 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(...args:Array):JSCSSStyleSheet{
			return new JSCSSStyleSheet(CLASS_NAME, args);
		}
	}
}