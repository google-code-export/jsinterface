package aw.external.jsinterface{
	import aw.external.js_interface;
	import flash.utils.Dictionary;
	[ExcludeClass]
	/**
	 * 
	 * 
	 * 
	 * @private
	 * @see aw.external.JSInterface
	 * @see aw.external.jsinterface.JSDynamic
	 * @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	 */
	public class JSInstanceCache extends Object{

		/** 
		* 
		* 
		* 
		* @private 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var _instances:Dictionary = new Dictionary(true);

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @param obj 
		* @return void 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function addToCache(name:String, obj:JSDynamic):void{
			_instances[obj] = name;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* 
		* @public 
		* @param name 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function clear():void{
			for(var p:* in _instances){
				delete _instances[p];
			}
			_instances = new Dictionary(true);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getByName(name:String, cls:Class=null):JSDynamic{
			if(!name) return null;
			if(!cls) cls = JSDynamic;
			var jsd:JSDynamic = getFromCache(name);
			if(!jsd || !(jsd is cls)){
				jsd = new cls(JSDynamic.DO_NOT_CREATE_OBJECT);
				jsd.js_interface::info = new JSInfoObject(null);
				jsd.js_interface::name = name;
			}
			return jsd;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @param cls 
		* @return JSDynamic 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getByInfo(obj:Object, cls:Class=null):JSDynamic{
			if(!obj) return null;
			if(!cls) cls = JSDynamic;
			var jsd:JSDynamic = getFromCache(obj.value);
			if(!jsd || !(jsd is cls)){
				jsd = new cls(JSDynamic.DO_NOT_CREATE_OBJECT);
				jsd.js_interface::info = obj is JSInfoObject ? obj as JSInfoObject : new JSInfoObject(obj);
			}
			return jsd;
		}
	}
}