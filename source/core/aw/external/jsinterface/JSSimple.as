package aw.external.jsinterface{
	public class JSSimple implements IJSSimple{
		protected var _data:Object;
		public function JSSimple(d:Object):void{
			super();
			_data = d;
		}
		public function getSimpleData():*{
			return (this._data is IJSSimple) ? (this._data as IJSSimple).getSimpleData() : this._data;
		}
	}
}