package aw.external.jsinterface.objects{
	import aw.external.js_interface;
	import aw.external.jsinterface.JSDynamic;
	import aw.external.jsinterface.JSTypeMap;
	
	import flash.utils.getQualifiedClassName;
	/**
	 * <a href="http://www.aptana.com/reference/html/api/JSCore.index.html">JavaScript Core Reference</a> :: <a href="http://www.aptana.com/reference/html/api/Date.html">Date</a>.
	 * Class ported by documentation <a href="http://www.aptana.com/studio">Aptana Studio</a>.
	 */
	public dynamic class JSDate extends JSDynamic{

		/** 
		* 
		* 
		* 
		* @public (constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public const CLASS_NAME:String = 'Date';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_DATE_METHOD:String = 'getDate';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_DAY_METHOD:String = 'getDay';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_FULL_YEAR_METHOD:String = 'getFullYear';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_HOURS_METHOD:String = 'getHours';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_MILLISECONDS_METHOD:String = 'getMilliseconds';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_MINUTES_METHOD:String = 'getMinutes';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_MONTH_METHOD:String = 'getMonth';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_SECONDS_METHOD:String = 'getSeconds';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_TIME_METHOD:String = 'getTime';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_TIMEZONE_OFFSET_METHOD:String = 'getTimezoneOffset';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_UTC_DATE_METHOD:String = 'getUTCDate';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_UTC_DAY_METHOD:String = 'getUTCDay';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_UTC_FULL_YEAR_METHOD:String = 'getUTCFullYear';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_UTC_HOURS_METHOD:String = 'getUTCHours';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_UTC_MILLISECONDS_METHOD:String = 'getUTCMilliseconds';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_UTC_MINUTES_METHOD:String = 'getUTCMinutes';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_UTC_MONTH_METHOD:String = 'getUTCMonth';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_UTC_SECONDS_METHOD:String = 'getUTCSeconds';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const GET_YEAR_METHOD:String = 'getYear';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_DATE_METHOD:String = 'setDate';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_FULL_YEAR_METHOD:String = 'setFullYear';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_HOURS_METHOD:String = 'setHours';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_MILLISECONDS_METHOD:String = 'setMilliseconds';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_MINUTES_METHOD:String = 'setMinutes';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_MONTH_METHOD:String = 'setMonth';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_SECONDS_METHOD:String = 'setSeconds';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_TIME_METHOD:String = 'setTime';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_UTC_DATE_METHOD:String = 'setUTCDate';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_UTC_FULL_YEAR_METHOD:String = 'setUTCFullYear';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_UTC_HOURS_METHOD:String = 'setUTCHours';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_UTC_MILLISECONDS_METHOD:String = 'setUTCMilliseconds';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_UTC_MINUTES_METHOD:String = 'setUTCMinutes';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_UTC_MONTH_METHOD:String = 'setUTCMonth';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_UTC_SECONDS_METHOD:String = 'setUTCSeconds';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const SET_YEAR_METHOD:String = 'setYear';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const TO_DATE_STRING_METHOD:String = 'toDateString';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const TO_GMT_STRING_METHOD:String = 'toGMTString';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const TO_LOCALE_DATE_STRING_METHOD:String = 'toLocaleDateString';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const TO_LOCALE_STRING_METHOD:String = 'toLocaleString';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const TO_LOCALE_TIME_STRING_METHOD:String = 'toLocaleTimeString';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const TO_TIME_STRING_METHOD:String = 'toTimeString';

		/** 
		* 
		* 
		* 
		* @public (js_interface,constant) 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static js_interface const TO_UTC_STRING_METHOD:String = 'toUTCString';

		/** 
		* 
		* 
		* 
		* @public 
		* @param className 
		* @param args 
		* @return void 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function JSDate(...args:Array):void{
			if(!args.length || args[0]!==JSDynamic.DO_NOT_CREATE_OBJECT){
				super(CLASS_NAME, args);
			}else init();
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getDate():int{
			return this.internalCall(js_interface::GET_DATE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getDay():int{
			return this.internalCall(js_interface::GET_DAY_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getFullYear():int{
			return this.internalCall(js_interface::GET_FULL_YEAR_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getHours():int{
			return this.internalCall(js_interface::GET_HOURS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getMilliseconds():int{
			return this.internalCall(js_interface::GET_MILLISECONDS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getMinutes():int{
			return this.internalCall(js_interface::GET_MINUTES_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getMonth():int{
			return this.internalCall(js_interface::GET_MONTH_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getSeconds():int{
			return this.internalCall(js_interface::GET_SECONDS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getTime():int{
			return this.internalCall(js_interface::GET_TIME_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getTimezoneOffset():int{
			return this.internalCall(js_interface::GET_TIMEZONE_OFFSET_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getUTCDate():int{
			return this.internalCall(js_interface::GET_UTC_DATE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getUTCDay():int{
			return this.internalCall(js_interface::GET_UTC_DAY_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getUTCFullYear():int{
			return this.internalCall(js_interface::GET_UTC_FULL_YEAR_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getUTCHours():int{
			return this.internalCall(js_interface::GET_UTC_HOURS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getUTCMilliseconds():int{
			return this.internalCall(js_interface::GET_UTC_MILLISECONDS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getUTCMinutes():int{
			return this.internalCall(js_interface::GET_UTC_MINUTES_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getUTCMonth():int{
			return this.internalCall(js_interface::GET_UTC_MONTH_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getUTCSeconds():int{
			return this.internalCall(js_interface::GET_UTC_SECONDS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function getYear():int{
			return this.internalCall(js_interface::GET_YEAR_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param dayValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setDate(dayValue:int):int{
			return this.internalCall(js_interface::SET_DATE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param yearValue 
		* @param monthValue 
		* @param dayValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setFullYear(yearValue:int, monthValue:int=0, dayValue:int=0):int{
			return this.internalCall(js_interface::SET_FULL_YEAR_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param hoursValue 
		* @param minutesValue 
		* @param secondsValue 
		* @param msValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setHours(hoursValue:int, minutesValue:int=0, secondsValue:int=0, msValue:int=0):int{
			return this.internalCall(js_interface::SET_HOURS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param millisecondsValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setMilliseconds(millisecondsValue:int):int{
			return this.internalCall(js_interface::SET_MILLISECONDS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param minutesValue 
		* @param secondsValue 
		* @param msValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setMinutes(minutesValue:int, secondsValue:int=0, msValue:int=0):int{
			return this.internalCall(js_interface::SET_MINUTES_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param monthValue 
		* @param dayValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setMonth(monthValue:int, dayValue:int=0):int{
			return this.internalCall(js_interface::SET_MONTH_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param secondsValue 
		* @param msValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setSeconds(secondsValue:int, msValue:int=0):int{
			return this.internalCall(js_interface::SET_SECONDS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param timeValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setTime(timeValue:int):int{
			return this.internalCall(js_interface::SET_TIME_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param dayValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setUTCDate(dayValue:int):int{
			return this.internalCall(js_interface::SET_UTC_DATE_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param yearValue 
		* @param monthValue 
		* @param dayValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setUTCFullYear(yearValue:int, monthValue:int=0, dayValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_FULL_YEAR_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param hoursValue 
		* @param minutesValue 
		* @param secondsValue 
		* @param msValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setUTCHours(hoursValue:int, minutesValue:int=0, secondsValue:int=0, msValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_HOURS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param millisecondsValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setUTCMilliseconds(millisecondsValue:int):int{
			return this.internalCall(js_interface::SET_UTC_MILLISECONDS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param minutesValue 
		* @param secondsValue 
		* @param msValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setUTCMinutes(minutesValue:int, secondsValue:int=0, msValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_MINUTES_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param monthValue 
		* @param dayValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setUTCMonth(monthValue:int, dayValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_MONTH_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param secondsValue 
		* @param msValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setUTCSeconds(secondsValue:int, msValue:int=0):int{
			return this.internalCall(js_interface::SET_UTC_SECONDS_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param yearValue 
		* @return int 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function setYear(yearValue:int):int{
			return this.internalCall(js_interface::SET_YEAR_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toDateString():String{
			return this.internalCall(js_interface::TO_DATE_STRING_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toGMTString():String{
			return this.internalCall(js_interface::TO_GMT_STRING_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toLocaleDateString():String{
			return this.internalCall(js_interface::TO_LOCALE_DATE_STRING_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toLocaleString():String{
			return this.internalCall(js_interface::TO_LOCALE_STRING_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toLocaleTimeString():String{
			return this.internalCall(js_interface::TO_LOCALE_TIME_STRING_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toTimeString():String{
			return this.internalCall(js_interface::TO_TIME_STRING_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		public function toUTCString():String{
			return this.internalCall(js_interface::TO_UTC_STRING_METHOD, arguments);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return JSDate 
		* @see aw.external.jsinterface.objects.JSDate 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function create(...args:Array):JSDate{
			return new JSDate(CLASS_NAME, args);
		}
	}
}