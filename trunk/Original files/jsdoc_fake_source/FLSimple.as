package {
	/**
	 *  Объект-обёртка для JavaScript объектов передаваемых в среду Flash Player'а напрямую, как это деалет ExternalInterface.
	 * В таком случае в среде Flash Player'а созаётся дубликат объекта никак не сязанный с оригиналом.
	 * @public
	 */
	public class FLSimple extends Object{
		/**
		 * Оригинальный объект, передаваемый в среду Flash Player'а
		 */
		public var data:Object;
		/**
		 * @public
		 * @param {Object} v Передаваемый объект
		 */
		function FLSimple(v:Object):void{
			super();
			this.data = v;
		}
	}
}