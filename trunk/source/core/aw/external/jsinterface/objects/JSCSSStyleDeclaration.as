package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/CSSStyleDeclaration.html">CSSStyleDeclaration</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSCSSStyleDeclaration extends JSDynamic{
		static public const CLASS_NAME:String = 'CSSStyleDeclaration';
		static js_interface const CSS_TEXT_PROPERTY:String = 'cssText';
		static js_interface const LENGTH_PROPERTY:String = 'length';
		static js_interface const PARENT_RULE_PROPERTY:String = 'parentRule';
		static js_interface const GET_PROPERTY_CSSVALUE_METHOD:String = 'getPropertyCSSValue';
		static js_interface const GET_PROPERTY_PRIORITY_METHOD:String = 'getPropertyPriority';
		static js_interface const GET_PROPERTY_VALUE_METHOD:String = 'getPropertyValue';
		static js_interface const ITEM_METHOD:String = 'item';
		static js_interface const REMOVE_PROPERTY_METHOD:String = 'removeProperty';
		static js_interface const SET_PROPERTY_METHOD:String = 'setProperty';
		public function JSCSSStyleDeclaration(className:Object='', args:*=null):void{
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
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		public function get parentRule():JSCSSRule{
			return this.internalGet(js_interface::PARENT_RULE_PROPERTY);
		}
		public function set parentRule(p:JSCSSRule):void{
			this.internalSet(js_interface::PARENT_RULE_PROPERTY, p);
		}
		public function getPropertyCSSValue(propertyName:String):JSCSSValue{
			return this.internalCall(js_interface::GET_PROPERTY_CSSVALUE_METHOD, arguments);
		}
		public function getPropertyPriority(propertyName:String):String{
			return this.internalCall(js_interface::GET_PROPERTY_PRIORITY_METHOD, arguments);
		}
		public function getPropertyValue(propertyName:String):String{
			return this.internalCall(js_interface::GET_PROPERTY_VALUE_METHOD, arguments);
		}
		public function item(index:int):String{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
		}
		public function removeProperty(propertyName:String):String{
			return this.internalCall(js_interface::REMOVE_PROPERTY_METHOD, arguments);
		}
		public function setProperty(propertyName:String, value:String, priority:String):void{
			this.internalCall(js_interface::SET_PROPERTY_METHOD, arguments);
		}
		static public function create(...args:Array):JSCSSStyleDeclaration{
			return new JSCSSStyleDeclaration(CLASS_NAME, args);
		}
	}
}