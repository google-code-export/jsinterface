package {
	/**
	 * It’s a wrapper object for JavaScript objects transferred to Flash Player environment directly, 
	 * as it’s done by ExternalInterface. In this case a duplicate of the object not related to the 
	 * original in any way is created in Flash Player environment.
	 * 
	 * @public
	 */
	public class FLSimple extends Object{
		/**
		 * Original object, which will be transferred into Flash Player environment.
		 */
		public var data:Object;
		/**
		 * @public
		 * @param {Object} v Object, which will be transferred into Flash Player environment.
		 */
		function FLSimple(v:Object):void{
			super();
			this.data = v;
		}
	}
}