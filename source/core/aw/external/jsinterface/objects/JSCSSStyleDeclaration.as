package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/CSSStyleDeclaration.html">CSSStyleDeclaration</a>.
	 * Class ported by documentation <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSCSSStyleDeclaration extends JSDynamic{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'CSSStyleDeclaration';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const CSS_TEXT_PROPERTY:String = 'cssText';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const LENGTH_PROPERTY:String = 'length';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const PARENT_RULE_PROPERTY:String = 'parentRule';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_PROPERTY_CSSVALUE_METHOD:String = 'getPropertyCSSValue';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_PROPERTY_PRIORITY_METHOD:String = 'getPropertyPriority';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_PROPERTY_VALUE_METHOD:String = 'getPropertyValue';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const ITEM_METHOD:String = 'item';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const REMOVE_PROPERTY_METHOD:String = 'removeProperty';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_PROPERTY_METHOD:String = 'setProperty';

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
		public function JSCSSStyleDeclaration(...args:Array):void{
			if(!args.length || args[0]!==JSDynamic.DO_NOT_CREATE_OBJECT){
				super(CLASS_NAME, args);
			}else init();
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get cssText():String{
			return this.internalGet(js_interface::CSS_TEXT_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set cssText(p:String):void{
			this.internalSet(js_interface::CSS_TEXT_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}

		/** 
		* 
		* 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
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
		public function get parentRule():JSCSSRule{
			return this.internalGet(js_interface::PARENT_RULE_PROPERTY);
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
		public function set parentRule(p:JSCSSRule):void{
			this.internalSet(js_interface::PARENT_RULE_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param propertyName 
		* @return JSCSSValue 
		* @see aw.external.jsinterface.objects.JSCSSValue 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getPropertyCSSValue(propertyName:String):JSCSSValue{
			return this.internalCall(js_interface::GET_PROPERTY_CSSVALUE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param propertyName 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getPropertyPriority(propertyName:String):String{
			return this.internalCall(js_interface::GET_PROPERTY_PRIORITY_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param propertyName 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getPropertyValue(propertyName:String):String{
			return this.internalCall(js_interface::GET_PROPERTY_VALUE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param index 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function item(index:int):String{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param propertyName 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function removeProperty(propertyName:String):String{
			return this.internalCall(js_interface::REMOVE_PROPERTY_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param propertyName 
		* @param value 
		* @param priority 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setProperty(propertyName:String, value:String, priority:String):void{
			this.internalCall(js_interface::SET_PROPERTY_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return JSCSSStyleDeclaration 
		* @see aw.external.jsinterface.objects.JSCSSStyleDeclaration 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(...args:Array):JSCSSStyleDeclaration{
			return new JSCSSStyleDeclaration(CLASS_NAME, args);
		}
	}
}