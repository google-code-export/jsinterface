package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Element.html">Element</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSElement extends JSNode{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Element';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const TAG_NAME_PROPERTY:String = 'tagName';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const GET_ATTRIBUTE_METHOD:String = 'getAttribute';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const GET_ATTRIBUTE_NODE_METHOD:String = 'getAttributeNode';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const GET_ATTRIBUTE_NODE_NS_METHOD:String = 'getAttributeNodeNS';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const GET_ATTRIBUTE_NS_METHOD:String = 'getAttributeNS';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const GET_ELEMENTS_BY_TAG_NAME_METHOD:String = 'getElementsByTagName';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const GET_ELEMENTS_BY_TAG_NAME_NS_METHOD:String = 'getElementsByTagNameNS';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const HAS_ATTRIBUTE_METHOD:String = 'hasAttribute';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const HAS_ATTRIBUTE_NS_METHOD:String = 'hasAttributeNS';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const REMOVE_ATTRIBUTE_METHOD:String = 'removeAttribute';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const REMOVE_ATTRIBUTE_NODE_METHOD:String = 'removeAttributeNode';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const REMOVE_ATTRIBUTE_NS_METHOD:String = 'removeAttributeNS';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SET_ATTRIBUTE_METHOD:String = 'setAttribute';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SET_ATTRIBUTE_NODE_METHOD:String = 'setAttributeNode';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SET_ATTRIBUTE_NODE_NS_METHOD:String = 'setAttributeNodeNS';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SET_ATTRIBUTE_NS_METHOD:String = 'setAttributeNS';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSElement(className:String='', args:*=null):void{
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
		public function get tagName():String{
			return this.internalGet(js_interface::TAG_NAME_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set tagName(p:String):void{
			this.internalSet(js_interface::TAG_NAME_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return String 
		*/
		public function getAttribute(name:String):String{
			return this.internalCall(js_interface::GET_ATTRIBUTE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		*/
		public function getAttributeNode(name:String):JSNode/*JSAttr*/{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NODE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		*/
		public function getAttributeNodeNS(namespaceURI:String, localName:String):JSAttr{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NODE_NS_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return String 
		*/
		public function getAttributeNS(namespaceURI:String, localName:String):String{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NS_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function getElementsByTagName(name:String):JSArray/*JSNodeList*/{
			var ret:JSArray = this.internalCall(js_interface::GET_ELEMENTS_BY_TAG_NAME_METHOD, arguments);
			if(ret) ret.js_interface::itemType = JSElement;
			return ret;
		}
		/** 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function getElementsByTagNameNS(namespaceURI:String, localName:String):JSArray/*JSNodeList*/{
			var ret:JSArray = this.internalCall(js_interface::GET_ELEMENTS_BY_TAG_NAME_NS_METHOD, arguments);
			if(ret) ret.js_interface::itemType = JSElement;
			return ret;
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return Boolean 
		*/
		public function hasAttribute(name:String):Boolean{
			return this.internalCall(js_interface::HAS_ATTRIBUTE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return Boolean 
		*/
		public function hasAttributeNS(namespaceURI:String, localName:String):Boolean{
			return this.internalCall(js_interface::HAS_ATTRIBUTE_NS_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return void 
		*/
		public function removeAttribute(name:String):void{
			this.internalCall(js_interface::REMOVE_ATTRIBUTE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param oldAttr 
		* @return JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		*/
		public function removeAttributeNode(oldAttr:JSAttr):JSAttr{
			return this.internalCall(js_interface::REMOVE_ATTRIBUTE_NODE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @return void 
		*/
		public function removeAttributeNS():void{
			this.internalCall(js_interface::REMOVE_ATTRIBUTE_NS_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param name 
		* @param value 
		* @return void 
		*/
		public function setAttribute(name:String, value:String):void{
			this.internalCall(js_interface::SET_ATTRIBUTE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param newAttr 
		* @return JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		*/
		public function setAttributeNode(newAttr:JSAttr):JSAttr{
			return this.internalCall(js_interface::SET_ATTRIBUTE_NODE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param newAttr 
		* @return JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		*/
		public function setAttributeNodeNS(newAttr:JSAttr):JSAttr{
			return this.internalCall(js_interface::SET_ATTRIBUTE_NODE_NS_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param namespaceURI 
		* @param qualifiedName 
		* @param value 
		* @return void 
		*/
		public function setAttributeNS(namespaceURI:String, qualifiedName:String, value:String):void{
			this.internalCall(js_interface::SET_ATTRIBUTE_NS_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSElement 
		* @see aw.external.jsinterface.objects.JSElement 
		*/
		static public function create(...args:Array):JSElement{
			return new JSElement(CLASS_NAME, args);
		}
	}
}