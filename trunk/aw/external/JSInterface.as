package aw.external{
	import aw.external.jsinterface.JSCore;
	import aw.external.jsinterface.JSFunction;
	import aw.external.jsinterface.objects.JSDocument;
	import aw.external.jsinterface.objects.JSEvent;
	import aw.external.jsinterface.objects.JSHTMLElement;
	import aw.external.jsinterface.objects.JSNavigator;
	import aw.external.jsinterface.objects.JSWindow;
	import aw.system.FlashPlayerType;
	
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.display.Stage;
	import flash.external.ExternalInterface;
	import flash.system.Capabilities;
	
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class JSInterface extends Object{
		JSFunction;
		/** 
		* 
		* @private (constant) 
		*/
		static private const GET_TITLE:String = 'JSI.getTitle';
		/** 
		* 
		* @private (constant) 
		*/
		static private const SET_TITLE:String = 'JSI.setTitle';
		/** 
		* 
		* @private (constant) 
		*/
		static private const GET_STATUS:String = 'JSI.getStatus';
		/** 
		* 
		* @private (constant) 
		*/
		static private const SET_STATUS:String = 'JSI.setStatus';
		/** 
		* 
		* @private (constant) 
		*/
		static private const GET_LOCATION:String = 'JSI.getLocation';
		/** 
		* 
		* @private (constant) 
		*/
		static private const GET_TOP_LOCATION:String = 'JSI.getTopLocation';
		/** 
		* 
		* @private (constant) 
		*/
		static private const GET_LOCATION_HASH:String = 'JSI.getLocationHash';
		/** 
		* 
		* @private (constant) 
		*/
		static private const SET_LOCATION_HASH:String = 'JSI.setLocationHash';
		/** 
		* 
		* @private (constant) 
		*/
		static private const GET_COOKIE_STRING:String = 'JSI.getCookieString';
		/** 
		* 
		* @private (constant) 
		*/
		static private const SET_COOKIE_STRING:String = 'JSI.setCookieString';
		/** 
		* 
		* @private (constant) 
		*/
		static private const GET_DEFAULT_STATUS:String = 'JSI.getDefaultStatus';
		/** 
		* 
		* @private (constant) 
		*/
		static private const SET_DEFAULT_STATUS:String = 'JSI.setDefaultStatus';
		/** 
		* 
		* @public 
		*/
		static public var redirectJavaScriptExceptions:Boolean = true;
		/** 
		* 
		* @public 
		*/
		static public var traceExceptionOnly:Boolean = true;
		/** 
		* 
		* @public 
		*/
		static public var exceptionHandler:Function;
		/** 
		* 
		* @public 
		*/
		static public var allowJavaScriptAccess:Boolean = false;
		/** 
		* 
		* @public 
		*/
		static public var redirectFlashExceptions:Boolean = true;
		/** 
		* 
		* @private (protected) 
		*/
		static protected var _stage:Stage = null;
		/** 
		* 
		* @private (protected) 
		*/
		static protected var _root:DisplayObject = null;
		/** 
		* 
		* @private (protected) 
		*/
		static protected var _isHTMLTitleVerified:Boolean = false;
		/** 
		* 
		* @public (getter) 
		* @return Boolean 
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
		* 
		* @public (getter) 
		* @return Boolean 
		*/
		static public function get initialized():Boolean{
			return JSCore.initialized;
		}
		/** 
		* 
		* @public 
		* @param arg 
		* @param allowJSAccess 
		* @return void 
		*/
		static public function initialize(arg:*=null, allowJSAccess:Boolean=false):void{
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
		* 
		* @private 
		* @return void 
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
		* 
		* @public (getter) 
		* @return Stage 
		*/
		static public function get stage():Stage{
			return _stage;
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		static public function set stage(p:Stage):void{
			_stage = p;
		}
		/** 
		* 
		* @public (getter) 
		* @return DisplayObject 
		*/
		static public function get root():DisplayObject{
			return _root;
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		static public function set root(p:DisplayObject):void{
			_root = p;
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return void 
		*/
		static public function getTitle(str:String):void{
			ExternalInterface.call(GET_TITLE);
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return void 
		*/
		static public function setTitle(str:String):void{
			ExternalInterface.call(SET_TITLE, str);
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		static public function getStatus():String{
			return ExternalInterface.call(GET_STATUS);
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return void 
		*/
		static public function setStatus(str:String):void{
			ExternalInterface.call(SET_STATUS, str);
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		static public function getDefaultStatus():String{
			return ExternalInterface.call(GET_DEFAULT_STATUS);
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return void 
		*/
		static public function setDefaultStatus(str:String):void{
			ExternalInterface.call(SET_DEFAULT_STATUS, str);
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		static public function getLocation():String{
			return ExternalInterface.call(GET_LOCATION);
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		static public function getTopLocation():String{
			return ExternalInterface.call(GET_TOP_LOCATION);
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		static public function getLocationHash():String{
			return ExternalInterface.call(GET_LOCATION_HASH);
		}
		/** 
		* 
		* @public 
		* @param str 
		* @return void 
		*/
		static public function setLocationHash(str:String):void{
			ExternalInterface.call(SET_LOCATION_HASH, str);
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		static public function getCookieString():String{
			return ExternalInterface.call(GET_COOKIE_STRING);
		}
		/** 
		* 
		* @private (protected) 
		*/
		static protected var JS_SET_COOKIE_COMMAND:String = 'document.cookie = ';
		/** 
		* 
		* @public 
		* @param name 
		* @param value 
		* @param date 
		* @param path 
		* @param domain 
		* @param secure 
		* @return void 
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
		* @private (protected) 
		*/
		static protected var COOKIE_SPACER:String = '; ';
		/** 
		* 
		* @private (protected) 
		*/
		static protected var VALUE_SPACER:String = '=';
		/** 
		* 
		* @public 
		* @param name 
		* @return String 
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
		* @public (constant) 
		*/
		static public const MILLISECONDS_IN_DAY:int = 86400000;
		/** 
		* 
		* @public 
		* @param name 
		* @param path 
		* @param domain 
		* @param secure 
		* @return void 
		*/
		static public function removeCookie(name:*, path:String='/', domain:String='', secure:Boolean=false):void{
			var d:Date = new Date();
			d.setTime(d.getTime()-MILLISECONDS_IN_DAY);
			setCookie(name, '', d, path, domain, secure);
		}
		/** 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSWindow 
		*/
		static protected var _window:JSWindow;
		/** 
		* 
		* @public (getter) 
		* @return JSWindow 
		* @see aw.external.jsinterface.objects.JSWindow 
		*/
		static public function get window():JSWindow{
			if(!_window){
				_window = JSCore.getWindow();
			}
			return _window;
		}
		/** 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSDocument 
		*/
		static protected var _document:JSDocument;
		/** 
		* 
		* @public (getter) 
		* @return JSDocument 
		* @see aw.external.jsinterface.objects.JSDocument 
		*/
		static public function get document():JSDocument{
			if(!_document){
				_document = JSCore.getDocument();
			}
			return _document;
		}
		/** 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSNavigator 
		*/
		static protected var _navigator:JSNavigator;
		/** 
		* 
		* @public (getter) 
		* @return JSNavigator 
		* @see aw.external.jsinterface.objects.JSNavigator 
		*/
		static public function get navigator():JSNavigator{
			if(!_navigator){
				_navigator = JSCore.getNavigator();
			}
			return _navigator;
		}
		/** 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		*/
		static protected var _main:JSHTMLElement;
		/** 
		* 
		* @public (getter) 
		* @return JSHTMLElement 
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		*/
		static public function get main():JSHTMLElement{
			if(!_main){
				_main = JSCore.getMain();
			}
			return _main;
		}
		/** 
		* 
		* @private (protected) 
		* @see aw.external.jsinterface.objects.JSEvent 
		*/
		static protected var _event:JSEvent;
		/** 
		* 
		* @public (getter) 
		* @return JSEvent 
		* @see aw.external.jsinterface.objects.JSEvent 
		*/
		static public function get event():JSEvent{
			if(!_event){
				_event = JSCore.getEvent();
			}
			return _event;
		}
		/** 
		* 
		* @public 
		* @param flCallbacks 
		* @param flObjects 
		* @param jsCallbacks 
		* @param jsObjects 
		* @return void 
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
		* 
		* @public 
		* @param path 
		* @param cls 
		* @return * 
		*/
		static public function getInstance(path:String, cls:Class=null):*{
			return JSCore.getInstance(path, cls);
		}
		/** 
		* 
		* @public 
		* @param url 
		* @param func 
		* @param type 
		* @return JSHTMLElement 
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		*/
		static public function loadJavaScript(url:String, func:Function=null, type:String=''):JSHTMLElement{
			return JSCore.loadJavaScript(url, func, type);
		}
		/** 
		* 
		* @public 
		* @param url 
		* @param func 
		* @param type 
		* @return JSHTMLElement 
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		*/
		static public function loadCSS(url:String, func:Function=null, type:String=''):JSHTMLElement{
			return JSCore.loadCSS(url, func, type);
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param propName 
		* @param args 
		* @param func 
		* @param timeout 
		* @return void 
		*/
		static public function callLater(obj:*, propName:String, args:Array=null, func:Function=null, timeout:uint=1):void{
			JSCore.callLater(obj, propName, args, func, timeout);
		}
	}
}