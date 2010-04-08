package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Text.html">Text</a>.
	 * Class ported by documentation <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSText extends JSCharacterData{
		
		/** 
		 * 
		 * 
		 * 
		 * @public (constant) 
		 * @langversion ActionScript 3.0 
		 * @playerversion Flash 9.0.28.0 
		 */
		static public const CLASS_NAME:String = 'Text';
		
		/** 
		 * 
		 * 
		 * 
		 * @public (js_interface,constant) 
		 * @langversion ActionScript 3.0 
		 * @playerversion Flash 9.0.28.0 
		 */
		static js_interface const SPLIT_TEXT_METHOD:String = 'splitText';
		
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
		public function JSText(...args:Array):void{
			if(!args.length || args[0]!==JSDynamic.DO_NOT_CREATE_OBJECT){
				super(CLASS_NAME, args);
			}else init();
		}
		
		/** 
		 * 
		 * 
		 * 
		 * @public 
		 * @param str 
		 * @return void 
		 * @langversion ActionScript 3.0 
		 * @playerversion Flash 9.0.28.0 
		 */
		public function splitText(offset:int):JSText{
			return this.internalCall(this.js_interface::SPLIT_TEXT_METHOD, arguments);
		}
		
		/** 
		 * 
		 * 
		 * 
		 * @public 
		 * @param args 
		 * @return JSCharacterData 
		 * @see aw.external.jsinterface.objects.JSText 
		 * @langversion ActionScript 3.0 
		 * @playerversion Flash 9.0.28.0 
		 */
		static public function create(...args:Array):JSText{
			return new JSText(CLASS_NAME, args);
		}
	}
}