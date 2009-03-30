package aw.utils{

	/** 
	* 
	* 
	* 
	* @public 
	* @author Galaburda a_[w] Oleg	  http://www.actualwave.com 
	*/
	public final class NumberUtils extends Object{

		/** 
		* 
		* 
		* 
		* @public 
		* @param min 
		* @param max 
		* @return Number 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function random(min:Number, max:Number):Number{
			if(!Calc.isNumber(min)) min = Number.MIN_VALUE;
			if(!Calc.isNumber(max)) max = Number.MAX_VALUE;
			return  Math.round(min+Math.random()*(max-min));
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param num 
		* @param min 
		* @param max 
		* @param noUnique 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function randomArray(num:Number, min:Number, max:Number, noUnique:Boolean):Array{
			var arr:Array = new Array();
			if(Math.abs(max-min)<num) return Calc.valuesArray(min, max);
			for(var i:Number=0; i<num; i++){
				var value:Number = Calc.random(min, max);
				var dbl:Boolean = false;
				for(var j:Number=0; j<i && !noUnique; j++){
					if(arr[j]==value){
						dbl = true;
						break;
					}
				}
				if(dbl) i--;
				else arr.push(value);
			}
			return arr;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param args 
		* @return * 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function randomValue(... args:Array):*{
			return args[Math.floor(Math.random()*args.length)];
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param min 
		* @param max 
		* @return Array 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function valuesArray(min:Number, max:Number):Array{
			var arr:Array = new Array();
			if(max>min){
				for(var i:Number=min; i<=max; i++) arr.push(i);
			}else{
				for(var i:Number=max; i<=min; i++) arr.push(i);
			}
			
			return arr;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param num 
		* @return Boolean 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function isNumber(num):Boolean{
			if(typeof(num)=='number') return true;
			else return false;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param obj 
		* @return Number 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function toNumber(obj):Number{
			var num:Number = Number(obj);
			if(isNaN(num)) return 0;
			else return num;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param num 
		* @param len 
		* @return String 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function toString(num:Number, len:Number):String{
			var str:String = num.toString();
			while(str.length<len) str = '0'+str;
			return str;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param num 
		* @param max 
		* @return Number 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function getPercent(num:Number, max:Number):Number{
			return num/(max/100);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param num 
		* @param perc 
		* @return Number 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function numberByPercent(num:Number, perc:Number):Number{
			return (num/100)*perc;
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param perc 
		* @param max 
		* @return Number 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function numberFromPercent(perc:Number, max:Number):Number{
			return perc*(max/100);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param num 
		* @param perc 
		* @return Number 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function maxByPercent(num:Number, perc:Number):Number{
			return 100*(num/perc);
		}

		/** 
		* 
		* 
		* 
		* @public 
		* @param max1 
		* @param max2 
		* @param num2 
		* @return Number 
		* @langversion ActionScript 3.0 
		* @playerversion Flash 9.0.28.0 
		*/
		static public function partByPercent(max1:Number, max2:Number, num2:Number):Number{
			return num2/max2*max1;
		}
	}
}