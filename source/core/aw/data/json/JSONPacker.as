package aw.data.json{

	/** 
	* Класс пакующий дерево объектов в строку в JSON формате. Может использовать оригинальный формат и изменённый JavaScript формат. Их отличие в описании свойств объектов - в оригинальном JSON формате имена свойств объектов обрамляются кавычками.
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public class JSONPacker extends Object{
		/**
		*
		* @private (constant)
		*/
		static public const OBJECT_OPEN:String = '{';

		/**
		*
		* @private (constant)
		*/
		static public const OBJECT_CLOSE:String = '}';

		/**
		*
		* @private (constant)
		*/
		static public const ARRAY_OPEN:String = '[';

		/**
		*
		* @private (constant)
		*/
		static public const ARRAY_CLOSE:String = ']';

		/**
		*
		* @private (constant)
		*/
		static public const OBJECT_SPACER:String = ':';

		/**
		*
		* @private (constant)
		*/
		static public const SPACER:String = ',';

		/**
		*
		* @private (constant)
		*/
		static public const STRING:String = '"';

		/**
		*
		* @private (constant)
		*/
		static private var stringSearchesLength:int;

		/**
		*
		* @private (constant)
		*/
		static private const STRING_SEARCHES:Array = function():Array{
			var arr:Array = ['\\','\/','\r','\n','\t','\v','\b','\f','\x','\0'];
			stringSearchesLength = arr.length;
			return arr;
		}();

		/**
		*
		* @private (constant)
		*/
		static private const STRING_REPLACEMENTS:Array = ['\\\\','\\\/','\\r','\\n','\\t','\\v','\\b','\\f','\\x','\\0'];

		/**
		* Упаковка данных в строку формата JSON.
		* 
		* @param o Объект
		* @return String
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function pack(o:*, useJSSyntax:Boolean=false):String{
			if(o is Number || o is Boolean) return String(o);
			if(o is XML || o is XMLList) o = (o as XML).toXMLString();
			if(!(o is String)){
				if(o is Array) return packArray(o, useJSSyntax);
				else if(o is Object) return packObject(o, useJSSyntax);
				else return String(o);
			}
			return STRING+packString(o)+STRING;
		}
		

		/** 
		* 
		* 
		* 
		* @private 
		* @param str 
		* @param rec 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function packString(str:String, rec:String=STRING):String{
			var len:int = stringSearchesLength;
			for(var i:int=0; i<len; i++){
				var chr:String = STRING_SEARCHES[i];
				var rep:String = STRING_REPLACEMENTS[i];
				var pos:int = 0;
				while((pos = str.indexOf(chr, pos))>=0){
					str = str.substr(0, pos)+rep+str.substr(pos+1);
					pos+=2;
				}
			}
			return str;
		}

		/**
		* Упаковывает объект в строку формата JSON.
		* 
		* @private 
		* @param o Объект.
		* @return String
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function packObject(o:Object, useJSSyntax:Boolean=false):String{
			var ret:String = OBJECT_OPEN;
			var rep:Boolean = false;
			var p:String;
			if(useJSSyntax){
				for(p in o){
					ret += p+OBJECT_SPACER+pack(o[p], useJSSyntax)+SPACER;
					rep = true;
				}
			}else{
				for(p in o){
					ret += STRING+p+STRING+OBJECT_SPACER+pack(o[p], useJSSyntax)+SPACER;
					rep = true;
				}
			}
			return (rep ? ret.substr(0, ret.length-1) : ret)+OBJECT_CLOSE;
		}


		/** 
		* 
		* 
		* 
		* @private 
		* @param o 
		* @param useJSSyntax 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function packArrayAsArguments(o:Array, useJSSyntax:Boolean=false):String{
			var ret:String = '';
			var len:int = o.length;
			var rep:Boolean = false;
			for(var i:int=0;i<len;i++){
				ret += pack(o[i], useJSSyntax)+SPACER;
				rep = true;
			}
			return String(rep ? ret.substr(0, ret.length-1) : ret);
		}

		/**
		* Упаковывает массив в строку формата JSON.
		* 
		* @private 
		* @param o Массив.
		* @return String
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function packArray(o:Array, useJSSyntax:Boolean=false):String{
			return ARRAY_OPEN+packArrayAsArguments(o, useJSSyntax)+ARRAY_CLOSE;
		}
	}
}