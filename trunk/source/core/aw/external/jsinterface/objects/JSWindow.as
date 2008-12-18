package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Window.html">Window</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSWindow extends JSDynamic{
		static public const CLASS_NAME:String = 'Window';
		static js_interface const DEFAULT_STATUS_PROPERTY:String = 'defaultStatus';
		static js_interface const NAME_PROPERTY:String = 'name';
		static js_interface const ON_BLUR_PROPERTY:String = 'onblur';
		static js_interface const ON_CHANGE_PROPERTY:String = 'onchange';
		static js_interface const ON_CLICK_PROPERTY:String = 'onclick';
		static js_interface const ON_CLOSE_PROPERTY:String = 'onclose';
		static js_interface const ON_ERROR_PROPERTY:String = 'onerror';
		static js_interface const ON_FOCUS_PROPERTY:String = 'onfocus';
		static js_interface const ON_KEY_DOWN_PROPERTY:String = 'onkeydown';
		static js_interface const ON_KEY_PRESS_PROPERTY:String = 'onkeypress';
		static js_interface const ON_KEY_UP_PROPERTY:String = 'onkeyup';
		static js_interface const ON_LOAD_PROPERTY:String = 'onload';
		static js_interface const ON_MOUSE_DOWN_PROPERTY:String = 'onmousedown';
		static js_interface const ON_MOUSE_MOVE_PROPERTY:String = 'onmousemove';
		static js_interface const ON_MOUSE_OUT_PROPERTY:String = 'onmouseout';
		static js_interface const ON_MOUSE_OVER_PROPERTY:String = 'onmouseover';
		static js_interface const ON_MOUSE_UP_PROPERTY:String = 'onmouseup';
		static js_interface const ON_MOVE_PROPERTY:String = 'onmove';
		static js_interface const ON_RESET_PROPERTY:String = 'onreset';
		static js_interface const ON_RESIZE_PROPERTY:String = 'onresize';
		static js_interface const ON_SELECT_PROPERTY:String = 'onselect';
		static js_interface const ON_SUBMIT_PROPERTY:String = 'onsubmit';
		static js_interface const ON_UNLOAD_PROPERTY:String = 'onunload';
		static js_interface const STATUS_PROPERTY:String = 'status';
		static js_interface const CLOSED_PROPERTY:String = 'closed';
		static js_interface const DOCUMENT_PROPERTY:String = 'document';
		static js_interface const EVENT_PROPERTY:String = 'event';
		static js_interface const FRAMES_PROPERTY:String = 'frames';
		static js_interface const HISTORY_PROPERTY:String = 'history';
		static js_interface const INNER_HEIGHT_PROPERTY:String = 'innerHeight';
		static js_interface const INNER_WIDTH_PROPERTY:String = 'innerWidth';
		static js_interface const LENGTH_PROPERTY:String = 'length';
		static js_interface const LOCATION_PROPERTY:String = 'location';
		static js_interface const NAVIGATOR_PROPERTY:String = 'navigator';
		static js_interface const OPENER_PROPERTY:String = 'opener';
		static js_interface const PARENT_PROPERTY:String = 'parent';
		static js_interface const SCREEN_PROPERTY:String = 'screen';
		static js_interface const SELF_PROPERTY:String = 'self';
		static js_interface const TOP_PROPERTY:String = 'top';
		static js_interface const WINDOW_PROPERTY:String = 'window';
		static js_interface const XML_HTTP_REQUEST_PROPERTY:String = 'XMLHttpRequest';
		static js_interface const ALERT_METHOD:String = 'alert';
		static js_interface const BACK_METHOD:String = 'back';
		static js_interface const BLUR_METHOD:String = 'blur';
		static js_interface const CLEAR_INTERVAL_METHOD:String = 'clearInterval';
		static js_interface const CLEAR_TIMEOUT_METHOD:String = 'clearTimeout';
		static js_interface const CLOSE_METHOD:String = 'close';
		static js_interface const CONFIRM_METHOD:String = 'confirm';
		static js_interface const FOCUS_METHOD:String = 'focus';
		static js_interface const GET_COMPUTED_STYLE_METHOD:String = 'getComputedStyle';
		static js_interface const MOVE_BY_METHOD:String = 'moveBy';
		static js_interface const MOVE_TO_METHOD:String = 'moveTo';
		static js_interface const OPEN_METHOD:String = 'open';
		static js_interface const PROMPT_METHOD:String = 'prompt';
		static js_interface const SCROLL_METHOD:String = 'scroll';
		static js_interface const SCROLL_BY_METHOD:String = 'scrollBy';
		static js_interface const SCROLL_TO_METHOD:String = 'scrollTo';
		static js_interface const SET_INTERVAL_METHOD:String = 'setInterval';
		static js_interface const SET_TIMEOUT_METHOD:String = 'setTimeout';
		public function JSWindow(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get defaultStatus():String{
			return this.internalGet(js_interface::DEFAULT_STATUS_PROPERTY);
		}
		public function set defaultStatus(p:String):void{
			this.internalSet(js_interface::DEFAULT_STATUS_PROPERTY, p);
		}
		public function get name():String{
			return this.internalGet(js_interface::NAME_PROPERTY);
		}
		public function set name(p:String):void{
			this.internalSet(js_interface::NAME_PROPERTY, p);
		}
		public function get onblur():Function{
			return this.internalGet(js_interface::ON_BLUR_PROPERTY);
		}
		public function set onblur(p:Function):void{
			this.internalSet(js_interface::ON_BLUR_PROPERTY, p);
		}
		public function get onchange():Function{
			return this.internalGet(js_interface::ON_CHANGE_PROPERTY);
		}
		public function set onchange(p:Function):void{
			this.internalSet(js_interface::ON_CHANGE_PROPERTY, p);
		}
		public function get onclick():Function{
			return this.internalGet(js_interface::ON_CLICK_PROPERTY);
		}
		public function set onclick(p:Function):void{
			this.internalSet(js_interface::ON_CLICK_PROPERTY, p);
		}
		public function get onclose():Function{
			return this.internalGet(js_interface::ON_CLOSE_PROPERTY);
		}
		public function set onclose(p:Function):void{
			this.internalSet(js_interface::ON_CLOSE_PROPERTY, p);
		}
		public function get onerror():Function{
			return this.internalGet(js_interface::ON_ERROR_PROPERTY);
		}
		public function set onerror(p:Function):void{
			this.internalSet(js_interface::ON_ERROR_PROPERTY, p);
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
		public function get onload():Function{
			return this.internalGet(js_interface::ON_LOAD_PROPERTY);
		}
		public function set onload(p:Function):void{
			this.internalSet(js_interface::ON_LOAD_PROPERTY, p);
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
		public function get onmove():Function{
			return this.internalGet(js_interface::ON_MOVE_PROPERTY);
		}
		public function set onmove(p:Function):void{
			this.internalSet(js_interface::ON_MOVE_PROPERTY, p);
		}
		public function get onreset():Function{
			return this.internalGet(js_interface::ON_RESET_PROPERTY);
		}
		public function set onreset(p:Function):void{
			this.internalSet(js_interface::ON_RESET_PROPERTY, p);
		}
		public function get onresize():Function{
			return this.internalGet(js_interface::ON_RESIZE_PROPERTY);
		}
		public function set onresize(p:Function):void{
			this.internalSet(js_interface::ON_RESIZE_PROPERTY, p);
		}
		public function get onselect():Function{
			return this.internalGet(js_interface::ON_SELECT_PROPERTY);
		}
		public function set onselect(p:Function):void{
			this.internalSet(js_interface::ON_SELECT_PROPERTY, p);
		}
		public function get onsubmit():Function{
			return this.internalGet(js_interface::ON_SUBMIT_PROPERTY);
		}
		public function set onsubmit(p:Function):void{
			this.internalSet(js_interface::ON_SUBMIT_PROPERTY, p);
		}
		public function get onunload():Function{
			return this.internalGet(js_interface::ON_UNLOAD_PROPERTY);
		}
		public function set onunload(p:Function):void{
			this.internalSet(js_interface::ON_UNLOAD_PROPERTY, p);
		}
		public function get status():String{
			return this.internalGet(js_interface::STATUS_PROPERTY);
		}
		public function set status(p:String):void{
			this.internalSet(js_interface::STATUS_PROPERTY, p);
		}
		public function get closed():Boolean{
			return this.internalGet(js_interface::CLOSED_PROPERTY);
		}
		public function set closed(p:Boolean):void{
			this.internalSet(js_interface::CLOSED_PROPERTY, p);
		}
		public function get document():JSDocument{
			return this.internalGet(js_interface::DOCUMENT_PROPERTY);
		}
		public function set document(p:JSDocument):void{
			this.internalSet(js_interface::DOCUMENT_PROPERTY, p);
		}
		public function get event():JSEvent{
			return this.internalGet(js_interface::EVENT_PROPERTY);
		}
		public function set event(p:JSEvent):void{
			this.internalSet(js_interface::EVENT_PROPERTY, p);
		}
		public function get frames():JSArray{
			var ret:JSArray = this.internalGet(js_interface::FRAMES_PROPERTY);
			if(ret) ret.js_interface::itemType = JSElement;
			return ret;
		}
		public function set frames(p:JSArray):void{
			this.internalSet(js_interface::FRAMES_PROPERTY, p);
		}
		public function get history():JSHistory{
			return this.internalGet(js_interface::HISTORY_PROPERTY);
		}
		public function set history(p:JSHistory):void{
			this.internalSet(js_interface::HISTORY_PROPERTY, p);
		}
		public function get innerHeight():Number{
			return this.internalGet(js_interface::INNER_HEIGHT_PROPERTY);
		}
		public function set innerHeight(p:Number):void{
			this.internalSet(js_interface::INNER_HEIGHT_PROPERTY, p);
		}
		public function get innerWidth():Number{
			return this.internalGet(js_interface::INNER_WIDTH_PROPERTY);
		}
		public function set innerWidth(p:Number):void{
			this.internalSet(js_interface::INNER_WIDTH_PROPERTY, p);
		}
		public function get length():Number{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		public function set length(p:Number):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		public function get location():JSLocation{
			return this.internalGet(js_interface::LOCATION_PROPERTY);
		}
		public function set location(p:JSLocation):void{
			this.internalSet(js_interface::LOCATION_PROPERTY, p);
		}
		public function get navigator():JSNavigator{
			return this.internalGet(js_interface::NAVIGATOR_PROPERTY);
		}
		public function set navigator(p:JSNavigator):void{
			this.internalSet(js_interface::NAVIGATOR_PROPERTY, p);
		}
		public function get opener():JSWindow{
			return this.internalGet(js_interface::OPENER_PROPERTY);
		}
		public function set opener(p:JSWindow):void{
			this.internalSet(js_interface::OPENER_PROPERTY, p);
		}
		public function get parent():JSWindow{
			return this.internalGet(js_interface::PARENT_PROPERTY);
		}
		public function set parent(p:JSWindow):void{
			this.internalSet(js_interface::PARENT_PROPERTY, p);
		}
		public function get screen():JSScreen{
			return this.internalGet(js_interface::SCREEN_PROPERTY);
		}
		public function set screen(p:JSScreen):void{
			this.internalSet(js_interface::SCREEN_PROPERTY, p);
		}
		public function get self():JSWindow{
			return this.internalGet(js_interface::SELF_PROPERTY);
		}
		public function set self(p:JSWindow):void{
			this.internalSet(js_interface::SELF_PROPERTY, p);
		}
		public function get top():JSWindow{
			return this.internalGet(js_interface::TOP_PROPERTY);
		}
		public function set top(p:JSWindow):void{
			this.internalSet(js_interface::TOP_PROPERTY, p);
		}
		public function get window():JSWindow{
			return this.internalGet(js_interface::WINDOW_PROPERTY);
		}
		public function set window(p:JSWindow):void{
			this.internalSet(js_interface::WINDOW_PROPERTY, p);
		}
		public function get XMLHttpRequest():Object{
			return this.internalGet(js_interface::XML_HTTP_REQUEST_PROPERTY);
		}
		public function set XMLHttpRequest(p:Object):void{
			this.internalSet(js_interface::XML_HTTP_REQUEST_PROPERTY, p);
		}
		public function alert(message:String):void{
			this.internalCall(js_interface::ALERT_METHOD, arguments);
		}
		public function back():void{
			this.internalCall(js_interface::BACK_METHOD, arguments);
		}
		public function blur():void{
			this.internalCall(js_interface::BLUR_METHOD, arguments);
		}
		public function clearInterval(intervalId:Object):void{
			this.internalCall(js_interface::CLEAR_INTERVAL_METHOD, arguments);
		}
		public function clearTimeout(timeoutId:Object):void{
			this.internalCall(js_interface::CLEAR_TIMEOUT_METHOD, arguments);
		}
		public function close():void{
			this.internalCall(js_interface::CLOSE_METHOD, arguments);
		}
		public function confirm(question:String):Boolean{
			return this.internalCall(js_interface::CONFIRM_METHOD, arguments);
		}
		public function focus():void{
			this.internalCall(js_interface::FOCUS_METHOD, arguments);
		}
		public function getComputedStyle(elt:JSElement, pseudoElt:String):JSCSSStyleDeclaration{
			return this.internalCall(js_interface::GET_COMPUTED_STYLE_METHOD, arguments);
		}
		public function moveBy(dx:int, dy:int):void{
			this.internalCall(js_interface::MOVE_BY_METHOD, arguments);
		}
		public function moveTo(x:Object, y:Object):void{
			this.internalCall(js_interface::MOVE_TO_METHOD, arguments);
		}
		public function open(url:String, name:String='', features:String='', replace:Boolean=false):JSWindow{
			return this.internalCall(js_interface::OPEN_METHOD, arguments);
		}
		public function prompt(message:String, default_:String):Object{
			return this.internalCall(js_interface::PROMPT_METHOD, arguments);
		}
		public function scroll(x:Object, y:Object):void{
			this.internalCall(js_interface::SCROLL_METHOD, arguments);
		}
		public function scrollBy(dx:int, dy:int):void{
			this.internalCall(js_interface::SCROLL_BY_METHOD, arguments);
		}
		public function scrollTo(x:Object, y:Object):void{
			this.internalCall(js_interface::SCROLL_TO_METHOD, arguments);
		}
		/**
		 * 
		 * ===================================== Проверить эти два метода на принимаемые параметры, особенно последнее - аргументы функции, как принимаются, args:Array или ...args:Array.
		 * 
		 */
		public function setInterval(code:String, func:Function, interval:Number, args:Array):Number{
			return this.internalCall(js_interface::SET_INTERVAL_METHOD, arguments);
		}
		public function setTimeout(code:String, func:Function, delay:String, args:Array):Number{
			return this.internalCall(js_interface::SET_TIMEOUT_METHOD, arguments);
		}
		static public function create(...args:Array):JSWindow{
			return new JSWindow(CLASS_NAME, args);
		}
	}
}