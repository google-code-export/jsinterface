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
		static public const CLASS_NAME:String = 'CSSRuleList';
		static js_interface const LENGTH_PROPERTY:String = 'length';
		static js_interface const ITEM_METHOD:String = 'item';
		public function JSCSSRuleList(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		public function item(index:int):JSCSSRule{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
		}
		static public function create(...args:Array):JSCSSRuleList{
			return new JSCSSRuleList(CLASS_NAME, args);
		}
	}
}