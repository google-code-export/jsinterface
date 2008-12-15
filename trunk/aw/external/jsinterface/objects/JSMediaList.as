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
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'MediaList';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const LENGTH_PROPERTY:String = 'length';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const MEDIA_TEXT_PROPERTY:String = 'mediaText';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const APPEND_MEDIUM_METHOD:String = 'appendMedium';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const DELETE_MEDIUM_METHOD:String = 'deleteMedium';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const ITEM_METHOD:String = 'item';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSMediaList(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
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
		public function get mediaText():String{
			return this.internalGet(js_interface::MEDIA_TEXT_PROPERTY);
		}
		/** 
		* 
		* @public (setter) 
		* @param p 
		* @return void 
		*/
		public function set mediaText(p:String):void{
			this.internalSet(js_interface::MEDIA_TEXT_PROPERTY, p);
		}
		/** 
		* 
		* @public 
		* @param newMedium 
		* @return void 
		*/
		public function appendMedium(newMedium:String):void{
			this.internalCall(js_interface::APPEND_MEDIUM_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param oldMedium 
		* @return void 
		*/
		public function deleteMedium(oldMedium:String):void{
			this.internalCall(js_interface::DELETE_MEDIUM_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param index 
		* @return String 
		*/
		public function item(index:int):String{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSMediaList 
		* @see aw.external.jsinterface.objects.JSMediaList 
		*/
		static public function create(...args:Array):JSMediaList{
			return new JSMediaList(CLASS_NAME, args);
		}
	}
} 