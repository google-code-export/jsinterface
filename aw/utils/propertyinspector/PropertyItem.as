package aw.utils.propertyinspector{
	import aw.data.*;
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class PropertyItem extends Object{
		/** 
		* 
		* @private (protected) 
		*/
		protected var _name:QName;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _type:Class;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _container:int;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _access:int;
		/** 
		* 
		* @public 
		* @param n 
		* @param t 
		* @param a 
		* @param p 
		* @param u 
		* @return void 
		*/
		public function PropertyItem(n:String, t:Class, a:int, p:int, u:String=''):void{
			super();
			_name = new QName(u, n);
			_type = t;
			_access = a;
			_container = p;
		}
		/** 
		* 
		* @public (getter) 
		* @return QName 
		*/
		public function get name():QName{
			return this._name;
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get uri():String{
			return this._name.uri;
		}
		/** 
		* 
		* @public (getter) 
		* @return Namespace 
		*/
		public function get namespace():Namespace{
			return new Namespace(this._name.uri);
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get localName():String{
			return this._name.localName;
		}
		/** 
		* 
		* @public (getter) 
		* @return Class 
		*/
		public function get type():Class{
			return this._type;
		}
		/** 
		* 
		* @public (getter) 
		* @return int 
		*/
		public function get container():int{
			return this._container;
		}
		/** 
		* 
		* @public (getter) 
		* @return int 
		*/
		public function get access():int{
			return this._access;
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		public function toString():String{
			return this._name.toString();
		}
		/** 
		* 
		* @public 
		* @return PropertyItem 
		* @see aw.utils.propertyinspector.PropertyItem 
		*/
		public function clone():PropertyItem{
			return new PropertyItem(this._name.localName, this._type, this._container, this._access, this._name.uri);
		}
	}
}