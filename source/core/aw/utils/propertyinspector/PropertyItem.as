package aw.utils.propertyinspector{
	import aw.data.*;
	public class PropertyItem extends Object{
		protected var _name:QName;
		protected var _type:Class;
		protected var _container:int;
		protected var _access:int;
		public function PropertyItem(n:String, t:Class, a:int, p:int, u:String=''):void{
			super();
			_name = new QName(u, n);
			_type = t;
			_access = a;
			_container = p;
		}
		public function get name():QName{
			return this._name;
		}
		public function get uri():String{
			return this._name.uri;
		}
		public function get namespace():Namespace{
			return new Namespace(this._name.uri);
		}
		public function get localName():String{
			return this._name.localName;
		}
		public function get type():Class{
			return this._type;
		}
		public function get container():int{
			return this._container;
		}
		public function get access():int{
			return this._access;
		}
		public function toString():String{
			return this._name.toString();
		}
		public function clone():PropertyItem{
			return new PropertyItem(this._name.localName, this._type, this._container, this._access, this._name.uri);
		}
	}
}