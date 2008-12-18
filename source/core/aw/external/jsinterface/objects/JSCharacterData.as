package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/CharacterData.html">CharacterData</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSCharacterData extends JSNode{
		static public const CLASS_NAME:String = 'CharacterData';
		static js_interface const DATA_PROPERTY:String = 'data';
		static js_interface const LENGTH_PROPERTY:String = 'length';
		static js_interface const APPEND_DATA_METHOD:String = 'appendData';
		static js_interface const DELETE_DATA_METHOD:String = 'deleteData';
		static js_interface const INSERT_DATA_METHOD:String = 'insertData';
		static js_interface const REPLACE_DATA_METHOD:String = 'replaceData';
		static js_interface const SUBSTRING_DATA_METHOD:String = 'substringData';
		public function JSCharacterData(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get data():String{
			return this.internalGet(js_interface::DATA_PROPERTY);
		}
		public function set data(p:String):void{
			this.internalSet(js_interface::DATA_PROPERTY, p);
		}
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		public function appendData(str:String):void{
			this.internalCall(js_interface::APPEND_DATA_METHOD, arguments);
		}
		public function deleteData(offset:int, count:int):void{
			this.internalCall(js_interface::DELETE_DATA_METHOD, arguments);
		}
		public function insertData(offset:int, str:String):void{
			this.internalCall(js_interface::INSERT_DATA_METHOD, arguments);
		}
		public function replaceData(offset:int, count:int, str:String):void{
			this.internalCall(js_interface::REPLACE_DATA_METHOD, arguments);
		}
		public function substringData(offset:int, count:int):String{
			return this.internalCall(js_interface::SUBSTRING_DATA_METHOD, arguments);
		}
		static public function create(...args:Array):JSCharacterData{
			return new JSCharacterData(CLASS_NAME, args);
		}
	}
}