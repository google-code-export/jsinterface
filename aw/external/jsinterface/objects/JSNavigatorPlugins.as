package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	* @see aw.external.jsinterface.objects.JSArray 
	*/
	public dynamic class JSNavigatorPlugins extends JSArray{
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'Array';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const REFRESH_METHOD:String = 'refresh';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSNavigatorPlugins(className:String='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		/** 
		* 
		* @public 
		* @param reload 
		* @return Object 
		*/
		public function refresh(reload:Boolean=false):Object{
			return this.internalCall(js_interface::REFRESH_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSNavigatorPlugins 
		* @see aw.external.jsinterface.objects.JSNavigatorPlugins 
		*/
		static public function create(...args:Array):JSNavigatorPlugins{
			return new JSNavigatorPlugins(CLASS_NAME, args);
		}
	}
}