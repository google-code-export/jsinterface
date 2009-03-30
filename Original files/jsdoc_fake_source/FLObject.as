package{
	/**
	 * Объект прообраз объектов передаваемых из среды Flash Player'а в JavaScript среде. 
	 * Работает аналогичным образом с JSDynamic, только со стороны JavaScript.
	 * Если на HTML странице расположен только один экземпляр Flash Player'а(говоря проще, 
	 * запущена только одна flashка) с инициализированным JSInterface, то параметр указывающий 
	 * имя экземпляра JavaScript менеджера JSInterface можно не указывать - он будет 
	 * использован по-умолчанию.
	 * @public
	 */
	public class FLObject extends Object{
		/**
		 * Имя экземпляра JavaScript менеджера JSInterface
		 * @public
		 */
		public var jsi:String;
		/**
		 * Информация о переданном flash объекте
		 * @public
		 */
		public var info:Object;
		/**
		 * Строковая ссылка, имя flash объекта в стеке переданных объектов. 
		 * @public
		 */
		public var name:String;
		/**
		 * Объекты FLObject создаются автоматически каждый раз, когда в JavaScript среду передаётся объект из среды Flash Player'а.
		 * @public
		 * @param j Имя экземпляра JavaScript менеджера JSInterface
		 * @param i Информация о переданном flash объекте
		 */
		function FLObject(j:String, i:Object){
			super();
			this.jsi = j;
			this.info = i;
			this.name = i.value;
		}
		/** 
		 * Вызвать свойство/метод из flash объекта
		 * @param n Имя метода.
		 * @param a Список передаваемых аргументов.
		 * @param u URI пространства имён в котором находится имя метода. Не обязательный параметр, можно не указывать если имя метода находится в базовом пространстве имён.
		 * @return Результат выполнения метода
		 */
		public function call(n:String, a:Array, u:String=''):*{
		}
		/** 
		 * Проверить наличие свойства во flash объекте
		 * @param n Имя свойства
		 * @param u URI пространства имён в котором находится имя свойства. Не обязательный параметр, можно не указывать если имя свойства находится в базовом пространстве имён.
		 * @return Возвращает TRUE, если свойство с заданным именем существует.
		 */
		public function has(n:String, u:String=''):Boolean{
			return true;
		}
		/** Получить значение свойства из flash объекта
		 * 
		 * @param n
		 * @param u URI пространства имён в котором находится имя свойства. Не обязательный параметр, можно не указывать если имя свойства находится в базовом пространстве имён.
		 * @return Значение свойства
		 */
		public function get(n:String, u:String=''):*{
		}
		/** Установить свойство во flash объекте
		 * 
		 * @param n
		 * @param v
		 * @param u URI пространства имён в котором находится имя свойства. Не обязательный параметр, можно не указывать если имя свойства находится в базовом пространстве имён.
		 * @return void
		 */
		public function set(n:String, v:*, u:String=''):void{
		}
		/** Удалить свойство из flash объекта
		 * 
		 * @param n Имя свойства
		 * @param u URI пространства имён в котором находится имя свойства. Не обязательный параметр, можно не указывать если имя свойства находится в базовом пространстве имён.
		 * @return Возвращает TRUE в случае успешного проведения операции
		 */
		public function del(n:String, u:String=''):Boolean{
			return true;
		}
		/** Получить данный flash объект не как ссылку, а напрямую - с последующей пастеризацией и потерей связи с flash окружением.
		 *  @return Возвращает flash объект напрямую, аналогично по действию оборачиванию в объект JSSimple при передаче со стороны Flash Player'а.
		 */
		public function getAsSimple():Object{
			return {};
		}
		/** Получить список свойств flash объекта
		 * 
		 * @param ac Модификатор доступа, указывается ключами R, W, RW, D(только динамические, не объявленные свойства).
		 * @return Список свойств flash объекта.
		 */
		public function getPropertyList(ac:String):Array{
			return [];
		}
		/** 
		 * Получить список методов flash объекта.
		 * @return Список методов flash объекта.
		 */
		public function getMethodList():Array{
			return [];
		}
		/** 
		 *  Метод возвращает в виде строки XML выдаваемый flash функцией flash.utils.describeType()
		 * @return XML дерево с информацией о классе flash объекта в виде строки
		 */
		public function describeType():String{
			return '';
		}
		/** 
		 * Получить имя класса flash объекта
		 * @return Имя класса
		 */
		public function getClassName():String{
			return '';
		}
		/** 
		 * Получить имя супер класса flash объекта
		 * @return Имя супер класса
		 */
		public function getSuperClassName():String{
			return '';
		}
		/** 
		 * Удалить данный flash объект из стека ссылок.
		 * @return void
		 */
		public function remove():void{
		}
		/**
		 * Создать объект в среде Flash Player'а.
		 * Возможность выполнения этой функции зависит от значения свойства JSInterface.allowJavaScriptAccess в среде Flash Player'а.
		 * @param cn Имя класса
		 * @param a Список аргументов передаваемых в конструктор
		 * @param jn Имя экземпляра менеджера JSIinterface
		 * @return Объект FLObject, содержащий информацию о оригинальном объекте из среды Flash Player'а
		 */
		static public function create(cn:String, a:Array, jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** 
		 * Получить flash объект по строковому пути к нему в точечной нотации.
		 * Возможность выполнения этой функции зависит от значения свойства JSInterface.allowJavaScriptAccess в среде Flash Player'а.
		 * @param p Путь к объекту
		 * @param t Целевой объект из среды Flash Player'а, к которому будет привязан путь
		 * @param jn Имя экземпляра менеджера JSIinterface
		 * @return Объект FLObject содержащий информацию о оригинальном объекте из среды Flash Player'а
		 */
		static public function instance(p:String, t:FLObject, jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** 
		 * Удалить все ссылки на сохранённые в стеках объекты и функции, как со стороны JavaScript среды, так и со стороны Flash Player'а.
		 * @param flc Удалить Flash каллбеки
		 * @param flo Удалить Flash объекты
		 * @param jsc Удалить JavaScript каллбеки
		 * @param jso Удалить JavaScript объекты
		 * @param jn Имя экземпляра менеджера JSIinterface
		 * @return void
		 */
		static public function clear(flc:Boolean=true, flo:Boolean=true, jsc:Boolean=true, jso:Boolean=true, jn:String=''):void{
		}
		/** 
		 * Получить объект stage из среды Flash Player'а.
		 * Возможность выполнения этой функции зависит от значения свойства JSInterface.allowJavaScriptAccess в среде Flash Player'а.
		 * @param jn Имя экземпляра менеджера JSIinterface
		 * @return Объект FLObject содержащий информацию о оригинальном объекте из среды Flash Player'а
		 */
		static public function stage(jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** 
		 * Получить объект root timeline из среды Flash Player'а.
		 * Возможность выполнения этой функции зависит от значения свойства JSInterface.allowJavaScriptAccess в среде Flash Player'а.
		 * @param jn Имя экземпляра менеджера JSIinterface
		 * @return  Объект static public function  содержащий информацию о оригинальном объекте из среды Flash Player'а
		 */
		static public function root(jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** 
		 * Получить объект ApplicationDomain.currentDomain из среды Flash Player'а.
		 * Возможность выполнения этой функции зависит от значения свойства JSInterface.allowJavaScriptAccess в среде Flash Player'а.
		 * @param jn Имя экземпляра менеджера JSIinterface
		 * @return Объект FLObject содержащий информацию о оригинальном объекте из среды Flash Player'а
		 */
		static public function applicationDomain(jn:String=''):FLObject{
			return new FLObject('', {});
		}
		/** Зарегистрировать класс JavaScript объектов-оболочек для определённого типа объектов из 
		 * среды Flash Player'а. Такие пользовательские объекты-оболочки должны агрегировать передаваемый 
		 * объект FLObject и использовать его для связи  оригинальным объектом. 
		 * @example Создаёт объект используя полученную функцию в качестве конструктора и передаёт 
		 * ему объект FLObject как единственный аргумент.
<listing version="3.0">
function SpriteObject(flObject){
	this._flObject = flObject;
}
FLObject.registerWrapper('flash.display.Sprite', SpriteObject);
</listing>
		 * @example FLObject передаёт в уже созданный объект, применяя его как значение свойству "_flObject"
<listing version="3.0">
function SpriteObject(){
	var _flObject;
}
FLObject.registerWrapper('flash.display.Sprite', SpriteObject, false, null, true);
</listing>
		 * @example FLObject передаёт в уже созданный объект, применяя его как значение указанного свойства, в 
		 * данном случае "_currentFlashObject"
<listing version="3.0">
function SpriteObject(){
	var _currentFlashObject;
}
FLObject.registerWrapper('flash.display.Sprite', SpriteObject, false, null, true, '_currentFlashObject');
</listing>
		 * @example Переданная функция вызывается через оператор "()", в качестве возвращаемого значения функция должна 
		 * вернуть ожидаемый объект. В качестве аргумента получает объект FLObject.
<listing version="3.0">
function SpriteObject(){
	var _flObject;
}
function createSpriteObject(flObject){
	var sprite = new SpriteObject();
	sprite._flObject = flObject;
	return sprite;
}
FLObject.registerWrapper('flash.display.Sprite', SpriteObject, true);
</listing>
		 * 
		 * @param cn Имя класса Flash объекта
		 * @param jf Конструктор JavaScript класса или функция
		 * @param af Если TRUE, то запускать передаваемую JavaScript функцию через оператор "()", а если FALSE(по умолчанию), то через оператор "new".
		 * @paran jn Имя JSI объекта
		 * @param up Если TRUE, то объект FLObject передаётся после создания объекта в указанное свойство, а если FALSE - передаётся в качестве единственного аргумента
		 * @param pn Имя аргумента в котором содержится объект FLObject
		 * @return void
		 */
		static public function registerWrapper(cn:String, jf:Function, af:Boolean=false, jn:String='', up:Boolean=false, pn:String='_flObject'):void{
		}
		/** Проверяет сущестование альтернативного объекта-оболочки для указанного класса, по его имени.
		 * 
		 * @param cn Имя класса Flash объекта
		 * @paran jn Имя JSI объекта
		 * @return Boolean
		 */
		static public function hasRegisteredWrapper(cn:String, jn:String=''):Boolean{
			return true;
		}
		/** Удаляет информацию о альтернативной оболочке для указанного класса.
		 * 
		 * @param cn Имя класса Flash объекта
		 * @paran jn Имя JSI объекта
		 * @return void
		 */
		static public function unregisterWrapper(cn:String, jn:String=''):void{
		}
		/** Отчищает всю информацию о типах альтернативных объектов-оболочек.
		 * 
		 * @paran jn Имя JSI объекта
		 * @return void
		 */
		static public function unregisterAllWrappers(jn:String=''):void{
		}
	}
}