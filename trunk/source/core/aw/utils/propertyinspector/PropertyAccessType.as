package aw.utils.propertyinspector{
	public final class PropertyAccessType extends Object{
		static public const READWRITE:int = 0;
		static public const READONLY:int = 1;
		static public const WRITEONLY:int = 2;
		static public const METHOD:int = 3;
		static internal const TYPES:Object = {readwrite:0, readonly:1, writeonly:2, method:3};
	}
}