package aw.errors{
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class JSError extends Error{
		/** 
		* 
		* @private (protected) 
		*/
		protected var _description:String;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _fileName:String;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _lineNumber:Number;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _message:String;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _jsErrorName:String;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _number:Number;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _stack:String;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _targetObject:Object;
		/** 
		* 
		* @private (protected) 
		*/
		protected var _targetParameter:String;
		/** 
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
		* @public 
		* @return String 
		*/
		public function toString():String{
			return '{JavaScript} '+this.message+'\nTarget object: ['+this._targetObject+'] property: ['+this._targetParameter+']\nStack trace: '+this._stack+'\n\n';
		}
		/** 
		* 
		* @public 
		* @return String 
		*/
		override public function getStackTrace():String{
			return this._stack;
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get description():String{
			return this._description;
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get fileName():String{
			return this._fileName;
		}
		/** 
		* 
		* @public (getter) 
		* @return Number 
		*/
		public function get lineNumber():Number{
			return this._lineNumber;
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get jsErrorName():String{
			return this._jsErrorName;
		}
		/** 
		* 
		* @public (getter) 
		* @return Number 
		*/
		public function get number():Number{
			return this._number;
		}
		/** 
		* 
		* @public (getter) 
		* @return Object 
		*/
		public function get targetObject():Object{
			return this._targetObject;
		}
		/** 
		* 
		* @public (getter) 
		* @return String 
		*/
		public function get targetParameter():String{
			return this._targetParameter;
		}
	}
}