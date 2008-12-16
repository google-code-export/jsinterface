package aw.external.jsinterface{
	import aw.external.js_interface;
	
	import flash.utils.Dictionary;
	[ExcludeClass]
	/**
	 *  @private
	 */
	public class JSInstanceCache extends Object{
		/** 
		* 
		* @private 
		*/
		static private var _instances:Dictionary = new Dictionary(true);
		/** 
		* 
		* @public 
		* @param name 
		* @param obj 
		* @return void 
		* @see aw.external.jsinterface.JSDynamic 
		*/
		static public function addToCache(name:String, obj:JSDynamic):void{
			_instances[obj] = name;
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return void 
		*/
		static public function removeFromCache(name:String):void{
			for(var p:* in _instances){
				if(_instances[p]==name){
					delete _instances[p];
					break;
				}
			}
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		*/
		static public function getFromCache(name:String):JSDynamic{
			for(var p:* in _instances){
				if(_instances[p]==name){
					return p;
				}
			}
			return null;
		}
		/** 
		* 
		* @public 
		* @return void 
		*/
		static public function clear():void{
			for(var p:* in _instances){
				delete _instances[p];
			}
			_instances = new Dictionary(true);
		}
		/** 
		* 
		* @public 
		* @param name 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		*/
		static public function getByName(name:String, cls:Class=null):JSDynamic{
			if(!name) return null;
			if(!cls) cls = JSDynamic;
			var jsd:JSDynamic = getFromCache(name);
			if(!jsd || !(jsd is cls)){
				jsd = new cls();
				jsd.js_interface::info = new JSInfoObject(null);
				jsd.js_interface::name = name;
			}
			return jsd;
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		*/
		static public function getByInfo(obj:Object, cls:Class=null):JSDynamic{
			if(!obj) return null;
			if(!cls) cls = JSDynamic;
			var jsd:JSDynamic = getFromCache(obj.value);
			if(!jsd || !(jsd is cls)){
				jsd = new cls();
				jsd.js_interface::info = obj is JSInfoObject ? obj as JSInfoObject : new JSInfoObject(obj);
			}
			return jsd;
		}
	}
}













