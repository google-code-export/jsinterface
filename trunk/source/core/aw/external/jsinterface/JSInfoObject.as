package aw.external.jsinterface{
	import aw.external.js_interface;
	import aw.utils.ClassUtils;
	
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	[ExcludeClass]
	/**
	 * Класс управляющий объектами информации о импортируемых или экспортируемых объектах между средами выполнения. 
	 * Он собирает информацию о экспортируемых объектах из среды Flash Player'а и обрабатывает информацию полученную о 
	 * объектах импортируемых из JavaScript среды.
	 * Умеет определять дважды перенесённые объекты и подменяет их оригинальными. К примеру, если объект из среды Flash Player'а 
	 * был перенесён в JavaScript, а потом возвращён, то окончательным значением будет не объект JSDynamic, как для JavaScript 
	 * объекта, а оригинальный объект вызванный из стека переносимых объектов.
	 * 
	 * @private
	 * @see aw.external.jsinterface.JSDynamic
	 * @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	 */
	public class JSInfoObject extends Object{
		
		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const SIDE:String = 'FL';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JAVASRIPT_SIDE:String = 'FL';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const NUMBER_TYPE:String = 'number';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const STRING_TYPE:String = 'string';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const BOOLEAN_TYPE:String = 'boolean';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const ARRAY_TYPE:String = 'array';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_TYPE:String = 'object';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const FUNCTION_TYPE:String = 'function';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const VOID_TYPE:String = 'void';

		/** 
		* 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public var value:String;

		/** 
		* 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public var type:String = OBJECT_TYPE;

		/** 
		* 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public var isComplex:Boolean = true;

		/** 
		* 
		* 
		* 
		* @public 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public var side:String = JAVASRIPT_SIDE;

		/** 
		* Оболочка для информации о импортируемом объекте. Получает в качестве параметра простой объект и переносит все необходимые свойства. 
		* 
		* 
		* @public 
		* @param obj Объект с информацией о JavaScript объекте с которым связана информация.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSInfoObject(obj:Object):void{
			super();
			if(obj){
				value = obj.value;
				type = obj.type;
				isComplex = obj.isComplex;
				side = obj.side;
			}
		}

		/** 
		* Создаёт простой объект с информацией для передачи её в JavaScript среду.
		* 
		* 
		* @public 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toObject():Object{
			return {value:this.value, type:this.type, isComplex:this.isComplex, side:this.side};
		}

		/** 
		* Строковое представление объекта.
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toString():String{
			return '{value:'+this.value+', type:'+this.type+', isComplex:'+this.isComplex+', side:'+this.side+'}';
		}
		

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const _types:Dictionary = function():Dictionary{
			var ret:Dictionary = new Dictionary();
			ret[XML]		= createXMLInfo;
			ret[XMLList]	= createXMLListInfo;
			ret[Number]		= createBasicInfo;
			ret[String]		= createBasicInfo;
			ret[Boolean]	= createBasicInfo;
			ret[Function]	= createFunctionInfo;
			ret[JSDynamic]	= createJSDynamicInfo;
			ret[JSComplex]	= createJSComplexInfo;
			ret[JSSimple]	= createJSSimpleInfo;
			ret[Object]		= createObjectInfo;
			ret[Array]		= createObjectInfo;
			return ret;
		}();

		/** 
		* Создаёт объект информации из объектов любых типов.
		* 
		* 
		* @public 
		* @param val Любой передаваемый в JavaScript объект.
		* @return Object Объект с информацией о объекте.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(value:*, canBeComplex:Boolean=true):Object{
			//trace('create', value);
			if(!value) return value;
			var cls:Class = ClassUtils.getClassDefinition(value);
			var ret:Object;
			if(canBeComplex){
				if(JSSimple.isSimpleType(cls)){
					ret = create(value, false);
				}else if(cls in _types){
					ret = _types[cls](value);
				}else{
					if(value is Function){ // Function
						ret = createFunctionInfo(value as Function);
					}else if(value is JSDynamic){ // JavaScript Object
						ret = createJSDynamicInfo(value as JSDynamic);
					}else if(value is IJSSimple){ // Force Simple Object
						ret = createJSSimpleInfo(value as IJSSimple);
					}else if(value is JSComplex){ // Complex Object
						ret = createJSComplexInfo(value as JSComplex);
					}else{ // Simple Object
						ret = createObjectInfo(value, canBeComplex, cls);
					}
				}
			}else{ // Verify registered Simple Object
				if(cls in _types) ret = _types[cls](value);
				else ret = createObjectInfo(value, false, cls);
			}
			//if(ret.constructor == Object) trace(' o ', ret.type, ret.value);
			//else trace(' - ', ret);
			return ret;
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param value 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function createXMLInfo(value:XML):String{
			//trace('- createXMLInfo');
			return value.toXMLString();
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param value 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function createXMLListInfo(value:XMLList):String{
			//trace('- createXMLListInfo');
			return value.toXMLString();
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param value 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function createBasicInfo(value:*):Object{
			//trace('- createBasicInfo');
			return value;
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param value 
		* @param canBeComplex 
		* @param cls 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function createObjectInfo(value:Object, canBeComplex:Boolean=false, cls:Class=null):Object{
			//trace('- createObjectInfo');
			if(!cls) cls = ClassUtils.getClassDefinition(value);
			var type:String = OBJECT_TYPE;
			var isComplex:Boolean = false;
			var className:String = '';
			if(canBeComplex && cls!=Array && cls!=Object){	// Complex Object
				className = getQualifiedClassName(value);
				value = FLObject.addObject(value);
				type = OBJECT_TYPE;
				isComplex = true;
			}else{
				if(cls==Object){							// Object
					type = OBJECT_TYPE;
					value = createByObject(value);
				}else if(cls==Array){						// Array
					type = ARRAY_TYPE;
					value = createByList(value as Array);
				}
			}
			return {value:value, type:type, className:className, isComplex:isComplex, side:SIDE};
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param value 
		* @return Object 
		* @see aw.external.jsinterface.JSDynamic 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function createJSDynamicInfo(value:JSDynamic):Object{
			//trace('- createJSDynamicInfo');
			return value.js_interface::info.toObject();
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param value 
		* @return Object 
		* @see aw.external.jsinterface.JSComplex 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function createJSComplexInfo(value:JSComplex):Object{
			//trace('- createJSComplexInfo');
			var target:Object = value.js_interface::target;
			return {value:FLObject.addObject(target), type:(target is Array) ? ARRAY_TYPE : OBJECT_TYPE, isComplex:true, side:SIDE};
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param value 
		* @return Object 
		* @see aw.external.jsinterface.IJSSimple 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function createJSSimpleInfo(value:IJSSimple):Object{
			//trace('- createJSSimpleInfo');
			return create(value.getSimpleData(), false);
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @param value 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function createFunctionInfo(value:Function):Object{
			//trace('- createFunctionInfo');
			if(JSDynamic.FUNCTION_TARGET_NAME in value){ // Javascript Function
				return (value as Object).jsDynamicTarget.js_interface::info.toObject();
			}else{ // Flash Function
				return {value:JSCaller.addCallback(value), type:FUNCTION_TYPE, isComplex:true, side:SIDE};
			}
		}

		/** 
		* Создаёт информацию для вложенных объектов и свойств других объектов.
		* 
		* 
		* @public 
		* @param obj 
		* @param createCopy 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function createByObject(obj:Object, createCopy:Boolean=true):Object{
			var ret:Object = createCopy ? {} : obj;
			if(obj){
				for(var p:String in obj){
					ret[p] = create(obj[p]);
				}
			}
			return ret;
		}

		/** 
		* Создаёт информацию для значений массива.
		* 
		* 
		* @public 
		* @param arr 
		* @param createCopy 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function createByList(arr:Array, createCopy:Boolean=true):Array{
			var ret:Array = createCopy ? [] : arr;
			if(arr){
				var len:int = arr.length;
				for(var i:int=0; i<len; i++) ret[i] = create(arr[i]);
			}
			return ret;
		}

		/** 
		* Преобразует объект с информацией в объект оболочку, который будет связан с JavaScript объектом.
		* 
		* 
		* @public 
		* @param obj 
		* @param cls 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function convert(obj:Object, cls:Class=null):*{
			if(!obj) return undefined;
			var jsd:JSDynamic;
			if(Object(obj).constructor==Object){
				if(obj.isComplex){
					if(!cls) cls = JSDynamic;
					if(obj.side==SIDE){
						if(obj.type==FUNCTION_TYPE){
							return Object(JSCaller.getCallback(obj.value));
						}else{
							return FLObject.getObject(obj.value);
						}
					}else{
						jsd = JSInstanceCache.getByInfo(obj, cls);
						if(obj.type==FUNCTION_TYPE){
							return jsd.js_interface::asFunction();
						}else return jsd;
					}
				}else{
					if(obj.type==ARRAY_TYPE){
						return convertByList(obj.value);
					}else if(obj.type==OBJECT_TYPE){
						return convertByObject(obj.value);
					}else{
						return obj.value;
					}
				}
			}
			return obj;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param arr 
		* @param createCopy 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function convertByList(arr:Array, createCopy:Boolean=true):Array{
			var ret:Array = createCopy ? [] : arr;
			if(arr){
				var val:*;
				var len:int = arr.length;
				for(var i:int=0; i<len; i++){
					val = arr[i];
					if(val is Number || val is String || val is Boolean) ret[i] = val;
					else ret[i] = convert(val);
				}
			}
			return ret;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @param createCopy 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function convertByObject(obj:Object, createCopy:Boolean=true):Object{
			var ret:Object = createCopy ? {} : obj;
			if(obj){
				var val:*;
				for(var p:String in obj){
					val = obj[p];
					if(val is Number || val is String || val is Boolean) ret[p] = val;
					else ret[p] = convert(val);
				}
			}
			return ret;
		}
	}
}