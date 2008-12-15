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
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'CSSRule';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const CSS_TEXT_PROPERTY:String = 'cssText';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const PARENT_RULE_PROPERTY:String = 'parentRule';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const PARENT_STYLE_SHEET_PROPERTY:String = 'parentStyleSheet';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const TYPE_PROPERTY:String = 'type';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSCSSRule(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get cssText():String{
			return this.internalGet(js_interface::CSS_TEXT_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set cssText(p:String):void{
			this.internalSet(js_interface::CSS_TEXT_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return JSCSSRule 
		* @see aw.external.jsinterface.objects.JSCSSRule 
		*/
		public function get parentRule():JSCSSRule{
			return this.internalGet(js_interface::PARENT_RULE_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSCSSRule 
		*/
		public function set parentRule(p:JSCSSRule):void{
			this.internalSet(js_interface::PARENT_RULE_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return JSCSSStyleSheet 
		* @see aw.external.jsinterface.objects.JSCSSStyleSheet 
		*/
		public function get parentStyleSheet():JSCSSStyleSheet{
			return this.internalGet(js_interface::PARENT_STYLE_SHEET_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSCSSStyleSheet 
		*/
		public function set parentStyleSheet(p:JSCSSStyleSheet):void{
			this.internalSet(js_interface::PARENT_STYLE_SHEET_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return Number 
		*/
		public function get type():Number{
			return this.internalGet(js_interface::TYPE_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set type(p:Number):void{
			this.internalSet(js_interface::TYPE_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSCSSRule 
		* @see aw.external.jsinterface.objects.JSCSSRule 
		*/
		static public function create(...args:Array):JSCSSRule{
			return new JSCSSRule(CLASS_NAME, args);
		}
	}
}