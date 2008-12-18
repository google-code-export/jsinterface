package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Document.html">Document</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSDocument extends JSNode{
		static public const CLASS_NAME:String = 'Document';
		static js_interface const ALINK_COLOR_PROPERTY:String = 'alinkColor';
		static js_interface const ANCHORS_PROPERTY:String = 'anchors';
		static js_interface const APPLETS_PROPERTY:String = 'applets';
		static js_interface const BG_COLOR_PROPERTY:String = 'bgColor';
		static js_interface const BODY_PROPERTY:String = 'body';
		static js_interface const COOKIE_PROPERTY:String = 'cookie';
		static js_interface const DOCTYPE_PROPERTY:String = 'doctype';
		static js_interface const DOCUMENT_ELEMENT_PROPERTY:String = 'documentElement';
		static js_interface const DOMAIN_PROPERTY:String = 'domain';
		static js_interface const EMBEDS_PROPERTY:String = 'embeds';
		static js_interface const FG_COLOR_PROPERTY:String = 'fgColor';
		static js_interface const FORMS_PROPERTY:String = 'forms';
		static js_interface const HEIGHT_PROPERTY:String = 'height';
		static js_interface const IMAGES_PROPERTY:String = 'images';
		static js_interface const IMPLEMENTATION_PROPERTY:String = 'implementation';
		static js_interface const LAST_MODIFIED_PROPERTY:String = 'lastModified';
		static js_interface const LINK_COLOR_PROPERTY:String = 'linkColor';
		static js_interface const LINKS_PROPERTY:String = 'links';
		static js_interface const ON_CLICK_PROPERTY:String = 'onclick';
		static js_interface const ON_DBLCLICK_PROPERTY:String = 'ondblclick';
		static js_interface const ON_KEY_DOWN_PROPERTY:String = 'onkeydown';
		static js_interface const ON_KEY_PRESS_PROPERTY:String = 'onkeypress';
		static js_interface const ON_KEY_UP_PROPERTY:String = 'onkeyup';
		static js_interface const ON_MOUSE_DOWN_PROPERTY:String = 'onmousedown';
		static js_interface const ON_MOUSE_MOVE_PROPERTY:String = 'onmousemove';
		static js_interface const ON_MOUSE_OUT_PROPERTY:String = 'onmouseout';
		static js_interface const ON_MOUSE_OVER_PROPERTY:String = 'onmouseover';
		static js_interface const ON_MOUSE_UP_PROPERTY:String = 'onmouseup';
		static js_interface const PLUGINS_PROPERTY:String = 'plugins';
		static js_interface const REFERRER_PROPERTY:String = 'referrer';
		static js_interface const STYLE_SHEETS_PROPERTY:String = 'styleSheets';
		static js_interface const TITLE_PROPERTY:String = 'title';
		static js_interface const VLINK_COLOR_PROPERTY:String = 'vlinkColor';
		static js_interface const WIDTH_PROPERTY:String = 'width';
		static js_interface const CLEAR_METHOD:String = 'clear';
		static js_interface const CLOSE_METHOD:String = 'close';
		static js_interface const CREATE_ATTRIBUTE_METHOD:String = 'createAttribute';
		static js_interface const CREATE_ATTRIBUTE_NS_METHOD:String = 'createAttributeNS';
		static js_interface const CREATE_COMMENT_METHOD:String = 'createComment';
		static js_interface const CREATE_DOCUMENT_FRAGMENT_METHOD:String = 'createDocumentFragment';
		static js_interface const CREATE_ELEMENT_METHOD:String = 'createElement';
		static js_interface const CREATE_ELEMENT_NS_METHOD:String = 'createElementNS';
		static js_interface const CREATE_TEXT_NODE_METHOD:String = 'createTextNode';
		static js_interface const GET_ELEMENT_BY_ID_METHOD:String = 'getElementById';
		static js_interface const GET_ELEMENTS_BY_TAG_NAME_METHOD:String = 'getElementsByTagName';
		static js_interface const OPEN_METHOD:String = 'open';
		static js_interface const WRITE_METHOD:String = 'write';
		static js_interface const WRITE_LN_METHOD:String = 'writeln';
		public function JSDocument(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get alinkColor():String{
			return this.internalGet(js_interface::ALINK_COLOR_PROPERTY);
		}
		public function set alinkColor(p:String):void{
			this.internalSet(js_interface::ALINK_COLOR_PROPERTY, p);
		}
		public function get anchors():JSArray{
			var ret:JSArray = this.internalGet(js_interface::ANCHORS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSAnchor;
			return ret;
		}
		public function set anchors(p:JSArray):void{
			this.internalSet(js_interface::ANCHORS_PROPERTY, p);
		}
		public function get applets():JSArray{
			var ret:JSArray = this.internalGet(js_interface::APPLETS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSApplet;
			return ret;
		}
		public function set applets(p:JSArray):void{
			this.internalSet(js_interface::APPLETS_PROPERTY, p);
		}
		public function get bgColor():String{
			return this.internalGet(js_interface::BG_COLOR_PROPERTY);
		}
		public function set bgColor(p:String):void{
			this.internalSet(js_interface::BG_COLOR_PROPERTY, p);
		}
		public function get body():JSElement{
			return this.internalGet(js_interface::BODY_PROPERTY);
		}
		public function set body(p:JSElement):void{
			this.internalSet(js_interface::BODY_PROPERTY, p);
		}
		public function get cookie():String{
			return this.internalGet(js_interface::COOKIE_PROPERTY);
		}
		public function set cookie(p:String):void{
			this.internalSet(js_interface::COOKIE_PROPERTY, p);
		}
		public function get doctype():JSDocumentType{
			return this.internalGet(js_interface::DOCTYPE_PROPERTY);
		}
		public function set doctype(p:JSDocumentType):void{
			this.internalSet(js_interface::DOCTYPE_PROPERTY, p);
		}
		public function get documentElement():JSElement{
			return this.internalGet(js_interface::DOCUMENT_ELEMENT_PROPERTY);
		}
		public function set documentElement(p:JSElement):void{
			this.internalSet(js_interface::DOCUMENT_ELEMENT_PROPERTY, p);
		}
		public function get domain():String{
			return this.internalGet(js_interface::DOMAIN_PROPERTY);
		}
		public function set domain(p:String):void{
			this.internalSet(js_interface::DOMAIN_PROPERTY, p);
		}
		public function get embeds():JSArray{
			var ret:JSArray = this.internalGet(js_interface::EMBEDS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSHTMLElement;
			return ret;
		}
		public function set embeds(p:JSArray):void{
			this.internalSet(js_interface::EMBEDS_PROPERTY, p);
		}
		public function get fgColor():String{
			return this.internalGet(js_interface::FG_COLOR_PROPERTY);
		}
		public function set fgColor(p:String):void{
			this.internalSet(js_interface::FG_COLOR_PROPERTY, p);
		}
		public function get forms():JSArray{
			var ret:JSArray = this.internalGet(js_interface::FORMS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSForm;
			return ret;
		}
		public function set forms(p:JSArray):void{
			this.internalSet(js_interface::FORMS_PROPERTY, p);
		}
		public function get height():Number{
			return this.internalGet(js_interface::HEIGHT_PROPERTY);
		}
		public function set height(p:Number):void{
			this.internalSet(js_interface::HEIGHT_PROPERTY, p);
		}
		public function get images():JSArray{
			var ret:JSArray = this.internalGet(js_interface::IMAGES_PROPERTY);
			if(ret) ret.js_interface::itemType = JSImage;
			return ret;
		}
		public function set images(p:JSArray):void{
			this.internalSet(js_interface::IMAGES_PROPERTY, p);
		}
		public function get implementation():Object{
			return this.internalGet(js_interface::IMPLEMENTATION_PROPERTY);
		}
		public function set implementation(p:Object):void{
			this.internalSet(js_interface::IMPLEMENTATION_PROPERTY, p);
		}
		public function get lastModified():String{
			return this.internalGet(js_interface::LAST_MODIFIED_PROPERTY);
		}
		public function set lastModified(p:String):void{
			this.internalSet(js_interface::LAST_MODIFIED_PROPERTY, p);
		}
		public function get linkColor():String{
			return this.internalGet(js_interface::LINK_COLOR_PROPERTY);
		}
		public function set linkColor(p:String):void{
			this.internalSet(js_interface::LINK_COLOR_PROPERTY, p);
		}
		public function get links():JSArray{
			var ret:JSArray = this.internalGet(js_interface::LINKS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSLink;
			return ret;
		}
		public function set links(p:JSArray):void{
			this.internalSet(js_interface::LINKS_PROPERTY, p);
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
		public function get plugins():JSArray{
			var ret:JSArray = this.internalGet(js_interface::PLUGINS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSHTMLElement;
			return ret;
		}
		public function set plugins(p:JSArray):void{
			this.internalSet(js_interface::PLUGINS_PROPERTY, p);
		}
		public function get referrer():String{
			return this.internalGet(js_interface::REFERRER_PROPERTY);
		}
		public function set referrer(p:String):void{
			this.internalSet(js_interface::REFERRER_PROPERTY, p);
		}
		public function get styleSheets():JSArray{
			var ret:JSArray = this.internalGet(js_interface::STYLE_SHEETS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSCSSStyleSheet;
			return ret;
		}
		public function set styleSheets(p:JSArray):void{
			this.internalSet(js_interface::STYLE_SHEETS_PROPERTY, p);
		}
		public function get title():String{
			return this.internalGet(js_interface::TITLE_PROPERTY);
		}
		public function set title(p:String):void{
			this.internalSet(js_interface::TITLE_PROPERTY, p);
		}
		public function get vlinkColor():String{
			return this.internalGet(js_interface::VLINK_COLOR_PROPERTY);
		}
		public function set vlinkColor(p:String):void{
			this.internalSet(js_interface::VLINK_COLOR_PROPERTY, p);
		}
		public function get width():Number{
			return this.internalGet(js_interface::WIDTH_PROPERTY);
		}
		public function set width(p:Number):void{
			this.internalSet(js_interface::WIDTH_PROPERTY, p);
		}
		public function clear():void{
			this.internalCall(js_interface::CLEAR_METHOD, arguments);
		}
		public function close():Object{
			return this.internalCall(js_interface::CLOSE_METHOD, arguments);
		}
		public function createAttribute(name:String):JSAttr{
			return this.internalCall(js_interface::CREATE_ATTRIBUTE_METHOD, arguments);
		}
		public function createAttributeNS(namespaceURI:String, qualifiedName:String):JSAttr{
			return this.internalCall(js_interface::CREATE_ATTRIBUTE_NS_METHOD, arguments);
		}
		public function createComment(data:String):JSComment{
			return this.internalCall(js_interface::CREATE_COMMENT_METHOD, arguments);
		}
		public function createDocumentFragment():JSDocumentFragment{
			return this.internalCall(js_interface::CREATE_DOCUMENT_FRAGMENT_METHOD, arguments);
		}
		public function createElement(tagName:String):JSHTMLElement{
			return this.internalCall(js_interface::CREATE_ELEMENT_METHOD, arguments);
		}
		public function createElementNS(namespaceURI:String, qualifiedName:String):JSHTMLElement{
			return this.internalCall(js_interface::CREATE_ELEMENT_NS_METHOD, arguments);
		}
		public function createTextNode(data:String):String{
			return this.internalCall(js_interface::CREATE_TEXT_NODE_METHOD, arguments);
		}
		public function getElementById(id:String):JSHTMLElement{
			return this.internalCall(js_interface::GET_ELEMENT_BY_ID_METHOD, arguments);
		}
		public function getElementsByTagName(tagname:String):JSArray{
			var ret:JSArray = this.internalCall(js_interface::GET_ELEMENTS_BY_TAG_NAME_METHOD, arguments);
			if(ret) ret.js_interface::itemType = JSHTMLElement;
			return ret;
		}
		public function open(mimeType:String='', name:String='', features:String='', replace:Boolean=false):void{
			this.internalCall(js_interface::OPEN_METHOD, arguments);
		}
		public function write(string:String):Object{
			return this.internalCall(js_interface::WRITE_METHOD, arguments);
		}
		public function writeln(string:String):Object{
			return this.internalCall(js_interface::WRITE_LN_METHOD, arguments);
		}
		static public function create(...args:Array):JSDocument{
			return new JSDocument(CLASS_NAME, args);
		}
	}
}