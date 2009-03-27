package aw.external.jsinterface.objects{
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	public class JSObjectTypeMapper extends Object{
		static private var _initialized:Boolean = false;
		static private var _types:Object = new Object();
		static public function initialize():void{
			if(!_initialized){
				initPredefined();
				_initialized = true;
			}
		}
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
		static public function addMap(name:String, map:JSTypeMap):void{
			_types[name] = map;
		}
		static public function addMapByObject(obj:Object, map:JSTypeMap):void{
			_types[getQualifiedClassName(obj)] = map;
		}
		static public function addMaps(... args:Array):void{
			var len:int = args.length;
			for(var i:int=0; i<len; i+=2){
				_types[args[i]] = args[i+1];
			}
		}
		static public function addMapsByObject(... args:Array):void{
			var len:int = args.length;
			for(var i:int=0; i<len; i+=2){
				_types[getQualifiedClassName(args[i])] = args[i+1];
			}
		}
		static public function isMapExists(name:String):Boolean{
			return name in _types;
		}
		static public function getMap(name:String):JSTypeMap{
			return _types[name];
		}
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