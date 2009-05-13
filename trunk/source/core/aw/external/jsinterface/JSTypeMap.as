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
	
	[Exclude]
	/** 
	* It’s the class of types mapping for properties and methods of JavaScript objects in Flash Player environment. 
	* Objects of this class serve as type managers for properties of classes extending JSDynamic. In order to indicate 
	* the property type, you need to indicated the property name and type. If a method name is indicated, the type will 
	* be applied to the retrieved value.
	* @example
<listing version="3.0">
package {
	import aw.external.js_interface;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	import aw.external.jsinterface.objects.JSNode;
	import aw.external.jsinterface.objects.JSElement;
	import aw.external.jsinterface.objects.JSObjectTypeMapper;
	public dynamic class AttributeNode extends JSNode{
		static private var _isTypesDefined:Boolean = false;
		public function AttributeNode(...args:Array):void{
			if(className){
				super('Attr', args);
			}else init();
		}
		override private function init():void{
			if(!_isTypesDefined){
				defineTypes();
				_isTypesDefined = true;
			}
			super.init();
		}
		public function get ownerElement():JSElement{
			return this.internalGet('ownerElement');
		}
		public function set ownerElement(p:JSElement):void{
			this.internalSet('ownerElement', p);
		}
		static private function defineTypes():void{
			// 	creating an object containing the relationship between the name of the properties and the type of content
			var types:JSTypeMap = new JSTypeMap();
			// indication of the property and the type of
			types.addType('ownerElement', JSElement);
			// registration map of types for the object class for which the map
			JSObjectTypeMapper.addMapByObject(AttributeNode, types);
		}
	}
}
</listing>
	* @public 
	* @see aw.external.jsinterface.JSDynamic
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public dynamic class JSTypeMap extends Object{

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSARRAY:String = 'JSARRAY_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSATTR:String = 'JSATTR_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSATTR_MAP:Object = {
			ownerElement:JSElement
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSCSSRULE:String = 'JSCSSRULE_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSCSSRULE_MAP:Object = {
			parentRule:JSCSSRule,
			parentStyleSheet:JSCSSStyleSheet
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSCSSRULE_LIST:String = 'JSCSSRULE_LIST_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSCSSRULE_LIST_MAP:Object = {
			item:JSCSSRule
		}

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSCSSSTYLE_DECLARATION:String = 'JSCSSSTYLE_DECLARATION_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSCSSSTYLE_DECLARATION_MAP:Object = {
			parentRule:JSCSSRule,
			getPropertyCSSValue:JSCSSValue
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSCSSSTYLE_SHEET:String = 'JSCSSSTYLE_SHEET_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSCSSSTYLE_SHEET_MAP:Object = {
			cssRules:JSCSSRuleList,
			ownerRule:JSCSSRule
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSDOCUMENT:String = 'JSDOCUMENT_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSDOCUMENT_TYPE:String = 'JSDOCUMENT_TYPE_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSDOCUMENT_TYPE_MAP:Object = {
			entities:JSNamedNodeMap,
			notations:JSNamedNodeMap
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSELEMENT:String = 'JSELEMENT_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSEVENT:String = 'JSEVENT_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSEVENT_MAP:Object = {
			fromElement:JSElement,
			srcElement:JSElement,
			toElement:JSElement
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSFORM:String = 'JSFORM_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSFORM_MAP:Object = {
			elements:JSArray
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSHTMLELEMENT:String = 'JSHTMLELEMENT_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSNAVIGATOR:String = 'JSNAVIGATOR_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSNAVIGATOR_MAP:Object = {
			mimeTypes:JSArray,
			plugins:JSNavigatorPlugins
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSNODE:String = 'JSNODE_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSNODE_LIST:String = 'JSNODE_LIST_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSNODE_LIST_MAP:Object = {
			item:JSNode
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSSTYLE_SHEET:String = 'JSSTYLE_SHEET_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSSTYLE_SHEET_MAP:Object = {
			media:JSMediaList,
			ownerNode:JSNode,
			parentStyleSheet:JSStyleSheet
		};

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSWINDOW:String = 'JSWINDOW_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const JSXML_HTTP_REQUEST:String = 'JSXML_HTTP_REQUEST_MAP';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JSXML_HTTP_REQUEST_MAP:Object = {
			responseXML:JSDocument
		};

		/** 
		* The constructor takes the objects to the method addTypes().
		* 
		* 
		* @public 
		* @param args 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSTypeMap(...args:Array):void{
			super();
			if(args.length){
				addList(args);
			}
		}

		/** 
		* It registers the type of property by the name of the property.
		* 
		* 
		* @public 
		* @param name Name of the property or method.
		* @param cls Property type class.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function addType(name:String, cls:Class):void{
			if(name && cls){
				this[name] = cls;
			}
		}

		/** 
		* Register types of properties from the associative array.
		* The name of the property should be the name of the property of the transferred object and the type - its value.
		* 
		* @public 
		* @param obj The object used as an associative array. 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
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
		* The method of registering pre-established map of types for embedded objects.
		* 
		* 
		* @public 
		* @param args 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		private function addList(...args:Array):void{
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
		* Returns the type of property.
		* 
		* 
		* @public 
		* @param name 
		* @return Class 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getType(name:String):Class{
			return (name in this && this[name] is Class) ? this[name] : JSDynamic;
		}

		/** 
		* Verifies the existence of the registered type for the property by its name.
		* 
		* 
		* @public 
		* @param name 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function hasType(name:String):Boolean{
			return name in this;
		}
	}
}