package aw.external.jsinterface.objects{
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;

	/** 
	* Contains all types of mapping objects to JavaScript objects. 
	* This class is the repository and when you create a new proxy 
	* object(JSDynamic instance), he is responsible for the 
	* attribution to him the object mapping.
	* 
	* 
	* @public 
	* @see aw.external.jsinterface.JSTypeMap
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public class JSObjectTypeMapper extends Object{

		/** 
		* 
		* 
		* 
		* @private 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var _initialized:Boolean = false;

		/** 
		* 
		* 
		* 
		* @private 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private var _types:Object = new Object();

		/** 
		* 
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function initialize():void{
			if(!_initialized){
				initPredefined();
				_initialized = true;
			}
		}

		/** 
		* 
		* 
		* 
		* @private 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private function initPredefined():void{
			addMapsByObject(
				JSArray, new JSTypeMap(JSTypeMap.JSARRAY), 
				JSAttr, new JSTypeMap(JSTypeMap.JSNODE, JSTypeMap.JSATTR), 
				JSCSSRule, new JSTypeMap(JSTypeMap.JSCSSRULE), 
				JSCSSRuleList, new JSTypeMap(JSTypeMap.JSCSSRULE_LIST), 
				JSCSSStyleDeclaration, new JSTypeMap(JSTypeMap.JSCSSSTYLE_DECLARATION), 
				JSCSSStyleSheet, new JSTypeMap(JSTypeMap.JSSTYLE_SHEET, JSTypeMap.JSCSSSTYLE_SHEET), 
				JSDocument, new JSTypeMap(JSTypeMap.JSNODE, JSTypeMap.JSDOCUMENT), 
				JSDocumentType, new JSTypeMap(JSTypeMap.JSNODE, JSTypeMap.JSDOCUMENT_TYPE), 
				JSElement, new JSTypeMap(JSTypeMap.JSNODE, JSTypeMap.JSELEMENT), 
				JSEvent, new JSTypeMap(JSTypeMap.JSEVENT), 
				JSForm, new JSTypeMap(JSTypeMap.JSFORM), 
				JSHTMLElement, new JSTypeMap(JSTypeMap.JSNODE, JSTypeMap.JSELEMENT, JSTypeMap.JSHTMLELEMENT), 
				JSNavigator, new JSTypeMap(JSTypeMap.JSNAVIGATOR), 
				JSNode, new JSTypeMap(JSTypeMap.JSNODE), 
				JSNodeList, new JSTypeMap(JSTypeMap.JSNODE_LIST), 
				JSStyleSheet, new JSTypeMap(JSTypeMap.JSSTYLE_SHEET), 
				JSWindow, new JSTypeMap(JSTypeMap.JSWINDOW), 
				JSXMLHttpRequest, new JSTypeMap(JSTypeMap.JSXML_HTTP_REQUEST)
			);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @param map 
		* @return void 
		* @see aw.external.jsinterface.JSTypeMap 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function addMap(name:String, map:JSTypeMap):void{
			_types[name] = map;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @param map 
		* @return void 
		* @see aw.external.jsinterface.JSTypeMap 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function addMapByObject(obj:Object, map:JSTypeMap):void{
			_types[getQualifiedClassName(obj)] = map;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function addMaps(... args:Array):void{
			var len:int = args.length;
			for(var i:int=0; i<len; i+=2){
				_types[args[i]] = args[i+1];
			}
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function addMapsByObject(... args:Array):void{
			var len:int = args.length;
			for(var i:int=0; i<len; i+=2){
				_types[getQualifiedClassName(args[i])] = args[i+1];
			}
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isMapExists(name:String):Boolean{
			return name in _types;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return JSTypeMap 
		* @see aw.external.jsinterface.JSTypeMap 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getMap(name:String):JSTypeMap{
			return _types[name];
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @return JSTypeMap 
		* @see aw.external.jsinterface.JSTypeMap 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getMapByObject(obj:Object):JSTypeMap{
			return _types[getQualifiedClassName(obj)];
		}
		JSAnchor;
		JSApplet;
		JSArray;
		JSAttr;
		JSCharacterData;
		JSComment;
		JSCSSRule;
		JSCSSRuleList;
		JSCSSStyleDeclaration;
		JSCSSStyleSheet;
		JSCSSValue;
		JSDate;
		JSDocument;
		JSDocumentFragment;
		JSDocumentType;
		JSElement;
		JSEvent;
		JSForm;
		JSFrame;
		JSHistory;
		JSHTMLElement;
		JSHTMLStyleObject;
		JSImage;
		JSLink;
		JSLocation;
		JSMediaList;
		JSMimeType;
		JSNamedNodeMap;
		JSNavigator;
		JSNavigatorPlugins;
		JSNode;
		JSNodeList;
		JSPlugin;
		JSScreen;
		JSStyleSheet;
		JSWindow;
		JSXMLHttpRequest;
	}
}