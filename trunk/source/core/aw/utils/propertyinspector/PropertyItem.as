package aw.utils.propertyinspector{
	import aw.data.*;
	
	import flash.utils.getQualifiedClassName;

	/** 
	* Объект описывающий член класса(свойство или метод). Хранит информацию о особенностях, таких как: имя, тип возвращаемого значения, тип члена класса, уровень доступа.
	* 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public class PropertyItem extends Object{

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _name:QName;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _type:Class;

		/** 
		* 
		* 
		* 
		* @private (protected)
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _container:int;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _access:int;

		/** 
		* В конструктор передаются характеристики члена класса.
		* 
		* 
		* @public 
		* @param n 
		* @param t 
		* @param a 
		* @param p 
		* @param u 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function PropertyItem(n:String, t:Class, a:int, p:int, u:String=''):void{
			super();
			_name = new QName(u, n);
			_type = t;
			_access = a;
			_container = p;
		}

		/** 
		* Возвращает строковое представление объекта, имя свойства.
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toString():String{
			return this._name.toString();
		}

		/** 
		* Имя члена класса
		* 
		* 
		* @public (getter) 
		* @return QName 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get name():QName{
			return this._name;
		}

		/** 
		* Ключ пространства имён, в котором находится имя данного члена класса.
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get uri():String{
			return this._name.uri;
		}

		/** 
		* Пространиство имён, в котором находится имя данного члена класса.
		* 
		* 
		* @public (getter) 
		* @return Namespace 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get namespace():Namespace{
			return new Namespace(this._name.uri);
		}

		/** 
		* Локальное имя члена класса.
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get localName():String{
			return this._name.localName;
		}

		/** 
		* Тип возвращаемого значения, а для свойств - тип значения свойства. 
		* 
		* 
		* @public (getter) 
		* @return Class 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get type():Class{
			return this._type;
		}

		/** 
		* Вид члена класса - переменная, GET/SET метод, константа или метод.
		* 
		* 
		* @public (getter) 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get container():int{
			return this._container;
		}

		/** 
		* Уровень доступа - чтение/запись, только чтение, только запись или метод.
		* 
		* 
		* @public (getter) 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get access():int{
			return this._access;
		}

		/** 
		* Простым значением объекта будет имя описываемого члена класса.  
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function valueOf():QName{
			return this._name;
		}

		/** 
		* Клонировать объект
		* 
		* 
		* @public 
		* @return PropertyItem 
		* @see aw.utils.propertyinspector.PropertyItem 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function clone():PropertyItem{
			return new PropertyItem(this._name.localName, this._type, this._container, this._access, this._name.uri);
		}
	}
}