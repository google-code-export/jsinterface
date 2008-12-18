package aw.errors{
	public class EvalUtilsError extends Error{
		public function EvalUtilsError(message:String="", id:int=0):void{
			super(message, id);
		}
		static public const XML_ROOT_NODE_WITHOUT_NAME:String = 'Eval error: Root XML node without name.';
		static public const INCORRECT_CHAR:String = 'Eval error: Incorrect char finded';
		static protected const INCORRECT_CHAR_EXT:String = 'Eval error: Incorrect char finded in position = ';
		static public function getIncorrectCharMessage(i:int):String{
			return INCORRECT_CHAR_EXT+String(i);
		}
		static public const IS_NOT_FUNCTION:String = 'Eval error: Property is not a function';
		static protected const IS_NOT_FUNCTION_EXT1:String = 'Eval error: Property, "';
		static protected const IS_NOT_FUNCTION_EXT2:String = '" is not a function';
		static public function getIsNotFunctionMessage(name:Object):String{
			return IS_NOT_FUNCTION_EXT1+String(name)+IS_NOT_FUNCTION_EXT2;
		}
	}
}