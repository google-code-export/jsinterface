package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/DocumentType.html">DocumentType</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSDocumentType extends JSNode{
		static public const CLASS_NAME:String = 'DocumentType';
		static js_interface const ENTITIES_PROPERTY:String = 'entities';
		static js_interface const INTERNAL_SUBSET_PROPERTY:String = 'internalSubset';
		static js_interface const NAME_PROPERTY:String = 'name';
		static js_interface const NOTATIONS_PROPERTY:String = 'notations';
		static js_interface const PUBLIC_ID_PROPERTY:String = 'publicId';
		static js_interface const SYSTEM_ID_PROPERTY:String = 'systemId';
		public function JSDocumentType(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get entities():JSNamedNodeMap{
			return this.internalGet(js_interface::ENTITIES_PROPERTY);
		}
		public function set entities(p:JSNamedNodeMap):void{
			this.internalSet(js_interface::JSNamedNodeMap, p);
		}
		public function get internalSubset():String{
			return this.internalGet(js_interface::INTERNAL_SUBSET_PROPERTY);
		}
		public function set internalSubset(p:String):void{
			this.internalSet(js_interface::INTERNAL_SUBSET_PROPERTY, p);
		}
		public function get name():String{
			return this.internalGet(js_interface::NAME_PROPERTY);
		}
		public function set name(p:String):void{
			this.internalSet(js_interface::NAME_PROPERTY, p);
		}
		public function get notations():JSNamedNodeMap{
			return this.internalGet(js_interface::NOTATIONS_PROPERTY);
		}
		public function set notations(p:JSNamedNodeMap):void{
			this.internalSet(js_interface::NOTATIONS_PROPERTY, p);
		}
		public function get publicId():String{
			return this.internalGet(js_interface::PUBLIC_ID_PROPERTY);
		}
		public function set publicId(p:String):void{
			this.internalSet(js_interface::PUBLIC_ID_PROPERTY, p);
		}
		public function get systemId():String{
			return this.internalGet(js_interface::SYSTEM_ID_PROPERTY);
		}
		public function set systemId(p:String):void{
			this.internalSet(js_interface::SYSTEM_ID_PROPERTY, p);
		}
		static public function create(...args:Array):JSDocumentType{
			return new JSDocumentType(CLASS_NAME, args);
		}
	}
}