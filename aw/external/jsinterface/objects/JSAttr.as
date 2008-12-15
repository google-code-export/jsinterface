package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Attr.html">Attr</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSAttr extends JSNode{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Attr';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const NAME_PROPERTY:String = 'name';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const OWNER_ELEMENT_PROPERTY:String = 'ownerElement';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SPECIFIED_PROPERTY:String = 'specified';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const VALUE_PROPERTY:String = 'value';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSAttr(className:String='', args:*=null):void{
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
		* @public (getter) 
		* @return JSElement 
		* @see aw.external.jsinterface.objects.JSElement 
		*/
		public function get ownerElement():JSElement{
			return this.internalGet(js_interface::OWNER_ELEMENT_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSElement 
		*/
		public function set ownerElement(p:JSElement):void{
			this.internalSet(js_interface::OWNER_ELEMENT_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return Boolean 
		*/
		public function get specified():Boolean{
			return this.internalGet(js_interface::SPECIFIED_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set specified(p:Boolean):void{
			this.internalSet(js_interface::SPECIFIED_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get value():String{
			return this.internalGet(js_interface::VALUE_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set value(p:String):void{
			this.internalSet(js_interface::VALUE_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSAttr 
		* @see aw.external.jsinterface.objects.JSAttr 
		*/
		static public function create(...args:Array):JSAttr{
			return new JSAttr(CLASS_NAME, args);
		}
	}
}
