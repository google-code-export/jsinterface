package aw.utils{
	import aw.emulate.Arithmetic;
	import aw.emulate.Condition;
	import aw.emulate.OperatorPriority;
	import aw.emulate.Operators;
	import aw.errors.EvalUtilsError;
	import aw.utils.iteration.LengthIterationIndex;
	
	import flash.system.ApplicationDomain;
	import flash.utils.getQualifiedClassName;
	public class EvalUtils extends Object{
		static public const SPACES:String = ' \n\t\r';
		static public const OBJECT_OPEN:String = '{';
		static public const OBJECT_CLOSE:String = '}';
		static public const OBJECT_PAIR_DELIMITER:String = ',';
		static public const OBJECT_PAIR_SEPARATOR:String = ':';
		static public const DOT_CHAR:String = '.';
		static public const HEX_CHAR:String = 'x';
		static public const ARRAY_OPEN:String = '[';
		static public const ARRAY_CLOSE:String = ']';
		static public const ARRAY_ITEM_DELIMITER:String = ',';
		static public const XML_OPEN:String = '<';
		static public const XML_CLOSE:String = '>';
		static public const XML_CLOSE_TAG_CHAR:String = '/';
		static public const XML_CDATA_OPEN:String = '<![CDATA[';
		static public const XML_CDATA_CLOSE:String = ']]>';
		static public const REGEXP_OPEN:String = '/';
		static public const REGEXP_ADDON:String = 'gimsx';
		static public const STRING_STOP:String = '"\'`';
		static public const STRING_META_CHAR:String = '\\';
		static public const NUMBER_CHAR:String = '.0123456789';
		static public const NUMBER_FULL_CHAR:String = '.0123456789xABCDEFabcdef';
		static public const OPERATION_CHAR:String = '+-*/=%<>!~|&^';
		static public const EXEC_OPERATION_CHAR:String = 'asintceof';
		static public const PREFIX_OPERATION_CHAR:String = '+-!';
		static public const NOT_OPERATION_CHAR:String = '!';
		static public const PLUS_OPERATION_CHAR:String = '+';
		static public const MINUS_OPERATION_CHAR:String = '-';
		static public const ARIFM_CHAR:String = '+-*/=%';
		static public const BITWISE_CHAR:String = '&|<>^';
		static public const CONDITION_CHAR:String = '&|<>=';
		static public const ARIFM_SIMPLE_CHAR:String = '+-';
		static protected const CONSTANTS:Object = function ():Object{
			var obj:Object = {};
			obj['null'] = null;
			obj['true'] = true;
			obj['false'] = false;
			obj['undefined'] = undefined;
			obj['Infinity'] = Infinity;
			obj['+Infinity'] = +Infinity;
			obj['-Infinity'] = -Infinity;
			obj['NaN'] = NaN;
			return obj;
		}();
		static protected const STRING_REPLACEMENTS:Object = function ():Object{
			var obj:Object = {};
			obj['r'] = '\r';
			obj['n'] = '\n';
			obj['\\'] = '\\';
			obj['t'] = '\t';
			obj['v'] = '\v';
			return obj;
		}();
		//----------------- object params
		static public const RESTRICTED_NAME_CHARS:String = '~!#$%^&*()+|-=\\[];\'`<>?,./:"{}№ \t';
		static protected const RESTRICTED_NAME_CHARS_OBJECT:Object = function():Object{
			var obj:Object = {};
			var len:int = RESTRICTED_NAME_CHARS.length;
			for(var i:int=0; i<len; i++) obj[RESTRICTED_NAME_CHARS.charAt(i)] = true;
			return obj;
		}();
		static public const PARAM_NAME_SPACERS:String = '.([';
		static public const FUNCTION_CALL_OPEN:String = '(';
		static public const FUNCTION_CALL_CLOSE:String = ')';
		static public const DYNAMIC_NAME_OPEN:String = '[';
		static public const DYNAMIC_NAME_CLOSE:String = ']';
		static public const ANY_SIGN:String = '*';
		static public const THIS_LINK_NAME:String = 'this';
		static public const NAMESPACE_SEPARATOR_PART:String = ':';
		static public const NAMESPACE_SEPARATOR:String = '::';
		static public const PARAMETER_SEPARATOR:String = '.';
		static public const ATTRIBUTE_SEPARATOR:String = '@';
		 /** TODO:
		 * Проверить везде, чтоб вместе с parseValue шла проверка на префиксные операторы
		 * Дбавить проверку на константы, сожно даже к функции получения статической переменной.
		 */
		static public function evaluate(str:String, scope:Object=null, iteration:LengthIterationIndex=null):*{
			if(!iteration) iteration = new LengthIterationIndex(str.length);
			var val:*;
			var pref:String = getPrefixOperator(str, iteration);
			val = parseValue(str, iteration, scope);
			if(pref) val = executePrefixOperator(val, pref);
			if(iteration.index<iteration.length) val = getNextOperation(val, str, iteration, scope);
			return val;
		}
		static public function parseValue(str:String, iteration:LengthIterationIndex, scope:Object=null):*{
			var chr:String;
			var i:int = iteration.index;
			var len:int = iteration.length;
			while(SPACES.indexOf((chr = str.charAt(i)))>=0 && i<len) i++;
			var ret:*;
			if(i<len){
				// trace('----------------- PARSE VALUE CONTROL CHAR', chr);
				if(STRING_STOP.indexOf(chr)>=0) ret = getStringData(str, iteration);
				else if(NUMBER_CHAR.indexOf(chr)>=0) ret = getNumberData(str, iteration);
				else if(chr==XML_OPEN) ret = getXMLData(str, iteration);
				else if(chr==ARRAY_OPEN) ret = getArrayData(str, iteration, scope);
				else if(chr==OBJECT_OPEN) ret = getObjectData(str, iteration, scope);
				else if(chr==REGEXP_OPEN) ret = getRegExpData(str, iteration, scope);
				else ret = getExecutableData(str, iteration, scope);
			}
			return ret;
		}
//---------------------------------------------------- OPERATION
		static public function getNextOperation(first:*, str:String, iteration:LengthIterationIndex, scope:Object, operation:String=''):*{
			// trace('get next operation start [',str.charAt(iteration.index),']');
			// trace('first operand', first, getQualifiedClassName(first));
			if(!operation) operation = getOperator(str, iteration);
			if(!operation) return first;
			// trace('operation is ', operation);
			if(operation==Arithmetic.INCREMENT){
				// trace(' - increment');
				first = first+1;
				operation = getOperator(str, iteration);
			}else if(operation==Arithmetic.DECREMENT){
				// trace(' - decrement');
				first = first-1;
				operation = getOperator(str, iteration);
			}
			if(!operation) return first;
			// trace('start with operation', operation);
			var second:* = parseValue(str, iteration, scope);
			// trace('second operand', second, getQualifiedClassName(second));
			var nextOperation:String = getOperator(str, iteration);
			if(nextOperation){
				// trace('next operation is', nextOperation);
				if(OperatorPriority.getValue(nextOperation)>OperatorPriority.getValue(operation)){
					// trace('next have higher priority');
					second = getNextOperation(second, str, iteration, scope, nextOperation);
					// trace('new second operand', second, getQualifiedClassName(second));
					first = executeOperation(operation, first, second);
				}else{
					// trace('current have higher priority');
					first = executeOperation(operation, first, second);
					first = getNextOperation(first, str, iteration, scope, nextOperation);
				}
			}else first = executeOperation(operation, first, second);
			return first;
		}
		static public function executeOperation(operation:String, first:*, second:*):*{
			var cls:Object = Operators.getType(operation);
			if(cls) first = cls.byString(operation, first, second);
			else throw new Error('EvalUtils error: Operation ['+operation+'] is not supported.');
			return first;
		}
		static public function getOperator(str:String, iteration:LengthIterationIndex, chrs:String=OPERATION_CHAR):String{
			var operation:String = '';
			var i:int = iteration.index;
			var len:int = iteration.length;
			var chr:String = str.charAt(i);
			var firstSpace:Boolean = SPACES.indexOf(chr)>=0;
			while(SPACES.indexOf((chr = str.charAt(i)))>=0 && i<len) i++;
			if(OPERATION_CHAR.indexOf(chr)>=0){
				operation = chr;
				while(OPERATION_CHAR.indexOf(chr = str.charAt(++i))>=0 && i<len) operation = operation+chr;
			}else if(firstSpace && EXEC_OPERATION_CHAR.indexOf(chr)>=0){
				operation = chr;
				while(EXEC_OPERATION_CHAR.indexOf(chr = str.charAt(++i))>=0 && i<len) operation = operation+chr;
				if(SPACES.indexOf(chr)<0) operation = '';
			}
			if(operation){
				while(SPACES.indexOf((chr = str.charAt(i)))>=0 && i<len) i++;
				iteration.index = i;
			}
			return operation;
		}
		/*
		Метод получения операторов префиксной операции.
		*/
		static public function getPrefixOperator(str:String, iteration:LengthIterationIndex, chrs:String=PREFIX_OPERATION_CHAR):String{
			var operation:String = '';
			var i:int = iteration.index;
			var len:int = iteration.length;
			var chr:String;
			while(PREFIX_OPERATION_CHAR.indexOf(chr = str.charAt(i))>=0){
				operation = operation+chr;
				i++;
			}
			if(operation) iteration.index = i;
			return operation;
		}
		/*
		Метод обработки префиксных операторов _справа_налево_. 
		*/
		static public function executePrefixOperator(value:*, chrs:String):*{
			var i:int = chrs.length-1;
			var chr:String;
			while(i>=0){
				chr = chrs.charAt(i);
				if(chr==Condition.LOGICAL_NOT) value = !value;
				else if(chr==Arithmetic.PLUS){
					if(chrs.charAt(i-1)==chr){
						value = ++value;
						i = i-1;
					}else value = +value;
				}else if(chr==Arithmetic.MINUS){
					if(chrs.charAt(i-1)==chr){
						value = --value;
						i = i-1;
					}else value = -value;
				}
				i = i-1;
			}
			return value;
		}
//---------------------------------------------------- OBJECT
		static public function getObjectData(str:String, iteration:LengthIterationIndex, scope:Object=null):Object{
			var ret:Object = {};
			var nextValue:Boolean = true;
			var len:int = iteration.length;
			var chr:String;
			var name:String;
			var value:String;
			var i:int = iteration.index+1;
			// trace('------------------------ START PARSE OBJECT');
			while(i<len){
				chr = str.charAt(i);
				// trace('next char', chr);
				if(SPACES.indexOf(chr)>=0){
					// trace(' - space');
					i++;
					continue;
				}
				if(nextValue){
					// trace('next value');
					iteration.index = i;
					if(name){
						ret[name] = evaluate(str, scope, iteration);
						// trace('value: ', ret[name]);
						i = iteration.index;
						name = '';
						nextValue = false;
					}else{
						name = getObjectPropName(str, iteration);
						// trace('name: ', name);
						i = iteration.index+1;
					}
					continue;
				}
				if(chr==OBJECT_PAIR_DELIMITER){
					nextValue = true;
					i++;
					// trace('pair delimiter', chr);
					continue;
				}
				if(chr==OBJECT_CLOSE){
					iteration.index = i+1;
					// trace('close object', chr);
					break;
				}
				i++;
			}
			// trace('------------------------ STOP PARSE OBJECT');
			return ret;
		}
		static public function getObjectPropName(str:String, iteration:LengthIterationIndex):String{
			var i:int = iteration.index;
			var name:String;
			var end:int;
			if(STRING_STOP.indexOf(str.charAt(i))>=0){
				// name as string - in quotes: {"some name string":true}
				name = getStringData(str, iteration);
				end = str.indexOf(OBJECT_PAIR_SEPARATOR, iteration.index);
				if(end>0) iteration.index = end;
			}else{
				// name as basic name: {someName:true}
				end = str.indexOf(OBJECT_PAIR_SEPARATOR, i);
				if(end>0){
					iteration.index = end;
					while(SPACES.indexOf(str.charAt(--end))>=0);
					name = str.substring(i, end+1);
				}
			}
			return name;
		}
		//---------------------------------------------------- ARRAY
		static public function getArrayData(str:String, iteration:LengthIterationIndex, scope:Object=null, closeChar:String=ARRAY_CLOSE):Array{
			var ret:Array = [];
			var chr:String;
			var name:String;
			var value:String;
			var len:int = iteration.length;
			var i:int = iteration.index+1;
			var nextValue:Boolean = true;
			// trace('------------------------ START PARSE ARRAY');
			while(i<len){
				chr = str.charAt(i);
				// trace('next char', chr);
				if(SPACES.indexOf(chr)>=0){
					// trace(' - space');
					i++;
					continue;
				}
				if(nextValue){
					iteration.index = i;
					ret.push(evaluate(str, scope, iteration));
					// trace('value: ', ret[ret.length-1]);
					nextValue = false;
					i = iteration.index;
					continue;
				}
				if(chr==ARRAY_ITEM_DELIMITER){
					nextValue = true;
					i++;
					// trace('item delimiter', chr);
					continue;
				}
				if(chr==closeChar){
					iteration.index = i+1;
					// trace('close array', chr);
					break;
				}
				i++;
			}
			// trace('------------------------ STOP PARSE ARRAY');
			return ret;
		}
		//---------------------------------------------------- STRING
		static public function getStringData(str:String, iteration:LengthIterationIndex):String{
			var i:int = iteration.index;
			var q:String = str.charAt(i);
			var j:int = i;
			var mI:int;
			while((j = str.indexOf(q, j+1))>=0){
				mI = j;
				while(str.charAt(--mI)==STRING_META_CHAR);
				if((j-mI)%2==1) break;
			}
			iteration.index = ++j;
			// trace('----------- STRING LAST CHAR', str.charAt(j));
			return parseString(str.substring(i, j));
		}
		static public function skipQuotedString(str:String, iteration:LengthIterationIndex):void{
			var i:int = iteration.index;
			var q:String = str.charAt(i);
			var j:int = i;
			var mI:int;
			while((j = str.indexOf(q, j+1))>=0){
				mI = j;
				while(str.charAt(--mI)==STRING_META_CHAR);
				if((j-mI)%2==1) break;
			}
			iteration.index = j+1;
		}
		static public function parseString(str:String):String{
			var q:String = str.charAt(0);
			var j:int = 0;
			var src:String;
			var rpl:String;
			while((j = str.indexOf(STRING_META_CHAR, j+1))>=0){
				src = str.charAt(j+1);
				if(src in STRING_REPLACEMENTS) rpl = STRING_REPLACEMENTS[src];
				else if(src == q) rpl = q;
				else continue;
				str = str.substr(0, j)+rpl+str.substr(j+2);
			}
			return str.substring(1, str.length-1);
		}
		//---------------------------------------------------- NUMBER
		static public function getNumberData(str:String, iteration:LengthIterationIndex):Number{
			var start:int = iteration.index;
			var len:int = iteration.length;
			var end:int = start;
			var chr:String;
			var floatNumber:Boolean = false;
			while(NUMBER_FULL_CHAR.indexOf((chr = str.charAt(end)))>=0 && end<len){
				if(chr==DOT_CHAR || chr==HEX_CHAR){
					if(floatNumber) break;
					else floatNumber = true;
				}
				end++;
			}
			iteration.index = end;
			// trace('----------- NUMBER LAST CHAR', str.charAt(end));
			return Number(str.substring(start, end));
		}
		//---------------------------------------------------- XML
		static public function getXMLData(str:String, iteration:LengthIterationIndex):XML{
			var start:int = iteration.index;
			var i:int;
			var tagName:String = getXMLTagName(str, iteration);
			if(!tagName) throw new EvalUtilsError(EvalUtilsError.XML_ROOT_NODE_WITHOUT_NAME);
			else if(str.indexOf(XML_CDATA_OPEN, start)==start){
				i = str.indexOf(XML_CDATA_CLOSE, start)+XML_CDATA_CLOSE.length;
			}else if(!isClosedXMLTag(str, iteration)){
				var tagNameLength:int = tagName.length;
				i = iteration.index;
				var tagI:int;
				var cdtI:int;
				var tagCount:int = 1;
				var chr:String;
				while(true){
					tagI = str.indexOf(tagName, i);
					cdtI = str.indexOf(XML_CDATA_OPEN, i);
					if(tagI<0) break;
					if(cdtI>0 && cdtI<tagI){
						i = str.indexOf(XML_CDATA_CLOSE, cdtI);
					}else{
						chr = str.charAt(tagI-1);
						if(chr==XML_CLOSE_TAG_CHAR && str.charAt(tagI-2)==XML_OPEN){
							tagCount--;
							if(!tagCount){
								i = str.indexOf(XML_CLOSE, tagI);
								break;
							}
						}else{
							if(chr==XML_OPEN) tagCount++;
							i = tagI+tagNameLength;
						}
					}
				}
				iteration.index = ++i;
			}
			return XML(str.substring(start, i));
		}
		static public function getXMLTagName(str:String, iteration:LengthIterationIndex):String{
			var start:int = iteration.index+1;
			var i:int = start;
			var chr:String = str.charAt(i);
			while(SPACES.indexOf(chr)<0 && chr!=XML_CLOSE && chr!=XML_CLOSE_TAG_CHAR) chr = str.charAt(++i);
			iteration.index = i;
			return str.substring(start, i+1);
		}
		static public function isClosedXMLTag(str:String, iteration:LengthIterationIndex):Boolean{
			var start:int = iteration.index;
			var cls:int = str.indexOf(XML_CLOSE_TAG_CHAR+XML_CLOSE, start);
			var ncls:int = str.indexOf(XML_CLOSE, start);
			iteration.index = ncls;
			return (cls>=0 && cls<ncls) ? true : false;
		}
		//---------------------------------------------------- REGEXP
		static public function getRegExpData(str:String, iteration:LengthIterationIndex, scope:Object=null):RegExp{
			var rgx:String = skipRegExpExpression(str, iteration);
			var i:int = iteration.index;
			var j:int = i+1;
			while(REGEXP_ADDON.indexOf(str.charAt(++i))>=0);
			var keys:String = str.substring(j, i);
			iteration.index = i;
			return new RegExp(rgx, keys);
		}
		static public function skipRegExpExpression(str:String, iteration:LengthIterationIndex):String{
			var i:int = iteration.index;
			var j:int = i;
			var mI:int;
			while((j = str.indexOf(REGEXP_OPEN, j+1))>=0){
				mI = j;
				while(str.charAt(--mI)==STRING_META_CHAR);
				if((j-mI)%2==1) break;
			}
			iteration.index = j;
			return str.substring(i+1, j);
		}
		//---------------------------------------------------- EXECUTABLE
		static public function getExecutableData(str:String, iteration:LengthIterationIndex, scope:Object=null):Object{
			var i:int = iteration.index;
			var chr:String = str.charAt(i);
			var isAttribute:Boolean = false;
			var isGetDescendants:Boolean = false;
			var currentScope:Object;
			// trace('------------------------ START PARSE EXECUTABLE');
			if(chr==ATTRIBUTE_SEPARATOR){
				// trace('first is attribute');
				isAttribute = true;
				iteration.index = ++i;
			}
			var name:QName = getExecutableQName(str, iteration, scope);
			// trace('first name:', name);
			if(name.localName==THIS_LINK_NAME){
				// trace(' - force current scope');
				currentScope = scope;
			}else if(name in scope){
				// trace(' - current scope');
				currentScope = isAttribute ? scope.@[name] : scope[name];
			}else{
				// trace(' - static scope');
				currentScope = getExecutableStaticValue(str, iteration, ApplicationDomain.currentDomain, String(name));
			}
			var len:int = iteration.length;
			i = iteration.index;
			// trace(' -- cycle');
			while(i<len){
				chr = str.charAt(i);
				// trace('next char:', chr);
				if(chr==FUNCTION_CALL_OPEN){
					// trace('function call');
					if(currentScope is Function) currentScope = MethodCaller.apply(currentScope as Function, getArrayData(str, iteration, scope, FUNCTION_CALL_CLOSE));
					else throw new EvalUtilsError(EvalUtilsError.getIsNotFunctionMessage(name));
					i = iteration.index+1;
					continue;
				}
				if(chr==DOT_CHAR){
					// trace('dot separated names');
					chr = str.charAt(++i);
					if(chr==DOT_CHAR){
						// trace('is descendants');
						isGetDescendants = true;
						chr = str.charAt(++i);
					}else isGetDescendants = false;
					if(chr==ATTRIBUTE_SEPARATOR){
						// trace('is attribute');
						isAttribute = true;
						chr = str.charAt(++i);
					}else isAttribute = false;
				}else if(chr!=DYNAMIC_NAME_OPEN){
					// trace('incorrect char');
					break;
				}
				iteration.index = i;
				name = getExecutableQName(str, iteration, scope);
				// trace('name: ', name);
				if(isGetDescendants){
					if(name.uri===null){
						var localName:String = name.localName;
						currentScope = isAttribute ? currentScope..@*.(localName()==localName) : currentScope..*.(localName()==localName);
					}else currentScope = isAttribute ? currentScope..@*.(name()==name) : currentScope..*.(name()==name);
					//currentScope = isAttribute ? currentScope..@[name] : currentScope..[name]; вызывает непредвиденную ошибку при работе descendants+qname
				}else{
					currentScope = isAttribute ? currentScope.@[name] : currentScope[name];
				}
				// trace('scope: ', currentScope);
				i = iteration.index;
				
			}
			iteration.index = i;
			// trace('------------------------ STOP PARSE EXECUTABLE');
			return currentScope;
		}
		static public function getExecutableStaticValue(str:String, iteration:LengthIterationIndex, appd:ApplicationDomain=null, name:String=''):Object{
			if(!appd) appd = ApplicationDomain.currentDomain;
			if(!name.length) name = getExecutableNameString(str, iteration);
			if(name in CONSTANTS) return CONSTANTS[name];
			var ret:Object;
			var i:int;
			var chr:String;
			while(!appd.hasDefinition(name)){
				i = iteration.index;
				chr = str.charAt(i);
				if(chr==DOT_CHAR){
					iteration.index = i+1;
					name += DOT_CHAR+getExecutableNameString(str, iteration);
				}else if(chr==NAMESPACE_SEPARATOR_PART){
					if(str.charAt(i+1)==NAMESPACE_SEPARATOR_PART){
						iteration.index = i+2;
						name += NAMESPACE_SEPARATOR+getExecutableNameString(str, iteration);
						break;
					}else throw new EvalUtilsError(EvalUtilsError.getIncorrectCharMessage(i+1));
				}else break;
			}
			ret = appd.getDefinition(name);
			iteration.index = i;
			return ret;
		}
		static public function getExecutableQName(str:String, iteration:LengthIterationIndex, scope:Object=null):QName{
			var qn:QName;
			var i:int = iteration.index;
			var chr:String = str.charAt(i);
			var nsuri:String;
			var name:String;
			if(chr==ANY_SIGN){
				nsuri = chr;
				i++;
			}else{
				nsuri = getExecutableNameData(str, iteration, scope);
				i = iteration.index;
			}
			if(str.charAt(i)==NAMESPACE_SEPARATOR_PART && str.charAt(i+1)==NAMESPACE_SEPARATOR_PART){
				i+=2;
				chr = str.charAt(i);
				if(chr==ANY_SIGN){
					name = chr;
					iteration.index = i+1;
				}else{
					iteration.index = i;
					name = getExecutableNameData(str, iteration, scope);
				}
			}
			if(name){
				if(nsuri==ANY_SIGN) qn = new QName(null, name);
				else{
					qn = new QName(scope is XML ? (scope as XML).namespace(nsuri) : getExecutableData(nsuri, new LengthIterationIndex(nsuri.length), scope), name);
				}
			}else qn = new QName('', nsuri);
			return qn;
		}
		static public function getExecutableNameData(str:String, iteration:LengthIterationIndex, scope:Object=null):*{
			var i:int = iteration.index;
			var ret:*;
			if(str.charAt(i)==DYNAMIC_NAME_OPEN){
				iteration.index = i+1;
				ret = parseValue(str, iteration, scope);
				i = iteration.index;
				while(str.charAt(i)!=DYNAMIC_NAME_CLOSE) i++;
				iteration.index = i+1;
			}else{
				ret = getExecutableNameString(str, iteration);
			}
			return ret;
		}
		static public function getExecutableNameString(str:String, iteration:LengthIterationIndex):String{
			var len:int = iteration.length;
			var i:int = iteration.index;
			var dest:String = str.charAt(i);
			for(i=i+1; i<len; i++){
				if(str.charAt(i) in RESTRICTED_NAME_CHARS_OBJECT) break;
			}
			dest = str.substring(iteration.index, i);
			iteration.index = i;
			return dest;
		}
	}
}