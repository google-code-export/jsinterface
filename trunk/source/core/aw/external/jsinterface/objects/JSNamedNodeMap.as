package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/NamedNodeMap.html">NamedNodeMap</a>.
	 * Class ported by documentation <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSNamedNodeMap extends JSDynamic{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'NamedNodeMap';

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
		static js_interface const GET_NAMED_ITEM_METHOD:String = 'getNamedItem';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_NAMED_ITEM_NS_METHOD:String = 'getNamedItemNS';

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
		static js_interface const REMOVE_NAMED_ITEM_METHOD:String = 'removeNamedItem';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const REMOVE_NAMED_ITEM_NS_METHOD:String = 'removeNamedItemNS';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_NAMED_ITEM_METHOD:String = 'setNamedItem';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_NAMED_ITEM_NS_METHOD:String = 'setNamedItemNS';

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
		public function JSNamedNodeMap(...args:Array):void{
			if(!args.length || args[0]!==JSDynamic.DO_NOT_CREATE_OBJECT){
				super(CLASS_NAME, args);
			}else init();
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
		* @public 
		* @param name 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getNamedItem(name:String):JSNode{
			return this.internalCall(js_interface::GET_NAMED_ITEM_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getNamedItemNS(namespaceURI:String, localName:String):JSNode{
			return this.internalCall(js_interface::GET_NAMED_ITEM_NS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param index 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function item(index:int):JSNode{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
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
		public function removeNamedItem(name:String):JSNode{
			return this.internalCall(js_interface::REMOVE_NAMED_ITEM_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param namespaceURI 
		* @param localName 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function removeNamedItemNS(namespaceURI:String, localName:String):JSNode{
			return this.internalCall(js_interface::REMOVE_NAMED_ITEM_NS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param arg 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setNamedItem(arg:JSNode):JSNode{
			return this.internalCall(js_interface::SET_NAMED_ITEM_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param arg 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setNamedItemNS(arg:JSNode):JSNode{
			return this.internalCall(js_interface::SET_NAMED_ITEM_NS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return JSNamedNodeMap 
		* @see aw.external.jsinterface.objects.JSNamedNodeMap 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(...args:Array):JSNamedNodeMap{
			return new JSNamedNodeMap(CLASS_NAME, args);
		}
	}
}