package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/NamedNodeMap.html">NamedNodeMap</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSNamedNodeMap extends JSDynamic{
		static public const CLASS_NAME:String = 'NamedNodeMap';
		static js_interface const LENGTH_PROPERTY:String = 'length';
		static js_interface const GET_NAMED_ITEM_METHOD:String = 'getNamedItem';
		static js_interface const GET_NAMED_ITEM_NS_METHOD:String = 'getNamedItemNS';
		static js_interface const ITEM_METHOD:String = 'item';
		static js_interface const REMOVE_NAMED_ITEM_METHOD:String = 'removeNamedItem';
		static js_interface const REMOVE_NAMED_ITEM_NS_METHOD:String = 'removeNamedItemNS';
		static js_interface const SET_NAMED_ITEM_METHOD:String = 'setNamedItem';
		static js_interface const SET_NAMED_ITEM_NS_METHOD:String = 'setNamedItemNS';
		public function JSNamedNodeMap(className:Object='', args:*=null):void{
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
		public function getNamedItem(name:String):JSNode{
			return this.internalCall(js_interface::GET_NAMED_ITEM_METHOD, arguments);
		}
		public function getNamedItemNS(namespaceURI:String, localName:String):JSNode{
			return this.internalCall(js_interface::GET_NAMED_ITEM_NS_METHOD, arguments);
		}
		public function item(index:int):JSNode{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
		}
		public function removeNamedItem(name:String):JSNode{
			return this.internalCall(js_interface::REMOVE_NAMED_ITEM_METHOD, arguments);
		}
		public function removeNamedItemNS(namespaceURI:String, localName:String):JSNode{
			return this.internalCall(js_interface::REMOVE_NAMED_ITEM_NS_METHOD, arguments);
		}
		public function setNamedItem(arg:JSNode):JSNode{
			return this.internalCall(js_interface::SET_NAMED_ITEM_METHOD, arguments);
		}
		public function setNamedItemNS(arg:JSNode):JSNode{
			return this.internalCall(js_interface::SET_NAMED_ITEM_NS_METHOD, arguments);
		}
		static public function create(...args:Array):JSNamedNodeMap{
			return new JSNamedNodeMap(CLASS_NAME, args);
		}
	}
}