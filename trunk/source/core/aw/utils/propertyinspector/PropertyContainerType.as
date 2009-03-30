package aw.utils.propertyinspector{

	/** 
	* Виды воспринимаемых членов класса и их значения. 
	* 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @see aw.utils.PropertyInspector
	*/
	public final class PropertyContainerType extends Object{

		/** 
		* Любой тип
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const ANY:int = -1;

		/** 
		* Тип "переменная"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const VARIABLE:int = 0;

		/** 
		* Тип методов доступа, аксессоров(GET/SET методы).
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const ACCESSOR:int = 1;

		/** 
		* Тип "константа"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CONSTANT:int = 2;

		/** 
		* Тип "метод"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const METHOD:int = 3;

		/** 
		* Строка содержащая стандартное описание типа "переменная"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const VARIABLE_NAME:String = 'variable';

		/** 
		* Строка содержащая стандартное описание типа "аксессор"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const ACCESSOR_NAME:String = 'accessor';

		/** 
		* Строка содержащая стандартное описание типа "константа"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CONSTANT_NAME:String = 'constant';

		/** 
		* Строка содержащая стандартное описание типа "метод"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const METHOD_NAME:String = 'method';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const TYPE_LIST:Object = [VARIABLE_NAME, ACCESSOR_NAME, CONSTANT_NAME, METHOD_NAME];

		/** 
		* Метод возвращающий описательную строку по значению типа.
		* 
		* 
		* @public
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getTypeName(type:int):String{
			return TYPE_LIST[type];
		}
	}
}