<html>
<head>
<title>Verizon Fivespot</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="refresh" content="8; URL=home_wan.asp">
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/network.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">

var net_type  = '<% asp_get("current_network_mode"); %>';
var pppstate  = '<% asp_get("ppp_status"); %>';
var cardstate = '<% asp_get("modem_main_state"); %>';
	
var mcc = '<% asp_get("mcc"); %>';
var mnc = '<% asp_get("mnc"); %>';

var active_state ='<% asp_get("ppp0_record"); %>';
function check_active_state()
{
	var flag = active_state_load(active_state);
	if((flag == 1) ||(flag == 4))
	{
		window.location = "/adm/activing.asp";
	}
}

function next_goto_page()
{
	if(cardstate == "modem_waitmlock")
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
	}
	else if (cardstate == "modem_undetected")
	{
	     window.location = "/air_network/no_modem.asp";
	}
	if (pppstate == "ppp_connecting")
	{
		 window.location = "/air_network/pppconnect.asp";		 
	}
	if (pppstate == "ppp_disconnecting")
	{
		 window.location = "/air_network/pppdisconnect.asp";		 
	}
}

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

function get3gdomain()
{
	var net_domain_stat = "<% asp_get('domain_stat'); %>";
	
	if(net_type == "WCDMA")//WCDMA
	{
		document.getElementById("net_domain").innerHTML = net_domain_stat+"&nbsp;";
	}
	else if(net_type == "CDMA")//CDMA
	{
		e = document.getElementById("tr_domain").style.display = "none";
	}
}

function PageInit()
{
	check_active_state();
    next_goto_page();
	get_config();
}

