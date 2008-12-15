package aw.external.jsinterface{
	/** 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg http://actualwave.com/ 
	*/
	public class JSSimple implements IJSSimple{
		/** 
		* 
		* @private (protected) 
		*/
		protected var _data:Object;
		/** 
		* 
		* @public 
		* @param d 
		* @return void 
		*/
		public function JSSimple(d:Object):void{
			super();
			_data = d;
		}
		/** 
		* 
		* @public 
		* @return * 
		*/
		public function getSimpleData():*{
			return (this._data is IJSSimple) ? (this._data as IJSSimple).getSimpleData() : this._data;
		}
	}
}