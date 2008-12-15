package aw.utils.propertyinspector{
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public final class PropertyAccessType extends Object{
		/** 
		* 
		* @public (constant) 
		*/
		static public const READWRITE:int = 0;
		/** 
		* 
		* @public (constant) 
		*/
		static public const READONLY:int = 1;
		/** 
		* 
		* @public (constant) 
		*/
		static public const WRITEONLY:int = 2;
		/** 
		* 
		* @public (constant) 
		*/
		static public const METHOD:int = 3;
		/** 
		* 
		* @private (internal,constant) 
		*/
		static internal const TYPES:Object = {readwrite:0, readonly:1, writeonly:2, method:3};
	}
}