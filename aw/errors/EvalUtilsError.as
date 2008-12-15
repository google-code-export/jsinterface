package aw.errors{
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class EvalUtilsError extends Error{
		/** 
		* 
		* @public 
		* @param message 
		* @param id 
		* @return void 
		*/
		public function EvalUtilsError(message:String="", id:int=0):void{
			super(message, id);
		}
		/** 
		* 
		* @public (constant) 
		*/
		static public const XML_ROOT_NODE_WITHOUT_NAME:String = 'Eval error: Root XML node without name.';
		/** 
		* 
		* @public (constant) 
		*/
		static public const INCORRECT_CHAR:String = 'Eval error: Incorrect char finded';
		/** 
		* 
		* @private (protected,constant) 
		*/
		static protected const INCORRECT_CHAR_EXT:String = 'Eval error: Incorrect char finded in position = ';
		/** 
		* 
		* @public 
		* @param i 
		* @return String 
		*/
		static public function getIncorrectCharMessage(i:int):String{
			return INCORRECT_CHAR_EXT+String(i);
		}
		/** 
		* 
		* @public (constant) 
		*/
		static public const IS_NOT_FUNCTION:String = 'Eval error: Property is not a function';
		/** 
		* 
		* @private (protected,constant) 
		*/
		static protected const IS_NOT_FUNCTION_EXT1:String = 'Eval error: Property, "';
		/** 
		* 
		* @private (protected,constant) 
		*/
		static protected const IS_NOT_FUNCTION_EXT2:String = '" is not a function';
		/** 
		* 
		* @public 
		* @param name 
		* @return String 
		*/
		static public function getIsNotFunctionMessage(name:Object):String{
			return IS_NOT_FUNCTION_EXT1+String(name)+IS_NOT_FUNCTION_EXT2;
		}
	}
}