package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/XMLHttpRequest.html">XMLHttpRequest</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSXMLHttpRequest extends JSDynamic{
		static public const CLASS_NAME:String = 'XMLHttpRequest';
		static js_interface const ON_READY_STATE_CHANGE_PROPERTY:String = 'onreadystatechange';
		static js_interface const READY_STATE_PROPERTY:String = 'readyState';
		static js_interface const RESPONSE_TEXT_PROPERTY:String = 'responseText';
		static js_interface const RESPONSE_XML_PROPERTY:String = 'responseXML';
		static js_interface const STATUS_PROPERTY:String = 'status';
		static js_interface const STATUS_TEXT_PROPERTY:String = 'statusText';
		static js_interface const ABORT_METHOD:String = 'abort';
		static js_interface const GET_ALL_RESPONSE_HEADERS_METHOD:String = 'getAllResponseHeaders';
		static js_interface const GET_RESPONSE_HEADER_METHOD:String = 'getResponseHeader';
		static js_interface const OPEN_METHOD:String = 'open';
		static js_interface const SEND_METHOD:String = 'send';
		static js_interface const SET_REQUEST_HEADER_METHOD:String = 'setRequestHeader';
		public function JSXMLHttpRequest(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get onreadystatechange():Function{
			return this.internalGet(js_interface::ON_READY_STATE_CHANGE_PROPERTY);
		}
		public function set onreadystatechange(p:Function):void{
			this.internalSet(js_interface::ON_READY_STATE_CHANGE_PROPERTY, p);
		}
		public function get readyState():Number{
			return this.internalGet(js_interface::READY_STATE_PROPERTY);
		}
		public function set readyState(p:Number):void{
			this.internalSet(js_interface::READY_STATE_PROPERTY, p);
		}
		public function get responseText():String{
			return this.internalGet(js_interface::RESPONSE_TEXT_PROPERTY);
		}
		public function set responseText(p:String):void{
			this.internalSet(js_interface::RESPONSE_TEXT_PROPERTY, p);
		}
		public function get responseXML():JSDocument{
			return this.internalGet(js_interface::RESPONSE_XML_PROPERTY);
		}
		public function set responseXML(p:JSDocument):void{
			this.internalSet(js_interface::RESPONSE_XML_PROPERTY, p);
		}
		public function get status():Number{
			return this.internalGet(js_interface::STATUS_PROPERTY);
		}
		public function set status(p:Number):void{
			this.internalSet(js_interface::STATUS_PROPERTY, p);
		}
		public function get statusText():String{
			return this.internalGet(js_interface::STATUS_TEXT_PROPERTY);
		}
		public function set statusText(p:String):void{
			this.internalSet(js_interface::STATUS_TEXT_PROPERTY, p);
		}
		public function abort():void{
			this.internalCall(js_interface::ABORT_METHOD, arguments);
		}
		public function getAllResponseHeaders():String{
			return this.internalCall(js_interface::GET_ALL_RESPONSE_HEADERS_METHOD, arguments);
		}
		public function getResponseHeader(header:String):String{
			return this.internalCall(js_interface::GET_RESPONSE_HEADER_METHOD, arguments);
		}
		public function open(method:String, uri:String, async:Boolean=false, user:String='', password:String=''):void{
			this.internalCall(js_interface::OPEN_METHOD, arguments);
		}
		public function send(data:Object):void{
			this.internalCall(js_interface::SEND_METHOD, arguments);
		}
		public function setRequestHeader(header:Object, value:Object):void{
			this.internalCall(js_interface::SET_REQUEST_HEADER_METHOD, arguments);
		}
		static public function create(...args:Array):JSXMLHttpRequest{
			return new JSXMLHttpRequest(CLASS_NAME, args);
		}
	}
}