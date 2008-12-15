package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/NodeList.html">NodeList</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSNodeList extends JSArray{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'NodeList';
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
		public function JSNodeList(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public 
		* @param index 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		*/
		public function item(index:int):JSNode{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSNodeList 
		* @see aw.external.jsinterface.objects.JSNodeList 
		*/
		static public function create(...args:Array):JSNodeList{
			return new JSNodeList(CLASS_NAME, args);
		}
	}
}