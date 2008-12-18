package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/JSCore.index.html">JavaScript Core Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Date.html">Date</a>.
	 * Класс портирован по документации <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSDate extends JSDynamic{
		static public const CLASS_NAME:String = 'Date';
		static js_interface const GET_DATE_METHOD:String = 'getDate';
		static js_interface const GET_DAY_METHOD:String = 'getDay';
		static js_interface const GET_FULL_YEAR_METHOD:String = 'getFullYear';
		static js_interface const GET_HOURS_METHOD:String = 'getHours';
		static js_interface const GET_MILLISECONDS_METHOD:String = 'getMilliseconds';
		static js_interface const GET_MINUTES_METHOD:String = 'getMinutes';
		static js_interface const GET_MONTH_METHOD:String = 'getMonth';
		static js_interface const GET_SECONDS_METHOD:String = 'getSeconds';
		static js_interface const GET_TIME_METHOD:String = 'getTime';
		static js_interface const GET_TIMEZONE_OFFSET_METHOD:String = 'getTimezoneOffset';
		static js_interface const GET_UTC_DATE_METHOD:String = 'getUTCDate';
		static js_interface const GET_UTC_DAY_METHOD:String = 'getUTCDay';
		static js_interface const GET_UTC_FULL_YEAR_METHOD:String = 'getUTCFullYear';
		static js_interface const GET_UTC_HOURS_METHOD:String = 'getUTCHours';
		static js_interface const GET_UTC_MILLISECONDS_METHOD:String = 'getUTCMilliseconds';
		static js_interface const GET_UTC_MINUTES_METHOD:String = 'getUTCMinutes';
		static js_interface const GET_UTC_MONTH_METHOD:String = 'getUTCMonth';
		static js_interface const GET_UTC_SECONDS_METHOD:String = 'getUTCSeconds';
		static js_interface const GET_YEAR_METHOD:String = 'getYear';
		static js_interface const SET_DATE_METHOD:String = 'setDate';
		static js_interface const SET_FULL_YEAR_METHOD:String = 'setFullYear';
		static js_interface const SET_HOURS_METHOD:String = 'setHours';
		static js_interface const SET_MILLISECONDS_METHOD:String = 'setMilliseconds';
		static js_interface const SET_MINUTES_METHOD:String = 'setMinutes';
		static js_interface const SET_MONTH_METHOD:String = 'setMonth';
		static js_interface const SET_SECONDS_METHOD:String = 'setSeconds';
		static js_interface const SET_TIME_METHOD:String = 'setTime';
		static js_interface const SET_UTC_DATE_METHOD:String = 'setUTCDate';
		static js_interface const SET_UTC_FULL_YEAR_METHOD:String = 'setUTCFullYear';
		static js_interface const SET_UTC_HOURS_METHOD:String = 'setUTCHours';
		static js_interface const SET_UTC_MILLISECONDS_METHOD:String = 'setUTCMilliseconds';
		static js_interface const SET_UTC_MINUTES_METHOD:String = 'setUTCMinutes';
		static js_interface const SET_UTC_MONTH_METHOD:String = 'setUTCMonth';
		static js_interface const SET_UTC_SECONDS_METHOD:String = 'setUTCSeconds';
		static js_interface const SET_YEAR_METHOD:String = 'setYear';
		static js_interface const TO_DATE_STRING_METHOD:String = 'toDateString';
		static js_interface const TO_GMT_STRING_METHOD:String = 'toGMTString';
		static js_interface const TO_LOCALE_DATE_STRING_METHOD:String = 'toLocaleDateString';
		static js_interface const TO_LOCALE_STRING_METHOD:String = 'toLocaleString';
		static js_interface const TO_LOCALE_TIME_STRING_METHOD:String = 'toLocaleTimeString';
		static js_interface const TO_TIME_STRING_METHOD:String = 'toTimeString';
		static js_interface const TO_UTC_STRING_METHOD:String = 'toUTCString';
		public function JSDate(className:Object='', args:*=null):void{
			if(className){
				if(arguments.length>1 && !(args is Array)) args = [args];
				super(className, args);
			}else init();
		}
		public function getDate():int{
			return this.internalCall(js_interface::GET_DATE_METHOD, arguments);
		}
		public function getDay():int{
			return this.internalCall(js_interface::GET_DAY_METHOD, arguments);
		}
		public function getFullYear():int{
			return this.internalCall(js_interface::GET_FULL_YEAR_METHOD, arguments);
		}
		public function getHours():int{
			return this.internalCall(js_interface::GET_HOURS_METHOD, arguments);
		}
		public function getMilliseconds():int{
			return this.internalCall(js_interface::GET_MILLISECONDS_METHOD, arguments);
		}
		public function getMinutes():int{
			return this.internalCall(js_interface::GET_MINUTES_METHOD, arguments);
		}
		public function getMonth():int{
			return this.internalCall(js_interface::GET_MONTH_METHOD, arguments);
		}
		public function getSeconds():int{
			return this.internalCall(js_interface::GET_SECONDS_METHOD, arguments);
		}
		public function getTime():int{
			return this.internalCall(js_interface::GET_TIME_METHOD, arguments);
		}
		public function getTimezoneOffset():int{
			return this.internalCall(js_interface::GET_TIMEZONE_OFFSET_METHOD, arguments);
		}
		public function getUTCDate():int{
			return this.internalCall(js_interface::GET_UTC_DATE_METHOD, arguments);
		}
		public function getUTCDay():int{
			return this.internalCall(js_interface::GET_UTC_DAY_METHOD, arguments);
		}
		public function getUTCFullYear():int{
			return this.internalCall(js_interface::GET_UTC_FULL_YEAR_METHOD, arguments);
		}
		public function getUTCHours():int{
			return this.internalCall(js_interface::GET_UTC_HOURS_METHOD, arguments);
		}
		public function getUTCMilliseconds():int{
			return this.internalCall(js_interface::GET_UTC_MILLISECONDS_METHOD, arguments);
		}
		public function getUTCMinutes():int{
			return this.internalCall(js_interface::GET_UTC_MINUTES_METHOD, arguments);
		}
		public function getUTCMonth():int{
			return this.internalCall(js_interface::GET_UTC_MONTH_METHOD, arguments);
		}
		public function getUTCSeconds():int{
			return this.internalCall(js_interface::GET_UTC_SECONDS_METHOD, arguments);
		}
		public function getYear():int{
			return this.internalCall(js_interface::GET_YEAR_METHOD, arguments);
		}
		public function setDate(dayValue:int):int{
			return this.internalCall(js_interface::SET_DATE_METHOD, arguments);
		}
		public function setFullYear(yearValue:int, monthValue:int=0, dayValue:int=0):int{
			return this.internalCall(js_interface::SET_FULL_YEAR_METHOD, arguments);
		}
		public function setHours(hoursValue:int, minutesValue:int=0, secondsValue:int=0, msValue:int=0):int{
			return this.internalCall(js_interface::SET_HOURS_METHOD, arguments);
		}
		public function setMilliseconds(millisecondsValue:int):int{
			return this.internalCall(js_interface::SET_MILLISECONDS_METHOD, arguments);
		}
		public function setMinutes(minutesValue:int, secondsValue:int=0, msValue:int=0):int{
			return this.internalCall(js_interface::SET_MINUTES_METHOD, arguments);
		}
		public function setMonth(monthValue:int, dayValue:int=0):int{
			return this.internalCall(js_interface::SET_MONTH_METHOD, arguments);
		}
		public function setSeconds(secondsValue:int, msValue:int=0):int{
			return this.internalCall(js_interface::SET_SECONDS_METHOD, arguments);
		}
		public function setTime(timeValue:int):int{
			return this.internalCall(js_interface::SET_TIME_METHOD, arguments);
		}
		public function setUTCDate(dayValue:int):int{
			return this.internalCall(js_interface::SET_UTC_DATE_METHOD, arguments);
		}
		public function setUTCFullYear(yearValue:int, monthValue:int=0, dayValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_FULL_YEAR_METHOD, arguments);
		}
		public function setUTCHours(hoursValue:int, minutesValue:int=0, secondsValue:int=0, msValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_HOURS_METHOD, arguments);
		}
		public function setUTCMilliseconds(millisecondsValue:int):int{
			return this.internalCall(js_interface::SET_UTC_MILLISECONDS_METHOD, arguments);
		}
		public function setUTCMinutes(minutesValue:int, secondsValue:int=0, msValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_MINUTES_METHOD, arguments);
		}
		public function setUTCMonth(monthValue:int, dayValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_MONTH_METHOD, arguments);
		}
		public function setUTCSeconds(secondsValue:int, msValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_SECONDS_METHOD, arguments);
		}
		public function setYear(yearValue:int):int{
			return this.internalCall(js_interface::SET_YEAR_METHOD, arguments);
		}
		public function toDateString():String{
			return this.internalCall(js_interface::TO_DATE_STRING_METHOD, arguments);
		}
		public function toGMTString():String{
			return this.internalCall(js_interface::TO_GMT_STRING_METHOD, arguments);
		}
		public function toLocaleDateString():String{
			return this.internalCall(js_interface::TO_LOCALE_DATE_STRING_METHOD, arguments);
		}
		public function toLocaleString():String{
			return this.internalCall(js_interface::TO_LOCALE_STRING_METHOD, arguments);
		}
		public function toLocaleTimeString():String{
			return this.internalCall(js_interface::TO_LOCALE_TIME_STRING_METHOD, arguments);
		}
		public function toTimeString():String{
			return this.internalCall(js_interface::TO_TIME_STRING_METHOD, arguments);
		}
		public function toUTCString():String{
			return this.internalCall(js_interface::TO_UTC_STRING_METHOD, arguments);
		}
		static public function create(...args:Array):JSDate{
			return new JSDate(CLASS_NAME, args);
		}
	}
}