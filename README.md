# urlencode-as3

Actionscript library to handle percent encoding/decoding.

# Description

I often encounter a situation where percent encoding is done in the
charset other than UTF-8 ouside of actionscript(especially at server side), 
and built-in methods like escape/unescape or
escapeMultiByte/unecapeMutliByte doesn't help since they only support UTF-8 or
charset specified in System.useCodePage.

# Usage

```actionscript

import urlencode.URIString;

public function doSomething():void{

    var reqUrl:String="http://example.com?msg=%93%FA%96%7B%8C%EA";
    var aryParams:Array = reqUrl.replace(/.*\?(.*)/,"$1").split("&");
    var params:Object = {};

    for(var i:int=0;i < aryParams.length;i++){
        var key:String = aryParams[i].split("=")[0];
        var val:String = aryParams[i].split("=")[1];
        params[key]= val;
    }
    trace(params["msg"]); // "%93%FA%96%7B%8C%EA"

    var decoder:URIString = new URIString(params["msg"]);
    trace(decoder.decode(URIString.SHIFT_JIS)); // "日本語"

}

```

