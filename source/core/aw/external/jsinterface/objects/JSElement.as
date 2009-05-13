package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Element.html">Element</a>.
	 * Class ported by documentation <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSElement extends JSNode{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'Element';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const TAG_NAME_PROPERTY:String = 'tagName';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_ATTRIBUTE_METHOD:String = 'getAttribute';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_ATTRIBUTE_NODE_METHOD:String = 'getAttributeNode';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_ATTRIBUTE_NODE_NS_METHOD:String = 'getAttributeNodeNS';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_ATTRIBUTE_NS_METHOD:String = 'getAttributeNS';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_ELEMENTS_BY_TAG_NAME_METHOD:String = 'getElementsByTagName';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_ELEMENTS_BY_TAG_NAME_NS_METHOD:String = 'getElementsByTagNameNS';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const HAS_ATTRIBUTE_METHOD:String = 'hasAttribute';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const HAS_ATTRIBUTE_NS_METHOD:String = 'hasAttributeNS';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const REMOVE_ATTRIBUTE_METHOD:String = 'removeAttribute';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const REMOVE_ATTRIBUTE_NODE_METHOD:String = 'removeAttributeNode';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const REMOVE_ATTRIBUTE_NS_METHOD:String = 'removeAttributeNS';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_ATTRIBUTE_METHOD:String = 'setAttribute';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_ATTRIBUTE_NODE_METHOD:String = 'setAttributeNode';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_ATTRIBUTE_NODE_NS_METHOD:String = 'setAttributeNodeNS';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_ATTRIBUTE_NS_METHOD:String = 'setAttributeNS';

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
		public function JSElement(...args:Array):void{
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
		public function get tagName():String{
			return this.internalGet(js_interface::TAG_NAME_PROPERTY);
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
		public function set tagName(p:String):void{
			this.internalSet(js_interface::TAG_NAME_PROPERTY, p);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getAttribute(name:String):String{
			return this.internalCall(js_interface::GET_ATTRIBUTE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getAttributeNode(name:String):JSNode/*JSAttr*/{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NODE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getAttributeNodeNS(namespaceURI:String, localName:String):JSAttr{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NODE_NS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getAttributeNS(namespaceURI:String, localName:String):String{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getElementsByTagName(name:String):JSArray/*JSNodeList*/{

			/** 
			* 
			* 
			* 
			* @public 
			* @see aw.external.jsinterface.objects.JSArray 
			* @langversion ActionScript 3.0 
			* @playerversion Flash 9.0.28.0 
			*/
			var ret:JSArray = this.internalCall(js_interface::GET_ELEMENTS_BY_TAG_NAME_METHOD, arguments);
			if(ret) ret.js_interface::itemType = JSElement;
			return ret;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getElementsByTagNameNS(namespaceURI:String, localName:String):JSArray/*JSNodeList*/{

			/** 
			* 
			* 
			* 
			* @public 
			* @see aw.external.jsinterface.objects.JSArray 
			* @langversion ActionScript 3.0 
			* @playerversion Flash 9.0.28.0 
			*/
			var ret:JSArray = this.internalCall(js_interface::GET_ELEMENTS_BY_TAG_NAME_NS_METHOD, arguments);
			if(ret) ret.js_interface::itemType = JSElement;
			return ret;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function hasAttribute(name:String):Boolean{
			return this.internalCall(js_interface::HAS_ATTRIBUTE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function hasAttributeNS(namespaceURI:String, localName:String):Boolean{
			return this.internalCall(js_interface::HAS_ATTRIBUTE_NS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function removeAttribute(name:String):void{
			this.internalCall(js_interface::REMOVE_ATTRIBUTE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param oldAttr 
		* @return JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function removeAttributeNode(oldAttr:JSAttr):JSAttr{
			return this.internalCall(js_interface::REMOVE_ATTRIBUTE_NODE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function removeAttributeNS():void{
			this.internalCall(js_interface::REMOVE_ATTRIBUTE_NS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @param value 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setAttribute(name:String, value:String):void{
			this.internalCall(js_interface::SET_ATTRIBUTE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param newAttr 
		* @return JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setAttributeNode(newAttr:JSAttr):JSAttr{
			return this.internalCall(js_interface::SET_ATTRIBUTE_NODE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param newAttr 
		* @return JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setAttributeNodeNS(newAttr:JSAttr):JSAttr{
			return this.internalCall(js_interface::SET_ATTRIBUTE_NODE_NS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param namespaceURI 
		* @param qualifiedName 
		* @param value 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setAttributeNS(namespaceURI:String, qualifiedName:String, value:String):void{
			this.internalCall(js_interface::SET_ATTRIBUTE_NS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return JSElement 
		* @see aw.external.jsinterface.objects.JSElement 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(...args:Array):JSElement{
			return new JSElement(CLASS_NAME, args);
		}
	}
}