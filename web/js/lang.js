var Butterlate = new Butterlation();
window.Get_string = function(key) { return Butterlate.gettext(key); };
window.__ = function(key,replacements) { return Butterlate.vgettext(key,replacements); };

function Butterlation() {
  this.dict = new ButterDictionary();
  this.getLang = function() {
    var one, two, end, navLan;
	// Modified by LiuWei184577 2010-03-17 for support Chinese
	// load from the navigator setting if cookie is null
	// Basically, the program won't read the language option from the navigator.
    if((one=document.cookie.indexOf("mLangage"))==-1) {
      //return ((navigator.language) ? navigator.language : navigator.browserLanguage).substring(0,2);   
      //return "en";
	  navLan = (navigator.language) ? navigator.language : navigator.browserLanguage;
	  if (navLan.substring(0,2) == "zh")
	  {
		if ("zh-tw" == navLan || "zh-hk" == navLan || "zh-mo" == navLan)
			return "zhtw";
		else
			return "zhcn";
	  }
	  else
	  {
		//return navLan.substring(0,2);
		return "en";
	  }
    }
	
	// load from the cookie setting. The cookie is set by the web server[websFeedback()].
    end = (document.cookie.indexOf(';',one)!=-1) ? document.cookie.indexOf(';',one) : document.cookie.length;
    return unescape(document.cookie.substring(one+9,end));
  };
  this.lang = this.getLang();
  this.setTextDomain = function(domain) { this.po="../mlang/"+this.lang+"/"+domain+".xml";
  	this.initializeDictionary(); }
  this.initializeDictionary = function() {
    var request;
    try { request = new XMLHttpRequest(); } catch(e1) {
      try { request = new ActiveXObject("Msxml2.XMLHTTP"); } catch(e2) {
        try { request = new ActiveXObject("Microsoft.XMLHTTP"); } catch(e3) { return; }}};
    request.open("GET",this.po,false); 
    request.send(null);
    if(request.status==200) { 
      var pos = request.responseXML.documentElement.getElementsByTagName("lang");
      for(var i=0; i<pos.length; i++) this.dict.set(pos[i].getAttribute("id"),pos[i].getAttribute("string"));
    }
  };
  this.gettext = function(key) { return this.dict.get(key); };
  this.vgettext = function(key,replacements) { 
    var nkey=this.gettext(key); var index; var count=0;
    if(replacements.length==0) return nkey;
    while((index=nkey.indexOf('%s'))!=-1) { 
      nkey=nkey.substring(0,index)+replacements[count]+nkey.substring(index+2,nkey.length); 
      count = ((count+1)==replacements.length) ? count : (count+1);
    }
    return nkey;
  };
}
      
function ButterDictionary() {
  this.keys = new Array();
  this.values = new Array();
  this.set = function(key,value) { 
    var index = this.getIndex(key);
    if(index==-1) { this.keys.push(key); this.values.push(value); }
    else this.values[index]=value;
  };
  this.get = function(key) {
    var index;
    if((index=this.getIndex(key))!=-1) return this.values[index];
    return key;
  };
  this.getIndex = function(key) {
    var index=-1;
    for(var i=0; i<this.keys.length; i++) if(this.keys[i]==key) { index=i; break; }
    return index;
  };
  this.keyExists = function(key) { return (this.getIndex(key)!=1); };
  this.deleteKey = function(key) { 
    var index = getIndex(key);
    if(index!=-1) { this.keys.splice(index,1); this.values.splice(index,1); }
  };
}

var keyStr = "ABCDEFGHIJKLMNOP" + 
             "QRSTUVWXYZabcdef" + 
             "ghijklmnopqrstuv" + 
             "wxyz0123456789+/" + 
             "="; 
function bytesToUnicode(bs) 
{
    var result=""; 
    var offset=0; 
    if(bs.length>=2 && bs[0]==255 && bs[1]==254) offset=2;  // delete "FE" 
    for(var i=offset;i<bs.length;i+=2) 
    {
        if(bs[i] != 0 ||  bs[i+1] != 0)
        {
	        var code=bs[i+1]+(bs[i]<<8); 
            result+=String.fromCharCode(code);
        }
    } 
    return result; 
} 

function decode64(input) { 
   var output = ""; 
   var chr1, chr2, chr3 = ""; 
   var enc1, enc2, enc3, enc4 = ""; 
   var i = 0; 
   // remove all characters that are not A-Z, a-z, 0-9, +, /, or = 
   var base64test = /[^A-Za-z0-9\+\/\=]/g; 
   if (base64test.exec(input)) { 
      alert("There were invalid base64 characters in the input text.\n" + 
            "Valid base64 characters are A-Z, a-z, 0-9, '+', '/', and '='\n" + 
            "Expect errors in decoding."); 
   } 
   input = input.replace(/[^A-Za-z0-9\+\/\=]/g, ""); 
    output=new Array(); 
  do { 
      enc1 = keyStr.indexOf(input.charAt(i++)); 
      enc2 = keyStr.indexOf(input.charAt(i++)); 
      enc3 = keyStr.indexOf(input.charAt(i++));
      enc4 = keyStr.indexOf(input.charAt(i++)); 

      chr1 = (enc1 << 2) | (enc2 >> 4); 
      chr2 = ((enc2 & 15) << 4) | (enc3 >> 2); 
      chr3 = ((enc3 & 3) << 6) | enc4; 

      output.push(chr1); 
      if (enc3 != 64) { 
         output.push(chr2); 
      } 
      if (enc4 != 64) { 
         output.push(chr3); 
      } 

      chr1 = chr2 = chr3 = ""; 
      enc1 = enc2 = enc3 = enc4 = ""; 
   } while (i < input.length); 
   return bytesToUnicode(output); 
} 
