package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/StyleSheet.html">StyleSheet</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSStyleSheet extends JSDynamic{
		static public const CLASS_NAME:String = 'StyleSheet';
		static js_interface const DISABLED_PROPERTY:String = 'disabled';
		static js_interface const HREF_PROPERTY:String = 'href';
		static js_interface const MEDIA_PROPERTY:String = 'media';
		static js_interface const OWNER_NODE_PROPERTY:String = 'ownerNode';
		static js_interface const PARENT_STYLE_SHEET_PROPERTY:String = 'parentStyleSheet';
		static js_interface const TITLE_PROPERTY:String = 'title';
		static js_interface const TYPE_PROPERTY:String = 'type';
		public function JSStyleSheet(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get disabled():Boolean{
			return this.internalGet(js_interface::DISABLED_PROPERTY);
		}
		public function set disabled(p:Boolean):void{
			this.internalSet(js_interface::DISABLED_PROPERTY, p);
		}
		public function get href():String{
			return this.internalGet(js_interface::HREF_PROPERTY);
		}
		public function set href(p:String):void{
			this.internalSet(js_interface::HREF_PROPERTY, p);
		}
		public function get media():JSMediaList{
			return this.internalGet(js_interface::MEDIA_PROPERTY);
		}
		public function set media(p:JSMediaList):void{
			this.internalSet(js_interface::MEDIA_PROPERTY, p);
		}
		public function get ownerNode():JSNode{
			return this.internalGet(js_interface::OWNER_NODE_PROPERTY);
		}
		public function set ownerNode(p:JSNode):void{
			this.internalSet(js_interface::OWNER_NODE_PROPERTY, p);
		}
		public function get parentStyleSheet():JSStyleSheet{
			return this.internalGet(js_interface::PARENT_STYLE_SHEET_PROPERTY);
		}
		public function set parentStyleSheet(p:JSStyleSheet):void{
			this.internalSet(js_interface::PARENT_STYLE_SHEET_PROPERTY, p);
		}
		public function get title():String{
			return this.internalGet(js_interface::TITLE_PROPERTY);
		}
		public function set title(p:String):void{
			this.internalSet(js_interface::TITLE_PROPERTY, p);
		}
		public function get type():String{
			return this.internalGet(js_interface::TYPE_PROPERTY);
		}
		public function set type(p:String):void{
			this.internalSet(js_interface::TYPE_PROPERTY, p);
		}
		static public function create(...args:Array):JSStyleSheet{
			return new JSStyleSheet(CLASS_NAME, args);
		}
	}
}