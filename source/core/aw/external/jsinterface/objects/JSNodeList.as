package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/NodeList.html">NodeList</a>.
	 * Class ported by documentation <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSNodeList extends JSArray{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'NodeList';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const ITEM_METHOD:String = 'item';

		/** 
		* 
		* 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSNodeList(...args:Array):void{
			if(!args.length || args[0]!==JSDynamic.DO_NOT_CREATE_OBJECT){
				super(CLASS_NAME, args);
			}else init();
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param index 
		* @return JSNode 
		* @see aw.external.jsinterface.objects.JSNode 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function item(index:int):JSNode{
			return this.internalCall(js_interface::ITEM_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return JSNodeList 
		* @see aw.external.jsinterface.objects.JSNodeList 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(...args:Array):JSNodeList{
			return new JSNodeList(CLASS_NAME, args);
		}
	}
}