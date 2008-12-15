package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/MimeType.html">MimeType</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSMimeType extends JSDynamic{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'MimeType';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const DESCRIPTION_PROPERTY:String = 'description';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ENABLED_PLUGIN_PROPERTY:String = 'enabledPlugin';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SUFFIXES_PROPERTY:String = 'suffixes';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const TYPE_PROPERTY:String = 'type';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSMimeType(className:String='', args:*=null):void{
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
		public function get description():String{
			return this.internalGet(js_interface::DESCRIPTION_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set description(p:String):void{
			this.internalSet(js_interface::DESCRIPTION_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return Object 
		*/
		public function get enabledPlugin():Object{
			return this.internalGet(js_interface::ENABLED_PLUGIN_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set enabledPlugin(p:Object):void{
			this.internalSet(js_interface::ENABLED_PLUGIN_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get suffixes():String{
			return this.internalGet(js_interface::SUFFIXES_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set suffixes(p:String):void{
			this.internalSet(js_interface::SUFFIXES_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get type():String{
			return this.internalGet(js_interface::TYPE_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set type(p:String):void{
			this.internalSet(js_interface::TYPE_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSMimeType 
		* @see aw.external.jsinterface.objects.JSMimeType 
		*/
		static public function create(...args:Array):JSMimeType{
			return new JSMimeType(CLASS_NAME, args);
		}
	}
}