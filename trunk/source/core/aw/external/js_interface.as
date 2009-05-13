/*
* @author Galaburda Oleg a_[w]
* http://actualwave.com/ 
*
*/

package aw.external{

	/** 
	* Namespace used to gain access to the specific features of JSInterface, JSDynamic and types of objects included in this library.
	* 
	* @example
<listing version="3.0">
package {
	import aw.external.JSInterface;
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.objects.JSHTMLElement;
	
	import flash.display.Sprite;
	
	public class Test extends Sprite{
		public function Test():void{
			super();
			JSInterface.initialize(this, true);
			var document:JSDynamic = JSInterface.document;
			// 	get a list of names of properties
			var properties:Array = document.js_interface::properties;
			trace(properties);
			// obtain the value of the string path to an object
			var element:JSHTMLElement = document.js_interface::getValue("body.childNodes[1]", JSHTMLElement);
			trace(element);
			// classifу properties of the object by using the callback function
			trace(element.js_interface::forEach(function(target:Object, propertyName:String, propertyValue:*):void{trace(propertyName, ' = ', propertyValue);}));
		}
	}
}
/&#042; trace output
namespaces,lastModified,onstorage,parentNode,onstoragecommit,nodeType,...
[object]
nextSibling  =  [object HTMLNoShowElement]
onresizeend  =  null
onrowenter  =  null
aria-haspopup  =  undefined
childNodes  =  undefined
ondragleave  =  null
canHaveHTML  =  undefined
onbeforepaste  =  null
ondragover ...
&#042;/
</listing>
	* @public (namespace) 
	* @langversion ActionScript 3.0 
	* @playerversion Flash 9.0.28.0 
	*/
	public namespace js_interface = 'aw.external::js_interface';
}