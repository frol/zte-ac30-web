<html>
<head>
<title>Verizon Fivespot</title>
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/validate.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("internet");
var lan2 = '<% getCfgZero(1, "Lan2Enabled"); %>';

var secs
var timerID = null
var timerRunning = false
function StartTheTimer(){
	if (secs==0){
		TimeoutReload(5);
		//window.location.reload();
		window.location.href=window.location.href;	
    }else{
        self.status = secs
        secs = secs - 1
        timerRunning = true
        timerID = self.setTimeout("StartTheTimer()", 1000)
    }
}

function TimeoutReload(timeout)
{
	secs = timeout;
	if(timerRunning)
		clearTimeout(timerID)
	timerRunning = false
	StartTheTimer();	
}

function display_on()
{
	if (window.ActiveXObject) {
		return "block";
	}
	else if (window.XMLHttpRequest) {
		return "table-row";
	}
}

function dhcpTypeSwitch()
{
	document.getElementById("dhcpIpPool").style.visibility = "hidden";
	document.getElementById("dhcpIpPool").style.display = "none";
	//document.getElementById("start").style.visibility = "hidden";
	//document.getElementById("start").style.display = "none";
	document.lanCfg.dhcpStart.disabled = true;
	//document.getElementById("end").style.visibility = "hidden";
	//document.getElementById("end").style.display = "none";
	document.lanCfg.dhcpEnd.disabled = true;
	
	document.getElementById("lease").style.visibility = "hidden";
	document.getElementById("lease").style.display = "none";
	document.getElementById("dhcpLease").disabled = true;
	if (document.lanCfg.lanDhcpType.options.selectedIndex == 1)
	{
		document.getElementById("dhcpIpPool").style.visibility = "visible";
		document.getElementById("dhcpIpPool").style.display = display_on();
		//document.getElementById("start").style.visibility = "visible";
		//document.getElementById("start").style.display = display_on();
		document.lanCfg.dhcpStart.disabled = false;
		//document.getElementById("end").style.visibility = "visible";
		//document.getElementById("end").style.display = display_on();
		document.lanCfg.dhcpEnd.disabled = false;
		
		document.getElementById("lease").style.visibility = "visible";
		document.getElementById("lease").style.display = display_on();
		document.lanCfg.dhcpLease.disabled = false;
	}
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

function initValue()
{
	check_active_state();
	
	var opmode = '<% getCfgZero(1, "OperationMode"); %>';
	var dhcp = '<% getCfgZero(1, "dhcpEnabled"); %>';
	var stp = '<% getCfgZero(1, "stpEnabled"); %>';
	var lltd = '<% getCfgZero(1, "lltdEnabled"); %>';
	var igmp = '<% getCfgZero(1, "igmpEnabled"); %>';
	//var upnp = '<% getCfgZero(1, "upnpEnabled"); %>';
	var radvd = '<% getCfgZero(1, "radvdEnabled"); %>';
	var pppoe = '<% getCfgZero(1, "pppoeREnabled"); %>';
	var dns = '<% getCfgZero(1, "dnsPEnabled"); %>';
	var wan = '<% getCfgZero(1, "wanConnectionMode"); %>';
	var lltdb = '<% getLltdBuilt(); %>';
	var igmpb = '<% getIgmpProxyBuilt(); %>';
	var radvdb = '<% getRadvdBuilt(); %>';
	var pppoeb = '<% getPppoeRelayBuilt(); %>';
	var dnsp = '<% getDnsmasqBuilt(); %>';
	var pppstate = '<% asp_get("ppp_status"); %>';
	
	if (pppstate == "ppp_connecting")
	{
		 window.location = "/air_network/pppconnect.asp";		 
	}
	else if (pppstate == "ppp_disconnecting")
	{
		 window.location = "/air_network/pppdisconnect.asp";		 
	}

	//document.lanCfg.upnpEnbl.options.selectedIndex = 1*upnp;

	document.lanCfg.lanDhcpType.options.selectedIndex = 1*dhcp;
	dhcpTypeSwitch();
	
	if (pppstate == "ppp_connected")
	{
	    document.lanCfg.lanIp.disabled = true;
		document.lanCfg.lanNetmask.disabled = true;
		if(document.lanCfg.lanDhcpType.options.selectedIndex == 1)
		{
		    document.lanCfg.dhcpStart.disabled = true;		
		    document.lanCfg.dhcpEnd.disabled = true;
			document.lanCfg.dhcpLease.disabled = true;
		}		
		document.lanCfg.lanDhcpType.disabled = true;		
		//document.lanCfg.upnpEnbl.disabled = true;
		
		document.getElementById('RouterLanApply').disabled = true;	
	}
	else
	{
		document.lanCfg.lanIp.disabled = false;
		document.lanCfg.lanNetmask.disabled = false;
		if(document.lanCfg.lanDhcpType.options.selectedIndex == 1)
		{
		    document.lanCfg.dhcpStart.disabled = false;		
		    document.lanCfg.dhcpEnd.disabled = false;
			document.lanCfg.dhcpLease.disabled = false;
		}		
		document.lanCfg.lanDhcpType.disabled = false;		
		//document.lanCfg.upnpEnbl.disabled = false;
		
		document.getElementById('RouterLanApply').disabled = false;	
	}

}

function atoi(str, num)
{
	i = 1;
	if (num != 1) {
		while (i != num && str.length != 0) {
			if (str.charAt(0) == '.') {
				i++;
			}
			str = str.substring(1);
		}
		if (i != num)
			return -1;
	}

	for (i=0; i<str.length; i++) {
		if (str.charAt(i) == '.') {
			str = str.substring(0, i);
			break;
		}
	}
	if (str.length == 0)
		return -1;
	if((('0' == str.charAt(0)) && (1 != str.length)))
	    return -1;
	 	
	return parseInt(str, 10);
}

function checkRange(str, num, min, max)
{
	d = atoi(str, num);
	if (d > max || d < min)
		return false;
	return true;
}

function isAllNum(str)
{
	for (var i=0; i<str.length; i++) {
		if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.' ))
			continue;
		return 0;
	}
	return 1;
}

function checkIpAddr(field, ismask)
{
	if (field.value == "") {
		ShowError(field, "Router Lan IP Empty");
		//field.value = field.defaultValue;
		field.focus();
		return false;
	}

	if (isAllNum(field.value) == 0) {
		ShowError(field, 'Router Lan IP Format Error');
		//field.value = field.defaultValue;
		field.focus();
		return false;
	}

	if (ismask) {
		if ((!checkRange(field.value, 1, 0, 256)) ||
				(!checkRange(field.value, 2, 0, 256)) ||
				(!checkRange(field.value, 3, 0, 256)) ||
				(!checkRange(field.value, 4, 0, 256)))
		{
			ShowError(field, 'Router Lan IP Format Error');
			//field.value = field.defaultValue;
			field.focus();
			return false;
		}
	}
	else {
		//if ((!checkRange(field.value, 1, 0, 255)) ||
		if ((!checkRange(field.value, 1, 1, 223)) ||
				(!checkRange(field.value, 2, 0, 255)) ||
				(!checkRange(field.value, 3, 0, 255)) ||
				(!checkRange(field.value, 4, 1, 254)))
		{
			ShowError(field, 'Router Lan IP Format Error');
			//field.value = field.defaultValue;
			field.focus();
			return false;
		}
	}
	return true;
}
function hex(val)
{
	var h = (val-0).toString(16);
	if(h.length==1) h='0'+h;
	return h.toUpperCase();
}
function Op_AND_4Byte(v1, v2) {
	var i;
	var var1 = new Array();
	var var2 = new Array();
	var result='0x';

	for (i=2,j=0;i<10;i+=2,j++) {
		var1[j]='0x'+v1.substring(i,i+2);
		var2[j]='0x'+v2.substring(i,i+2);
	}
	
	for (i=0;i<4;i++) {
		result = result + hex(var1[i]&var2[i]);
	}
	
	result = result-0;
	return result;
}
function validateGateway(wanIp,netmaskIp,gatewayIp) {

	var i1,i2,i3, wip, nip, gip;
	var lan4, mask4, pool4, net_no, lo_broadcast;

	i1=wanIp.indexOf('.');
	i2=wanIp.indexOf('.',(i1+1));
	i3=wanIp.indexOf('.',(i2+1));
	wip = hex(wanIp.substring(0,i1)) + hex(wanIp.substring((i1+1),i2)) +hex(wanIp.substring((i2+1),i3))+hex(wanIp.substring((i3+1),wanIp.length));
	wip = '0x'+wip;
	lan4 = wanIp.substring((i3+1),wanIp.length)-0;

	i1=netmaskIp.indexOf('.');
	i2=netmaskIp.indexOf('.',(i1+1));
	i3=netmaskIp.indexOf('.',(i2+1));
	nip = hex(netmaskIp.substring(0,i1)) + hex(netmaskIp.substring((i1+1),i2)) +hex(netmaskIp.substring((i2+1),i3)) +hex(netmaskIp.substring((i3+1),netmaskIp.length));
	nip = '0x'+nip;
	mask4 = netmaskIp.substring((i3+1),netmaskIp.length)-0;

	i1=gatewayIp.indexOf('.');
	i2=gatewayIp.indexOf('.',(i1+1));
	i3=gatewayIp.indexOf('.',(i2+1));
	gip = hex(gatewayIp.substring(0,i1)) + hex(gatewayIp.substring((i1+1),i2)) +hex(gatewayIp.substring((i2+1),i3)) +hex(gatewayIp.substring((i3+1),gatewayIp.length));
	gip = '0x'+gip;
	pool4 = gatewayIp.substring((i3+1),gatewayIp.length)-0;

	if (Op_AND_4Byte(wip, nip) != Op_AND_4Byte(gip, nip))
	{
		//alert("Invalid Ip: " +gatewayIp+" not in " + wanIp+"/"+netmaskIp+" netmask");
		return false;
	}

	net_no = (lan4 & mask4);
	lo_broadcast =  (lan4 & mask4) + (255-mask4);
	
	if (pool4==net_no) {
		//alert("Invalid Ip: " +gatewayIp+" is the Network Number.");
		return false;
	}
	if (pool4==lo_broadcast) {
		//alert("Invalid Ip: " +gatewayIp+" is the Broadcast address.");
		return false;
	}
}

function validateStartEndIp(lan_ipaddr, netip, startip, endip)
{
	i1=startip.indexOf('.');
	i2=startip.indexOf('.',(i1+1));
	i3=startip.indexOf('.',(i2+1));
	sip = hex(startip.substring(0,i1)) + hex(startip.substring((i1+1),i2)) +hex(startip.substring((i2+1),i3))+hex(startip.substring((i3+1),startip.length));
	sip = '0x'+sip;

	i1=endip.indexOf('.');
	i2=endip.indexOf('.',(i1+1));
	i3=endip.indexOf('.',(i2+1));
	eip = hex(endip.substring(0,i1)) + hex(endip.substring((i1+1),i2)) +hex(endip.substring((i2+1),i3))+hex(endip.substring((i3+1),endip.length));
	eip = '0x'+eip;
	
	i1=lan_ipaddr.indexOf('.');
	i2=lan_ipaddr.indexOf('.',(i1+1));
	i3=lan_ipaddr.indexOf('.',(i2+1)); 
	lan_ipaddr = hex(lan_ipaddr.substring(0,i1)) + hex(lan_ipaddr.substring((i1+1),i2)) +hex(lan_ipaddr.substring((i2+1),i3))+hex(lan_ipaddr.substring((i3+1),lan_ipaddr.length));
	lan_ipaddr = '0x'+lan_ipaddr;

	if(sip>eip)
	{
		//alert("Invalid start and end IP address, end IP should be larger than start IP.");
		return 1;
	}
	
	if(lan_ipaddr >= sip && lan_ipaddr <= eip)
	{
	    return 2;
	}
	
	return 0;
}

function isNetmaskIPValid(ip)
{
	if (ip == 255 || ip == 254 || ip == 252 || ip == 248
	|| ip == 240 || ip == 224 || ip == 192 || ip == 128 || ip == 0)
	{
		return true;
	}
	else
	{
		return false;
	}
}

function validateNetmask(netmask)
{
	var array = new Array();
	array = netmask.split(".");
	
	if (array.length != 4)
	{
		return false;
	}
	
	array[0] = parseInt(array[0]);
	array[1] = parseInt(array[1]);
	array[2] = parseInt(array[2]);
	array[3] = parseInt(array[3]);

	if (array[3] != 0)
	{
		if (array[2] != 255 || array[1] != 255 || array[0] != 255)
		{
			return false;
		}
		else
		{
			if (!isNetmaskIPValid(array[3]))
			{
				return false;
			}
		}
	}
	
	if (array[2] != 0)
	{
		if (array[1] != 255 || array[0] != 255)
		{
			return false;
		}
		else
		{
			if (!isNetmaskIPValid(array[2]))
			{
				return false;
			}
		}
	}
	
	if (array[1] != 0)
	{
		if (array[0] != 255)
		{
			return false;
		}
		else
		{
			if (!isNetmaskIPValid(array[1]))
			{
				return false;
			}
		}
	}
	
	if ( "0.0.0.0" == netmask || "255.255.255.255" == netmask)
	{
		return false;
	}
	
	return true;
}

function CheckValue()
{
/*
	if (document.lanCfg.hostname.value.indexOf(" ") >= 0)
	{
		ShowError(document.lanCfg.hostname, 'Don\'t enter Blank Space in this feild');
		document.lanCfg.hostname.focus();
		document.lanCfg.hostname.select();
		return false;
	}
	*/
	if (!checkIpAddr(document.lanCfg.lanIp, false))
		return false;
	if (!checkIpAddr(document.lanCfg.lanNetmask, true))
		return false;
		
	// check the netmask address by LiuWei184577
	if ( !validateNetmask(document.lanCfg.lanNetmask.value) )
	{
		ShowError(document.lanCfg.lanNetmask, 'Router Lan NetMask Invalid');
		document.lanCfg.lanNetmask.focus();
		return false;
	}
		
	/*
	if (document.lanCfg.lan2enabled[0].checked == true)
	{
		if (!checkIpAddr(document.lanCfg.lan2Ip, false))
			return false;
		if (!checkIpAddr(document.lanCfg.lan2Netmask, true))
			return false;
	}
	
	if (document.lanCfg.lanGateway.value != "")
		if (!checkIpAddr(document.lanCfg.lanGateway, false))
			return false;
	if (document.lanCfg.lanPriDns.value != "")
		if (!checkIpAddr(document.lanCfg.lanPriDns, false))
			return false;
	if (document.lanCfg.lanSecDns.value != "")
		if (!checkIpAddr(document.lanCfg.lanSecDns, false))
			return false;
	*/
	if (document.lanCfg.lanDhcpType.options.selectedIndex == 1) {
		if (!checkIpAddr(document.lanCfg.dhcpStart, false))
			return false;
			
		var startIp = document.lanCfg.dhcpStart.value;
		var startIpArrays = startIp.split(".");
		if (startIpArrays.length >= 4)
			startIpArrays[3] = 254;
		var endIp = startIpArrays[0] + "." + startIpArrays[1] + "." + startIpArrays[2] + "." + startIpArrays[3];
		document.lanCfg.dhcpEnd.value = endIp;
		
		if (!checkIpAddr(document.lanCfg.dhcpEnd, false))
			return false;
			
		if(validateGateway(document.lanCfg.lanIp.value, document.lanCfg.lanNetmask.value, document.lanCfg.dhcpStart.value)==false)
		{
		    ShowError(document.lanCfg.dhcpStart, "Router Lan DHCP SIP Out Range");
		    return false;
		}
		
		if(validateGateway(document.lanCfg.lanIp.value, document.lanCfg.lanNetmask.value, document.lanCfg.dhcpEnd.value)==false)
		{
		    ShowError(document.lanCfg.dhcpEnd, "Router Lan DHCP EIP Out Range");
		    return false;
		}	
		
		if(validateStartEndIp(document.lanCfg.lanIp.value, document.lanCfg.lanNetmask.value,
		    document.lanCfg.dhcpStart.value, document.lanCfg.dhcpEnd.value)==1)
		{
		    ShowError(document.lanCfg.dhcpEnd, "Router Lan DHCP Pool Error");
			return false;
		}
		else if(validateStartEndIp(document.lanCfg.lanIp.value, document.lanCfg.lanNetmask.value,
		    document.lanCfg.dhcpStart.value, document.lanCfg.dhcpEnd.value)==2)
		{
			ShowError(document.lanCfg.lanIp, "Router Lan DHCP Pool Conflict" );
			return false;
		}
	
		if (validateDhcpLease(document.lanCfg.dhcpLease.value)==false
			|| parseInt(document.lanCfg.dhcpLease.value) > 65535) 
		{
			ShowError(document.getElementById("dhcpLease"),"Router Lan DHCP Lease Error" );
			return false;
		}		

		
		/*	
		if (!checkIpAddr(document.lanCfg.dhcpMask, true))
			return false;
		if (document.lanCfg.dhcpPriDns.value != "")
			if (!checkIpAddr(document.lanCfg.dhcpPriDns, false))
				return false;
		if (document.lanCfg.dhcpSecDns.value != "")
			if (!checkIpAddr(document.lanCfg.dhcpSecDns, false))
				return false;
		if (!checkIpAddr(document.lanCfg.dhcpGateway, false))
			return false;
			
		if (document.lanCfg.dhcpStatic1Mac.value != "") {
			var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
			if (!re.test(document.lanCfg.dhcpStatic1Mac.value)) {
				ShowError(document.lanCfg.dhcpStatic1Mac, "Please fill the MAC Address in correct format! (XX:XX:XX:XX:XX:XX)");
				document.lanCfg.dhcpStatic1Mac.focus();
				return false;
			}
			if (!checkIpAddr(document.lanCfg.dhcpStatic1Ip, false))
				return false;
			document.lanCfg.dhcpStatic1.value = document.lanCfg.dhcpStatic1Mac.value + ';' + document.lanCfg.dhcpStatic1Ip.value;
		}
		if (document.lanCfg.dhcpStatic2Mac.value != "") {
			var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
			if (!re.test(document.lanCfg.dhcpStatic2Mac.value)) {
				ShowError(document.lanCfg.dhcpStatic2Mac, "Please fill the MAC Address in correct format! (XX:XX:XX:XX:XX:XX)");
				document.lanCfg.dhcpStatic2Mac.focus();
				return false;
			}
			if (!checkIpAddr(document.lanCfg.dhcpStatic2Ip, false))
				return false;
			document.lanCfg.dhcpStatic2.value = document.lanCfg.dhcpStatic2Mac.value + ';' + document.lanCfg.dhcpStatic2Ip.value;
		}
		if (document.lanCfg.dhcpStatic3Mac.value != "") {
			var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
			if (!re.test(document.lanCfg.dhcpStatic3Mac.value)) {
				ShowError(document.lanCfg.dhcpStatic3Mac, "Please fill the MAC Address in correct format! (XX:XX:XX:XX:XX:XX)");
				document.lanCfg.dhcpStatic3Mac.focus();
				return false;
			}
			if (!checkIpAddr(document.lanCfg.dhcpStatic3Ip, false))
				return false;
			document.lanCfg.dhcpStatic3.value = document.lanCfg.dhcpStatic3Mac.value + ';' + document.lanCfg.dhcpStatic3Ip.value;
		}
		*/
	}
	
	writeHiddenNum();
	return true;
}

function lan2_enable_switch()
{
	if (document.lanCfg.lan2enabled[1].checked == true)
	{
		document.lanCfg.lan2Ip.disabled = true;
		document.lanCfg.lan2Netmask.disabled = true;
	}
	else
	{
		document.lanCfg.lan2Ip.disabled = false;
		document.lanCfg.lan2Netmask.disabled = false;
	}
}

var oldIp;
function recIpCfg()
{
	oldIp = document.lanCfg.lanIp.value;
}


function modDhcpCfg()
{
	var i, j;
	var mask = document.lanCfg.lanNetmask.value;
	var newNet = document.lanCfg.lanIp.value;

	if (mask == "255.255.255.0")
		mask = 3;
	else if (mask == "255.255.0.0")
		mask = 2;
	else if (mask == "255.0.0.0")
		mask = 1;
	else
		return;

	for (i=0, j=0; i<oldIp.length; i++) {
		if (oldIp.charAt(i) == '.') {
			j++;
			if (j != mask)
				continue;
			oldIp = oldIp.substring(0, i);
			break;
		}
	}

	for (i=0, j=0; i<newNet.length; i++) {
		if (newNet.charAt(i) == '.') {
			j++;
			if (j != mask)
				continue;
			newNet = newNet.substring(0, i);
			break;
		}
	}

	document.lanCfg.dhcpStart.value = document.lanCfg.dhcpStart.value.replace(oldIp, newNet);
	document.lanCfg.dhcpEnd.value = document.lanCfg.dhcpEnd.value.replace(oldIp, newNet);

}
function whenblur()
{
	if(checklanip() == true)
	{
		//alert("true");
		modDhcpCfg();
	}	
	else
	{
          //alert("false");
        }
}
function checklanip()
{
	var strIp   = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$/;

	if (!(strIp.test(document.lanCfg.lanIp.value)))
	{
		return false;
	}
	return true;
}

function lan_toptip()
{
    toptip('Router Lan Sub Title');
}
function ip_address_toptip()
{
    toptip('Router Lan IP Address');
}
function subnet_mask_toptip()
{
    toptip('Router Lan Subnet Mask');
}
function lan_mac_toptip()
{
    toptip('Router Lan MAC Address');
}
function dhcp_type_toptip()
{
    toptip('Router Lan DHCP Type');
}
function dhcp_ip_pool_toptip()
{
    toptip('Router Lan DHCP Pool');
}
function dhcp_lease_time_toptip()
{
    toptip('Router Lan DHCP Lease');
}
//function upnp_toptip()
//{
//    toptip('Router Lan UPNP');
//}
</script>
</head>

<body style="overflow:scroll;overflow-x:hidden;overflow-y:hidden;" onLoad="initValue();">
	<div id="MsgLayer1" style="BORDER-RIGHT: rgb(0,0,0) 1px; BORDER-TOP: rgb(0,0,0) 1px; Z-INDEX: 888; FILTER: Alpha(opacity=90); LEFT: 500px; BACKGROUND-IMAGE: url(../img/Msg_bg.gif); VISIBILITY: hidden; BORDER-LEFT: rgb(0,0,0) 1px; WIDTH: 351px; BORDER-BOTTOM: rgb(0,0,0) 1px; BACKGROUND-REPEAT: no-repeat; POSITION: absolute; TOP: 50px; HEIGHT: 92px; moz-opacity: 0.9; opacity: 0.9" onClick="setinner('hidden')">	</div>
	<div id="MsgLayer2" style="BORDER-RIGHT: rgb(0,0,0) 1px; BORDER-TOP: rgb(0,0,0) 1px; Z-INDEX: 888; LEFT: 550px; VISIBILITY: hidden; BORDER-LEFT: rgb(0,0,0) 1px; WIDTH: 353px; BORDER-BOTTOM: rgb(0,0,0) 1px; POSITION: absolute; TOP: 100px; HEIGHT: 92px" onClick="setinner('hidden')">
		<div id="errLayer" style="Z-INDEX: 889; LEFT: 20px; WIDTH: 318px; POSITION: absolute; TOP: 10px; HEIGHT: 52px">
			<table height="48" width="320" border="0" >
				<tr>
					<td width="320" align="center"><span class="msg" id="errmsg" name="errmsg">
					</span></td>
				</tr>
			</table>
		</div>
	</div>
	<iframe id="ifr" style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; Z-INDEX: 887; FILTER: Alpha(opacity=0); LEFT: 500px; VISIBILITY: hidden; BORDER-LEFT: medium none; WIDTH: 351px; BORDER-BOTTOM: medium none; POSITION: absolute; TOP: 50px; HEIGHT: 75px; moz-opacity: 0; opacity: 0" src="about:blank"></iframe>
	<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>

<form method=post name="lanCfg" action="/goform/setLan" onSubmit="return CheckValue()">
	<input type="hidden" name="lucknum" id="lucknum"/>
	<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
		<tr align="center">
			<td valign="top">
		<table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td class="listtopic" colspan=2 id="RouterLanTitle">Hotspot--&gt;LAN</td>
            </tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>   
        </table>
        <table cellspacing="0" cellpadding="0" border="0" align="left" width="100%">
            <tr>
            	<td width="10px">&nbsp;</td>
				<td align="center" width="120" class="selectedMenu"><span id="RouterLanMenu1">&nbsp;&#8226; LAN</span></td>
                <td align="center" width="120" class="unselectedMenu">
				<a href="dhcpcliinfo.asp"><span id="RouterLanMenu2">&#8226;DHCP Clients </span></a></td>
				<td width="400px">&nbsp;</td>
            </tr>
        </table>   
        <br/><br/><br/>                      
<table width="98%" border="0" cellpadding="0" cellspacing="0">
<tr>
  <td class="title" colspan="2" id="RouterLanSubTitle" onMouseOver="lan_toptip();" onMouseOut="return nd();">LAN Interface Setup</td>
</tr>
<tr>
  <td width="22%" class="head_top" id="RouterLanIPAddress"  onMouseOver="ip_address_toptip();" onMouseOut="return nd();">IP Address</td>
  <td width="78%" class="head_top_content"><input name="lanIp" maxlength=15 value="<% getLanIp(); %>" onFocus="recIpCfg()" ></td>
</tr>
<tr>
  <td width="22%" class="head" id="RouterLanSubnetMask" onMouseOver="subnet_mask_toptip();" onMouseOut="return nd();">Subnet Mask</td>
  <td width="78%" class="head_content"><input name="lanNetmask" maxlength=15 value="<% getLanNetmask(); %>"></td>
</tr>


<tr>
  <td width="22%" class="head" id="RouterLanMACAddress" onMouseOver="lan_mac_toptip();" onMouseOut="return nd();">MAC Address</td>
  <td width="78%" class="head_content">&nbsp;<% getLanMac(); %></td>
</tr>
<tr>
  <td width="22%" class="head" id="RouterLanDHCPType" onMouseOver="dhcp_type_toptip();" onMouseOut="return nd();">DHCP Server</td>
  <td width="78%" class="head_content">
    <select name="lanDhcpType" size="1" onChange="dhcpTypeSwitch();">
      <option value="DISABLE" id="RouterLanDHCPTypeDisable">Disable</option>
      <option value="SERVER" id="RouterLanDHCPTypeServer">Enable</option>
    </select>
  </td>
</tr>
<tr id="dhcpIpPool">
  <td width="22%" class="head" id="RouterLanDHCPIpPool" onMouseOver="dhcp_ip_pool_toptip();" onMouseOut="return nd();">DHCP IP Pool</td>
  <td width="78%" class="head_content">
	<input name="dhcpStart" maxlength=15 value="<% getCfgGeneral(1, "dhcpStart"); %>">&nbsp;&nbsp;-&nbsp;&nbsp;
    <input name="dhcpEnd" maxlength=15 style="background-color:#E5E5E5" value="<% getCfgGeneral(1, "dhcpEnd"); %>" readonly>
  </td>
</tr>
<tr id="lease">
  <td width="22%" class="head" id="RouterLanDHCPLease" onMouseOver="dhcp_lease_time_toptip();" onMouseOut="return nd();">DHCP Lease Time</td>
  <td width="78%" class="head_content" ><input name="dhcpLease" id="dhcpLease" maxlength=5
             value="<% getCfgGeneral(1, "dhcpLease_hour"); %>">&nbsp;<span id="RouterLanDHCPLeaseUnit">hour(s)</span></td>
</tr>
</table>

<table width="98%" cellpadding="10" cellspacing="0">
<tr align="right">
  <td>
    <input type="submit"  class="btn" value="Apply" id="RouterLanApply" name="RouterLanApply"  onClick="TimeoutReload(20)">&nbsp;&nbsp;
    <input type="reset"  class="btn" value="Cancel" id="RouterLanCancel" onClick="window.location.reload()">
  </td>
</tr>
</table>
</td>
</tr>
</table>

</form>

</body>
</html>

