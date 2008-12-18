package aw.external.jsinterface{
	import aw.external.js_interface;
	
	import flash.utils.Proxy;
	[ExcludeClass]
	/**
	 *  @private
	 */
	public class JSInfoObject extends Object{
		static private const SIDE:String = 'FL';
		static private const JAVASRIPT_SIDE:String = 'FL';
		static private const NUMBER_TYPE:String = 'number';
		static private const STRING_TYPE:String = 'string';
		static private const BOOLEAN_TYPE:String = 'boolean';
		static private const ARRAY_TYPE:String = 'array';
		static private const OBJECT_TYPE:String = 'object';
		static private const FUNCTION_TYPE:String = 'function';
		static private const VOID_TYPE:String = 'void';
		public var value:String;
		public var type:String = OBJECT_TYPE;
		public var isComplex:Boolean = true;
		public var side:String = JAVASRIPT_SIDE;
		public function JSInfoObject(obj:Object):void{
			super();
			if(obj){
				value = obj.value;
				type = obj.type;
				isComplex = obj.isComplex;
				side = obj.side;
			}
		}
		public function toObject():Object{
			return {value:this.value, type:this.type, isComplex:this.isComplex, side:this.side};
		}
		public function toString():String{
			return '{value:'+this.value+', type:'+this.type+', isComplex:'+this.isComplex+', side:'+this.side+'}';
		}
		static public function create(val:*):Object{
			//----------------------- Simple data
			if(val is XML || val is XMLList) return val.toXMLString();
			if(!val || val is Number || val is String || val is Boolean){
				return val;
			}
			//----------------------- Complex data
			var type:String = OBJECT_TYPE;
			var isComplex:Boolean = false;
			if(val is Function){
				if(JSDynamic.FUNCTION_TARGET_NAME in val){ // Javascript Function
					return val.jsDynamicTarget.js_interface::info.toObject();
				}else{ // Flash Function
					isComplex = true;
					type = FUNCTION_TYPE;
					val = JSCaller.addCallback(val);
				}
			}else if(val is JSDynamic){ // JavaScript Object
				return (val as JSDynamic).js_interface::info.toObject();
			}else{ // Flash Object
				if(val is IJSSimple){ // Force Simple Object
					return create((val as IJSSimple).getSimpleData());
				}
				if(val is JSComplex || val is Proxy){ // Complex Object
					val = (val as JSComplex).js_interface::target;
					type = (val is Array) ? ARRAY_TYPE : OBJECT_TYPE;
					val = FLObject.addObject(val);
					isComplex = true;
				}else{ // Simple Object
					var cls:Class = (val as Object).constructor as Class;
					if(cls==Object){ // Object
						type = OBJECT_TYPE;
						val = createByObject(val);
					}else if(cls==Array){ // Array
						type = ARRAY_TYPE;
						val = createByList(val);
					}else{ // Complex Object
						val = FLObject.addObject(val);
						type = OBJECT_TYPE;
						isComplex = true;
					}
				}
			}
			return {value:val, type:type, isComplex:isComplex, side:SIDE};
		}
		static public function createByObject(obj:Object, createCopy:Boolean=true):Object{
			var ret:Object = createCopy ? {} : obj;
			if(obj){
				for(var p:String in obj){
					ret[p] = create(obj[p]);
				}
			}
			return ret;
		}
		static public function createByList(arr:Array, createCopy:Boolean=true):Array{
			var ret:Array = createCopy ? [] : arr;
			if(arr){
				var len:int = arr.length;
				for(var i:int=0; i<len; i++) ret[i] = create(arr[i]);
			}
			return ret;
		}
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