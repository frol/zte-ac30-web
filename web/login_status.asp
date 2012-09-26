<html>                                                                          
<head>                                                                          
<META http-equiv = "Content-Type" content = "text/html; charset = utf-8">       
<meta HTTP-EQUIV = 'Pragma' CONTENT = 'no-cache'/>
<!--<meta HTTP-EQUIV = 'refresh' CONTENT = '10'>-->
<link rel = stylesheet href = 'js/css.css' type = 'text/css'>
<title>Verizon Fivespot</title>                           
<base target = "_top">
<script language="JavaScript" src="js/network.js"></script>
<script>
var csq = '<% asp_get("csq"); %>';  
var rssi = '<% asp_get("rssi"); %>';  
var rscp = '<% asp_get("rscp"); %>'; 
var wanState = '<% asp_get("ppp_status"); %>';
var network_type = '<% asp_get("network_type"); %>';
var modem_network_mode = '<%asp_get("current_network_mode");%>';
var roam         = '<%asp_get("simcard_roam");%>';
var mcc = '<% asp_get("mcc"); %>';
var mnc = '<% asp_get("mnc"); %>';
var battery_status = '<%asp_get("battery_status");%>';
var battery_info = '<%asp_get("battery_info");%>';

var ievdoState = 0;
var iwanState = 0;

function fixPng() {   
  var arVersion = navigator.appVersion.split("MSIE")   
  var version = parseFloat(arVersion[1])   
  
  if ((version >= 5.5 && version < 7.0) && (document.body.filters)) {   
    for(var i=0; i<document.images.length; i++) {   
      var img = document.images[i];   
      var imgName = img.src.toUpperCase();   
      if (imgName.indexOf(".PNG") > 0) {   
        var width = img.width;   
        var height = img.height;   
        var sizingMethod = (img.className.toLowerCase().indexOf("scale") >= 0)? "scale" : "image";    
        img.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + img.src.replace('%23', '%2523').replace("'", "%27") + "', sizingMethod='" + sizingMethod + "')";   
        img.src = "blank.gif";   
        img.width = width;   
        img.height = height;   
        }   
      }   
    }   
}

function getElById(idVal)                                                       
{                                                                               
  if (document.getElementById != null)                                          
    return document.getElementById(idVal);                                      
  if (document.all != null)                                                     
    return document.all[idVal];                                                 
                                                                                
  return null;                                                                  
}

function showEVDOsts(iLen)                                                      
{    
    var e = getElById("signalImg");
    switch (iLen)
    {                                                                           
        case 0:                                             
            e.src = "img/4.png";                     
            break;                                                              
        case 1:                                              
            e.src = "img/5.png";                     
            break;                                                              
        case 2:                                              
            e.src = "img/6.png";                     
            break;                                                              
        case 3:                                            
            e.src = "img/7.png";                     
            break; 
		case 4:                                            
            e.src = "img/8.png";                     
            break;                                                              
        case 5:                                            
            e.src = "img/9.png";                     
            break;                                                                                                            
       default:                                                                
          e.src = "img/9.png"; 
             break;
    }                                                                           
} 

function showNetworkType(network)                                                
{                                                                               
    if ((" " == network) || ("" == network)){
		document.getElementById("network_type").innerHTML = "---";
	}else{
		if ("CDMA" == network)
		{
			network = "1xRTT";
		}
		else if ("CDMA AND EVDO" == network)
		{
			network = "EVDO";
		}
		else if ("HSDPA" == network || "HSUPA" == network)
		{
			network = "HSPA";
		}
		else if ("NO Server" == network)
		{
			network = "No Service";
		}
		
		document.getElementById("network_type").innerHTML = network;
		
		if ("No Service" == network)
		{
			showEVDOsts(0);
		}
	}                                                                       
} 

