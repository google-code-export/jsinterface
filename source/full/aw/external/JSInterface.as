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
	* Основной класс библиотеки JSInterface, содержит самые необходимые методы для взаимодействия с JavaScript средой. 
	* Этот класс содержит методы "шорткаты" для часто испольуемых операций, таких как смена заголовка страницы, работа 
	* с Cookie или загрузки CSS и JavaScript файлов. 
	* Перед началом работы с библиотекой удостоверьтесь, что она была проинициализирована с помощью метода JSInterface.initialize(). 
	* Инициализация необходима для внедрения необходимого JavaScript кода в HTML страничку, чтоб JSInterface мог корректно 
	* работать.
	* @example Пример использования:
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
		static private const GET_TITLE:String = 'JSI.getTitle';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_TITLE:String = 'JSI.setTitle';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_STATUS:String = 'JSI.getStatus';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_STATUS:String = 'JSI.setStatus';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_LOCATION:String = 'JSI.getLocation';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_TOP_LOCATION:String = 'JSI.getTopLocation';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_LOCATION_HASH:String = 'JSI.getLocationHash';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_LOCATION_HASH:String = 'JSI.setLocationHash';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_COOKIE_STRING:String = 'JSI.getCookieString';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_COOKIE_STRING:String = 'JSI.setCookieString';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const GET_DEFAULT_STATUS:String = 'JSI.getDefaultStatus';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SET_DEFAULT_STATUS:String = 'JSI.setDefaultStatus';

		/** 
		* Указывает на необходимость дублировать JavaScript ошибки во Flash среде. Такие ошибки могут возникнуть при неправомерных действиях(вызов несуществующего метода) инициатором которых была среда Flash Player'а.
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public var redirectJavaScriptExceptions:Boolean = true;

		/** 
		* Вместо выброса ошибки позволяет выводить текст ошибки в OUTPUT консоль.
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public var traceExceptionOnly:Boolean = true;

		/** 
		* Функция обрабатывающая ошибки произошедшие за рамками запроса из Flash Player'а. Такие ошибки могут происходить при выполнении JavaScript функций вызванных из Flash Player'а по таймауту(к примеру, с помощью метода JSInterface.callLater()).
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public var exceptionHandler:Function;

		/** 
		* Разрешает доступ к объектам Flash Player'а из среды JavaScript. Если задать TRUE, то появляется возможность создавать и запрашивать объекты находящиеся в среде Flash Player'а.
		* Если значение FALSE, то доступ к объектам из Flash Player среды ограничивается предварительно переданными в JavaScript объектами. 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public var allowJavaScriptAccess:Boolean = false;

		/** 
		* Переадресовывает все ошибки из среды Flash Player'а в JavaScript и там вызывает JavaScript ошибку с полученными данными. Такие ошибки могут происходить во время обработки запроса поступившего из JavaScript среды. 
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
		* Возвращает TRUE если возможно использовать JSInterface. Это произойдёт только в случае запуска программы в браузере и включенном ExternalInterface.
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
		* Возвращает TRUE если JSInterface уже инициализирован
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
		* Инициализировать JSInterface.
		* 
		* 
		* @public 
		* @param arg Любой объект типа DisplayObject имеющий доступ к Stage, LoaderInfo данной программы или URL строка данной программы. 
		* Этот параметр позволяет найти HTML объект данной программы в DOM дереве HTML страницы, если не был задан ID для HTML объекта Flash Player'а. 
		* В случае передачи объекта типа DisplayObject или LoaderInfo, связанного со Stage, автоматически будут заполненны свойства JSInterface.stage 
		* и JSInterface.root, необходимые для разрешения доступа из JavaScript среды в среду Flash Player'а.
		* @example Инициализация:
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
		* @param allowJSAccess Разрешить доступ из JavaScript среды в среду Flash Player'а.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function initialize(arg:*=null, allowJSAccess:Boolean=false):void{
			JSObjectTypeMapper.initialize();
			coreInit(arg, allowJSAccess);
		}

		/** 
		* Инициализирует основные функции JSInterface.
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
		* Возвращает корневой объект дерева DisplayObject.
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
		* Собственная ссылка на Stage объект данной программы. 
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
		* Собственная ссылка на root(корневой DisplayObject объект) объект данной программы.
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
		* Возвращает заголовок HTML страницы.
		* 
		* 
		* @public 
		* @param str 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getTitle(str:String):void{
			ExternalInterface.call(GET_TITLE);
		}

		/** 
		* Задаёт заголовок HTML страницы.
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
		* Возвращает текст статусной панели окна.
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
		* Задаёт текст статусной панели окна.
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
		* Возвращает текст статусной панели окна, по-умолчанию.
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
		* Задаёт текст статусной панели окна, по-умолчанию.
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
		* Возвращает URL HTML страницы, фрейма в котором находится текущая программа.
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
		* Возвращает URL корневого фрейма, онсновной HTML страницы.
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
		* Возвращает активный якорь страницы. 
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
		* Задаёт активный якорь страницы.
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
		* Возвращает исходную строку сохранённых Cookie.
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
		* Задаёт сookie.
		* 
		* 
		* @public 
		* @param name Имя cookie параметра.
		* @param value Значение.
		* @param date Время хранения cookie.
		* @param path Путь, по котоорму будет доступен cookie.
		* @param domain Домен, для которого значение cookie действительно.
		* @param secure Если TRUE, то cookie будет пересылаться только через HTTPS.
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
		* Возвращает cookie по его имени.
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
		* Удаляет cookie.
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
		* Ссылка на JavaScript объект window. Этот объект используется в JavaScript, как глобальный и все глобально объявленные функции и свойства JavaScript будут доступны через него, как его методы и свойства. 
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
		* Ссылка на JavaScript объект document.
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
		* Ссылка на JavaScript объект navigator.
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
		* Ссылка на JavaScript объект HTML дерева данного экземпляра Flash Player'а.
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
		* Ссылка на JavaScript объект event.
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
		* Отчищвает стеки ссылок переданных(а зачит и сохранённых) объектов.
		* 
		* 
		* @public 
		* @param flCallbacks Отчистить стек функций переданных из среды JavaScript.
		* @param flObjects Отчистить стек объектов переданных из среды JavaScript.
		* @param jsCallbacks Отчистить стек функций переданных из среды Flash Player'а.
		* @param jsObjects Отчистить стек объектов переданных из среды Flash Player'а.
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
		* Получить значение из JavaScript среды, по пути в точечной нотации.
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
		* Загрузить файл с JavaScript в HTML документ.
		* 
		* 
		* @public 
		* @param url Путь к файлу
		* @param func Функция вызываемая по окончанию загрузки.
		* @param type Значение атрибута type тега SCRIPT, если не задано, то будет использовано стандартное - text/javascript.
		* @return JSHTMLElement HTML объект созданного тега SCRIPT, в который произойдёт загрузка.
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function loadJavaScript(url:String, func:Function=null, type:String=''):JSHTMLElement{
			return JSCore.loadJavaScript(url, func, type, JSHTMLElement) as JSHTMLElement;
		}

		/** 
		* Загрузить файл с CSS в HTML документ.
		* 
		* 
		* @public 
		* @param url Путь к файлу
		* @param func Функция вызываемая по окончанию загрузки. В браузере Fire Fox не вызывается событие onload, поэтому отловить окончание загрузки в такой способ невозможно и эта функция не будет вызвана.
		* @param type Значение атрибута type тега LINK, если не задано, то будет использовано стандартное - text/css.
		* @return JSHTMLElement HTML объект созданного тега LINK, в который произойдёт загрузка.
		* @see aw.external.jsinterface.objects.JSHTMLElement 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function loadCSS(url:String, func:Function=null, type:String=''):JSHTMLElement{
			return JSCore.loadCSS(url, func, type, JSHTMLElement) as JSHTMLElement;
		}

		/** 
		* Вызвать JavaScript метод по таймауту.
		* 
		* 
		* @public 
		* @param obj Объект, содержащий метод
		* @param propName Имя метода
		* @param args Аргументы перебаваемые в метод
		* @param func Функция в которую будет возвращён результат работы JavaScript функции
		* @param timeout Таймаут в миллисекундах
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function callLater(obj:*, propName:String, args:Array=null, func:Function=null, timeout:uint=1):void{
			JSCore.callLater(obj, propName, args, func, timeout);
		}
	}
}