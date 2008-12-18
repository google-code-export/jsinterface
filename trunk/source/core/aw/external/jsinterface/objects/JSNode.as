package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Node.html">Node</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSNode extends JSDynamic{
		static public const CLASS_NAME:String = 'Node';
		static js_interface const ATTRIBUTES_PROPERTY:String = 'attributes';
		static js_interface const CHILD_NODES_PROPERTY:String = 'childNodes';
		static js_interface const FIRST_CHILD_PROPERTY:String = 'firstChild';
		static js_interface const LAST_CHILD_PROPERTY:String = 'lastChild';
		static js_interface const LOCAL_NAME_PROPERTY:String = 'localName';
		static js_interface const NAMESPACE_URI_PROPERTY:String = 'namespaceURI';
		static js_interface const NEXT_SIBLING_PROPERTY:String = 'nextSibling';
		static js_interface const NODE_NAME_PROPERTY:String = 'nodeName';
		static js_interface const NODE_TYPE_PROPERTY:String = 'nodeType';
		static js_interface const NODE_VALUE_PROPERTY:String = 'nodeValue';
		static js_interface const OWNER_DOCUMENT_PROPERTY:String = 'ownerDocument';
		static js_interface const PARENT_NODE_PROPERTY:String = 'parentNode';
		static js_interface const PREFIX_PROPERTY:String = 'prefix';
		static js_interface const PREVIUOS_SIBLING_PROPERTY:String = 'previousSibling';
		static js_interface const APPEND_CHILD_METHOD:String = 'appendChild';
		static js_interface const CLONE_NODE_METHOD:String = 'cloneNode';
		static js_interface const HAS_ATTRIBUTES_METHOD:String = 'hasAttributes';
		static js_interface const HAS_CHILD_NODES_METHOD:String = 'hasChildNodes';
		static js_interface const INSERT_BEFORE_METHOD:String = 'insertBefore';
		static js_interface const IS_SUPPORTED_METHOD:String = 'isSupported';
		static js_interface const NORMALIZE_METHOD:String = 'normalize';
		static js_interface const REMOVE_CHILD_METHOD:String = 'removeChild';
		static js_interface const REPLACE_CHILD_METHOD:String = 'replaceChild';
		public function JSNode(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get attributes():Object/*JSNamedNodeMap*/{
			return this.internalGet(js_interface::ATTRIBUTES_PROPERTY);
		}
		public function set attributes(p:Object/*JSNamedNodeMap*/):void{
			this.internalSet(js_interface::ATTRIBUTES_PROPERTY, p);
		}
		public function get childNodes():JSArray/*JSNodeList*/{
			var ret:JSArray = this.internalGet(js_interface::CHILD_NODES_PROPERTY);
			if(ret) ret.js_interface::itemType = JSNode;
			return ret;
		}
		public function set childNodes(p:JSArray/*JSNodeList*/):void{
			this.internalSet(js_interface::CHILD_NODES_PROPERTY, p);
		}
		public function get firstChild():Object/*JSNode*/{
			return this.internalGet(js_interface::FIRST_CHILD_PROPERTY);
		}
		public function set firstChild(p:Object/*JSNode*/):void{
			this.internalSet(js_interface::FIRST_CHILD_PROPERTY, p);
		}
		public function get lastChild():Object/*JSNode*/{
			return this.internalGet(js_interface::LAST_CHILD_PROPERTY);
		}
		public function set lastChild(p:Object/*JSNode*/):void{
			this.internalSet(js_interface::LAST_CHILD_PROPERTY, p);
		}
		public function get localName():String{
			return this.internalGet(js_interface::LOCAL_NAME_PROPERTY);
		}
		public function set localName(p:String):void{
			this.internalSet(js_interface::LOCAL_NAME_PROPERTY, p);
		}
		public function get namespaceURI():String{
			return this.internalGet(js_interface::NAMESPACE_URI_PROPERTY);
		}
		public function set namespaceURI(p:String):void{
			this.internalSet(js_interface::NAMESPACE_URI_PROPERTY, p);
		}
		public function get nextSibling():Object/*JSNode*/{
			return this.internalGet(js_interface::NEXT_SIBLING_PROPERTY);
		}
		public function set nextSibling(p:Object/*JSNode*/):void{
			this.internalSet(js_interface::NEXT_SIBLING_PROPERTY, p);
		}
		public function get nodeName():String{
			return this.internalGet(js_interface::NODE_NAME_PROPERTY);
		}
		public function set nodeName(p:String):void{
			this.internalSet(js_interface::NODE_NAME_PROPERTY, p);
		}
		public function get nodeType():Number{
			return this.internalGet(js_interface::NODE_TYPE_PROPERTY);
		}
		public function set nodeType(p:Number):void{
			this.internalSet(js_interface::NODE_TYPE_PROPERTY, p);
		}
		public function get nodeValue():String{
			return this.internalGet(js_interface::NODE_VALUE_PROPERTY);
		}
		public function set nodeValue(p:String):void{
			this.internalSet(js_interface::NODE_VALUE_PROPERTY, p);
		}
		public function get ownerDocument():Object/*JSDocument*/{
			return this.internalGet(js_interface::OWNER_DOCUMENT_PROPERTY);
		}
		public function set ownerDocument(p:Object/*JSDocument*/):void{
			this.internalSet(js_interface::OWNER_DOCUMENT_PROPERTY, p);
		}
		public function get parentNode():Object/*JSNode*/{
			return this.internalGet(js_interface::PARENT_NODE_PROPERTY);
		}
		public function set parentNode(p:Object/*JSNode*/):void{
			this.internalSet(js_interface::PARENT_NODE_PROPERTY, p);
		}
		public function get prefix():String{
			return this.internalGet(js_interface::PREFIX_PROPERTY);
		}
		public function set prefix(p:String):void{
			this.internalSet(js_interface::PREFIX_PROPERTY, p);
		}
		public function get previousSibling():Object/*JSNode*/{
			return this.internalGet(js_interface::PREVIUOS_SIBLING_PROPERTY);
		}
		public function set previousSibling(p:Object/*JSNode*/):void{
			this.internalSet(js_interface::PREVIUOS_SIBLING_PROPERTY, p);
		}
		public function appendChild(child:JSNode):JSNode{
			return this.internalCall(js_interface::APPEND_CHILD_METHOD, arguments);
		}
		public function cloneNode(deep:Boolean):JSNode{
			return this.internalCall(js_interface::CLONE_NODE_METHOD, arguments);
		}
		public function hasAttributes():Boolean{
			return this.internalCall(js_interface::HAS_ATTRIBUTES_METHOD, arguments);
		}
		public function hasChildNodes():Boolean{
			return this.internalCall(js_interface::HAS_CHILD_NODES_METHOD, arguments);
		}
		public function insertBefore(newChild:JSNode, refChild:JSNode):JSNode{
			return this.internalCall(js_interface::INSERT_BEFORE_METHOD, arguments);
		}
		public function isSupported(feature:String, version:String=''):Boolean{
			return this.internalCall(js_interface::IS_SUPPORTED_METHOD, arguments);
		}
		public function normalize():void{
			this.internalCall(js_interface::NORMALIZE_METHOD, arguments);
		}
		public function removeChild(oldChild:JSNode):JSNode{
			return this.internalCall(js_interface::REMOVE_CHILD_METHOD, arguments);
		}
		public function replaceChild(newChild:JSNode, oldChild:JSNode):JSNode{
			return this.internalCall(js_interface::REPLACE_CHILD_METHOD, arguments);
		}
		static public function create(...args:Array):JSNode{
			return new JSNode(CLASS_NAME, args);
		}
	}
}