function get_config(){
	var dhcp_mode  = '<% asp_get("dhcpEnabled"); %>';
	var p_m_dns    = '<% asp_get("prefer_dns_manual"); %>';
	var s_m_dns    = '<% asp_get("standby_dns_manual"); %>';
	var p_a_dns		= '<% asp_get("prefer_dns_auto"); %>';
	var s_a_dns		= '<% asp_get("standby_dns_auto"); %>';
	var ppp_state    = '<% asp_get("ppp_status"); %>';
	var encryption   = '<% asp_get("EncrypType"); %>';
	var encryptType = '<% asp_get("AuthMode"); %>';
	var wps_enabled_state  = '<% asp_get("WscModeOption"); %>';
	var encryptType_tmp = '<% asp_get("AuthMode_tmp"); %>';	
	var cadstate = '<% asp_get("modem_main_state"); %>';
	var roam         = '<%asp_get("simcard_roam");%>';
	var provider     = '<%asp_get("network_provider");%>';
	
	var spn     = '<%asp_get("sim_spn");%>';
	var ssid_var     = '<% asp_get("SSID1"); %>';
	var channel_var = '<% asp_get("Channel"); %>';
	
	var network_type_var     = '<%asp_get("network_type");%>';
	
	if ((" " == network_type_var) || ("" == network_type_var)){
		document.getElementById("network_type_var").innerHTML = "---";  //Get_string('Router State Home Unknown');
	}else{
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
	if ((" " == ssid_var) || ("" == ssid_var)){
		document.getElementById("ssid_var").innerHTML = "---";   //Get_string('Router State Home Unknown');
	}else{
		document.getElementById("ssid_var").innerHTML = showSSID(ssid_var);
	}

	if(channel_var == "0")
	{
	    document.getElementById("channel").innerHTML = 'Auto';	
        }
	else
	{
	    document.getElementById("channel").innerHTML = channel_var;			
	}
	
	if ("0" == dhcp_mode){
		document.getElementById("dhcp_state").innerHTML = "Disable";  //Get_string('Router State Home Disable');
	}else if ("1" == dhcp_mode)
	{
		document.getElementById("dhcp_state").innerHTML = "Enable";   //Get_string('Router State Home Enable');
	}else{
		document.getElementById("dhcp_state").innerHTML = "Unknown";   //Get_string('Router State Home Unknown');
	}

	if ("auto" == '<% asp_get("dns_mode"); %>'){

		document.getElementById("p_dns").innerHTML = p_a_dns + "&nbsp;";
		document.getElementById("s_dns").innerHTML = s_a_dns + "&nbsp;";
	}else{
		document.getElementById("p_dns").innerHTML = p_m_dns + "&nbsp;";
		document.getElementById("s_dns").innerHTML = s_m_dns + "&nbsp;";
	}

	if ("ppp_connected" == ppp_state){
		document.getElementById("hppp_state").innerHTML = "Connected";  //Get_string('WAN Connection Connected');
	}
	else if ("ppp_on_demand" == ppp_state){
		document.getElementById("hppp_state").innerHTML = "OnDemand";  // \Get_string('WAN Connection OnDemand');
	}
	else{
		document.getElementById("hppp_state").innerHTML = "Disconnected";  //Get_string('WAN Connection Disconnected');
	}
	/***************************************************/
	if(wps_enabled_state == "0")//wps disabled
	{
		if((encryptType=="OPEN") && (encryption=="NONE"))
		{
			document.getElementById("security").innerHTML = "Disable";
		}
		else
		{
			if(encryptType=="OPEN")
			{
				document.getElementById("security").innerHTML = "OPEN WEP"; 
			}
			else if(encryptType=="SHARED")
			{
				document.getElementById("security").innerHTML = "SHARED";
			}
			else if(encryptType=="WPAPSK")
			{
				document.getElementById("security").innerHTML = "WPA-PSK";
			}
			else if(encryptType=="WPA2PSK")
			{
				document.getElementById("security").innerHTML = "WPA2-PSK";
			}
			else if(encryptType=="WPAPSKWPA2PSK")
			{
				document.getElementById("security").innerHTML = "WPA-PSK/WPA2-PSK";
			}
			else
			{
				document.getElementById("security").innerHTML = "undefined";
			}
			
		}
	}
	else
	{
		 if(encryptType_tmp=="WPAPSK")
		{
			document.getElementById("security").innerHTML = "WPA-PSK";
		}
		else if(encryptType_tmp=="WPA2PSK")
		{
			document.getElementById("security").innerHTML = "WPA2-PSK";
		}
		else if(encryptType_tmp=="WPAPSKWPA2PSK")
		{
			document.getElementById("security").innerHTML = "WPA-PSK/WPA2-PSK";
		}
	}
	
	/**********************************************/
	document.getElementById("roam").innerHTML = getRoamType(roam, net_type);
	
	if ("CDMA" == net_type)
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
		    document.getElementById("provider").innerHTML = "---";  //Get_string('Router State Home Unknown');
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
}

</script>
</head>

<body onLoad="PageInit();">
<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
	<tr style="width:100%" align="center">
		<td valign="top">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td class="listtopic" colspan="2" id="RouterStateHometitle">Home</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</table>
		<table width="98%"  id="3g_info" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="title" colspan="2" id="RouterStateHome3GInformation">
				WAN Information</td>
			</tr>
			<tr>
				<td width="40%" class="head_top" id="RouterStateHome3GInfoNetworkProvider">
				Network Provider</td>
				<td class="head_top_content">
				<div id="provider">&nbsp;
				</div>
				</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHome3GInfoNetworkType">Network Type</td>
				<td class="head_content">
				<div id="network_type_var">&nbsp;
				</div>
				</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHome3GInfoRoam">Global Access</td>
				<td class="head_content">
				<div id="roam">&nbsp;
				</div>
				</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeWANInfoPPPStatus">WAN Connection Status</td>
				<td class="head_content">
				<div id="hppp_state">
				</div>
				</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeWANInfoIPAddress">IP Address</td>
				<td class="head_content"><% asp_get("wan_ipaddr"); %>&nbsp;</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeWANInfoPrimaryDNS">Primary DNS</td>
				<td class="head_content">
				<div id="p_dns">&nbsp;
				</div>
				</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeWANInfoSecondaryDNS">Secondary 
				DNS</td>
				<td class="head_content">
				<div id="s_dns">&nbsp;
				</div>
				</td>
			</tr>
			<tr>
				<td class="title" colspan="2">&nbsp; </td>
			</tr>
			<tr>
				<td class="title" colspan="2" id="RouterStateHomeWLANCurrentStatus">
				WLAN Information</td>
			</tr>
			<tr>
				<td class="head_top" id="RouterStateHomeWLANStatSSID">SSID</td>
				<td class="head_top_content">
				<div id="ssid_var">
				</div>
				</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeWLANStatChannel">Channel</td>
                <td class="head_content">
				<div id="channel">
				</div>
                </td>                
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeWLANStatSecurityLevel">Security 
				Level</td>
				<td class="head_content">
				<div id="security">
				</div>
				</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeLWInfoIPAddress">IP Address</td>
				<td class="head_content"><% getLanIp(); %>&nbsp;</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeLWInfoSubnetMask">Subnet Mask</td>
				<td class="head_content"><% asp_get("lan_netmask"); %></td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeLWInfoDefaultGateway">Default 
				Gateway</td>
				<td class="head_content"><% getLanIp(); %>&nbsp;</td>
			</tr>
			<tr>
				<td class="head" id="RouterStateHomeLWInfoDHCPServer">DHCP Server</td>
				<td class="head_content">
				<div id="dhcp_state">
				</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</body>

</html>
