package aw.data{

	/**
	* Класс для преобразования строк в простые типы и обратно.
	* 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @playerversion Flash 9.0.28.0
	* @langversion 3.0
	*/
	public class BasicValue extends Object{

		/**
		* Константа со строковым значением TRUE.
		* @public (constant)
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public const TRUE:String = 'true';

		/**
		* Константа со строковым значением FALSE.
		* @public (constant)
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public const FALSE:String = 'false';

		/**
		* Константа со строковым значением NULL.
		* @public (constant)
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public const NULL:String = 'null';

		/**
		* Константа со строковым значением UNDEFINED.
		* @public (constant)
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public const UNDEFINED:String = 'undefined';

		/**
		* Преобразование строкового значения в булев тип.
		* 
		* @param s Строка для преобразования.
		* @return Boolean
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function expectsBoolean(s:*):Boolean{
			var str:String = String(s).toLowerCase();
			if(!s || (s is Number && s==0) || (s is String && s=='0') || str==BasicValue.FALSE || str==BasicValue.NULL || str==BasicValue.UNDEFINED){
				return false;
			}else return true;
		}

		/**
		* Получение значения из строкового эквивалента.
		* 
		* @param s Строка.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function valueFromString(s:String):*{
			if(s == BasicValue.TRUE) return true;
			else if(s == BasicValue.FALSE) return false;
			else if(s == BasicValue.NULL) return null;
			else if(s == BasicValue.UNDEFINED) return undefined;
			else if(!isNaN(Number(s))) return Number(s);
			else return s;
		}

		/**
		* Получение строки из значения простого типа.
		* 
		* @param v Значение.
		* @return String
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function valueToString(v:*):String{
			if(typeof(v) == 'xml') return v.toXMLString();
			else return String(v);
		}
	}
}