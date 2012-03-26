package urlencode {

    import flash.utils.ByteArray;

    public class URIString {

        /**
        * Supported charset used for encode/decode URIString
        * 
        * Basically, all charsets available on Flash Player or AIR should also be used for percent encoding
        * http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/charset-codes.html 
        *
        */

        public static const SHIFT_JIS:String="shift_jis";

        /**
        * @private Original string passed to this instance.
        */

        private var _us_string:String;

        /**
        * Constructor
        * 
        * @param str String to be percent encoded/decoded
        */
        public function URIString(str:String) {
          _us_string = str;
        }

        /** regexp for capturing possible encoded sequence for one character */
        private var rEncodedSegment:RegExp=/(%[0-9a-fA-F]{2})([a-zA-Z]|[0-fA9]|[-|_|.|~]){0,1}/g;
        /** */
        private var rCompleteEncodedSegment:RegExp = /(%[0-9a-fA-F]{2})+/g;

        public function encode(destCharset:String):String{
            return "";
        }


        public function decode(destCharset:String):String{
            var twoDigitFmt:String = this.completeEncode(_us_string);
            return this.replaceEncodedSeg(twoDigitFmt,function(encString:String):String{
                var encBytes:ByteArray = this.toEncBytes(encString);
                var decStr:String = encBytes.readMultiByte(encBytes.length,'shift_jis');
                return decStr;
            });
        }
        
    		/**
         * Fully encode every charcter in the form of '%' followed by two decimal digits(e.g '%2F'),
         * whether it's unencoded un-reserved character or encoded character with 
         * two decimal digits and a reserved char(e.g '%41A').
    		 * 
    		 * "ア" => %83A
    		 * "ア" => %83%41
    		 */
	
    		public function completeEncode(targetStr:String):String{
    			var encoded:String = targetStr.replace(rEncodedSegment,function():String{				
    				var encSec:String = arguments[1];
    				var unresStr:String = arguments[2];
				
    				var decodedStr:String;
    				if(unresStr.length > 0){
    					encSec = encSec + toEncString(unresStr);	
    				}				
    				return encSec;
    			});
    			return encoded;
    		}
		
		
    		public function replaceEncodedSeg(targetStr:String,fnReplace:Function):String{
    			var decoded:String = targetStr.replace(rCompleteEncodedSegment,function():String{	
    				//trace(arguments);
    				var encSeg:String = arguments[0];				
    				return fnReplace.call(null,encSeg);
    			});
    			return decoded;
    		}
		
		
    		/**
    		 * 非予約文字をURLエンコード文字に変換("A" => %41)
    		 */ 
		
    		public function toEncString(unreservedStr:String):String{
    			var encStr:String ="";
    			if(unreservedStr.length > 0){
    				var encByte:ByteArray = new ByteArray();
    				encByte.writeMultiByte(unreservedStr,'shift_jis');
    				encByte.position = 0;
			
    				encStr = "%" + encByte.readByte().toString(16);
    			}
    			return encStr;		
    		}
		
    		/**
    		 * SJISのURLエンコード表示(%+2桁の16進数表記)をByteに変更する。
    		 * as3ではByteArrayにread/writeMultiByteメソッドが用意されているため
    		 * 文字コードが分かっている文字列のバイト値の変換(エンコード)は簡単
    		 */ 
		
    		public function toDecBytes(encStr:String):ByteArray{
    			var bytes:Array = encStr.split('%');
    			bytes.shift(); // 先頭は空白
			
    			var hexByte:ByteArray = new ByteArray();
			
    			for(var i:int=0;i < bytes.length;i++){
    				var sect:String = bytes[i].toString();
    				if(sect.length == 2){
    					// %で区切られた先頭2文字は1バイト目の16進数表記
    					var firstByte:String = sect.substr(0,2);
    					hexByte.writeByte(parseInt(firstByte,16));
    				}
    			}
    			hexByte.position = 0;
    			return hexByte;
    		}

    }
}

