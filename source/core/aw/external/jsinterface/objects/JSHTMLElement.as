package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/HTMLElement.html">HTMLElement</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSHTMLElement extends JSElement{
		static public const CLASS_NAME:String = 'HTMLElement';
		static js_interface const ATTRIBUTES_PROPERTY:String = 'attributes';
		static js_interface const CHILD_NODES_PROPERTY:String = 'childNodes';
		static js_interface const CLASS_NAME_PROPERTY:String = 'className';
		static js_interface const CLIENT_HEIGHT_PROPERTY:String = 'clientHeight';
		static js_interface const CLIENT_WIDTH_PROPERTY:String = 'clientWidth';
		static js_interface const DIR_PROPERTY:String = 'dir';
		static js_interface const DISABLED_PROPERTY:String = 'disabled';
		static js_interface const FIRST_CHILD_PROPERTY:String = 'firstChild';
		static js_interface const ID_PROPERTY:String = 'id';
		static js_interface const INNER_HTML_PROPERTY:String = 'innerHTML';
		static js_interface const INNER_TEXT_PROPERTY:String = 'innerText';
		static js_interface const LANG_PROPERTY:String = 'lang';
		static js_interface const LAST_CHILD_PROPERTY:String = 'lastChild';
		static js_interface const NEXT_SIBLING_PROPERTY:String = 'nextSibling';
		static js_interface const OFFSET_HEIGHT_PROPERTY:String = 'offsetHeight';
		static js_interface const OFFSET_LEFT_PROPERTY:String = 'offsetLeft';
		static js_interface const OFFSET_PARENT_PROPERTY:String = 'offsetParent';
		static js_interface const OFFSET_TOP_PROPERTY:String = 'offsetTop';
		static js_interface const OFFSET_WIDTH_PROPERTY:String = 'offsetWidth';
		static js_interface const ON_BLUR_PROPERTY:String = 'onblur';
		static js_interface const ON_CLICK_PROPERTY:String = 'onclick';
		static js_interface const ON_DBLCLICK_PROPERTY:String = 'ondblclick';
		static js_interface const ON_FOCUS_PROPERTY:String = 'onfocus';
		static js_interface const ON_KEY_DOWN_PROPERTY:String = 'onkeydown';
		static js_interface const ON_KEY_PRESS_PROPERTY:String = 'onkeypress';
		static js_interface const ON_KEY_UP_PROPERTY:String = 'onkeyup';
		static js_interface const ON_MOUSE_DOWN_PROPERTY:String = 'onmousedown';
		static js_interface const ON_MOUSE_MOVE_PROPERTY:String = 'onmousemove';
		static js_interface const ON_MOUSE_OUT_PROPERTY:String = 'onmouseout';
		static js_interface const ON_MOUSE_OVER_PROPERTY:String = 'onmouseover';
		static js_interface const ON_MOUSE_UP_PROPERTY:String = 'onmouseup';
		static js_interface const OWNER_DOCUMENT_PROPERTY:String = 'ownerDocument';
		static js_interface const PARENT_NODE_PROPERTY:String = 'parentNode';
		static js_interface const PREVIOUS_SIBLING_PROPERTY:String = 'previousSibling';
		static js_interface const SCROLL_HEIGHT_PROPERTY:String = 'scrollHeight';
		static js_interface const SCROLL_LEFT_PROPERTY:String = 'scrollLeft';
		static js_interface const SCROLL_TOP_PROPERTY:String = 'scrollTop';
		static js_interface const SCROLL_WIDTH_PROPERTY:String = 'scrollWidth';
		static js_interface const STYLE_PROPERTY:String = 'style';
		static js_interface const TAB_INDEX_PROPERTY:String = 'tabIndex';
		static js_interface const TITLE_PROPERTY:String = 'title';
		static js_interface const ADD_EVENT_LISTENER_METHOD:String = 'addEventListener';
		static js_interface const APPEND_CHILD_METHOD:String = 'appendChild';
		static js_interface const BLUR_METHOD:String = 'blur';
		static js_interface const CLICK_METHOD:String = 'click';
		static js_interface const DISPATCH_EVENT_METHOD:String = 'dispatchEvent';
		static js_interface const FOCUS_METHOD:String = 'focus';
		static js_interface const GET_ATTRIBUTE_NODE_METHOD:String = 'getAttributeNode';
		static js_interface const GET_ELEMENTS_BY_TAG_NAME_METHOD:String = 'getElementsByTagName';
		static js_interface const REMOVE_EVENT_LISTENER_METHOD:String = 'removeEventListener';
		public function JSHTMLElement(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/*
		public function get attributes():JSArray{
			return this.internalGet(js_interface::ATTRIBUTES_PROPERTY);
		}
		public function set attributes(p:JSArray):void{
			this.internalSet(js_interface::ATTRIBUTES_PROPERTY, p);
		}
		public function get childNodes():JSArray{
			return this.internalGet(js_interface::CHILD_NODES_PROPERTY);
		}
		public function set childNodes(p:JSArray):void{
			this.internalSet(js_interface::CHILD_NODES_PROPERTY, p);
		}
		*/
		public function get className():String{
			return this.internalGet(js_interface::CLASS_NAME_PROPERTY);
		}
		public function set className(p:String):void{
			this.internalSet(js_interface::CLASS_NAME_PROPERTY, p);
		}
		public function get clientHeight():Number{
			return this.internalGet(js_interface::CLIENT_HEIGHT_PROPERTY);
		}
		public function set clientHeight(p:Number):void{
			this.internalSet(js_interface::CLIENT_HEIGHT_PROPERTY, p);
		}
		public function get clientWidth():Number{
			return this.internalGet(js_interface::CLIENT_WIDTH_PROPERTY);
		}
		public function set clientWidth(p:Number):void{
			this.internalSet(js_interface::CLIENT_WIDTH_PROPERTY, p);
		}
		public function get dir():String{
			return this.internalGet(js_interface::DIR_PROPERTY);
		}
		public function set dir(p:String):void{
			this.internalSet(js_interface::DIR_PROPERTY, p);
		}
		public function get disabled():Boolean{
			return this.internalGet(js_interface::DISABLED_PROPERTY);
		}
		public function set disabled(p:Boolean):void{
			this.internalSet(js_interface::DISABLED_PROPERTY, p);
		}
		/*
		public function get firstChild():Object{
			return this.internalGet(js_interface::FIRST_CHILD_PROPERTY);
		}
		public function set firstChild(p:Object):void{
			this.internalSet(js_interface::FIRST_CHILD_PROPERTY, p);
		}
		*/
		public function get id():String{
			return this.internalGet(js_interface::ID_PROPERTY);
		}
		public function set id(p:String):void{
			this.internalSet(js_interface::ID_PROPERTY, p);
		}
		public function get innerHTML():String{
			return this.internalGet(js_interface::INNER_HTML_PROPERTY);
		}
		public function set innerHTML(p:String):void{
			this.internalSet(js_interface::INNER_HTML_PROPERTY, p);
		}
		public function get innerText():String{
			return this.internalGet(js_interface::INNER_TEXT_PROPERTY);
		}
		public function set innerText(p:String):void{
			this.internalSet(js_interface::INNER_TEXT_PROPERTY, p);
		}
		public function get lang():String{
			return this.internalGet(js_interface::LANG_PROPERTY);
		}
		public function set lang(p:String):void{
			this.internalSet(js_interface::LANG_PROPERTY, p);
		}
		/*
		public function get lastChild():Object{
			return this.internalGet(js_interface::LAST_CHILD_PROPERTY);
		}
		public function set lastChild(p:Object):void{
			this.internalSet(js_interface::LAST_CHILD_PROPERTY, p);
		}
		public function get nextSibling():Object{
			return this.internalGet(js_interface::NEXT_SIBLING_PROPERTY);
		}
		public function set nextSibling(p:Object):void{
			this.internalSet(js_interface::NEXT_SIBLING_PROPERTY, p);
		}
		*/
		public function get offsetHeight():Number{
			return this.internalGet(js_interface::OFFSET_HEIGHT_PROPERTY);
		}
		public function set offsetHeight(p:Number):void{
			this.internalSet(js_interface::OFFSET_HEIGHT_PROPERTY, p);
		}
		public function get offsetLeft():Number{
			return this.internalGet(js_interface::OFFSET_LEFT_PROPERTY);
		}
		public function set offsetLeft(p:Number):void{
			this.internalSet(js_interface::OFFSET_LEFT_PROPERTY, p);
		}
		public function get offsetParent():Object{
			return this.internalGet(js_interface::OFFSET_PARENT_PROPERTY);
		}
		public function set offsetParent(p:Object):void{
			this.internalSet(js_interface::OFFSET_PARENT_PROPERTY, p);
		}
		public function get offsetTop():Number{
			return this.internalGet(js_interface::OFFSET_TOP_PROPERTY);
		}
		public function set offsetTop(p:Number):void{
			this.internalSet(js_interface::OFFSET_TOP_PROPERTY, p);
		}
		public function get offsetWidth():Number{
			return this.internalGet(js_interface::OFFSET_WIDTH_PROPERTY);
		}
		public function set offsetWidth(p:Number):void{
			this.internalSet(js_interface::OFFSET_WIDTH_PROPERTY, p);
		}
		public function get onblur():Function{
			return this.internalGet(js_interface::ON_BLUR_PROPERTY);
		}
		public function set onblur(p:Function):void{
			this.internalSet(js_interface::ON_BLUR_PROPERTY, p);
		}
		public function get onclick():Function{
			return this.internalGet(js_interface::ON_CLICK_PROPERTY);
		}
		public function set onclick(p:Function):void{
			this.internalSet(js_interface::ON_CLICK_PROPERTY, p);
		}
		public function get ondblclick():Function{
			return this.internalGet(js_interface::ON_DBLCLICK_PROPERTY);
		}
		public function set ondblclick(p:Function):void{
			this.internalSet(js_interface::ON_DBLCLICK_PROPERTY, p);
		}
		public function get onfocus():Function{
			return this.internalGet(js_interface::ON_FOCUS_PROPERTY);
		}
		public function set onfocus(p:Function):void{
			this.internalSet(js_interface::ON_FOCUS_PROPERTY, p);
		}
		public function get onkeydown():Function{
			return this.internalGet(js_interface::ON_KEY_DOWN_PROPERTY);
		}
		public function set onkeydown(p:Function):void{
			this.internalSet(js_interface::ON_KEY_DOWN_PROPERTY, p);
		}
		public function get onkeypress():Function{
			return this.internalGet(js_interface::ON_KEY_PRESS_PROPERTY);
		}
		public function set onkeypress(p:Function):void{
			this.internalSet(js_interface::ON_KEY_PRESS_PROPERTY, p);
		}
		public function get onkeyup():Function{
			return this.internalGet(js_interface::ON_KEY_UP_PROPERTY);
		}
		public function set onkeyup(p:Function):void{
			this.internalSet(js_interface::ON_KEY_UP_PROPERTY, p);
		}
		public function get onmousedown():Function{
			return this.internalGet(js_interface::ON_MOUSE_DOWN_PROPERTY);
		}
		public function set onmousedown(p:Function):void{
			this.internalSet(js_interface::ON_MOUSE_DOWN_PROPERTY, p);
		}
		public function get onmousemove():Function{
			return this.internalGet(js_interface::ON_MOUSE_MOVE_PROPERTY);
		}
		public function set onmousemove(p:Function):void{
			this.internalSet(js_interface::ON_MOUSE_MOVE_PROPERTY, p);
		}
		public function get onmouseout():Function{
			return this.internalGet(js_interface::ON_MOUSE_OUT_PROPERTY);
		}
		public function set onmouseout(p:Function):void{
			this.internalSet(js_interface::ON_MOUSE_OUT_PROPERTY, p);
		}
		public function get onmouseover():Function{
			return this.internalGet(js_interface::ON_MOUSE_OVER_PROPERTY);
		}
		public function set onmouseover(p:Function):void{
			this.internalSet(js_interface::ON_MOUSE_OVER_PROPERTY, p);
		}
		public function get onmouseup():Function{
			return this.internalGet(js_interface::ON_MOUSE_UP_PROPERTY);
		}
		public function set onmouseup(p:Function):void{
			this.internalSet(js_interface::ON_MOUSE_UP_PROPERTY, p);
		}
		/*
		public function get ownerDocument():Object{
			return this.internalGet(js_interface::OWNER_DOCUMENT_PROPERTY);
		}
		public function set ownerDocument(p:Object):void{
			this.internalSet(js_interface::OWNER_DOCUMENT_PROPERTY, p);
		}
		public function get parentNode():Object{
			return this.internalGet(js_interface::PARENT_NODE_PROPERTY);
		}
		public function set parentNode(p:Object):void{
			this.internalSet(js_interface::PARENT_NODE_PROPERTY, p);
		}
		public function get previousSibling():Object{
			return this.internalGet(js_interface::PREVIOUS_SIBLING_PROPERTY);
		}
		public function set previousSibling(p:Object):void{
			this.internalSet(js_interface::PREVIOUS_SIBLING_PROPERTY, p);
		}
		*/
		public function get scrollHeight():Number{
			return this.internalGet(js_interface::SCROLL_HEIGHT_PROPERTY);
		}
		public function set scrollHeight(p:Number):void{
			this.internalSet(js_interface::SCROLL_HEIGHT_PROPERTY, p);
		}
		public function get scrollLeft():Number{
			return this.internalGet(js_interface::SCROLL_LEFT_PROPERTY);
		}
		public function set scrollLeft(p:Number):void{
			this.internalSet(js_interface::SCROLL_LEFT_PROPERTY, p);
		}
		public function get scrollTop():Number{
			return this.internalGet(js_interface::SCROLL_TOP_PROPERTY);
		}
		public function set scrollTop(p:Number):void{
			this.internalSet(js_interface::SCROLL_TOP_PROPERTY, p);
		}
		public function get scrollWidth():Number{
			return this.internalGet(js_interface::SCROLL_WIDTH_PROPERTY);
		}
		public function set scrollWidth(p:Number):void{
			this.internalSet(js_interface::SCROLL_WIDTH_PROPERTY, p);
		}
		public function get style():JSHTMLStyleObject{
			return this.internalGet(js_interface::STYLE_PROPERTY);
		}
		public function set style(p:JSHTMLStyleObject):void{
			this.internalSet(js_interface::STYLE_PROPERTY, p);
		}
		public function get tabIndex():Number{
			return this.internalGet(js_interface::TAB_INDEX_PROPERTY);
		}
		public function set tabIndex(p:Number):void{
			this.internalSet(js_interface::TAB_INDEX_PROPERTY, p);
		}
		public function get title():String{
			return this.internalGet(js_interface::TITLE_PROPERTY);
		}
		public function set title(p:String):void{
			this.internalSet(js_interface::TITLE_PROPERTY, p);
		}
		public function addEventListener(whichEvent:String, handler:Object, direction:Boolean):JSHTMLElement{
			return this.internalCall(js_interface::ADD_EVENT_LISTENER_METHOD, arguments);
		}
		/*
		public function appendChild(newChild:JSNode):JSHTMLElement{
			return this.internalCall(js_interface::APPEND_CHILD_METHOD, arguments);
		}
		*/
		public function blur():void{
			this.internalCall(js_interface::BLUR_METHOD, arguments);
		}
		public function click():void{
			this.internalCall(js_interface::CLICK_METHOD, arguments);
		}
		/**
		 * 
		 * ======================================= Проверить тип аргумента этого метода на сайте Mozilla
		 * 
		 */
		public function dispatchEvent(event:*):void{
			this.internalCall(js_interface::DISPATCH_EVENT_METHOD, arguments);
		}
		public function focus():void{
			this.internalCall(js_interface::FOCUS_METHOD, arguments);
		}
		/*
		public function getAttributeNode(attributeName:String):JSNode{
			return this.internalCall(js_interface::GET_ATTRIBUTE_NODE_METHOD, arguments);
		}
		public function getElementsByTagName(tagname:String):JSArray{
			return this.internalCall(js_interface::GET_ELEMENTS_BY_TAG_NAME_METHOD, arguments);
		}
		*/
		public function removeEventListener(type:String, listener:Object, useCapture:Boolean):void{
			this.internalCall(js_interface::REMOVE_EVENT_LISTENER_METHOD, arguments);
		}
		static public function create(...args:Array):JSHTMLElement{
			return new JSHTMLElement(CLASS_NAME, args);
		}
	}
}