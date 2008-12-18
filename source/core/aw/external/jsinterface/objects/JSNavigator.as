package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Navigator.html">Navigator</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSNavigator extends JSDynamic{
		static public const CLASS_NAME:String = 'Navigator';
		static js_interface const APP_CODE_NAME_PROPERTY:String = 'appCodeName';
		static js_interface const APP_NAME_PROPERTY:String = 'appName';
		static js_interface const APP_VERSION_PROPERTY:String = 'appVersion';
		static js_interface const COOKIE_ENABLED_PROPERTY:String = 'cookieEnabled';
		static js_interface const LANGUAGE_PROPERTY:String = 'language';
		static js_interface const MIME_TYPES_PROPERTY:String = 'mimeTypes';
		static js_interface const PLATFORM_PROPERTY:String = 'platform';
		static js_interface const PLUGINS_PROPERTY:String = 'plugins';
		static js_interface const USER_AGENT_PROPERTY:String = 'userAgent';
		static js_interface const JAVA_ENABLED_METHOD:String = 'javaEnabled';
		public function JSNavigator(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get appCodeName():String{
			return this.internalGet(js_interface::APP_CODE_NAME_PROPERTY);
		}
		public function set appCodeName(p:String):void{
			this.internalSet(js_interface::APP_CODE_NAME_PROPERTY, p);
		}
		public function get appName():String{
			return this.internalGet(js_interface::APP_NAME_PROPERTY);
		}
		public function set appName(p:String):void{
			this.internalSet(js_interface::APP_NAME_PROPERTY, p);
		}
		public function get appVersion():String{
			return this.internalGet(js_interface::APP_VERSION_PROPERTY);
		}
		public function set appVersion(p:String):void{
			this.internalSet(js_interface::APP_VERSION_PROPERTY, p);
		}
		public function get cookieEnabled():Boolean{
			return this.internalGet(js_interface::COOKIE_ENABLED_PROPERTY);
		}
		public function set cookieEnabled(p:Boolean):void{
			this.internalSet(js_interface::COOKIE_ENABLED_PROPERTY, p);
		}
		public function get language():String{
			return this.internalGet(js_interface::LANGUAGE_PROPERTY);
		}
		public function set language(p:String):void{
			this.internalSet(js_interface::LANGUAGE_PROPERTY, p);
		}
		public function get mimeTypes():JSArray{
			var ret:JSArray = this.internalGet(js_interface::MIME_TYPES_PROPERTY);
			if(ret) ret.js_interface::itemType = JSMimeType;
			return ret;
		}
		public function set mimeTypes(p:JSArray):void{
			this.internalSet(js_interface::MIME_TYPES_PROPERTY, p);
		}
		public function get platform():String{
			return this.internalGet(js_interface::PLATFORM_PROPERTY);
		}
		public function set platform(p:String):void{
			this.internalSet(js_interface::PLATFORM_PROPERTY, p);
		}
		public function get plugins():JSNavigatorPlugins{
			var ret:JSNavigatorPlugins = this.internalGet(js_interface::PLUGINS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSPlugin;
			return ret;
		}
		public function set plugins(p:JSNavigatorPlugins):void{
			this.internalSet(js_interface::PLUGINS_PROPERTY, p);
		}
		public function get userAgent():String{
			return this.internalGet(js_interface::USER_AGENT_PROPERTY);
		}
		public function set userAgent(p:String):void{
			this.internalSet(js_interface::USER_AGENT_PROPERTY, p);
		}
		public function javaEnabled():Boolean{
			return this.internalCall(js_interface::JAVA_ENABLED_METHOD, arguments);
		}
		static public function create(...args:Array):JSNavigator{
			return new JSNavigator(CLASS_NAME, args);
		}
	}
}