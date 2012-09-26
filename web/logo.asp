<html>                                                                          
<head>                                                                          
<META http-equiv = "Content-Type" content = "text/html; charset = utf-8">       
<meta HTTP-EQUIV = 'Pragma' CONTENT = 'no-cache'/>
<meta HTTP-EQUIV = 'refresh' CONTENT = '6'>
<title>Verizon Fivespot</title>                           
<base target = "_top">                                                             
<link rel = stylesheet href = 'js/css.css' type = 'text/css'>                      
<script language = "javascript" src = "js/global.js"></script> 
<script language="JavaScript" src="js/protect.js"></script>
<script language="JavaScript" src="js/network.js"></script>
<script language = "javascript">
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
</script>                                                                       
<script language = "javascript">                                                

var csq = '<% asp_get("csq"); %>';  
var rssi = '<% asp_get("rssi"); %>';  
var rscp = '<% asp_get("rscp"); %>'; 
var wanState = '<% asp_get("ppp_status"); %>';                          
var icardState = '<% asp_get("modem_main_state"); %>';                                                  
var network_type = '<% asp_get("network_type"); %>';
//var network_provider = ' asp_get("network_provider"); ';
var domain_status = '<% asp_get("domain_stat"); %>';
var modem_network_mode = '<%asp_get("current_network_mode");%>';

var mcc = '<% asp_get("mcc"); %>';
var mnc = '<% asp_get("mnc"); %>';

var ievdoState = 0;
var iwanState = 0;
											 
function showEVDOsts(iLen)                                                      
{    
    var e = getElById("evdoBar");
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

function showWanState(iState)                                                   
{               
	var connect = "Connected";  //Get_string("WAN Connection Connected");
	var disconnect = "Disconnected"; //Get_string("WAN Connection Disconnected");
	var connecting = "Connecting";  //Get_string("WAN Connection Connecting");
	var disconnecting = "Disconnecting";  //Get_string("WAN Connection Disconnecting");
	var ondemand = "OnDemand";  //Get_string("WAN Connection OnDemand");
	
	var e = getElById("wanBar");

    switch (iState)                                                             
    {                 
		                                                           
        case 0:                                              
            e.src = "img/disconnect.png"; 
       		document.getElementById("con_status").innerHTML = disconnect;      
            break;                                                              
        case 1:                                               
            e.src = "img/disconnect.png";
       		document.getElementById("con_status").innerHTML = connecting;                      
            break;
		case 2:                                               
            e.src = "img/connect.png";
       		document.getElementById("con_status").innerHTML = connect;                  
            break;                                                              
        case 3:                                               
            e.src = "img/connect.png";
       		document.getElementById("con_status").innerHTML = disconnecting;                  
            break;
        case 4:                                              
            e.src = "img/disconnect.png"; 
       		document.getElementById("con_status").innerHTML = ondemand;      
            break;     
        default:                                                                
            e.src = "img/disconnect.png";
       		document.getElementById("con_status").innerHTML = disconnect;        
			break;
    }     
	
                                                                     
}                                                                               
             

function showCardState(cardState)                                               
{                                                
    var e = getElById("cardBar");
	
    if (cardState == "modem_init_complete")                                   
    {                                                                           
        e.src = "img/sim_detected.png"; 
    }                                                                           
    else                                                                        
    {                                                                           
        e.src = "img/sim_undetected.png";
    }                                                                           
}                                                                               
                                                                                
function showOperator(cardState)                                    
{ 
    if (cardState == "modem_init_complete")
	{
		if ("CDMA" == modem_network_mode)
	    {
		    document.getElementById("operator").innerHTML = Network_Verizon;
	    }
	    else
	   {
		    document.getElementById("operator").innerHTML = getOperatorName(mcc, mnc);
	   }
	}
	else
	{
		document.getElementById("operator").innerHTML = "---";
	}
    
/*
    if((null == operator)||("" == operator))                                    
    {                                                                           
       
    }                                                                           
    else
    {
        document.getElementById("operator").innerHTML = operator;
    }                                                                           
*/                                                                              
}                                                                               
                                                                                
function showNetworkRat(network)                                                
{                                                                               
    if ((" " == network) || ("" == network)){
		document.getElementById("network_rat").innerHTML = "---";
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
		
		document.getElementById("network_rat").innerHTML = network;
		
		if ("No Service" == network)
		{
			showEVDOsts(0);
		}
	}                                                                       
} 

function showdomainstate(PCs)
{
    switch (PCs)                                                            
    {                                                                           
        case "CS_ONLY":                                             
            document.getElementById("PCs_domain").innerHTML = "C";           
            break;                                                              
        case "PS_ONLY":                                            
            document.getElementById("PCs_domain").innerHTML = "P";          
            break;
        case "CS_PS":
            document.getElementById("PCs_domain").innerHTML = "&nbsp;P&nbsp;C";
            break;
        default:
            document.getElementById("PCs_domain").innerHTML = "";
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

function InitLogo()
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
	wanprocess(); // get connection status
	
    showEVDOsts(ievdoState);
    showWanState(iwanState);                                          
    showCardState(icardState);
    showNetworkRat(network_type);
    //showOperator(network_provider);
	showOperator(icardState);
	showdomainstate(top.g_domain_status);
	fixPng();
}                                                                               
</script>                                                                       
</head>                                                                   
<body onload = "InitLogo();fixPng();" style="background-image:url(img/logo_bg.png);font-size:12px">                                      
<table width = "100%" height ="100%" border = "0" cellpadding = "0" cellspacing = "0">                               
	<tr>
    	<td width="35px" class="SignalImage"><img id = "evdoBar" width = "32" height = "15px"></td> 
    	<td width="150px" class="SignalText" align="center"><font size="2" color="white"><DIV id = "network_rat"></DIV></font></td>
    	<td width="120px" class="SignalText" style = "font-size:2px; text-align:center"><font size="2" color="white"><DIV id = "operator"></DIV></font></td>
		<td width="50px" class="SignalText" align="left"><font size="2" color="white"><DIV id = "PCs_domain"></DIV></font></td>    
        <td width="20px" class="SignalImage"><img id="wanBar" width="18px" height="20" ></td>
    	<td width="120px" class="SignalText" ><font size="2" color="white"><DIV id = "con_status"></DIV></font></td>    
		<td width="20px" class="SignalImage"><img id="cardBar" width="15px" height="15px" ></td>
    </tr>                                                                           
</table>                                                       
</body>                                                                         
</html>  
