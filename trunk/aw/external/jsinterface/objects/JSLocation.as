package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Location.html">Location</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSLocation extends JSDynamic{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Location';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const HASH_PROPERTY:String = 'hash';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const HOST_PROPERTY:String = 'host';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const HOSTNAME_PROPERTY:String = 'hostname';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const HREF_PROPERTY:String = 'href';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const PATHNAME_PROPERTY:String = 'pathname';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const PORT_PROPERTY:String = 'port';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const PROTOCOL_PROPERTY:String = 'protocol';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SEARCH_PROPERTY:String = 'search';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const RELOAD_METHOD:String = 'reload';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const REPLACE_METHOD:String = 'replace';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSLocation(className:String='', args:*=null):void{
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
		public function get hash():String{
			return this.internalGet(js_interface::HASH_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set hash(p:String):void{
			this.internalSet(js_interface::HASH_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get host():String{
			return this.internalGet(js_interface::HOST_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set host(p:String):void{
			this.internalSet(js_interface::HOST_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get hostname():String{
			return this.internalGet(js_interface::HOSTNAME_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set hostname(p:String):void{
			this.internalSet(js_interface::HOSTNAME_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get href():String{
			return this.internalGet(js_interface::HREF_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set href(p:String):void{
			this.internalSet(js_interface::HREF_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get pathname():String{
			return this.internalGet(js_interface::PATHNAME_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set pathname(p:String):void{
			this.internalSet(js_interface::PATHNAME_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get port():String{
			return this.internalGet(js_interface::PORT_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set port(p:String):void{
			this.internalSet(js_interface::PORT_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get protocol():String{
			return this.internalGet(js_interface::PROTOCOL_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set protocol(p:String):void{
			this.internalSet(js_interface::PROTOCOL_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get search():String{
			return this.internalGet(js_interface::SEARCH_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set search(p:String):void{
			this.internalSet(js_interface::SEARCH_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param force 
		* @return Object 
		*/
		public function reload(force:Boolean):Object{
			return this.internalCall(js_interface::RELOAD_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param url 
		* @return Object 
		*/
		public function replace(url:String):Object{
			return this.internalCall(js_interface::REPLACE_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSLocation 
		* @see aw.external.jsinterface.objects.JSLocation 
		*/
		static public function create(...args:Array):JSLocation{
			return new JSLocation(CLASS_NAME, args);
		}
	}
}