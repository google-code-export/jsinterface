package aw.errors{

	/** 
	* Object is a copy of a JavaScript error in the Flash Player environment.
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
		* File name in which the error occurred.
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
		* Line number, in which the error occurred.
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
		* Name of JavaScript error
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
		* ID of JavaScript error
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
		* The object in which the error occurred. Sometimes, this property may be empty, if it is not possible to identify the object.
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
		* Name of property/method in which the error occurred. Sometimes, this property may be empty, if it is not possible to determine the name.
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