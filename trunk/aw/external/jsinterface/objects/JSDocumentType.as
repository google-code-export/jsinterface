package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/DocumentType.html">DocumentType</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSDocumentType extends JSNode{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'DocumentType';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ENTITIES_PROPERTY:String = 'entities';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const INTERNAL_SUBSET_PROPERTY:String = 'internalSubset';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const NAME_PROPERTY:String = 'name';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const NOTATIONS_PROPERTY:String = 'notations';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const PUBLIC_ID_PROPERTY:String = 'publicId';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SYSTEM_ID_PROPERTY:String = 'systemId';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSDocumentType(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public (getter) 
		* @return JSNamedNodeMap 
		* @see aw.external.jsinterface.objects.JSNamedNodeMap 
		*/
		public function get entities():JSNamedNodeMap{
			return this.internalGet(js_interface::ENTITIES_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSNamedNodeMap 
		*/
		public function set entities(p:JSNamedNodeMap):void{
			this.internalSet(js_interface::JSNamedNodeMap, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get internalSubset():String{
			return this.internalGet(js_interface::INTERNAL_SUBSET_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set internalSubset(p:String):void{
			this.internalSet(js_interface::INTERNAL_SUBSET_PROPERTY, p);
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
		* @return JSNamedNodeMap 
		* @see aw.external.jsinterface.objects.JSNamedNodeMap 
		*/
		public function get notations():JSNamedNodeMap{
			return this.internalGet(js_interface::NOTATIONS_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		* @see aw.external.jsinterface.objects.JSNamedNodeMap 
		*/
		public function set notations(p:JSNamedNodeMap):void{
			this.internalSet(js_interface::NOTATIONS_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get publicId():String{
			return this.internalGet(js_interface::PUBLIC_ID_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set publicId(p:String):void{
			this.internalSet(js_interface::PUBLIC_ID_PROPERTY, p);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get systemId():String{
			return this.internalGet(js_interface::SYSTEM_ID_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set systemId(p:String):void{
			this.internalSet(js_interface::SYSTEM_ID_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSDocumentType 
		* @see aw.external.jsinterface.objects.JSDocumentType 
		*/
		static public function create(...args:Array):JSDocumentType{
			return new JSDocumentType(CLASS_NAME, args);
		}
	}
}