<html>
<head>
<title>Verizon Fivespot</title>
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/toptip.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/wlan.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
var MAX_RULES = 10;
var rules_num = '<% getPortForwardRuleNumsASP(); %>' ;
var rules = '<% getPortForwardRulesASP(); %>';
var ruleArray = new Array();

function isNumOnly(str)
{
	for (var i=0; i<str.length; i++){
	    if((str.charAt(i) >= '0' && str.charAt(i) <= '9') )
			continue;
		return 0;
	}
	return 1;
}

function selectApplications()
{
	var selectedApp = document.portForward.applications.value;
	var protocolSelect = document.portForward.protocol;
	var sFromPortText  = document.portForward.fromPort;
	var sToPortText  = document.portForward.toPort;
	var dToPortText  = document.portForward.destPort;
	
	if ("None" == selectedApp)
	{
		protocolSelect.value = "TCP&UDP";
		dToPortText.value = "";
		sFromPortText.value = "";
		sToPortText.value = "";
	}
	else if ("DNS" == selectedApp)
	{
		protocolSelect.value = "TCP&UDP";
		dToPortText.value = "53";
		sFromPortText.value = "53";
		sToPortText.value = "53";
	}
	else if ("HTTP" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dToPortText.value = "80";
		sFromPortText.value = "80";
		sToPortText.value = "80";
	}
	else if ("HTTPS" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dToPortText.value = "443";
		sFromPortText.value = "443";
		sToPortText.value = "443";
	}
	else if ("FTP" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dToPortText.value = "21";
		sFromPortText.value = "21";
		sToPortText.value = "21";
	}
	else if ("Email(POP3)" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dToPortText.value = "110";
		sFromPortText.value = "110";
		sToPortText.value = "110";
	}
	else if ("Email(IMAP)" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dToPortText.value = "143";
		sFromPortText.value = "143";
		sToPortText.value = "143";
	}
	else if ("Telnet" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dToPortText.value = "23";
		sFromPortText.value = "23";
		sToPortText.value = "23";
	}
	else if ("RTP" == selectedApp)
	{
		protocolSelect.value = "UDP";
		dToPortText.value = "16403";
		sFromPortText.value = "16384";
		sToPortText.value = "16403";
	}
}

function splitRulesToArray()
{
	ruleArray = rules.split(";");
}

function isRuleExist(rule)
{
	for (var i = 0; i < ruleArray.length; i++)
	{
		if (ruleArray[i] == "")
			continue;
			
		if (ruleArray[i] == rule)
		{
			return true;
		}
	}
	return false;
}

function getProtocolType(proto)
{
	var type;
	if ("TCP" == proto)
		type = "1";
	else if ("UDP" == proto)
		type = "2";
	else if ("TCP&UDP" == proto)
		type = "3";
		
	return type;
}

function isCharacterValid(value)
{
	var   reg   =   /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;   
    if (reg.test(value))
	{
      //alert('Invalid character!');   
      return   false;   
    }   
    return   true;   
}

function deleteClick()
{
	var isCheck = false;
	for (var i = 0; i < 10; i++)
	{
		//alert("delRule" + i + "  slected! [" + document.getElementById("delRule" + i) +"]");
		if (document.getElementById("delRule" + i) && document.getElementById("delRule" + i).checked)
		{
			//alert("delRule" + i + "  slected!");
			isCheck = true;
			break;
		}
	}

	if (!isCheck)
	{
		return false;
	}
	
	writeHiddenNum("lucknum_delete");
    return true;
}

function checkRange(str, num, min, max)
{
    d = atoi(str,num);
    if(d > max || d < min)
        return false;
    return true;
}

function checkIpAddr(field)
{
	if(field.value == ""){
        //alert("Error. IP address is empty.");
        //field.value = field.defaultValue;
		ShowError(field, 'ip addr empty');
        //field.focus();
        return false;
    }
	
	var fields = field.value.split('.');
	if (fields.length != 4)
	{
		ShowError(field, 'IP format error');
        return false;
	}

    if ( isAllNum(field.value) == 0) {
       // alert('It should be a [0-9] number.');
        //field.value = field.defaultValue;
		ShowError(field, 'It should be under10');
        //field.focus();
        return false;
    }

    if( (!checkRange(field.value,1,1,223)) ||
        (!checkRange(field.value,2,0,255)) ||
        (!checkRange(field.value,3,0,255)) ||
        (!checkRange(field.value,4,1,254)) ){
        //alert('IP format error.');
        //field.value = field.defaultValue;
		ShowError(field, 'IP format error');
        //field.focus();
        return false;
    }

   return true;
}


