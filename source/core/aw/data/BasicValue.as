package aw.data{

	/**
	* Class for converting strings to simple types and vice versa.
	* 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @playerversion Flash 9.0.28.0
	* @langversion 3.0
	*/
	public class BasicValue extends Object{

		/**
		* Constant with string value of TRUE.
		* @public (constant)
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public const TRUE:String = 'true';

		/**
		* Constant with string value of FALSE.
		* @public (constant)
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public const FALSE:String = 'false';

		/**
		* Constant with string value of NULL.
		* @public (constant)
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public const NULL:String = 'null';

		/**
		* Constant with string value of UNDEFINED.
		* @public (constant)
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public const UNDEFINED:String = 'undefined';

		/**
		* Converting the string value to boolean.
		* 
		* @param s The string for conversion.
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
		* Getting value from the string equivalent.
		* 
		* @param s Input string.
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
		* Getting a string from the value of a simple type.
		* 
		* @param v Input value.
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