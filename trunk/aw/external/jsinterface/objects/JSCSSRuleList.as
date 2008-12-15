package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/CSSRuleList.html">CSSRuleList</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSCSSRuleList extends JSDynamic{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'CSSRuleList';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const LENGTH_PROPERTY:String = 'length';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ITEM_METHOD:String = 'item';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSCSSRuleList(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public (getter) 
		* @return int 
		*/
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param index 
		* @return JSCSSRule 
		* @see aw.external.jsinterface.objects.JSCSSRule 
		*/
		public function item(index:int):JSCSSRule{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSCSSRuleList 
		* @see aw.external.jsinterface.objects.JSCSSRuleList 
		*/
		static public function create(...args:Array):JSCSSRuleList{
			return new JSCSSRuleList(CLASS_NAME, args);
		}
	}
}