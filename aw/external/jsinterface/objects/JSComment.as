package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM2.index.html">HTML DOM Level 2 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Comment.html">Comment</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSComment extends JSCharacterData{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Comment';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSComment(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSComment 
		* @see aw.external.jsinterface.objects.JSComment 
		*/
		static public function create(...args:Array):JSComment{
			return new JSComment(CLASS_NAME, args);
		}
	}
}