package aw.external.jsinterface.flobject{
	import aw.utils.PropertyInspector;
	import aw.utils.propertyinspector.PropertyAccessType;
	import aw.utils.propertyinspector.PropertyInspectorItem;
	import aw.utils.propertyinspector.PropertyItem;
	import aw.utils.propertyinspector.static_ns;
	
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	

	[ExcludeClass]
	/** 
	* Класс в котором реализованы команды вызываемые из JavaScript для объектов перенесённых из среды Flash Player'а.
	* 
	* 
	* @private 
	* @see aw.external.JSInterface
	* @see aw.external.jsinterface.JSCore
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public class FLObjectCommands extends Object{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const AS_SIMPLE:String = 'asSimple';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const PROPERTY_LIST:String = 'propertyList';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const METHOD_LIST:String = 'methodList';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'describeType';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const DESCRIBE_TYPE:String = 'className';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const SUPER_CLASS_NAME:String = 'superClassName';

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @param cmd 
		* @param args 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function callCommand(obj:Object, cmd:String, args:Array=null):*{
			var val:*;
			if(cmd==AS_SIMPLE){
				val = asSimple(obj);
			}else if(cmd==PROPERTY_LIST){
				val = propertyList(obj, (args && args[0]) ? args[0] : '');
			}else if(cmd==METHOD_LIST){
				val = methodList(obj);
			}else if(cmd==DESCRIBE_TYPE){
				val = FLObjectCommands.describeType(obj);
			}else if(cmd==CLASS_NAME){
				val = className(obj);
			}else if(cmd==SUPER_CLASS_NAME){
				val = superClassName(obj);
			}else{
				val = undefined;
			}
			return val;
		}

		/** 
		* Возвращает объект напрямую, как простой тип.
		* 
		* 
		* @public 
		* @param obj 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function asSimple(obj:Object):Object{
			return obj;
		}

		/** 
		* Сокращённое обозначение "чтение и запись".
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const READWRITE_TYPE:String = 'rw';

		/** 
		* Сокращённое обозначение "только для чтения".
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const READONLY_TYPE:String = 'r';

		/** 
		* Сокращённое обозначение "только для записи".
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const WRITEONLY_TYPE:String = 'w';

		/** 
		* Сокращённое обозначение "динамическое свойство".
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const DYNAMIC_TYPE:String = 'd';

		/** 
		* Возвращает список свойств объекта.
		* 
		* 
		* @public 
		* @param obj 
		* @param access 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function propertyList(obj:Object, access:String=''):Array{
			var pi:PropertyInspectorItem = PropertyInspector.getInfo(obj);
			var f:Function = obj is Class ? pi.static_ns::getProperties : pi.getProperties;
			var ret:Array = new Array();
			if(!access){
				getPropNames(f(PropertyAccessType.READWRITE), ret);
				getDynamicNames(obj, ret);
			}else{
				if(access==READWRITE_TYPE){
					getPropNames(f(PropertyAccessType.READWRITE), ret);
				}else if(access==READONLY_TYPE){
					getPropNames(f(PropertyAccessType.READONLY), ret);
				}else if(access==WRITEONLY_TYPE){
					getPropNames(f(PropertyAccessType.WRITEONLY), ret);
				}else{
					getDynamicNames(obj, ret);
				}
			}
			return ret;
		}

		/** 
		* Возвращает перебираемые цыклом for...in свойства, предполагается, что они были созданы динамически.
		* 
		* 
		* @private 
		* @param obj 
		* @param ret 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function getDynamicNames(obj:Object, ret:Array=null):Array{
			if(!ret) ret = new Array();
			for(var p:* in obj){
				ret.push(p is QName ? {uri:p.uri, localName:p.localName} : {uri:'', localName:p});
			}
			return ret;
		}

		/** 
		* Переформировывает список объектов QName в список простых объектов с аналогичными свойствами uri и localName, в которые переносит значения.
		* 
		* 
		* @private 
		* @param arr 
		* @param ret 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function getPropNames(arr:Array, ret:Array=null):Array{
			if(!ret) ret = new Array();
			var len:int = arr.length;
			var item:QName;
			for(var i:int=0; i<len; i++){
				item = (arr[i] as PropertyItem).name;
				ret.push({uri:item.uri, localName:item.localName});
			}
			return ret;
		}

		/** 
		* Возвращает список методов объекта.
		* 
		* 
		* @public 
		* @param obj 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function methodList(obj:Object):Array{
			var pi:PropertyInspectorItem = PropertyInspector.getInfo(obj);
			var ret:Array = new Array();
			var arr:Array = obj is Class ? pi.static_ns::methods : pi.methods;
			var len:int = arr.length;
			var item:QName;
			for(var i:int=0; i<len; i++){
				item = (arr[i] as PropertyItem).name;
				ret.push({uri:item.uri, localName:item.localName});
			}
			return ret;
		}

		/** 
		* Возвращает строковоке представление XML дерева описывающего класс. Использует метод flash.utils.describeType().
		* 
		* 
		* @public 
		* @param obj 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function describeType(obj:Object):String{
			return flash.utils.describeType(obj).toXMLString();
		}

		/** 
		* Возвращает имя класса объекта.
		* 
		* 
		* @public 
		* @param obj 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function className(obj:Object):String{
			return getQualifiedClassName(obj);
		}

		/** 
		* Возвращает имя суперкласса объекта.
		* 
		* 
		* @public 
		* @param obj 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function superClassName(obj:Object):String{
			return getQualifiedSuperclassName(obj);
		}
	}
}