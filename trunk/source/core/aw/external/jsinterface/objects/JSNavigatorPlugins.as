package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	
	public dynamic class JSNavigatorPlugins extends JSArray{
		static public const CLASS_NAME:String = 'Array';
		static js_interface const REFRESH_METHOD:String = 'refresh';
		public function JSNavigatorPlugins(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function refresh(reload:Boolean=false):Object{
			return this.internalCall(js_interface::REFRESH_METHOD, arguments);
		}
		static public function create(...args:Array):JSNavigatorPlugins{
			return new JSNavigatorPlugins(CLASS_NAME, args);
		}
	}
}