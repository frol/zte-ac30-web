<html>                                              
<head>                                                                      
<title>Verizon Fivespot</title>                     
<meta http-equiv=Content-Type content=text/html; charset=UTF-8>     
 <meta http-equiv=Pragma content=no-cache>
<meta content=MSHTML 6.00.2900.3086 name=GENERATOR>                 
<link href=../style/normal_ws.css type=text/css rel=stylesheet> 
<script src="../js/lang.js" type=text/JavaScript></script>
<script language="JavaScript" src="../js/protect.js"></script>    
<script language="JavaScript" src="../js/network.js"></script>   
<script language="JavaScript" src="../js/active.js"></script>  
<script type=text/javascript>
Butterlate.setTextDomain("air_network");

var net_type = "<% asp_get('current_network_mode'); %>";
var mcc = '<% asp_get("mcc"); %>';
var mnc = '<% asp_get("mnc"); %>';

function get3grscp()
{
    var rscp_nv = "-"+'<% asp_get("rscp"); %>'+"dBm";
	if(net_type == "WCDMA")//WCDMA
	{
		document.getElementById("3G_rscp").innerHTML = "RSCP";	
	}
	else if(net_type == "CDMA")
	{
		if((rscp_nv == "-0dBm")||(rscp_nv == "-125dBm"))
		{
			rscp_nv = "-dBm";
		}
		document.getElementById("3G_rscp").innerHTML = "HDR_RSSI";		
	}
	document.getElementById("3g_rscp_dbm").innerHTML = rscp_nv;
	
}

var active_state ='<% asp_get("ppp0_record"); %>';
function check_active_state()
{
	var flag = active_state_load(active_state);
	if((flag == 1) ||(flag == 4))
	{
		window.location = "/adm/activing.asp";
	}
}

function initTranslation()
{
	check_active_state();
	get3grscp();
}

function disable_submit()
{            
    form_wlinfo.Submit_refresh.disabled = true;         
    return true;     
}
	
function next_goto_page()
{
	var pppstate = '<% asp_get("ppp_status"); %>';
	var cardstate = '<% asp_get("modem_main_state"); %>';
	var spn     = '<%asp_get("sim_spn");%>';
	
	if(cardstate == "modem_modem_lock")
	{
		window.location = "/air_network/modem_lock.asp";
		return;
	}
	
	if (cardstate == "modem_waitpin")
	{
		 window.location = "/air_network/pin.asp";   
	}
	else if(cardstate == "modem_waitpuk")
	{
	     window.location = "/air_network/puk.asp";
	}
	else if(cardstate == "modem_imsi_waitnck")
	{
	     window.location = "/air_network/unlock.asp";
	}
	else if (cardstate == "modem_sim_undetected")
	{
	     window.location = "/air_network/no_sim.asp";
		 //window.location = "/air_network/net_select.asp";
	}
	else if (cardstate == "modem_undetected")
	{
	     window.location = "/air_network/no_modem.asp";
	}
	else if (pppstate == "ppp_connecting")
	{
		 window.location = "/air_network/pppconnect.asp";		 
	}
	else if (pppstate == "ppp_disconnecting")
	{
		 window.location = "pppdisconnect.asp";		 
	}
	else
	{
	    var provider = '<%asp_get("network_provider");%>';
		var network_type_var = '<%asp_get("network_type");%>';
		var roam = '<%asp_get("simcard_roam");%>';
		var network_mode = '<% asp_get("current_network_mode"); %>';
		
		
		if ("CDMA" == network_mode)
	    {
	        document.getElementById("provider").innerHTML = Network_Verizon;
	    }
	    else
	    {
		    document.getElementById("provider").innerHTML = getOperatorName(mcc, mnc);
	    }
		/*
		if(spn == "" || spn == " ")
	    {
		    if (provider == "" || provider == " ")
	        {
		        document.getElementById("provider").innerHTML = '---';
	        }
		    else
		    {
		        document.getElementById("provider").innerHTML = provider;
	        }
		}
	    else
	    {
	        document.getElementById("provider").innerHTML = spn;
	    }
		*/
		
		if ((" " == network_type_var) || ("" == network_type_var))
		{
			document.getElementById("network_type_var").innerHTML = "---";  //Get_string('Router State Home Unknown');
		}
		else
		{
			if ("CDMA" == network_type_var)
			{
				network_type_var = "1xRTT";
			}
			else if ("CDMA AND EVDO" == network_type_var)
			{
				network_type_var = "EVDO";
			}
			else if ("HSDPA" == network_type_var || "HSUPA" == network_type_var)
			{
				network_type_var = "HSPA";
			}
			else if ("NO Server" == network_type_var)
			{
				network_type_var = "No Service";
			}
			
			document.getElementById("network_type_var").innerHTML = network_type_var;
		}
		
		document.getElementById("roam").innerHTML = getRoamType(roam, network_mode);
	}
}
</script>                                                                   
</head>                                                                     
<form name=form_wlinfo onsubmit="return disable_submit();" method=post>
<body  bgcolor=white vlink=#0000cc alink=#0000cc link=#0000cc onLoad="initTranslation();next_goto_page();"> 
<table cellspacing=0 cellpadding=0 width=100% border=0>  
      <tr>                                                                    
          <td id="3GTitleWirelessIfo" class=listtopic colspan=2>WAN Settings--&gt;Wireless Info</td>
      </tr>                                             
        </table>  
