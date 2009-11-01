package aw.external{
	import aw.external.jsinterface.JSCore;
	import aw.external.jsinterface.JSInstanceCache;
	import aw.external.jsinterface.JSDynamic;
	import aw.system.FlashPlayerType;
	
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.display.Stage;
	import flash.external.ExternalInterface;
	import flash.system.Capabilities;
	/*
	
	For ASDOC documentation  look into full version
	
	*/
	public class JSInterface extends Object{

		static private const GET_TITLE:String = 'JSIBrowser.getTitle';

		static private const SET_TITLE:String = 'JSIBrowser.setTitle';

		static private const GET_STATUS:String = 'JSIBrowser.getStatus';

		static private const SET_STATUS:String = 'JSIBrowser.setStatus';

		static private const GET_LOCATION:String = 'JSIBrowser.getLocation';

		static private const GET_TOP_LOCATION:String = 'JSIBrowser.getTopLocation';

		static private const GET_LOCATION_HASH:String = 'JSIBrowser.getLocationHash';

		static private const SET_LOCATION_HASH:String = 'JSIBrowser.setLocationHash';

		static private const GET_COOKIE_STRING:String = 'JSIBrowser.getCookieString';

		static private const SET_COOKIE_STRING:String = 'JSIBrowser.setCookieString';

		static private const GET_DEFAULT_STATUS:String = 'JSIBrowser.getDefaultStatus';

		static private const SET_DEFAULT_STATUS:String = 'JSIBrowser.setDefaultStatus';

		static public var redirectJavaScriptExceptions:Boolean = true;

		static public var traceExceptionOnly:Boolean = true;

		static public var exceptionHandler:Function;

		static public var allowJavaScriptAccess:Boolean = false;

		static public var redirectFlashExceptions:Boolean = true;

		static private var _stage:Stage = null;

		static private var _root:DisplayObject = null;

		static private var _isHTMLTitleVerified:Boolean = false;

		static public function get available():Boolean{
			var val:Boolean = ExternalInterface.available;
			if(val){
				var type:String = Capabilities.playerType;
				if(type != FlashPlayerType.ACTIVEX && type != FlashPlayerType.PLUGIN) val = false;
			}
			return val;
		}

		static public function get initialized():Boolean{
			return JSCore.initialized;
		}

		static public function initialize(arg:*=null, allowJSAccess:Boolean=false):void{
			coreInit(arg, allowJSAccess);
		}

		static private function coreInit(arg:*, allowJSAccess:Boolean):void{
			var url:String = '';
			if(arg is DisplayObject){
				var displayObject:DisplayObject = arg as DisplayObject;
				if(allowJSAccess){
					_stage = displayObject.stage;
					_root = findCurrentRoot();
				}
				url = displayObject.loaderInfo.url;
			}else if(arg is LoaderInfo){
				if(allowJSAccess){
					 _stage = (arg as LoaderInfo).content.stage;
					 _root = findCurrentRoot();
				}
				url = (arg as LoaderInfo).url;
			}else if(arg) url = arg as String;
			allowJavaScriptAccess = allowJSAccess;
			JSCore.init(url);
		}
		static private function findCurrentRoot():DisplayObject{
			if(!_stage) return null;
			var len:int = _stage.numChildren;
			var item:DisplayObject;
			if(len==1) item = _stage.getChildAt(0);
			else{
				for(var i:int=0; i<len; i++){
					item = _stage.getChildAt(i);
					if(item.root && item.root!=_stage) break;
				}
			}
			return item;
		}

		static public function get stage():Stage{
			return _stage;
		}

		static public function set stage(p:Stage):void{
			_stage = p;
		}

		static public function get root():DisplayObject{
			return _root;
		}

		static public function set root(p:DisplayObject):void{
			_root = p;
		}

		static public function getTitle():String{
			return ExternalInterface.call(GET_TITLE);
		}

		static public function setTitle(str:String):void{
			ExternalInterface.call(SET_TITLE, str);
		}

		static public function getStatus():String{
			return ExternalInterface.call(GET_STATUS);
		}

		static public function setStatus(str:String):void{
			ExternalInterface.call(SET_STATUS, str);
		}

		static public function getDefaultStatus():String{
			return ExternalInterface.call(GET_DEFAULT_STATUS);
		}

		static public function setDefaultStatus(str:String):void{
			ExternalInterface.call(SET_DEFAULT_STATUS, str);
		}

		static public function getLocation():String{
			return ExternalInterface.call(GET_LOCATION);
		}

		static public function getTopLocation():String{
			return ExternalInterface.call(GET_TOP_LOCATION);
		}

		static public function getLocationHash():String{
			return ExternalInterface.call(GET_LOCATION_HASH);
		}

		static public function setLocationHash(str:String):void{
			ExternalInterface.call(SET_LOCATION_HASH, str);
		}

		static public function getCookieString():String{
			return ExternalInterface.call(GET_COOKIE_STRING);
		}

		static private var JS_SET_COOKIE_COMMAND:String = 'document.cookie = ';

		static public function setCookie(name:*, value:*, date:Date=null, path:String='/', domain:String='', secure:Boolean=false):void{
			var str:String = name.toString()+'='+value.toString();
			if(date) str += ';expires='+date.toUTCString();
			if(path) str += ';path='+path;
			if(domain) str += ';domain='+domain;
			if(secure) str += ';secure';
			ExternalInterface.call(SET_COOKIE_STRING, str);
		}

		static private var COOKIE_SPACER:String = '; ';

		static private var VALUE_SPACER:String = '=';

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

		static private const MILLISECONDS_IN_DAY:int = 86400000;

		static public function removeCookie(name:*, path:String='/', domain:String='', secure:Boolean=false):void{
			var d:Date = new Date();
			d.setTime(d.getTime()-MILLISECONDS_IN_DAY);
			setCookie(name, '', d, path, domain, secure);
		}

		static protected var _window:JSDynamic;

		static public function get window():JSDynamic{
			if(!_window){
				_window = JSCore.getWindow(JSDynamic);
			}
			return _window;
		}

		static protected var _document:JSDynamic;

		static public function get document():JSDynamic{
			if(!_document){
				_document = JSCore.getDocument(JSDynamic);
			}
			return _document;
		}

		static protected var _navigator:JSDynamic;

		static public function get navigator():JSDynamic{
			if(!_navigator){
				_navigator = JSCore.getNavigator(JSDynamic);
			}
			return _navigator;
		}

		static protected var _main:JSDynamic;

		static public function get main():JSDynamic{
			if(!_main){
				_main = JSCore.getMain(JSDynamic);
			}
			return _main;
		}

		static protected var _event:JSDynamic;

		static public function get event():JSDynamic{
			if(_event) JSInstanceCache.removeFromCache(_event.js_interface::info.value);
			_event = JSCore.getEvent(JSDynamic);
			return _event;
		}

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

		static public function getInstance(path:String, cls:Class=null):*{
			return JSCore.getInstance(path, cls);
		}

		static public function loadJavaScript(url:String, func:Function=null, type:String=''):JSDynamic{
			return JSCore.loadJavaScript(url, func, type, JSDynamic);
		}
		
		static public function pushJavaScript(code:String, type:String='', asVirual:Boolean=false):JSDynamic{
			if(asVirual){
				JSCore.callAnonymous(code, false);
				return null;
			}else{
				return JSCore.pushSCRIPTTag(code, type, JSDynamic);
			}
		}
		
		static public function loadCSS(url:String, func:Function=null, type:String=''):JSDynamic{
			return JSCore.loadCSS(url, func, type, JSDynamic);
		}
		
		static public function pushCSS(style:String, type:String=''):JSDynamic{
			return JSCore.pushSTYLETag(style, type, JSDynamic);
		}
		
		static public function callLater(obj:*, propName:String, args:Array=null, func:Function=null, timeout:uint=1):void{
			JSCore.callLater(obj, propName, args, func, timeout);
		}
	}
}