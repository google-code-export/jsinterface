package aw.errors{

	/** 
	* The class contains the texts of errors caused by the class EvalUtils.
	* 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com
	* @see aw.utils.EvalUtils
	*/
	public class EvalUtilsError extends Error{

		/** 
		* 
		* 
		* 
		* @public 
		* @param message 
		* @param id 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function EvalUtilsError(message:String="", id:int=0):void{
			super(message, id);
		}

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const XML_ROOT_NODE_WITHOUT_NAME:String = 'Eval error: Root XML node without name.';

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const INCORRECT_CHAR:String = 'Eval error: Incorrect char finded';

		/** 
		* 
		* 
		* 
		* @private (protected,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static protected const INCORRECT_CHAR_EXT:String = 'Eval error: Incorrect char finded in position = ';

		/** 
		* 
		* 
		* 
		* @public 
		* @param i 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getIncorrectCharMessage(i:int):String{
			return INCORRECT_CHAR_EXT+String(i);
		}

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const IS_NOT_FUNCTION:String = 'Eval error: Property is not a function';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const IS_NOT_FUNCTION_EXT1:String = 'Eval error: Property, "';

		/** 
		* 
		* 
		* 
		* @private (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static private const IS_NOT_FUNCTION_EXT2:String = '" is not a function';

		/** 
		* 
		* 
		* 
		* @public 
		* @param name 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getIsNotFunctionMessage(name:Object):String{
			return IS_NOT_FUNCTION_EXT1+String(name)+IS_NOT_FUNCTION_EXT2;
		}
	}
}