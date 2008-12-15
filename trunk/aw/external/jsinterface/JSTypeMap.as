package aw.external.jsinterface{
	import aw.external.jsinterface.objects.JSArray;
	import aw.external.jsinterface.objects.JSAttr;
	import aw.external.jsinterface.objects.JSCSSRule;
	import aw.external.jsinterface.objects.JSCSSRuleList;
	import aw.external.jsinterface.objects.JSCSSStyleDeclaration;
	import aw.external.jsinterface.objects.JSCSSStyleSheet;
	import aw.external.jsinterface.objects.JSCSSValue;
	import aw.external.jsinterface.objects.JSComment;
	import aw.external.jsinterface.objects.JSDocument;
	import aw.external.jsinterface.objects.JSDocumentFragment;
	import aw.external.jsinterface.objects.JSDocumentType;
	import aw.external.jsinterface.objects.JSElement;
	import aw.external.jsinterface.objects.JSEvent;
	import aw.external.jsinterface.objects.JSHTMLElement;
	import aw.external.jsinterface.objects.JSHTMLStyleObject;
	import aw.external.jsinterface.objects.JSHistory;
	import aw.external.jsinterface.objects.JSLocation;
	import aw.external.jsinterface.objects.JSMediaList;
	import aw.external.jsinterface.objects.JSNamedNodeMap;
	import aw.external.jsinterface.objects.JSNavigator;
	import aw.external.jsinterface.objects.JSNavigatorPlugins;
	import aw.external.jsinterface.objects.JSNode;
	import aw.external.jsinterface.objects.JSNodeList;
	import aw.external.jsinterface.objects.JSScreen;
	import aw.external.jsinterface.objects.JSStyleSheet;
	import aw.external.jsinterface.objects.JSWindow;
	
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public dynamic class JSTypeMap extends Object{
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSARRAY:String = 'JSARRAY_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSARRAY_MAP:Object = {
			concat:JSArray,
			reverse:JSArray,
			slice:JSArray,
			sort:JSArray,
			splice:JSArray
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSATTR:String = 'JSATTR_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSATTR_MAP:Object = {
			ownerElement:JSElement
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSCSSRULE:String = 'JSCSSRULE_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSCSSRULE_MAP:Object = {
			parentRule:JSCSSRule,
			parentStyleSheet:JSCSSStyleSheet
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSCSSRULE_LIST:String = 'JSCSSRULE_LIST_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSCSSRULE_LIST_MAP:Object = {
			item:JSCSSRule
		}
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSCSSSTYLE_DECLARATION:String = 'JSCSSSTYLE_DECLARATION_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSCSSSTYLE_DECLARATION_MAP:Object = {
			parentRule:JSCSSRule,
			getPropertyCSSValue:JSCSSValue
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSCSSSTYLE_SHEET:String = 'JSCSSSTYLE_SHEET_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSCSSSTYLE_SHEET_MAP:Object = {
			cssRules:JSCSSRuleList,
			ownerRule:JSCSSRule
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSDOCUMENT:String = 'JSDOCUMENT_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSDOCUMENT_MAP:Object = {
			anchors:JSArray,
			applets:JSArray,
			body:JSElement,
			doctype:JSDocumentType,
			documentElement:JSElement,
			embeds:JSArray,
			forms:JSArray,
			images:JSArray,
			links:JSArray,
			plugins:JSArray,
			styleSheets:JSArray,
			createAttribute:JSAttr,
			createAttributeNS:JSAttr,
			createComment:JSComment,
			createDocumentFragment:JSDocumentFragment,
			createElement:JSHTMLElement,
			createElementNS:JSHTMLElement,
			getElementById:JSHTMLElement,
			getElementsByTagName:JSArray
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSDOCUMENT_TYPE:String = 'JSDOCUMENT_TYPE_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSDOCUMENT_TYPE_MAP:Object = {
			entities:JSNamedNodeMap,
			notations:JSNamedNodeMap
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSELEMENT:String = 'JSELEMENT_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSELEMENT_MAP:Object = {
			getAttributeNode:JSAttr,
			getAttributeNodeNS:JSAttr,
			getElementsByTagName:JSNodeList,
			getElementsByTagNameNS:JSNodeList,
			removeAttributeNode:JSAttr,
			setAttributeNode:JSAttr,
			setAttributeNodeNS:JSAttr
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSEVENT:String = 'JSEVENT_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSEVENT_MAP:Object = {
			fromElement:JSElement,
			srcElement:JSElement,
			toElement:JSElement
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSFORM:String = 'JSFORM_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSFORM_MAP:Object = {
			elements:JSArray
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSHTMLELEMENT:String = 'JSHTMLELEMENT_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSHTMLELEMENT_MAP:Object = {
			attributes:JSArray,
			childNodes:JSArray,
			style:JSHTMLStyleObject,
			addEventListener:JSHTMLElement,
			appendChild:JSHTMLElement,
			cloneNode:JSNode,
			getAttributeNode:JSNode,
			getElementsByTagName:JSArray,
			removeAttributeNode:JSAttr,
			removeChild:JSNode,
			replaceChild:JSNode,
			setAttributeNode:JSAttr
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSNAVIGATOR:String = 'JSNAVIGATOR_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSNAVIGATOR_MAP:Object = {
			mimeTypes:JSArray,
			plugins:JSNavigatorPlugins
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSNODE:String = 'JSNODE_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSNODE_MAP:Object = {
			attributes:JSNamedNodeMap,
			childNodes:JSNodeList,
			firstChild:JSNode,
			lastChild:JSNode,
			nextSibling:JSNode,
			ownerDocument:JSDocument,
			parentNode:JSNode,
			previousSibling:JSNode,
			appendChild:JSNode,
			cloneNode:JSNode,
			insertBefore:JSNode,
			removeChild:JSNode,
			replaceChild:JSNode
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSNODE_LIST:String = 'JSNODE_LIST_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSNODE_LIST_MAP:Object = {
			item:JSNode
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSSTYLE_SHEET:String = 'JSSTYLE_SHEET_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSSTYLE_SHEET_MAP:Object = {
			media:JSMediaList,
			ownerNode:JSNode,
			parentStyleSheet:JSStyleSheet
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSWINDOW:String = 'JSWINDOW_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSWINDOW_MAP:Object = {
			document:JSDocument,
			event:JSEvent,
			frames:JSArray,
			history:JSHistory,
			location:JSLocation,
			navigator:JSNavigator,
			opener:JSWindow,
			parent:JSWindow,
			screen:JSScreen,
			self:JSWindow,
			top:JSWindow,
			window:JSWindow,
			getComputedStyle:JSCSSStyleDeclaration,
			open:JSWindow
		};
		/** 
		* 
		* @public (constant) 
		*/
		static public const JSXML_HTTP_REQUEST:String = 'JSXML_HTTP_REQUEST_MAP';
		/** 
		* 
		* @private (constant) 
		*/
		static private const JSXML_HTTP_REQUEST_MAP:Object = {
			responseXML:JSDocument
		};
		/** 
		* 
		* @public 
		* @param args 
		* @return void 
		*/
		public function JSTypeMap(...args:Array):void{
			super();
			if(args.length){
				addList(args);
			}
		}
		/** 
		* 
		* @public 
		* @param name 
		* @param cls 
		* @return void 
		*/
		public function addType(name:String, cls:Class):void{
			if(name && cls){
				this[name] = cls;
			}
		}
		/** 
		* 
		* @public 
		* @param obj 
		* @return void 
		*/
		public function addTypes(obj:Object):void{
			if(obj){
				var item:Object;
				for(var p:String in obj){
					item = obj[p];
					if(item is JSTypeMap) this.addTypes(item);
					else this.addType(p, item as Class);
				}
			}
		}
		/** 
		* 
		* @public 
		* @param args 
		* @return void 
		*/
		public function addList(...args:Array):void{
			var len:int = args.length;
			var item:Object;
			for(var i:int=0; i<len; i++){
				item = args[i];
				if(item is Array){
					this.addList.apply(this, item);
				}else if(item is String){
					this.addTypes(JSTypeMap[item]);
				}else{
					this.addTypes(item);
				}
			}
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return Class 
		*/
		public function getType(name:String):Class{
			return (name in this && this[name] is Class) ? this[name] : JSDynamic;
		}
		/** 
		* 
		* @public 
		* @param name 
		* @return Boolean 
		*/
		public function hasType(name:String):Boolean{
			return name in this;
		}
	}
}