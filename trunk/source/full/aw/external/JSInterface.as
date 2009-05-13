package aw.external{
	import aw.external.jsinterface.JSCore;
	import aw.external.jsinterface.JSInstanceCache;
	import aw.external.jsinterface.objects.JSDocument;
	import aw.external.jsinterface.objects.JSEvent;
	import aw.external.jsinterface.objects.JSHTMLElement;
	import aw.external.jsinterface.objects.JSNavigator;
	import aw.external.jsinterface.objects.JSObjectTypeMapper;
	import aw.external.jsinterface.objects.JSWindow;
	import aw.system.FlashPlayerType;
	
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.display.Stage;
	import flash.external.ExternalInterface;
	import flash.system.Capabilities;
	
	/** 
	* It’s the main class of JSInterface library, it contains the most necessary methods for interaction with JavaScript environment. 
	* This class contains “shortcut” methods for frequently used operations, such as page title changing, working with Cookie or loading 
	* CSS and JavaScript files. Before starting working with the library make sure that it was initialized JSInterface.initialize() 
	* method. Initialization is necessary to integrate the necessary JavaScript code to the HTML page for the JSInterface to be able  
	* to operate correctly.
	* @example Example:
<listing version="3.0">
 package {
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSHTMLElement;
	
	import flash.display.Sprite;
	[SWF(width="20", height="20")]
	public class BodyOnClickExample extends Sprite{
		public function BodyOnClickExample():void{
			super();
			JSInterface.initialize(this);
			JSInterface.document.body.onclick = this.onclickHandler;
			var body:JSHTMLElement = JSDynamic.convert(JSInterface.document.body, JSHTMLElement);
			body.onclick();
			trace(JSInterface.document.links.length);
		}
		protected function onclickHandler():void{
			trace(' HTML Click! ');
		}
	}
}
</listing>
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public class JSInterface extends Object{

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_TITLE:String = 'JSIBrowser.getTitle';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_TITLE:String = 'JSIBrowser.setTitle';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_STATUS:String = 'JSIBrowser.getStatus';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_STATUS:String = 'JSIBrowser.setStatus';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_LOCATION:String = 'JSIBrowser.getLocation';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_TOP_LOCATION:String = 'JSIBrowser.getTopLocation';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_LOCATION_HASH:String = 'JSIBrowser.getLocationHash';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_LOCATION_HASH:String = 'JSIBrowser.setLocationHash';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_COOKIE_STRING:String = 'JSIBrowser.getCookieString';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_COOKIE_STRING:String = 'JSIBrowser.setCookieString';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_DEFAULT_STATUS:String = 'JSIBrowser.getDefaultStatus';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_DEFAULT_STATUS:String = 'JSIBrowser.setDefaultStatus';

		/** 
		* Shows the necessity to duplicate JavaScript errors in Flash environment. 
		* Such errors can occur upon wrongful acts (calling for a non-existing methods) 
		* initiated by Flash Player environment.
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public var redirectJavaScriptExceptions:Boolean = true;

		/** 
		* Instead of throwing error will show error description in OUTPUT window, using trace() command.
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public var traceExceptionOnly:Boolean = true;

		/** 
		* The function that processes errors that occurred beyond the request from Flash Player. 
		* Such errors can occur during execution of JavaScript functions called from Flash Player 
		* by time-out (for example, using JSInterface.callLater() method).
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public var exceptionHandler:Function;

		/** 
		* The function that processes errors that occurred beyond the request from Flash Player. 
		* Such errors can occur during execution of JavaScript functions called from Flash Player 
		* by time-out (for example, using JSInterface.callLater() method). 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public var allowJavaScriptAccess:Boolean = false;

		/** 
		* It allows access to Flash Player objects from JavaScript environment. 
		* If you set it as TRUE, you get a possibility to create and call for 
		* objects located in the Flash Player environment. If the value is FALSE, 
		* then the access to objects from Flash Player environment is limited to 
		* objects transferred to JavaScript in advance. 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public var redirectFlashExceptions:Boolean = true;

		/** 
		* 
		* 
		* 
		* @private  
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var _stage:Stage = null;

		/** 
		* 
		* 
		* 
		* @private 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var _root:DisplayObject = null;

		/** 
		* 
		* 
		* 
		* @private 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var _isHTMLTitleVerified:Boolean = false;

		/** 
		* Returns TRUE if you can use JSInterface. This will occur if application will run in browser with enabled ExternalInterface.
		* 
		* 
		* @public (getter) 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get available():Boolean{
			var val:Boolean = ExternalInterface.available;
			if(val){
				var type:String = Capabilities.playerType;
				if(type != FlashPlayerType.ACTIVEX && type != FlashPlayerType.PLUGIN) val = false;
			}
			return val;
		}

		/** 
		* Return TRUE if JSInterface is initialized.
		* 
		* 
		* @public (getter) 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get initialized():Boolean{
			return JSCore.initialized;
		}

		/** 
		* Initialize JSInterface.
		* 
		* 
		* @public 
		* @param arg Any object of DisplayObject type with access to Stage, LoaderInfo of the program or 
		* URL line of the program. This parameter allows finding the HTML-object of the program in the 
		* DOM-tree of the HTML-page, if no ID for the Flash Player HTML-object has been set. In case of 
		* transferring an object of DisplayObject or LoaderInfo type related to Stage the properties 
		* JSInterface.stage and JSInterface.root, necessary for allowing access from JavaScript environment 
		* to Flash Player environment, will be filled in automatically.
		* @example Initialization example:
<listing version="3.0">
package {
	import aw.external.JSInterface;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			JSInterface.initialize(this, true);
		}
	}
}
</listing>
		* @param allowJSAccess Enables access from JavaScript environment into Flash Player environment.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function initialize(arg:*=null, allowJSAccess:Boolean=false):void{
			JSObjectTypeMapper.initialize();
			coreInit(arg, allowJSAccess);
		}

		/** 
		* Initialize core of JSInterface
		* 
		* 
		* @private 
		* @param arg 
		* @param allowJSAccess 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function coreInit(arg:*, allowJSAccess:Boolean):void{
			var url:String = '';
			if(arg is DisplayObject){
				var displayObject:DisplayObject = arg as DisplayObject;
				_stage = displayObject.stage;
				findCurrentRoot();
				url = displayObject.loaderInfo.url;
			}else if(arg is LoaderInfo){
				_stage = (arg as LoaderInfo).content.stage;
				findCurrentRoot();
				url = (arg as LoaderInfo).url;
			}else if(arg) url = arg as String;
			allowJavaScriptAccess = allowJSAccess;
			JSCore.init(url);
		}

		/** 
		* Returns root DisplayObject
		* 
		* 
		* @private 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function findCurrentRoot():void{
			var len:int = _stage.numChildren;
			var item:DisplayObject;
			if(len==1) item = _stage.getChildAt(0);
			else{
				for(var i:int=0; i<len; i++){
					item = _stage.getChildAt(i);
					if(item.root && item.root!=_stage) break;
				}
			}
			_root = item;
		}

		/** 
		* Current Stage object. 
		* 
		* 
		* @public (getter) 
		* @return Stage 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get stage():Stage{
			return _stage;
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
		static public function set stage(p:Stage):void{
			_stage = p;
		}

		/** 
		* Root object of DisplayObject hierarchy
		* 
		* 
		* @public (getter) 
		* @return DisplayObject 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get root():DisplayObject{
			return _root;
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
		static public function set root(p:DisplayObject):void{
			_root = p;
		}

		/** 
		* Returns title of HTML page
		* 
		* 
		* @public 
		* @param str 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getTitle():String{
			return ExternalInterface.call(GET_TITLE);
		}

		/** 
		* Setup title of HTML page
		* 
		* 
		* @public 
		* @param str 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function setTitle(str:String):void{
			ExternalInterface.call(SET_TITLE, str);
		}

		/** 
		* Returns status of HTML page
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getStatus():String{
			return ExternalInterface.call(GET_STATUS);
		}

		/** 
		* Setup status of HTML page
		* 
		* 
		* @public 
		* @param str 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function setStatus(str:String):void{
			ExternalInterface.call(SET_STATUS, str);
		}

		/** 
		* Returns default status of HTML page
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getDefaultStatus():String{
			return ExternalInterface.call(GET_DEFAULT_STATUS);
		}

		/** 
		* Setup default status of HTML page
		* 
		* 
		* @public 
		* @param str 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function setDefaultStatus(str:String):void{
			ExternalInterface.call(SET_DEFAULT_STATUS, str);
		}

		/** 
		* Returns URL of current HTML page on which runs this application
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getLocation():String{
			return ExternalInterface.call(GET_LOCATION);
		}

		/** 
		* Returns URL of top level frame in current HTML page
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getTopLocation():String{
			return ExternalInterface.call(GET_TOP_LOCATION);
		}

		/** 
		* Returns current anchor(hash from URL) from HTML page
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getLocationHash():String{
			return ExternalInterface.call(GET_LOCATION_HASH);
		}

		/** 
		* Setup anchor for current HTML page
		* 
		* 
		* @public 
		* @param str 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function setLocationHash(str:String):void{
			ExternalInterface.call(SET_LOCATION_HASH, str);
		}

		/** 
		* Returns all cookie in string format
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getCookieString():String{
			return ExternalInterface.call(GET_COOKIE_STRING);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var JS_SET_COOKIE_COMMAND:String = 'document.cookie = ';

		/** 
		* Setup cookie
		* 
		* 
		* @public 
		* @param name Cookie name
		* @param value Cookie value
		* @param date Expiration date
		* @param path Path on which the cookie will be available
		* @param domain Domain for which cookie value is available
		* @param secure If TRUE, a cookie will be sent only via HTTPS
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function setCookie(name:*, value:*, date:Date=null, path:String='/', domain:String='', secure:Boolean=false):void{
			var str:String = name.toString()+'='+value.toString();
			if(date) str += ';expires='+date.toUTCString();
			if(path) str += ';path='+path;
			if(domain) str += ';domain='+domain;
			if(secure) str += ';secure';
			ExternalInterface.call(SET_COOKIE_STRING, str);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var COOKIE_SPACER:String = '; ';

		/** 
		* 
		* 
		* 
		* @private 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var VALUE_SPACER:String = '=';

		/** 
		* Returns the cookie by its name
		* 
		* 
		* @public 
		* @param name 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getCookie(name:String):String{
			var str:String = getCookieString();
			if(str && name){
				var nlen:int = name.length;
				var cpos:int = 0;
				var spos:int = 0;
				while((cpos = str.indexOf(name, spos))>=0 && (str.charAt(cpos+nlen)!=VALUE_SPACER || (Boolean(cpos) && str.substr(cpos-2, 2)!=COOKIE_SPACER))){
					spos = cpos+nlen;
				}
				var val:String = '';
				if(cpos>=0){
					spos = cpos+nlen+1;
					cpos = str.indexOf(COOKIE_SPACER, spos);
					val = str.substring(spos, cpos<0 ? str.length : cpos);
				}
			}
			return val;
		}

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const MILLISECONDS_IN_DAY:int = 86400000;

		/** 
		* Removes cookie
		* 
		* 
		* @public 
		* @param name 
		* @param path 
		* @param domain 
		* @param secure 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function removeCookie(name:*, path:String='/', domain:String='', secure:Boolean=false):void{
			var d:Date = new Date();
			d.setTime(d.getTime()-MILLISECONDS_IN_DAY);
			setCookie(name, '', d, path, domain, secure);
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSWindow 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _window:JSWindow;

		/** 
		* Reference to the JavaScript window object. This object is used in JavaScript, 
		* as a global and globally declared JavaScript functions and properties will be 
		* available through it, as its methods and properties 
		* 
		* 
		* @public (getter) 
		* @return JSWindow 
		* @see aw.external.jsinterface.objects.JSWindow 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get window():JSWindow{
			if(!_window){
				_window = JSCore.getWindow(JSWindow) as JSWindow;
			}
			return _window;
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSDocument 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _document:JSDocument;

		/** 
		* Reference to the JavaScript document object
		* 
		* 
		* @public (getter) 
		* @return JSDocument 
		* @see aw.external.jsinterface.objects.JSDocument 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get document():JSDocument{
			if(!_document){
				_document = JSCore.getDocument(JSDocument) as JSDocument;
			}
			return _document;
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSNavigator 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _navigator:JSNavigator;

		/** 
		* Reference to the JavaScript navigator object
		* 
		* 
		* @public (getter) 
		* @return JSNavigator 
		* @see aw.external.jsinterface.objects.JSNavigator 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get navigator():JSNavigator{
			if(!_navigator){
				_navigator = JSCore.getNavigator(JSNavigator) as JSNavigator;
			}
			return _navigator;
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _main:JSHTMLElement;

		/** 
		* Reference to the JavaScript object of this copy of Flash Player, from the HTML tree
		* 
		* 
		* @public (getter) 
		* @return JSHTMLElement 
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get main():JSHTMLElement{
			if(!_main){
				_main = JSCore.getMain(JSHTMLElement) as JSHTMLElement;
			}
			return _main;
		}

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSEvent 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _event:JSEvent;

		/** 
		* Reference to the JavaScript event object
		* 
		* 
		* @public (getter) 
		* @return JSEvent 
		* @see aw.external.jsinterface.objects.JSEvent 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get event():JSEvent{
			if(_event) JSInstanceCache.removeFromCache(_event.js_interface::info.value);
			_event = JSCore.getEvent(JSEvent) as JSEvent;
			return _event;
		}

		/** 
		* Clear stacks of transmitted objects
		* 
		* 
		* @public 
		* @param flCallbacks Clear stack of functions from JavaScript
		* @param flObjects Clear stack of objects from JavaScript
		* @param jsCallbacks Clear stack of functions from Flash Player
		* @param jsObjects Clear stack of objects from Flash Player
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function clear(flCallbacks:Boolean=true, flObjects:Boolean=true, jsCallbacks:Boolean=true, jsObjects:Boolean=true):void{
			if(flObjects){
				_window = null;
				_document = null;
				_navigator = null;
				_main = null;
				_event = null;
			}
			JSCore.clear(flCallbacks, flObjects, jsCallbacks, jsObjects);
		}

		/** 
		* Get value by path from JavaScript environment
		* 
		* 
		* @public 
		* @param path 
		* @param cls 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getInstance(path:String, cls:Class=null):*{
			return JSCore.getInstance(path, cls);
		}

		/** 
		* Load JavaScript file into the HTML document
		* 
		* 
		* @public 
		* @param url File URL
		* @param func Function which will be called when load complete
		* @param type TYPE attribute value of SCRIPT tag, if not specified, the default will be used - "text/javascript"
		* @return JSHTMLElement HTML object of created SCRIPT tag
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function loadJavaScript(url:String, func:Function=null, type:String=''):JSHTMLElement{
			return JSCore.loadJavaScript(url, func, type, JSHTMLElement) as JSHTMLElement;
		}
		
		/**
		* Adds new SCRIPT tag with content from "code" argument into HEAD section of HTML document
		* @param code JavaScript code
		* @param type Content of "type" argument of SCRIPT tag, by default is "text/javascript"
		* @param asVirual If TRUE, will NOT add new SCRIPT tag and will return NULL 
		* @return Created tag object
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		* 
		*/
		static public function pushJavaScript(code:String, type:String='', asVirual:Boolean=false):JSHTMLElement{
			if(asVirual){
				JSCore.callAnonymous(code, false);
				return null;
			}else{
				return JSCore.pushSCRIPTTag(code, type, JSHTMLElement) as JSHTMLElement;
			}
		}

		/** 
		* Load CSS file into the HTML document
		* 
		* 
		* @public 
		* @param url File URL
		* @param func Function which will be called when load complete. In a browser, Fire Fox is not called onload event, so to catch the complete of loading in such a way is impossible, and this function will not be called.
		* @param type TYPE attribute value of LINK tag, if not specified, the default will be used - "text/css"
		* @return JSHTMLElement HTML object of created LINK tag
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function loadCSS(url:String, func:Function=null, type:String=''):JSHTMLElement{
			return JSCore.loadCSS(url, func, type, JSHTMLElement) as JSHTMLElement;
		}
		
		/**
		* Adds new STYLE tag with content from "style" argument into HEAD section of HTML document
		* @param style CSS Style definitions
		* @param type Content of "type" argument of STYLE tag, by default is "text/css"
		* @return Created tag object
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		* 
		*/
		static public function pushCSS(style:String, type:String=''):JSHTMLElement{
			return JSCore.pushSTYLETag(style, type, JSHTMLElement) as JSHTMLElement;
		}

		/** 
		* Call the JavaScript method by timeout
		* 
		* 
		* @public 
		* @param obj The object containing the method
		* @param propName Method name
		* @param args Arguments list
		* @param func Function into which will return the result of the JavaScript function
		* @param timeout Time in milliseconds
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function callLater(obj:*, propName:String, args:Array=null, func:Function=null, timeout:uint=1):void{
			JSCore.callLater(obj, propName, args, func, timeout);
		}
	}
}