
function showSSID(ssid)
{
	var value = "";
	for (var i = 0; i < ssid.length; i++)
	{
		if ( ssid.charAt(i) == " " )
		{
			value += "&nbsp;";
		}
		else
		{
			value += ssid.charAt(i);
		}
	}
	return value;
}

function checkHex(val)
{
	var i=0;
	
	for(i=0; i<val.length; i++)
	{
		if (!((val.charAt(i)>='0' && val.charAt(i)<='9') ||
                      (val.charAt(i)>='A' && val.charAt(i)<='F') ||
                      (val.charAt(i)>='a' && val.charAt(i)<='f')))
		{
			alert('Invalid number '+val.charAt(i)+' at position '+ (i+1)+'! Must be 0123456789abcdefABCDEF');
			return false;
		}
	}
	return true;
}
var ASCIIStrValid = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' + 'abcdefghijklmnopqrstuvwxyz' + '0123456789' +
				  '!#$&()*+,-./%.:;<=>?@[]^_{|}~\"' + '\\' + "\'" + " ";
function checkASC(keyval,place)
{
	var j, k, flag;
	for ( k=0; k<keyval.length; k++ ) {
		for(j=0;j<ASCIIStrValid.length;j++) {
			flag = false;
			if(keyval.charAt(k) ==  ASCIIStrValid.charAt(j)) {
				flag = true;
				break;
			}
		}   
		if(flag == false) {
		    if(place=="ssid")
		    {	
		        ShowError(document.getElementById("ssid"),"This character is not accepted." );
		    }
		    else if(place=="passphrase")
		    {
		    	ShowError(document.getElementById("passphrase"),"This character is not accepted." );
		    }	
			return false;
		}
	}
	
	flag = false;
	for ( k=0; k<keyval.length; k++ ) 
	{
		if(keyval.charAt(k) != ' ')
		{
			flag = true;
			break;
		}		
	}
	if(flag == false) 
	{
		if(place=="ssid")
	        {	
		ShowError(document.getElementById("ssid"),"Invalid string: can not be empty!");
		}
		else if(place=="passphrase")
		{
		 ShowError(document.getElementById("passphrase"),"Invalid string: can not be empty!");
		}
		return false;
	}
	
	return true;
}

function checkASC_WEP(keyval)
{
	var j, k;
	var flag=true;
	for ( k=0; k<keyval.length; k++ ) {
		for(j=0;j<ASCIIStrValid.length;j++) {
			flag = false;
			if(keyval.charAt(k) ==  ASCIIStrValid.charAt(j)) {
				flag = true;
				break;
			}
		}   
	   if(flag == false)
	    {
	 		break;
	    }

	}
	if(flag == true)
	{
			return true;
	}
	else
	{
			return false;
	}
}


function checkinvalidssid(keyval)
{
	var k;
	var val;
	for ( k=0; k<keyval.length; k++ ) 
	{
		val = keyval.charAt(k);
		if( val == "\'" || val == "\"" || val == "\\" || val == "\<" || val == "\>" || val == ";" 
			|| val == "," || val == ":" || val == "\&" || val == "\*" || val =="\[" || val =="\]" || val =="$") 
		{
			return false;
		}
	}
	return true;
}

function check_blank_ssid(keyval)
{
	if (keyval)
	{
		if ( keyval.charAt(0) == " " 
		|| keyval.charAt(keyval.length-1) == " " )
		{
			return false;
		}
	}
	
	return true;
}

function checkinvalidkey(keyval)
{
	var k;
	var val;
	for ( k=0; k<keyval.length; k++ ) 
	{
		val = keyval.charAt(k);
		if( val == "\'" || val == "\"" || val == "\\" || val == "\<" || val == "\>" || val == ";" 
			|| val == "," || val == ":" || val == "\&" || val == "\*" || val =="\[" || val =="\]" || val =="$" || val ==" ") 
		{
			return false;
		}
	}
	return true;
}

//mode is the WLAN_WEP_MODE.value
//type is to be added, a confirmed name is to be decided, such as WLAN_WEP_TYPE.value
//key is the key value passed to here
function checkWlanWepKey(mode,type,key)  
{

	var mmode; var ttype;
	var i=0;

	if(key.length==0) return true;

	for(i=0; i<mode.length; i++)
	{
		if(mode[i].selected)
		{
			mmode=mode[i].value; // 40, 104, 128
			break;
		}
	}
	
ttype = type;
	if(ttype=='hex')
	{
		if(checkHex(key)!=true) return false;
		switch (mmode)
		{
		case "40":
		  if(key.length!=10)
		   { 
		     ShowError(document.getElementById("key1"),"Invalid key. Must be 10-digital HEX number" );
		     //alert('Invalid key. Must be 10-digital HEX number');
		     return false;
		   }
		  break;
		case "104":
		  if(key.length!=26)
		   { 
		     ShowError(document.getElementById("key1"),"Invalid key. Must be 26-digital HEX number" );
		     //alert('Invalid key. Must be 26-digital HEX number');
		     return false;
		   }
		  break;
		case "128":
		  if(key.length!=32)
		   { 
		     ShowError(document.getElementById("key1"),"Invalid key. Must be 32-digital HEX number" );
		     //alert('Invalid key. Must be 32-digital HEX number');
		     return false;
		   }
		  break;
		default: break;
		}
	}

}

function checkBeacon(val)
{
	var i=0;

	for(i=0; i<val.length; i++)
	{
		if(val.charAt(i)<'0' || val.charAt(i)>'9')
		{	
		    //alert('Beacon Interval: Invalid number '+val.charAt(i)+' at position '+ (i+1)+'! Must be 0123456789');
			ShowError(document.getElementById("bintval"),"Beacon Interval: Invalid Beacon Interval. It should be number." );
			return false;
		}
	}

	//if((val-0)<20 ||val>1000)
	if((val-0)<25 || val>500) /* snowpin 2005/10/12, refer to defaultConfig.txt */
	{
		//alert('Invalid Beacon Interval. The value should be between 20...1000');
		//alert('Invalid Beacon Interval. The value should be between 25...500'); /* snowpin 2005/10/12 */
		ShowError(document.getElementById("bintval"),"Invalid Beacon Interval. The value should be between 25...500" );
		return false;
	}
}
