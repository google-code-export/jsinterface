package aw.external.jsinterface.objects{
	import aw.external.jsinterface.JSDynamic;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/DocumentFragment.html">DocumentFragment</a>.
	 * Class ported by documentation <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSDocumentFragment extends JSNode{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'DocumentFragment';

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
		public function JSDocumentFragment(...args:Array):void{
			if(!args.length || args[0]!==JSDynamic.DO_NOT_CREATE_OBJECT){
				super(CLASS_NAME, args);
			}else init();
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return JSDocumentFragment 
		* @see aw.external.jsinterface.objects.JSDocumentFragment 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(...args:Array):JSDocumentFragment{
			return new JSDocumentFragment(CLASS_NAME, args);
		}
	}
}
