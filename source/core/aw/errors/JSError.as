package aw.errors{

	/** 
	* Объект являющий собой зеркало JavaScript ошибки в среде Flash Player'а.
	* 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	* @see aw.external.JSInterface
	*/
	public class JSError extends Error{

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _description:String;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _fileName:String;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _lineNumber:Number;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _message:String;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _jsErrorName:String;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _number:Number;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _stack:String;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _targetObject:Object;

		/** 
		* 
		* 
		* 
		* @private (protected) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		protected var _targetParameter:String;

		/** 
		* 
		* 
		* 
		* @public 
		* @param mess 
		* @param num 
		* @param desc 
		* @param fNam 
		* @param lNum 
		* @param nam 
		* @param st 
		* @param obj 
		* @param pNam 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSError(mess:String='', num:int=0, desc:String='', fNam:String='', lNum:Number=NaN, nam:String='', st:String='', obj:Object=null, pNam:String=''):void{
			super(mess, num);
			_description = desc;
			_fileName = fNam;
			_lineNumber = lNum;
			_jsErrorName = nam;
			_number = num;
			_stack = st;
			_targetObject = obj;
			_targetParameter = pNam;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toString():String{
			return '{JavaScript} '+this.message+'\nTarget object: ['+this._targetObject+'] property: ['+this._targetParameter+']\nStack trace: '+this._stack+'\n\n';
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		override public function getStackTrace():String{
			return this._stack;
		}

		/** 
		* 
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get description():String{
			return this._description;
		}

		/** 
		* Имя файла в котором произошла ошибка.
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get fileName():String{
			return this._fileName;
		}

		/** 
		* Номер строки, в которой произошла ошибка.
		* 
		* 
		* @public (getter) 
		* @return Number 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get lineNumber():Number{
			return this._lineNumber;
		}

		/** 
		* Имя JavaScript ошибки
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get jsErrorName():String{
			return this._jsErrorName;
		}

		/** 
		* ID JavaScript ошибки
		* 
		* 
		* @public (getter) 
		* @return Number 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get number():Number{
			return this._number;
		}

		/** 
		* Объект, при работе с которым произошла ошибка. Иногда это свойство может быть пустым, если невозможно определить этот объект.
		* 
		* 
		* @public (getter) 
		* @return Object 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get targetObject():Object{
			return this._targetObject;
		}

		/** 
		* Имя свойства/метода, при работе с которым произошла ошибка. Иногда это свойство может быть пустым, если невозможно определить имя.
		* 
		* 
		* @public (getter) 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function get targetParameter():String{
			return this._targetParameter;
		}
	}
}