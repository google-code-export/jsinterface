package aw.external.jsinterface{
	import aw.external.*;
	/*
	Надо придумать, как создавать функции принимающие аргументы.
	*/
	public class JSFunction extends Object{
		static public const CLASS_NAME:String = 'Function';
		static public const INSTANCE_ERROR:String = 'JavaScript function instance can\'t be created.';
		static public function create(javaScriptCode:String, ...args:Array):Function{
			var func:Function;
			var obj:Object;
			if(args.length){
				obj = JSCore.createFunction(args, javaScriptCode);
			}else{
				obj = JSCore.createObject(CLASS_NAME, [javaScriptCode]);
			}
			if(obj.constructor==Object && obj.isComplex && obj.value){
				var jsd:JSDynamic = new JSDynamic();
				jsd.js_interface::info = new JSInfoObject(obj);
				func = jsd.js_interface::asFunction();
			}else throw new Error(INSTANCE_ERROR);
			return func;
		}
	}
}