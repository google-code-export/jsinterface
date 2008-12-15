package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Plugin.html">Plugin</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSPlugin extends JSDynamic{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Plugin';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const DESCRIPTION_PROPERTY:String = 'description';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const FILENAME_PROPERTY:String = 'filename';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const LENGTH_PROPERTY:String = 'length';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const NAME_PROPERTY:String = 'name';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSPlugin(className:String='', args:*=null):void{
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
		* @return String 
		*/
		public function get filename():String{
			return this.internalGet(js_interface::FILENAME_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set filename(p:String):void{
			this.internalSet(js_interface::FILENAME_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return int 
		*/
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get name():String{
			return this.internalGet(js_interface::NAME_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set name(p:String):void{
			this.internalSet(js_interface::NAME_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSPlugin 
		* @see aw.external.jsinterface.objects.JSPlugin 
		*/
		static public function create(...args:Array):JSPlugin{
			return new JSPlugin(CLASS_NAME, args);
		}
	}
}