function atoi(str, num)
{
	i=1;
	if(num != 1 ){
		while (i != num && str.length != 0){
			if(str.charAt(0) == '.'){
				i++;
			}
			str = str.substring(1);
		}
	  	if(i != num )
			return -1;
	}
	
	for(i=0; i<str.length; i++){
		if(str.charAt(i) == '.'){
			str = str.substring(0, i);
			break;
		}
	}
	if(str.length == 0)
		return -1;
    if((('0' == str.charAt(0)) && (1 != str.length)))
	    return -1;
		
	return parseInt(str, 10);
}

function isAllNum(str)
{
	var LastChar='.';
	for (var i=0; i<str.length; i++)
	{
		if((str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.' ))
		{
			if( ('.' == LastChar) && ('0' == str.charAt(i)) )
			{
				if( (i!=0) && (i < str.length-1)  )
				{
					if('.' == str.charAt(i+1))
					{
					}						
					else return 0;
				}
				else return 0;
			}
			LastChar = str.charAt(i);
			continue;
		}
		return 0;
	}
	return 1;
}

function formCheck()
{
	writeHiddenNum("lucknum_forward");
	
	if(!document.portForward.portForwardEnabled.options.selectedIndex){
		// user choose disable
		return true;
	}else
	{
		if(document.getElementById("comment").value==""
		&&document.portForward.ip_address.value == ""
		&&document.portForward.destPort.value == "" 
		&&document.portForward.fromPort.value == ""
		&&document.portForward.toPort.value == "" )
			return true;
	}
	
	if(rules_num >= (MAX_RULES) ){
		alert(Get_string("The rule number is exceeded")+" "+ MAX_RULES +".");
		return false;
	}

	if( document.getElementById("comment").value == "")
	{
		ShowError(document.portForward.comment, 'Please enter comment');
		return false;
	}
	
	if (!isCharacterValid(document.getElementById("comment").value))
	{
		ShowError(document.portForward.comment, 'comment invalid character');
		return false;
	}
	
	if (checkASC(document.portForward.comment.value, "comment") == false) 
	{
		ShowError(document.portForward.comment, "WIFI Basic Invalid Err");
		return false;
	}
	
	if ( checkinvalidssid(document.portForward.comment.value) == false )
	{
		ShowError(document.portForward.comment, "WIFI KEY Char Err");
		return false;
	}

    if(document.portForward.ip_address.value == ""){
        //alert("Not set a ip address.");
        //document.portForward.ip_address.focus();
		ShowError(document.portForward.ip_address, 'Not set IP addr');
        return false;
    }

    if(! checkIpAddr(document.portForward.ip_address) ){
        //alert("IP address format error.");
        //document.portForward.ip_address.focus();
		ShowError(document.portForward.ip_address, 'IP format error');
        return false;
    }
	
    if(isAllNum(document.portForward.ip_address.value) == 0){
        //alert("Invalid ip address.");
        //document.portForward.ip_address.focus();
		ShowError(document.portForward.ip_address, 'ip not valid');
        return false;
    }
	
	if(document.portForward.destPort.value == ""){
		ShowError(document.portForward.destPort, 'Not set port');
		return false;
	}
	
	if(isNumOnly( document.portForward.destPort.value ) == 0){
		ShowError(document.portForward.destPort, 'Invalid port number');
		return false;
	}

	d1 = atoi(document.portForward.destPort.value, 1);
	if(d1 > 65535 || d1 < 1){
		ShowError(document.portForward.destPort, 'Invalid port number');
		return false;
	}

	if(document.portForward.fromPort.value == ""){
		//alert("Not set a port range.");
		//document.portForward.fromPort.focus();
		ShowError(document.portForward.fromPort, 'Not set port range');
		return false;
	}
	
	if(document.portForward.toPort.value == ""){
		ShowError(document.portForward.toPort, 'Not set port range');
		return false;
	}

	if(isNumOnly( document.portForward.fromPort.value ) == 0){
		//alert("Invalid port number.");
		//document.portForward.fromPort.focus();
		ShowError(document.portForward.fromPort, 'Invalid port number');
		return false;
	}

	d1 = atoi(document.portForward.fromPort.value, 1);
	if(d1 > 65535 || d1 < 1){
		//alert("Invalid port number!");
		//document.portForward.fromPort.focus();
		ShowError(document.portForward.fromPort, 'Invalid port number');
		return false;
	}
	
	if(document.portForward.toPort.value != ""){
		if(isAllNum( document.portForward.toPort.value ) == 0){
			//alert("Invalid port number.");
			//document.portForward.toPort.focus();
			ShowError(document.portForward.toPort, 'Invalid port number');
			return false;
		}
		d2 = atoi(document.portForward.toPort.value, 1);
		if(d2 > 65535 || d2 < 1){
			//alert("Invalid port number.");
			//document.portForward.toPort.focus();
			ShowError(document.portForward.toPort, 'Invalid port number');
			return false;
		}
		if(d1 > d2){	
			//alert("Invalid port range setting.");
			//document.portForward.fromPort.focus();
			ShowError(document.portForward.fromPort, 'Invalid port range');
			return false;
		}
   }
   
	var rule = document.portForward.ip_address.value + "," 
				+ document.portForward.fromPort.value + "," 
				+ document.portForward.toPort.value + ","
				+ getProtocolType(document.portForward.protocol.value) + ","
				+ document.portForward.comment.value + ","
				+ document.portForward.destPort.value;
	if (isRuleExist(rule))
	{
		ShowError(document.portForward.comment, 'Rule has existed');
		return false;
	}
   
   document.getElementById('forwardVirtualSrvApply').disabled = true;
   return true;
}


function display_on()
{
  if(window.XMLHttpRequest){
    return "table-row";
  } else if(window.ActiveXObject){
    return "block";
  }
}

function disableTextField (field)
{
  if(document.all || document.getElementById)
    field.disabled = true;
  else {
    field.oldOnFocus = field.onfocus;
    field.onfocus = skip;
  }
}

function enableTextField (field)
{
  if(document.all || document.getElementById)
    field.disabled = false;
  else {
    field.onfocus = field.oldOnFocus;
  }
}

function updateState()
{
    if(! rules_num ){
 		disableTextField(document.portForwardDelete.deleteSelPortForward);
 		disableTextField(document.portForwardDelete.reset);
	}else{
        enableTextField(document.portForwardDelete.deleteSelPortForward);
        enableTextField(document.portForwardDelete.reset);
	}

	if(document.portForward.portForwardEnabled.options.selectedIndex == 1){
		enableTextField(document.portForward.ip_address);
		enableTextField(document.portForward.fromPort);
		enableTextField(document.portForward.toPort);
		enableTextField(document.portForward.protocol);
		enableTextField(document.portForward.comment);
		document.getElementById("tmp1").style.display="";
		document.getElementById("ruleListDiv").style.display="";
		document.portForwardDelete.style.display="";
		
	}else{
		disableTextField(document.portForward.ip_address);
		disableTextField(document.portForward.fromPort);
		disableTextField(document.portForward.toPort);
		disableTextField(document.portForward.protocol);
		disableTextField(document.portForward.comment);
		document.getElementById("tmp1").style.display="none";
		document.getElementById("ruleListDiv").style.display="none";
		document.portForwardDelete.style.display="none";
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

function initPage()
{
	check_active_state();
	updateState();
	splitRulesToArray();
}

</script>
</head>


<body style="overflow-x:hidden" onLoad="initPage();">
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
    
<form method=post name="portForward" action=/goform/portForward onSubmit="return formCheck()">
		<input type="hidden" name="lucknum_forward" id="lucknum_forward"/>
		<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
		<tr align="center">
			<td valign="top">
		<table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td id="forwardTitle" name="forwardTitle" class="listtopic" colspan=2>Firewall--&gt;Port Forwarding</td>
            </tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>                                                       
        </table>
		<table cellspacing="0" cellpadding="0" border="0" align="left" width="100%">
            <tr>
            	<td width="10px">&nbsp;</td>
				<td align="center" width="180" class="unselectedMenu"><a href="port_filtering.asp"><span name="firewallTitlePortFilter" id="firewallTitlePortFilter">&#8226; MAC/IP/Port Filtering</span></a></td>
                <td align="center" width="180" class="selectedMenu"><span name="firewallTitlePortForward" id="firewallTitlePortForward" >&#8226;Port Forwarding</span></td>
                <td align="center" width="180" class="unselectedMenu"><a href="system_firewall.asp"><span name="firewallTitleSys" id="firewallTitleSys">&#8226;System Security</span></a></td>
				<td width="400px">&nbsp;</td>
            </tr>
        </table>   
        <br/><br/><br/>
<table width="96%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td class="title" colspan="2" id="forwardVirtualSrv" onMouseOver="PORT_FORWAR_toptip();" onMouseOut="return nd();">Virtual Server Settings (The maximum rule count is 10)</td>
</tr>
<tr>
	<td class="head_top" id="forwardVirtualSrvSet"  width="40%">Virtual Server Settings</td>
	<td class="head_top_content" width="60%">
	<select onChange="updateState()" name="portForwardEnabled">
	<option id="forwardVirtualSrvDisable" value=0 <% getPortForwardEnableASP(0); %> >Disable</option>
    <option id="forwardVirtualSrvEnable" value=1 <% getPortForwardEnableASP(1); %> >Enable</option>
    </select>
    </td>
</tr>
</table>

<table width="96%" border="0" cellspacing="0" cellpadding="10" name="tmp1" id ="tmp1">
<tr>
	<td class="head" id="forwardVirtualSrvIPAddr" width="40%">IP Address&nbsp;:&nbsp;Port</td>
	<td class="head_content" >
  		<input type="text" size="16" name="ip_address">&nbsp;:&nbsp;<input type="text" size="5" name="destPort"><span id="port_forward_IP">&nbsp;( XXX.XXX.XXX.XXX, eg: 192.168.0.100 : 80)</span>
	</td>
</tr>

<tr>
	<td class="head">Applications</td>
	<td class="head_content">
    	<select onChange="selectApplications()" name="applications" id="applications">
			<option value="None" selected>None</option>
			<option value="DNS">DNS</option>
			<option value="HTTP">HTTP</option>
			<option value="HTTPS">HTTPS</option>
            <option value="FTP">FTP</option>
            <option value="Email(POP3)">Email(POP3)</option>
            <option value="Email(IMAP)">Email(IMAP)</option>
            <option value="Telnet">Telnet</option>
            <option value="RTP">RTP</option>
		</select>
	</td>
</tr>

<tr>
	<td class="head" id="forwardVirtualSrvPortRange">Dest Port Range</td>
	<td class="head_content">
  		<input type="text" size="5" name="fromPort">-<input type="text" size="5" name="toPort"> &nbsp;&nbsp;&nbsp;( 1~65535)
	</td>
</tr>

<tr>
	<td class="head" id="forwardVirtualSrvProtocol">
		Protocol
	</td>
	<td class="head_content">
		<select name="protocol">
   		<option select value="TCP&UDP">TCP+UDP</option>
		<option value="TCP">TCP</option>
   		<option value="UDP">UDP</option>
   		</select>&nbsp;&nbsp;
	</td>
</tr>

<tr>
	<td class="head" id="forwardVirtualSrvComment">
		Comment
	</td>
	<td class="head_content">
		<input type="text" name="comment" id= "comment" size="16" maxlength="32">
	</td>
</tr>
</table> 

<br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
  <tr align="right">
    <td>
	<input class="btn" type="submit" value="Apply" id="forwardVirtualSrvApply" name="forwardVirtualSrvApply">
    </td>
  </tr>
</table>

</form>

<br>

<div id="ruleListDiv" name="ruleListDiv">
<form action=/goform/portForwardDelete method=POST name="portForwardDelete" id="portForwardDelete">
<input type="hidden" name="lucknum_delete" id="lucknum_delete"/>
<table cellSpacing=0 cellPadding=10 width="96%" border="0">
	<tr>
		<td class="title" colspan="5" id="forwardCurrentVirtualSrv">Current Virtual Servers in System: </td>
	</tr>

	<tr>
		<td id="forwardCurrentVirtualSrvNo" class="head_top" align="center"> No. 1 - 10</td>
		<td align=center id="forwardCurrentVirtualSrvIP" class="head_top"> IP Address : Port</td>
		<td align=center id="forwardCurrentVirtualSrvPort" class="head_top"> Dest Port Range</td>
		<td align=center id="forwardCurrentVirtualSrvProtocol" class="head_top"> Protocol</td>
		<td align=center id="forwardCurrentVirtualSrvComment" class="head_top"> Comment</td>
	</tr>

	<% showPortForwardRulesASP(); %>
</table>
<br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
  <tr align="right">
    <td>
<input class="btn" type="submit" value="Delete" id="forwardCurrentVirtualSrvDel" name="deleteSelPortForward" onClick="return deleteClick()">&nbsp;&nbsp;
<input class="btn" type="reset" value="Reset" id="forwardCurrentVirtualSrvReset" name="reset"/>
	</td>
  </tr>
</table>
</form>
</div>

</body>
</html>
