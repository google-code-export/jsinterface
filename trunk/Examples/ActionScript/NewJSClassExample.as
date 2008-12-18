package{
	import aw.external.JSInterface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSFunction;
	
	import flash.display.Sprite;
	
	public class NewJSClassExample extends Sprite{
		public function NewJSClassExample():void{
			super();
			JSInterface.initialize(this);
			var func:Function = JSFunction.create('this.title = _title;' + 
					'this.description = _descr;' + 
					'this.getInfo = function(){' + 
					'return "Name: "+this.title+"\\\\nDescription: "+this.description;' + 
					'};', '_title', '_descr');
			var obj:JSDynamic = new JSDynamic(func, ['Oleg', 'ActionScript developer']);
			trace(obj.getInfo());
		}
	}
}