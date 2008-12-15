package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Navigator.html">Navigator</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSNavigator extends JSDynamic{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Navigator';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const APP_CODE_NAME_PROPERTY:String = 'appCodeName';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const APP_NAME_PROPERTY:String = 'appName';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const APP_VERSION_PROPERTY:String = 'appVersion';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const COOKIE_ENABLED_PROPERTY:String = 'cookieEnabled';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const LANGUAGE_PROPERTY:String = 'language';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const MIME_TYPES_PROPERTY:String = 'mimeTypes';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const PLATFORM_PROPERTY:String = 'platform';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const PLUGINS_PROPERTY:String = 'plugins';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const USER_AGENT_PROPERTY:String = 'userAgent';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const JAVA_ENABLED_METHOD:String = 'javaEnabled';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSNavigator(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get appCodeName():String{
			return this.internalGet(js_interface::APP_CODE_NAME_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set appCodeName(p:String):void{
			this.internalSet(js_interface::APP_CODE_NAME_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get appName():String{
			return this.internalGet(js_interface::APP_NAME_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set appName(p:String):void{
			this.internalSet(js_interface::APP_NAME_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get appVersion():String{
			return this.internalGet(js_interface::APP_VERSION_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set appVersion(p:String):void{
			this.internalSet(js_interface::APP_VERSION_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return Boolean 
		*/
		public function get cookieEnabled():Boolean{
			return this.internalGet(js_interface::COOKIE_ENABLED_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set cookieEnabled(p:Boolean):void{
			this.internalSet(js_interface::COOKIE_ENABLED_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get language():String{
			return this.internalGet(js_interface::LANGUAGE_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set language(p:String):void{
			this.internalSet(js_interface::LANGUAGE_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return JSArray 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function get mimeTypes():JSArray{
			var ret:JSArray = this.internalGet(js_interface::MIME_TYPES_PROPERTY);
			if(ret) ret.js_interface::itemType = JSMimeType;
			return ret;
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSArray 
		*/
		public function set mimeTypes(p:JSArray):void{
			this.internalSet(js_interface::MIME_TYPES_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get platform():String{
			return this.internalGet(js_interface::PLATFORM_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set platform(p:String):void{
			this.internalSet(js_interface::PLATFORM_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return JSNavigatorPlugins 
		* @see aw.external.jsinterface.objects.JSNavigatorPlugins 
		*/
		public function get plugins():JSNavigatorPlugins{
			var ret:JSNavigatorPlugins = this.internalGet(js_interface::PLUGINS_PROPERTY);
			if(ret) ret.js_interface::itemType = JSPlugin;
			return ret;
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSNavigatorPlugins 
		*/
		public function set plugins(p:JSNavigatorPlugins):void{
			this.internalSet(js_interface::PLUGINS_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get userAgent():String{
			return this.internalGet(js_interface::USER_AGENT_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set userAgent(p:String):void{
			this.internalSet(js_interface::USER_AGENT_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @return Boolean 
		*/
		public function javaEnabled():Boolean{
			return this.internalCall(js_interface::JAVA_ENABLED_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSNavigator 
		* @see aw.external.jsinterface.objects.JSNavigator 
		*/
		static public function create(...args:Array):JSNavigator{
			return new JSNavigator(CLASS_NAME, args);
		}
	}
}