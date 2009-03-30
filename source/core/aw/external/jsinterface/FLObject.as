package aw.external.jsinterface{
	import aw.external.JSInterface;
	import aw.external.jsinterface.flobject.FLObjectCommands;
	import aw.utils.ClassUtils;
	import aw.utils.EvalUtils;
	
	import flash.external.ExternalInterface;
	import flash.system.ApplicationDomain;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	

	/** 
	* Класс связывающий объекты из среды Flash Player'а переданные в JavaScript. Через этот класс проходят все запросы связанные с этими обхъектами из среды JavaScript.
	* Так же, этот класс является менеджером всех переданных в JavaScript объектов и содержит о всех таких объектах информацию и ссылки на оригинальные объекты. 
	* Стек в котором хранятся ссылки на эти объекты сам не отчищается, его можно отчистить вручную используя методы FLObject.clear() или  FLObject.removeObject() для индивидуального объекта.
	* Операцию отчистки можно провести через основной класс - JSInterface, поэтому этот класс был скрыт.
	* 
	* @private (internal) 
	* @see aw.external.JSInterface
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	internal class FLObject extends Object{

		/** 
		* Базовое имя объекта - его ссылки, по которой он будет идентифицироваться в запросах из JavaScript среды. 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECTS_BASE_NAME:String = 'fo';

		/** 
		* Имя JavaScript метода создающего объект в среде Flash Player'а.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_CREATE_METHOD:String = 'jsiCaller_Object_CreateMethod';

		/** 
		* Имя JavaScript метода получающего экземпляр объекта в среде Flash Player'а из строковой ссылки на этот объект.
		* Использует класс aw.utils.EvalUtils.
		* @see aw.utils.EvalUtils
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_INSTANCE_METHOD:String = 'jsiCaller_Object_InstanceMethod';

		/** 
		* Имя JavaScript метода вызывающего метод объекта в среде Flash Player'а.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_CALL_METHOD:String = 'jsiCaller_Object_CallMethod';

		/** 
		* Имя JavaScript метода вызывающего предопределённую команду.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_CALL_COMMAND:String = 'jsiCaller_Object_CallCommand';

		/** 
		* Имя JavaScript метода проверяющего существование свойства у объекта в среде Flash Player'а.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_HAS_METHOD:String = 'jsiCaller_Object_HasMethod';

		/** 
		* Имя JavaScript метода получающего значение свойства объекта в среде Flash Player'а.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_GET_METHOD:String = 'jsiCaller_Object_GetMethod';

		/** 
		* Имя JavaScript метода задающего значение свойству объекта в среде Flash Player'а.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_SET_METHOD:String = 'jsiCaller_Object_SetMethod';

		/** 
		* Имя JavaScript метода удаляющего свойство объекта в среде Flash Player'а.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_DELETE_METHOD:String = 'jsiCaller_Object_DeleteMethod';

		/** 
		* Имя JavaScript метода удаляющего объект из стека FLObject.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECT_REMOVE_METHOD:String = 'jsiCaller_Object_RemoveMethod';

		/** 
		* Имя JavaScript метода полной отчистки стека FLObject.
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const OBJECTS_CLEAR:String = 'jsiCaller_Objects_Clear';

		/** 
		* Объект передающийся в качестве ошибки доступа, если JavaScript попытался получить доступ к объекту из среды Flash Player'а напрямую, без разрешения. 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const JS_ACCESS_DENIED_ERROR:Object = {error:{name:'{Flash} Error: Access denied.', message:'Access denied to Flash Player objects.'}};

		/** 
		* Стек всех объектов, перенесённых из среды Flash Player'а за его пределы.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _objects:Object = {};

		/** 
		* Индекс ссылок на объекты. Увеличивается на один каждый раз, когда в стеке появляется новая ссылка на объект.
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _objectsIndex:int = 0;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected var _initialized:Boolean = false;

		/** 
		* Генератор новых ссылок.
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function get newObjectName():String{
			return OBJECTS_BASE_NAME+String(_objectsIndex++);
		}

		/** 
		* Метод инициализации FLObject. Регистрирует необходимые JavaScript методы, для работы с объектами из среды Flash Player'а в JavaScript среде. 
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function initialize():void{
			if(_initialized) return;
			if(JSCore.hasDocument()){
				ExternalInterface.addCallback(OBJECT_CREATE_METHOD, objectCreateMethod);
				ExternalInterface.addCallback(OBJECT_INSTANCE_METHOD, objectInstanceMethod);
				ExternalInterface.addCallback(OBJECT_CALL_METHOD, objectCallMethod);
				ExternalInterface.addCallback(OBJECT_CALL_COMMAND, objectCallCommand);
				ExternalInterface.addCallback(OBJECT_HAS_METHOD, objectHasMethod);
				ExternalInterface.addCallback(OBJECT_GET_METHOD, objectGetMethod);
				ExternalInterface.addCallback(OBJECT_SET_METHOD, objectSetMethod);
				ExternalInterface.addCallback(OBJECT_DELETE_METHOD, objectDeleteMethod);
				ExternalInterface.addCallback(OBJECT_REMOVE_METHOD, removeObject);
				ExternalInterface.addCallback(OBJECTS_CLEAR, clearAllFromJS);
			}
			_initialized = true;
		}

		/** 
		* Добавить объект в стек.
		* 
		* 
		* @public 
		* @param o Исходный объект.
		* @return String Текстовая ссылка на объект в стеке.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function addObject(o:Object):String{
			for(var p:String in _objects){
				if(_objects[p]===o) return p;
			}
			var name:String = newObjectName;
			_objects[name] = o;
			return name;
		}

		/** 
		* Получить объект из стека по ссылке.
		* 
		* 
		* @public 
		* @param name Ссылка на объект в стеке.
		* @return Object Исходный объект.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getObject(name:String):Object{
			return _objects[name];
		}

		/** 
		* Удалить объект из стека по его ссылке.
		* 
		* 
		* @public 
		* @param name Ссылка на объект в стеке.
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function removeObject(name:String):void{
			delete _objects[name];
		}

		/** 
		* Удалить все объекты из стека.
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function removeAllObjects():void{
			for(var p:String in _objects){
				removeObject(p);
			}
		}

		/** 
		* Алиас метода FLObjects.removeAllObjects();
		* 
		* 
		* @public 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function clear():void{
			removeAllObjects();
		}

		/** 
		* Метод вызываемый из JavaScript при инициализации отчистки стеков хранящих объекты и функции. Позволяет отчищать стеки с сохранёнными объектами прямо из JavaScript. 
		* 
		* 
		* @private (internal) 
		* @param jsCallbacks 
		* @param jsObjects 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static internal function clearAllFromJS(jsCallbacks:Boolean=true, jsObjects:Boolean=true):void{
			if(jsCallbacks) JSCaller.clear();
			if(jsObjects) FLObject.clear();
		}

		/** 
		* Метод вызываемый из JavaScript для создания объекта в среде Flash Player'а.
		* 
		* 
		* @private (protected) 
		* @param className Имя класса
		* @param args Аргументы передаваемые конструктору класса
		* @return Object Информация о созданном объекте, либо информация о ошибке
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectCreateMethod(className:String, args:Array):Object{
			if(!JSInterface.allowJavaScriptAccess) return JS_ACCESS_DENIED_ERROR;
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectCreateMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectCreateMethod, arguments);
			}
		}

		/** 
		* Метод создания объекта.
		* 
		* 
		* @private (protected) 
		* @param className Имя класса
		* @param args Аргументы передаваемые конструктору класса
		* @return Object Информация о созданном объекте
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectCreateMethod(className:String, args:Array):Object{
			var v:Object = ClassUtils.applyByName(className, JSInfoObject.convertByList(args));
			return {value:JSInfoObject.create(v)};
		}

		/** 
		* Метод вызываемый из JavaScript для получения ссылки на объект в среде Flash Player'а.
		* 
		* 
		* @private (protected) 
		* @param path Путь к объекту, имя класса, путь к любому члену класса или ключевое слово: "stage", "root", "applicationDomain".
		* @param target Информация о объекте к которому следует применить указанный путь.
		* @return Object Информация о полученных данных, либо информация о ошибке
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectInstanceMethod(path:String, target:Object):Object{
			if(!JSInterface.allowJavaScriptAccess) return JS_ACCESS_DENIED_ERROR;
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectInstanceMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectInstanceMethod, arguments);
			}
		}

		/** 
		* Метод получения данных по строке.
		* 
		* 
		* @private (protected) 
		* @param path Путь к объекту, имя класса, путь к любому члену класса или ключевое слово: "stage", "root", "applicationDomain".
		* @param target Информация о объекте к которому следует применить указанный путь.
		* @return Object Информация о полученных данных
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectInstanceMethod(path:String, target:Object):Object{
			var v:Object;
			if(!target){
				if(path=='stage') v = JSInterface.stage;
				else if(path=='root') v = JSInterface.root;
				else if(path=='applicationDomain') v = ApplicationDomain.currentDomain;
			}
			if(!v) v = EvalUtils.evaluate(path, JSInfoObject.convert(target));
			return {value:JSInfoObject.create(v)};
		}

		/** 
		* Метод вызываемый из JavaScript для вызова метода объекта в среде Flash Player'а.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя метода.
		* @param args Аргументы передаваемые методу.
		* @param uri URI пространства имён в котором лежит метод.
		* @return Object Объект с информацией о возвращённом результате иои о произошедшей ошибке.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectCallMethod(objectName:String, name:String, args:Array, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectCallMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectCallMethod, arguments);
			}
		}

		/** 
		* Метод вызова метода объекта.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя метода.
		* @param args Аргументы передаваемые методу.
		* @param uri URI пространства имён в котором лежит метод.
		* @return Object Объект с информацией о возвращённом результате иои о произошедшей ошибке.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectCallMethod(objectName:String, name:String, args:Array, uri:String):Object{
			var obj:Object = getObject(objectName);
			var qn:QName = new QName(uri, name);
			//trace(obj, qn);
			//trace(args);
			//trace(JSInfoObject.convertByList(args));
			var val:* = obj[qn].apply(obj, JSInfoObject.convertByList(args));
			return {value:JSInfoObject.create(val)};
		}

		/** 
		* Метод вызова предопределённой команды.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param cmd Вызываемая команда.
		* @param args Аргументы передаваемые команде.
		* @return * Возвращаемый результат.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectCallCommand(objectName:String, cmd:String, args:Array=null):*{
			return FLObjectCommands.callCommand(getObject(objectName), cmd, args);
		}

		/** 
		* Метод вызываемый из JavaScript для проверки существования свойства у объекта в среде Flash Player'а.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя свойства.
		* @param uri URI пространства имён в котором лежит свойство.
		* @return * Информация о свойстве или о ошибке
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectHasMethod(objectName:String, name:String, uri:String):*{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectGetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectGetMethod, arguments);
			}
		}

		/** 
		* Метод для проверки существования свойства у объекта.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя свойства.
		* @param uri URI пространства имён в котором лежит свойство.
		* @return Object Информация о свойстве или о ошибке
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectHasMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create((new QName(uri, name)) in obj)};
		}

		/** 
		* Метод вызываемый из JavaScript для получения значения свойства объекта в среде Flash Player'а.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя свойства.
		* @param uri URI пространства имён в котором лежит свойство.
		* @return Object Информация о значении свойства или о произошедшей ошибке
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectGetMethod(objectName:String, name:String, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectGetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectGetMethod, arguments);
			}
		}

		/** 
		* Метод для получения значения свойства объекта.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя свойства.
		* @param uri URI пространства имён в котором лежит свойство.
		* @return Object Информация о значении свойства или о произошедшей ошибке
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectGetMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create(obj[new QName(uri, name)])};
		}

		/** 
		* Метод вызываемый из JavaScript для указания значения свойству объекта в среде Flash Player'а.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя свойства.
		* @param value Новое значение свойства.
		* @param uri URI пространства имён в котором лежит свойство.
		* @return Object Информация о ошибке, в случае её возникновения
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectSetMethod(objectName:String, name:String, value:Object, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectSetMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectSetMethod, arguments);
			}
		}

		/** 
		* Метод для указания значения свойству объекта.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя свойства.
		* @param value Новое значение свойства.
		* @param uri URI пространства имён в котором лежит свойство.
		* @return Object Информация о ошибке, в случае её возникновения
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectSetMethod(objectName:String, name:String, value:Object, uri:String):Object{
			var obj:Object = getObject(objectName);
			value = JSInfoObject.convert(value);
			return {value:JSInfoObject.create(obj[new QName(uri, name)] = value)};
		}

		/** 
		* Метод вызываемый из JavaScript для удаления свойства из объекта в среде Flash Player'а.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя свойства.
		* @param uri URI пространства имён в котором лежит свойство.
		* @return Object Информация о выполненной операции или о произошедшей ошибке.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function objectDeleteMethod(objectName:String, name:String, uri:String):Object{
			if(JSInterface.redirectFlashExceptions){
				return callObjectMethodWithExceptionRedirecting(callObjectDeleteMethod, arguments);
			}else{
				return callObjectMethodWithExceptionHandling(callObjectDeleteMethod, arguments);
			}
		}

		/** 
		* Метод удаления свойства.
		* 
		* 
		* @private (protected) 
		* @param objectName Ссылка на объект в стеке.
		* @param name Имя свойства.
		* @param uri URI пространства имён в котором лежит свойство.
		* @return Object Информация о выполненной операции или о произошедшей ошибке.
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectDeleteMethod(objectName:String, name:String, uri:String):Object{
			var obj:Object = getObject(objectName);
			return {value:JSInfoObject.create(delete obj[new QName(uri, name)])};
		}

		/** 
		* Метод вызвающий передаваемые ему методы с отловом происходящих ошибок для последующей передачи в JavaScript среду.
		* 
		* 
		* @private (protected) 
		* @param f 
		* @param args 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectMethodWithExceptionRedirecting(f:Function, args:Array):Object{
			var ret:Object;
			try{
				ret = f.apply(null, args);
			}catch(e:Error){
				ret = {value:undefined, error:{id:e.errorID, def:getQualifiedClassName(e), name:e.name, message:e.message, stackTrace:e.getStackTrace()}};
			}
			return ret;
		}

		/** 
		* Метод вызвающий передаваемые ему методы с отловом происходящих ошибок для определения их будущей судьбы - вызвать или отобразить в OUTPUT.
		* 
		* 
		* @private (protected) 
		* @param f 
		* @param args 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected function callObjectMethodWithExceptionHandling(f:Function, args:Array):Object{
			var ret:Object;
			try{
				ret = f.apply(null, args);
			}catch(e:Error){
				if(JSInterface.traceExceptionOnly){
					trace(e.getStackTrace());
				}else{
					if(JSInterface.exceptionHandler!=null) setTimeout(JSInterface.exceptionHandler, 1, e);
					else throw e;
				}
			}
			return ret;
		}
	}
}