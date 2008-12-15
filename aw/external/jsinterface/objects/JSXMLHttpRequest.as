package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/XMLHttpRequest.html">XMLHttpRequest</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSXMLHttpRequest extends JSDynamic{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'XMLHttpRequest';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ON_READY_STATE_CHANGE_PROPERTY:String = 'onreadystatechange';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const READY_STATE_PROPERTY:String = 'readyState';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const RESPONSE_TEXT_PROPERTY:String = 'responseText';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const RESPONSE_XML_PROPERTY:String = 'responseXML';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const STATUS_PROPERTY:String = 'status';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const STATUS_TEXT_PROPERTY:String = 'statusText';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ABORT_METHOD:String = 'abort';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const GET_ALL_RESPONSE_HEADERS_METHOD:String = 'getAllResponseHeaders';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const GET_RESPONSE_HEADER_METHOD:String = 'getResponseHeader';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const OPEN_METHOD:String = 'open';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SEND_METHOD:String = 'send';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SET_REQUEST_HEADER_METHOD:String = 'setRequestHeader';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSXMLHttpRequest(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public (getter) 
		* @return Function 
		*/
		public function get onreadystatechange():Function{
			return this.internalGet(js_interface::ON_READY_STATE_CHANGE_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set onreadystatechange(p:Function):void{
			this.internalSet(js_interface::ON_READY_STATE_CHANGE_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return Number 
		*/
		public function get readyState():Number{
			return this.internalGet(js_interface::READY_STATE_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set readyState(p:Number):void{
			this.internalSet(js_interface::READY_STATE_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get responseText():String{
			return this.internalGet(js_interface::RESPONSE_TEXT_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set responseText(p:String):void{
			this.internalSet(js_interface::RESPONSE_TEXT_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return JSDocument 
		* @see aw.external.jsinterface.objects.JSDocument 
		*/
		public function get responseXML():JSDocument{
			return this.internalGet(js_interface::RESPONSE_XML_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSDocument 
		*/
		public function set responseXML(p:JSDocument):void{
			this.internalSet(js_interface::RESPONSE_XML_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return Number 
		*/
		public function get status():Number{
			return this.internalGet(js_interface::STATUS_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set status(p:Number):void{
			this.internalSet(js_interface::STATUS_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get statusText():String{
			return this.internalGet(js_interface::STATUS_TEXT_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set statusText(p:String):void{
			this.internalSet(js_interface::STATUS_TEXT_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @return void 
		*/
		public function abort():void{
			this.internalCall(js_interface::ABORT_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		public function getAllResponseHeaders():String{
			return this.internalCall(js_interface::GET_ALL_RESPONSE_HEADERS_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param header 
		* @return String 
		*/
		public function getResponseHeader(header:String):String{
			return this.internalCall(js_interface::GET_RESPONSE_HEADER_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param method 
		* @param uri 
		* @param async 
		* @param user 
		* @param password 
		* @return void 
		*/
		public function open(method:String, uri:String, async:Boolean=false, user:String='', password:String=''):void{
			this.internalCall(js_interface::OPEN_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param data 
		* @return void 
		*/
		public function send(data:Object):void{
			this.internalCall(js_interface::SEND_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param header 
		* @param value 
		* @return void 
		*/
		public function setRequestHeader(header:Object, value:Object):void{
			this.internalCall(js_interface::SET_REQUEST_HEADER_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSXMLHttpRequest 
		* @see aw.external.jsinterface.objects.JSXMLHttpRequest 
		*/
		static public function create(...args:Array):JSXMLHttpRequest{
			return new JSXMLHttpRequest(CLASS_NAME, args);
		}
	}
}