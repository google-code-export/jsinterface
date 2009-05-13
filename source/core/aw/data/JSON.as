package aw.data{
	import aw.data.json.JSONPacker;
	import aw.utils.*;
	import aw.utils.eval.ArrayEval;
	import aw.utils.eval.NumberEval;
	import aw.utils.eval.ObjectEval;
	import aw.utils.eval.OperationEval;
	import aw.utils.eval.PredefinedEval;
	import aw.utils.eval.StringEval;
	import aw.utils.iteration.LengthIterationIndex;

		/**
		* Processing data in JSON format.
		*
		* It supports the standard syntax of JSON and his "misleading" the version with string keys, without the quotation marks:
		* <ol><li><code>{"paramName1":"string value", "paramName2":1000}; // correct syntax</code></li>
		* <li><code>{paramName1:"string value", paramName2:1000}; // 	error, but will be processed correctly</code></li></ol>
		* 
		* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
	public class JSON extends Object{

		/** 
		* 
		* 
		* 
		* @private 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var SPACES:String = StringEval.SPACES;
		
		/**
		* Packing data into a JSON string.
		* 
		* @param o Объект
		* @return String
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function pack(o:*):String{
			return JSONPacker.pack(o);
		}

		/**
		* Extracting data from the JSON format.
		* 
		* @param str Строка.
		* @return *
		* @playerversion Flash 9.0.28.0
		* @langversion 3.0
		*/
		static public function unpack(str:String):*{
			str = StringUtils.trim(str);
			return parseValue(str, new LengthIterationIndex(str.length), null);
		}
		

		/** 
		* 
		* 
		* 
		* @private 
		* @param str 
		* @param iteration 
		* @param scope 
		* @return * 
		* @see aw.utils.iteration.LengthIterationIndex 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function parseValue(str:String, iteration:LengthIterationIndex, scope:Object=null):*{
			var chr:String;
			var i:int = iteration.index;
			var len:int = iteration.length;
			while(SPACES.indexOf((chr = str.charAt(i)))>=0 && i<len) i++;
			var ret:*;
			var pref:String = OperationEval.getPrefixOperator(str, iteration);
			if(i<len){
				if(StringEval.STRING_STOP.indexOf(chr)>=0) ret = StringEval.getData(str, iteration);
				else if(NumberEval.NUMBER_CHAR.indexOf(chr)>=0) ret = NumberEval.getData(str, iteration);
				else if(chr==ArrayEval.ARRAY_OPEN) ret = ArrayEval.getData(str, iteration, parseValue, scope);
				else if(chr==ObjectEval.OBJECT_OPEN) ret = ObjectEval.getData(str, iteration, parseValue, scope);
				else{
					ret = PredefinedEval.getData(str, iteration);
				}
				if(pref) ret = OperationEval.executePrefixOperator(ret, pref);
			}
			return ret;
		}
	}
}