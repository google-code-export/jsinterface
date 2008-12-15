package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/CharacterData.html">CharacterData</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSCharacterData extends JSNode{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'CharacterData';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const DATA_PROPERTY:String = 'data';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const LENGTH_PROPERTY:String = 'length';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const APPEND_DATA_METHOD:String = 'appendData';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const DELETE_DATA_METHOD:String = 'deleteData';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const INSERT_DATA_METHOD:String = 'insertData';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const REPLACE_DATA_METHOD:String = 'replaceData';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const SUBSTRING_DATA_METHOD:String = 'substringData';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSCharacterData(className:String='', args:*=null):void{
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
		public function get data():String{
			return this.internalGet(js_interface::DATA_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set data(p:String):void{
			this.internalSet(js_interface::DATA_PROPERTY, p);
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
		* @public 
		* @param str 
		* @return void 
		*/
		public function appendData(str:String):void{
			this.internalCall(js_interface::APPEND_DATA_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param offset 
		* @param count 
		* @return void 
		*/
		public function deleteData(offset:int, count:int):void{
			this.internalCall(js_interface::DELETE_DATA_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param offset 
		* @param str 
		* @return void 
		*/
		public function insertData(offset:int, str:String):void{
			this.internalCall(js_interface::INSERT_DATA_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param offset 
		* @param count 
		* @param str 
		* @return void 
		*/
		public function replaceData(offset:int, count:int, str:String):void{
			this.internalCall(js_interface::REPLACE_DATA_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param offset 
		* @param count 
		* @return String 
		*/
		public function substringData(offset:int, count:int):String{
			return this.internalCall(js_interface::SUBSTRING_DATA_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSCharacterData 
		* @see aw.external.jsinterface.objects.JSCharacterData 
		*/
		static public function create(...args:Array):JSCharacterData{
			return new JSCharacterData(CLASS_NAME, args);
		}
	}
}