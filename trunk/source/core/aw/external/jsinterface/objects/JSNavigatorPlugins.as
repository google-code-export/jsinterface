package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	

	/** 
	* 
	* 
	* 
	* @private 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @see aw.external.jsinterface.objects.JSArray 
	*/
	public dynamic class JSNavigatorPlugins extends JSArray{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'Array';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const REFRESH_METHOD:String = 'refresh';

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
		public function JSNavigatorPlugins(...args:Array):void{
			if(!args.length || args[0]!==JSDynamic.DO_NOT_CREATE_OBJECT){
				super(CLASS_NAME, args);
			}else init();
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param reload 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function refresh(reload:Boolean=false):Object{
			return this.internalCall(js_interface::REFRESH_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return JSNavigatorPlugins 
		* @see aw.external.jsinterface.objects.JSNavigatorPlugins 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(...args:Array):JSNavigatorPlugins{
			return new JSNavigatorPlugins(CLASS_NAME, args);
		}
	}
}