package aw.errors{
	public class JSError extends Error{
		protected var _description:String;
		protected var _fileName:String;
		protected var _lineNumber:Number;
		protected var _message:String;
		protected var _jsErrorName:String;
		protected var _number:Number;
		protected var _stack:String;
		protected var _targetObject:Object;
		protected var _targetParameter:String;
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
		public function toString():String{
			return '{JavaScript} '+this.message+'\nTarget object: ['+this._targetObject+'] property: ['+this._targetParameter+']\nStack trace: '+this._stack+'\n\n';
		}
		override public function getStackTrace():String{
			return this._stack;
		}
		public function get description():String{
			return this._description;
		}
		public function get fileName():String{
			return this._fileName;
		}
		public function get lineNumber():Number{
			return this._lineNumber;
		}
		public function get jsErrorName():String{
			return this._jsErrorName;
		}
		public function get number():Number{
			return this._number;
		}
		public function get targetObject():Object{
			return this._targetObject;
		}
		public function get targetParameter():String{
			return this._targetParameter;
		}
	}
}