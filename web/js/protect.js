
if(top==self)
{
	top.location = "http://192.168.0.1/login.asp";
}

function click()
{
	window.event.returnValue = false;
}
document.oncontextmenu = click;


var isCookieEnable = document.cookie?true:false;
if (!isCookieEnable)
{
	alert("Please make sure the cookie is enabled, or else you can't login!");
	top.location = "http://192.168.0.1/login.asp";
}

function getlucknum()
{
	var lucknumvalue = "";   
    var search = "lucknum=";
	var offset = 0;
    if(document.cookie.length > 0) {  
        offset = document.cookie.indexOf(search);   
        if (offset != -1) {   
            offset += search.length;   
            end = document.cookie.indexOf(";", offset);   
            if (end == -1) end = document.cookie.length;   
            lucknumvalue = unescape(document.cookie.substring(offset, end))   
        }   
    }
	return lucknumvalue;
}

function writeHiddenNum(hiddenId)
{
	var lucknum = getlucknum();
	if (hiddenId)
	{
		document.getElementById(hiddenId).value = lucknum;
		return;
	}
	else if (document.getElementById("lucknum"))
	{
		document.getElementById("lucknum").value = lucknum;
	}
}
