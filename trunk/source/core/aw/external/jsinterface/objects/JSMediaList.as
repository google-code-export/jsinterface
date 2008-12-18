package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/MediaList.html">MediaList</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSMediaList extends JSDynamic{
		static public const CLASS_NAME:String = 'MediaList';
		static js_interface const LENGTH_PROPERTY:String = 'length';
		static js_interface const MEDIA_TEXT_PROPERTY:String = 'mediaText';
		static js_interface const APPEND_MEDIUM_METHOD:String = 'appendMedium';
		static js_interface const DELETE_MEDIUM_METHOD:String = 'deleteMedium';
		static js_interface const ITEM_METHOD:String = 'item';
		public function JSMediaList(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		public function get mediaText():String{
			return this.internalGet(js_interface::MEDIA_TEXT_PROPERTY);
		}
		public function set mediaText(p:String):void{
			this.internalSet(js_interface::MEDIA_TEXT_PROPERTY, p);
		}
		public function appendMedium(newMedium:String):void{
			this.internalCall(js_interface::APPEND_MEDIUM_METHOD, arguments);
		}
		public function deleteMedium(oldMedium:String):void{
			this.internalCall(js_interface::DELETE_MEDIUM_METHOD, arguments);
		}
		public function item(index:int):String{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
		}
		static public function create(...args:Array):JSMediaList{
			return new JSMediaList(CLASS_NAME, args);
		}
	}
} 