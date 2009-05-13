package aw.utils{
	import aw.utils.eval.ArrayEval;
	import aw.utils.eval.ExecutableEval;
	import aw.utils.eval.NumberEval;
	import aw.utils.eval.ObjectEval;
	import aw.utils.eval.OperationEval;
	import aw.utils.eval.RegExpEval;
	import aw.utils.eval.StringEval;
	import aw.utils.eval.XMLEval;
	import aw.utils.iteration.LengthIterationIndex;

	/** 
	* 	Class handles strings as references to objects in point notation. Used to convert the strings in the JSON, to the appropriate objects.
	* 
	* @example Supported record types:
<listing version="3.0">
package {
	import aw.utils.EvalUtils;
	
	import flash.display.Sprite;
	import flash.utils.getQualifiedClassName;

	public class Test extends Sprite{
		static private const JSON_STRING:String = '{regExp:/[^\w]/ig, xml:&lt;xml&gt;&lt;child&gt;&lt;![CDATA[Text]]&gt;&lt;/child&gt;&lt;/xml&gt;, value:this.textValue, definition:flash.display::Sprite}';
		public var textValue:String = 'Test parameter';
		public function Test():void{
			super();
			var obj:Object = EvalUtils.evaluate(JSON_STRING, this);
			trace('RegExp:    ', (obj.regExp as RegExp).source, getQualifiedClassName(obj.regExp));
			trace('XML:       ', (obj.xml as XML).toXMLString(), getQualifiedClassName(obj.xml));
			trace('Parameter: ', obj.value, getQualifiedClassName(obj.value));
			trace('Definition:', obj.definition, getQualifiedClassName(obj.definition));
		}
	}
}
/&#042; trace qutput:
RegExp:     [^w] RegExp
XML:        &lt;xml&gt;
  &lt;child&gt;&lt;![CDATA[Text]]&gt;&lt;/child&gt;
&lt;/xml&gt; XML
Parameter:  Test parameter String
Definition: [class Sprite] flash.display::Sprite
&#042;/
</listing>
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public class EvalUtils extends Object{

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
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const EXPRESSION_SEPARATOR:String = ',;';

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @param scope 
		* @param iteration 
		* @return * 
		* @see aw.utils.iteration.LengthIterationIndex 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function evaluate(str:String, scope:Object=null, iteration:LengthIterationIndex=null):*{
			if(!iteration) iteration = new LengthIterationIndex(str.length);
			var val:*;
			var i:int = iteration.index;
			var len:int = iteration.length;
			while(i<len){
				var chr:String = str.charAt(i);
				if(SPACES.indexOf(chr)<0 && EXPRESSION_SEPARATOR.indexOf(chr)<0){
					iteration.index = i;
					val = parseValue(str, iteration, scope);
					i = iteration.index;
				}
				i++;
			}
			iteration.index = i;
			return val;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @param iteration 
		* @param scope 
		* @return * 
		* @see aw.utils.iteration.LengthIterationIndex 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function parseValue(str:String, iteration:LengthIterationIndex, scope:Object=null):*{
			var chr:String;
			var i:int = iteration.index;
			var len:int = iteration.length;
			while(SPACES.indexOf((chr = str.charAt(i)))>=0 && i<len) i++;
			var ret:*;
			var pref:String = OperationEval.getPrefixOperator(str, iteration);
			if(i<len){
				// trace('----------------- PARSE VALUE CONTROL CHAR', chr);
				if(StringEval.STRING_STOP.indexOf(chr)>=0) ret = StringEval.getData(str, iteration);
				else if(NumberEval.NUMBER_CHAR.indexOf(chr)>=0) ret = NumberEval.getData(str, iteration);
				else if(chr==XMLEval.XML_OPEN) ret = XMLEval.getData(str, iteration);
				else if(chr==ArrayEval.ARRAY_OPEN) ret = ArrayEval.getData(str, iteration, parseValue, scope);
				else if(chr==ObjectEval.OBJECT_OPEN) ret = ObjectEval.getData(str, iteration, parseValue, scope);
				else if(chr==RegExpEval.REGEXP_OPEN) ret = RegExpEval.getData(str, iteration);
				else{
					ret = ExecutableEval.lookToExecutableData(str, iteration, parseValue, scope);
					//ret = getExecutableData(str, iteration, scope);
				}
				if(pref) ret = OperationEval.executePrefixOperator(ret, pref);
				if(iteration.index<len) ret = OperationEval.getNextOperation(ret, str, iteration, parseValue, scope);
			}
			return ret;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param str 
		* @param iteration 
		* @return void 
		* @see aw.utils.iteration.LengthIterationIndex 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function skipWhitespace(str:String, iteration:LengthIterationIndex):void{
			var index:int = iteration.index;
			var length:int = iteration.length;
			while(SPACES.indexOf(str.charAt(index))>=0 && index<length) index++;
			iteration.index = index;
		}
	}
}