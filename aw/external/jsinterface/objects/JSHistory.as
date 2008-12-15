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
		/** 
		* 
		* @public (constant) 
		*/
		static public const CLASS_NAME:String = 'History';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const LENGTH_PROPERTY:String = 'length';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const BACK_METHOD:String = 'back';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const FORWARD_METHOD:String = 'forward';
		/** 
		* 
		* @public (js_interface,constant) 
		*/
		static js_interface const GO_METHOD:String = 'go';
		/** 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		*/
		public function JSHistory(className:String='', args:*=null):void{
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
		* @public 
		* @return void 
		*/
		public function back():void{
			this.internalCall(js_interface::BACK_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @return void 
		*/
		public function forward():void{
			this.internalCall(js_interface::FORWARD_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param relative_position 
		* @param target_string 
		* @return void 
		*/
		public function go(relative_position:Number, target_string:String):void{
			this.internalCall(js_interface::GO_METHOD, arguments);
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return JSHistory 
		* @see aw.external.jsinterface.objects.JSHistory 
		*/
		static public function create(...args:Array):JSHistory{
			return new JSHistory(CLASS_NAME, args);
		}
	}
}