function showWanState(iState)                                                   
{               
	var connect = "Connected";
	var disconnect = "Disconnected";
	var connecting = "Connecting";
	var disconnecting = "Disconnecting";
	var ondemand = "OnDemand";
	
	var e = getElById("pppStatusImg");
    switch (iState)                                                             
    {                 
		                                                           
        case 0:                                              
            e.src = "img/disconnect.png"; 
       		document.getElementById("pppStatus").innerHTML = disconnect;      
            break;                                                              
        case 1:                                               
            e.src = "img/disconnect.png";
       		document.getElementById("pppStatus").innerHTML = connecting;                      
            break;
		case 2:                                               
            e.src = "img/connect.png";
       		document.getElementById("pppStatus").innerHTML = connect;                  
            break;                                                              
        case 3:                                               
            e.src = "img/connect.png";
       		document.getElementById("pppStatus").innerHTML = disconnecting;                  
            break;
        case 4:                                              
            e.src = "img/disconnect.png"; 
       		document.getElementById("pppStatus").innerHTML = ondemand;      
            break;     
        default:                                                                
            e.src = "img/disconnect.png";
       		document.getElementById("pppStatus").innerHTML = disconnect;        
			break;
    }                                  
}         


function wanprocess()
{
	if(wanState == "ppp_disconnected")
	{
	   iwanState = 0;
	}
	else if(wanState == "ppp_connecting")
	{
	   iwanState = 1;	
	}
	else if(wanState == "ppp_connected")
	{
	   iwanState = 2;	
	}
	else if(wanState == "ppp_disconnecting")
	{
	   iwanState = 3;	
	}
	else if(wanState == "ppp_on_demand")
	{
	   iwanState = 4;	
	}
	return iwanState;
}

function showBatteryStatus()
{
	var e = getElById("batteryStatusImg");
	
	if ("0" == battery_info)
	{
		if (battery_status > 75)
		{
			e.src = "img/battery_full.png";
		}
		else if (battery_status > 50 && battery_status <= 75)
		{
			e.src = "img/battery_three.png";
		}
		else if (battery_status > 25 && battery_status <= 50)
		{
			e.src = "img/battery_two.png";
		}
		else if (battery_status > 10 && battery_status <= 25)
		{
			e.src = "img/battery_one.png";
		}
		else
		{
			e.src = "img/battery_out.gif";
		}
	}
	else if ("1" == battery_info)
	{
		e.src = "img/battery_full.png";
	}
	else if ("2" == battery_info)
	{
		e.src = "img/battery_charging.gif";
	}
	else if ("3" == battery_info)
	{
		e.src = "img/battery_out.gif"; 
	}
}

function initPage()
{
	if ("CDMA" == modem_network_mode)
	{
		var temp = 0;
		if ("EVDO" == network_type || "CDMA AND EVDO" == network_type)
		{
			temp = rscp;
		}
		else if ("CDMA" == network_type)
		{
			temp = rssi;
		}
		else
		{
			temp = 0;
		}
		ievdoState = processCDMA(temp);
	}
	else
	{
		ievdoState = processWCDMA(csq);
	}
	
	showEVDOsts(ievdoState);
	showNetworkType(network_type);
	document.getElementById("roam_type").innerHTML = getRoamType(roam, modem_network_mode);
	wanprocess();
	showWanState(iwanState);
	showBatteryStatus();
	
	fixPng();
}
</script>
</head>

<body style="background-color:#900" onLoad="initPage();">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="text-align:left;color:#FFF; font-size:12px">
	<tr>
    	<td align="left" width="40" height="17">&nbsp;&nbsp;<img id="signalImg" width="32" height="17" src="img/4.png" border="0"/></td>
        <td align="center" width="140" height="17"><font color="#ffffff"><span id="network_type"/></font></td>
        <td align="left" width="80" height="17">&nbsp;&nbsp;<font color="#ffffff"><span id="roam_type"/></font></td>
        <td align="center" width="10" height="17">&nbsp;</td>
        <td align="right" width="18" height="17"><img id="pppStatusImg" width="18px" src="img/disconnect.png" ></td>
        <td align="left" width="100" height="17"><font color="#ffffff"><span id="pppStatus"/></font></td>
        <td align="center" width="40" height="17"><img id="batteryStatusImg" width="18" height="18"/>&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>
</body>

</html>