package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Element.html">Element</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSElement extends JSNode{
		static public const CLASS_NAME:String = 'Element';
		static js_interface const TAG_NAME_PROPERTY:String = 'tagName';
		static js_interface const GET_ATTRIBUTE_METHOD:String = 'getAttribute';
		static js_interface const GET_ATTRIBUTE_NODE_METHOD:String = 'getAttributeNode';
		static js_interface const GET_ATTRIBUTE_NODE_NS_METHOD:String = 'getAttributeNodeNS';
		static js_interface const GET_ATTRIBUTE_NS_METHOD:String = 'getAttributeNS';
		static js_interface const GET_ELEMENTS_BY_TAG_NAME_METHOD:String = 'getElementsByTagName';
		static js_interface const GET_ELEMENTS_BY_TAG_NAME_NS_METHOD:String = 'getElementsByTagNameNS';
		static js_interface const HAS_ATTRIBUTE_METHOD:String = 'hasAttribute';
		static js_interface const HAS_ATTRIBUTE_NS_METHOD:String = 'hasAttributeNS';
		static js_interface const REMOVE_ATTRIBUTE_METHOD:String = 'removeAttribute';
		static js_interface const REMOVE_ATTRIBUTE_NODE_METHOD:String = 'removeAttributeNode';
		static js_interface const REMOVE_ATTRIBUTE_NS_METHOD:String = 'removeAttributeNS';
		static js_interface const SET_ATTRIBUTE_METHOD:String = 'setAttribute';
		static js_interface const SET_ATTRIBUTE_NODE_METHOD:String = 'setAttributeNode';
		static js_interface const SET_ATTRIBUTE_NODE_NS_METHOD:String = 'setAttributeNodeNS';
		static js_interface const SET_ATTRIBUTE_NS_METHOD:String = 'setAttributeNS';
		public function JSElement(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get tagName():String{
			return this.internalGet(js_interface::TAG_NAME_PROPERTY);
		}
		public function set tagName(p:String):void{
			this.internalSet(js_interface::TAG_NAME_PROPERTY, p);
		}
		public function getAttribute(name:String):String{
			return this.internalCall(js_interface::GET_ATTRIBUTE_METHOD, arguments);
		}
		public function getAttributeNode(name:String):JSNode/*JSAttr*/{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NODE_METHOD, arguments);
		}
		public function getAttributeNodeNS(namespaceURI:String, localName:String):JSAttr{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NODE_NS_METHOD, arguments);
		}
		public function getAttributeNS(namespaceURI:String, localName:String):String{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NS_METHOD, arguments);
		}
		public function getElementsByTagName(name:String):JSArray/*JSNodeList*/{
			var ret:JSArray = this.internalCall(js_interface::GET_ELEMENTS_BY_TAG_NAME_METHOD, arguments);
			if(ret) ret.js_interface::itemType = JSElement;
			return ret;
		}
		public function getElementsByTagNameNS(namespaceURI:String, localName:String):JSArray/*JSNodeList*/{
			var ret:JSArray = this.internalCall(js_interface::GET_ELEMENTS_BY_TAG_NAME_NS_METHOD, arguments);
			if(ret) ret.js_interface::itemType = JSElement;
			return ret;
		}
		public function hasAttribute(name:String):Boolean{
			return this.internalCall(js_interface::HAS_ATTRIBUTE_METHOD, arguments);
		}
		public function hasAttributeNS(namespaceURI:String, localName:String):Boolean{
			return this.internalCall(js_interface::HAS_ATTRIBUTE_NS_METHOD, arguments);
		}
		public function removeAttribute(name:String):void{
			this.internalCall(js_interface::REMOVE_ATTRIBUTE_METHOD, arguments);
		}
		public function removeAttributeNode(oldAttr:JSAttr):JSAttr{
			return this.internalCall(js_interface::REMOVE_ATTRIBUTE_NODE_METHOD, arguments);
		}
		public function removeAttributeNS():void{
			this.internalCall(js_interface::REMOVE_ATTRIBUTE_NS_METHOD, arguments);
		}
		public function setAttribute(name:String, value:String):void{
			this.internalCall(js_interface::SET_ATTRIBUTE_METHOD, arguments);
		}
		public function setAttributeNode(newAttr:JSAttr):JSAttr{
			return this.internalCall(js_interface::SET_ATTRIBUTE_NODE_METHOD, arguments);
		}
		public function setAttributeNodeNS(newAttr:JSAttr):JSAttr{
			return this.internalCall(js_interface::SET_ATTRIBUTE_NODE_NS_METHOD, arguments);
		}
		public function setAttributeNS(namespaceURI:String, qualifiedName:String, value:String):void{
			this.internalCall(js_interface::SET_ATTRIBUTE_NS_METHOD, arguments);
		}
		static public function create(...args:Array):JSElement{
			return new JSElement(CLASS_NAME, args);
		}
	}
}