<table height=100% cellspacing=0 cellpadding=10 width=100% border=0>
    <tr>                                                                        
        <td valign=top>                                               
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
	 	<TD align="center" class="selectedMenu" width=155 height="20" >&nbsp;&#8226; Wireless Info</TD>
        <TD align="center" class="unselectedMenu" width=155 height="20"><A href="net_select.asp">&#8226;Network Select</A></TD>		
        <TD align="center" class="unselectedMenu" width=250 height="20"><A href="net_connect.asp">&#8226;WAN Connection Mode</A></TD>
        <TD align="center" class="unselectedMenu" width=250 height="20"><A href="multi_apn.asp">&#8226;Multi APN</A></TD>
         
       <TD width="695"></TD>
       </tr>
	   </table>
	                                                                 
        <br>                                                                      
        <table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td id="3G_tn_3GWirelessInfo" class="title" height=20>WAN Wireless Information</td>
            </tr>                                                                     
            <tr>                                                                      
                <td id="3G_network_provider" width=22% valign="top" class="head_top">Network Provider</td> 
                <td class="head_top_content" valign="top" width=78%><div id="provider"></div></td>
            </tr>
            <tr>
                <td id="3G_network_type" class="head" valign="top" width=22%>Network Type</td>                                          
                <td class="head_content" valign="top" width=78%><div id="network_type_var"></div></td>
            </tr>                                                  
            <tr>                                                   
                <td id="3G_roam" class="head" valign="top" width=22%>Global Access</td>
                <td class="head_content" valign="top" width=78%><div id="roam"></div></td>
            </tr>                                                                           
            <tr>                                                                            
                <td id="3G_rssi" class="head" valign="top" width=22%>RSSI</td> 
                <td class="head_content" valign="top" width=78%>-<% asp_get("rssi"); %> dBm</td>
            </tr>                                                                                                               
            <tr>                                                                           
                <td id="3G_rscp" class="head" valign="top" width=22%>&nbsp;</td>                               
                <td id="3g_rscp_dbm" class="head_content" valign="top" width=78%>&nbsp;</td>
            </tr>                                                              
            <tr>                                                                           
                <td id="3G_ec_io" class="head" valign="top" width=22%>Ec/Io</td>                                                  
                <td class="head_content" valign="top" width=78%>-<% asp_get("ecio"); %> dB</td>
            </tr> 
        </table>                                                                         
        <br>                                                                             
        <table cellspacing=0 cellpadding=0 width=100% border=0>         
            <tr>                                                                           
                <td valign=bottom>                                                       
                <div align=right>                                                        
                    <input id="3g_btn_refress" class=btn style=FONT-FAMILY: Arial type=button value=Refresh name=Submit_refresh onclick=location.reload()>
                </div>
                </td> 
            </tr>   
        </table>  
        </td>     
    </tr>       
</table>      
</body>       
</form>  
</html>       