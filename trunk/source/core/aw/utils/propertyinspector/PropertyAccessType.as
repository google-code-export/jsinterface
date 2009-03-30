package aw.utils.propertyinspector{

	/** 
	* Возможные типы доступа к членам классов и их значения.
	* 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @see aw.utils.PropertyInspector
	*/
	public final class PropertyAccessType extends Object{

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
		* Чтение и запись
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const READWRITE:int = 0;

		/** 
		* Только для чтения
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const READONLY:int = 1;

		/** 
		* Только для записи
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const WRITEONLY:int = 2;

		/** 
		* Метод
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const METHOD:int = 3;

		/** 
		* Строка содержащая стандартное описание типа "чтение/запись"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const READWRITE_NAME:String = 'readwrite';

		/** 
		* Строка содержащая стандартное описание типа "только для чтения"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const READONLY_NAME:String = 'readonly';

		/** 
		* Строка содержащая стандартное описание типа "только для записи"
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const WRITEONLY_NAME:String = 'writeonly';

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
		* @private (internal,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal const TYPES:Object = {readwrite:0, readonly:1, writeonly:2, method:3};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const TYPE_LIST:Object = [READWRITE_NAME, READONLY_NAME, WRITEONLY_NAME, METHOD_NAME];

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