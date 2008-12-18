package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/HTMLDOM0.index.html">HTML DOM Level 0 Reference</a> :: <a href="http://www.aptana.com/reference/html/api/History.html">History</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSHistory extends JSDynamic{
		static public const CLASS_NAME:String = 'History';
		static js_interface const LENGTH_PROPERTY:String = 'length';
		static js_interface const BACK_METHOD:String = 'back';
		static js_interface const FORWARD_METHOD:String = 'forward';
		static js_interface const GO_METHOD:String = 'go';
		public function JSHistory(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function get length():int{
			return this.internalGet(js_interface::LENGTH_PROPERTY);
		}
		public function set length(p:int):void{
			this.internalSet(js_interface::LENGTH_PROPERTY, p);
		}
		public function back():void{
			this.internalCall(js_interface::BACK_METHOD, arguments);
		}
		public function forward():void{
			this.internalCall(js_interface::FORWARD_METHOD, arguments);
		}
		public function go(relative_position:Number, target_string:String):void{
			this.internalCall(js_interface::GO_METHOD, arguments);
		}
		static public function create(...args:Array):JSHistory{
			return new JSHistory(CLASS_NAME, args);
		}
	}
}