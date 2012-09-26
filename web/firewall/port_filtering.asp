<html>
<head>
<title>Verizon Fivespot</title>
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/toptip.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/wlan.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
var MAX_RULES = 10;

var secs;
var timerID = null;
var timerRunning = false;
var timeout = 3;
var delay = 1000;

var rules_num = '<% getIPPortRuleNumsASP(); %>';
var rules = '<% getIPPortRulesASP(); %>';
var ruleArray = new Array();

function selectApplications()
{
	var selectedApp = document.ipportFilter.applications.value;
	var protocolSelect = document.ipportFilter.protocol;
	var dFromPortText  = document.ipportFilter.dFromPort;
	var dToPortText  = document.ipportFilter.dToPort;
	var sFromPortText  = document.ipportFilter.sFromPort;
	var sToPortText  = document.ipportFilter.sToPort;
	
	if ("None" == selectedApp)
	{
		dFromPortText.disabled = true;
		dToPortText.disabled   = true;
		sFromPortText.disabled = true;
		sToPortText.disabled   = true;
	}
	else
	{
		dFromPortText.disabled = false;
		dToPortText.disabled   = false;
		sFromPortText.disabled = false;
		sToPortText.disabled   = false;
	}
	
	if ("None" == selectedApp)
	{
		protocolSelect.value = "None";
		dFromPortText.value = "";
		dToPortText.value = "";
		sFromPortText.value = "";
		sToPortText.value = "";
	}
	else if ("DNS" == selectedApp)
	{
		protocolSelect.value = "TCP&UDP";
		dFromPortText.value = "53";
		dToPortText.value = "53";
		//sFromPortText.value = "53";
		//sToPortText.value = "53";
	}
	else if ("HTTP" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dFromPortText.value = "80";
		dToPortText.value = "80";
		//sFromPortText.value = "80";
		//sToPortText.value = "80";
	}
	else if ("HTTPS" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dFromPortText.value = "443";
		dToPortText.value = "443";
		//sFromPortText.value = "443";
		//sToPortText.value = "443";
	}
	else if ("FTP" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dFromPortText.value = "21";
		dToPortText.value = "21";
		//sFromPortText.value = "21";
		//sToPortText.value = "21";
	}
	else if ("Email(POP3)" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dFromPortText.value = "110";
		dToPortText.value = "110";
		//sFromPortText.value = "110";
		//sToPortText.value = "110";
	}
	else if ("Email(IMAP)" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dFromPortText.value = "143";
		dToPortText.value = "143";
		//sFromPortText.value = "143";
		//sToPortText.value = "143";
	}
	else if ("Telnet" == selectedApp)
	{
		protocolSelect.value = "TCP";
		dFromPortText.value = "23";
		dToPortText.value = "23";
		//sFromPortText.value = "23";
		//sToPortText.value = "23";
	}
	else if ("RTP" == selectedApp)
	{
		protocolSelect.value = "UDP";
		dFromPortText.value = "16384";
		dToPortText.value = "16403";
		//sFromPortText.value = "16384";
		//sToPortText.value = "16403";
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
	else if ("None" == proto)
		type = "5";
	else if ("ICMP" == proto)
		type = "4";
		
	return type;
}

function getActionType(action)
{
	var type;
	if ("Accept" == action)
		type = "1";
	else if ("Drop" == action)
		type = "0";
		
	return type;
}

function getIpAddress(ip)
{
	if (ip == "")
		return "any/0";
	else
		return ip;
}

function getPort(port)
{
	if (port == "")
		return "0";
	else
		return port;
}

function isCharacterValid(value)
{
	var   reg   =   /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;   
    if (reg.test(value))
	{
      return   false;   
    }   
    return   true;   
}

function InitializeTimer(){
	secs = timeout
	StopTheClock()
	StartTheTimer()
}

function StopTheClock(){
	if(timerRunning)
		clearTimeout(timerID)
	timerRunning = false
}

function StartTheTimer(){
	if (secs==0){
		StopTheClock()

		timerHandler();

		secs = timeout
		StartTheTimer()
    }else{
		self.status = secs
		secs = secs - 1
		timerRunning = true
		timerID = self.setTimeout("StartTheTimer()", delay)
	}
}

var http_request = false;
function makeRequest(url, content) {
    http_request = false;
    if (window.XMLHttpRequest) {
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) {
            http_request.overrideMimeType('text/xml');
        }
    } else if (window.ActiveXObject) { 
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
            http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }
    if (!http_request) {
        alert('Giving up :( Cannot create an XMLHTTP instance');
        return false;
    }
    http_request.onreadystatechange = alertContents;
    http_request.open('POST', url, true);
    http_request.send(content);
}

function alertContents() {
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			updatePacketCount( http_request.responseText);
		} else {
		}
	}
}

function updatePacketCount(str){
	var pc = new Array();
	pc = str.split(" ");
	for(i=0; i < pc.length; i++){
		e = document.getElementById("pktCnt" + i);
		e.innerHTML = pc[i];
	}
}

function timerHandler(){
	//makeRequest("/goform/getRulesPacketCount", "n/a");
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
	if(field.value == "")
		return false;

	if (isAllNumAndSlash(field.value) == 0){
		return false;
	}
	
	var fields = field.value.split('.');
	if (fields.length != 4)
	{
        return false;
	}

	var ip_pair = new Array();
	ip_pair = field.value.split("/");

	if(ip_pair.length > 2){
		return false;
	}

	if(ip_pair.length == 2){
		// sub mask
		if(!ip_pair[1].length)
			return false;
		if(!isNumOnly(ip_pair[1])){
			return false;
		}
		tmp = parseInt(ip_pair[1], 10);
		if(tmp < 0 || tmp > 32){
			return false;
		}
	}

    if( (!checkRange(ip_pair[0],1,1,223)) ||
		(!checkRange(ip_pair[0],2,0,255)) ||
		(!checkRange(ip_pair[0],3,0,255)) ||
		(!checkRange(ip_pair[0],4,1,254)) ){
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

function isAllNumAndSlash(str)
{
	for (var i=0; i<str.length; i++){
	    if( (str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.') || (str.charAt(i) == '/'))
			continue;
		return 0;
	}
	return 1;
}



function isNumOnly(str)
{
	for (var i=0; i<str.length; i++){
	    if((str.charAt(i) >= '0' && str.charAt(i) <= '9') )
			continue;
		return 0;
	}
	return 1;
}

function formCheck()
{
	document.getElementById('portBasicApply').disabled = true;
	writeHiddenNum("lucknum_basic");
	return true;
}


function zte_validateMac(val,which){
   var i;
   var sval=String(val);
	
	if (sval.length == 0)
	{
		//alert("MAC address can\'t be null!");	
		//ShowError(document.getElementById(which),"MAC address can\'t be null!" );
		return false;
	}

   if (sval.length>0 && sval.length!=17)
   {  
	   //alert('Invalid Length!');
	   //ShowError(document.getElementById(which),"Invalid Length!" );
      return false;
   }

   for (i=0; i<sval.length; i++)
   {  if ((i % 3)==2)
      {  if (sval.charAt(i)!=':')
         {  //alert('Invalid Format at position '+(i+1)+'! Must be xx:xx:xx:xx:xx:xx.');
			 //ShowError(document.getElementById(which),'Invalid Format at position '+(i+1)+'! Must be xx:xx:xx:xx:xx:xx.');
            return false;
         }
      }
      else if (!((sval.charAt(i)>='0' && sval.charAt(i)<='9') ||
                (sval.charAt(i)>='A' && sval.charAt(i)<='F')  ||
                (sval.charAt(i)>='a' && sval.charAt(i)<='f')))
      {  
         //alert('Invalid Character['+sval.charAt(i)+'] at Position '+(i+1)+'! Must be 0123456789ABCDEFabcdef.');
		 //ShowError(document.getElementById(which),'Invalid Character! It Must be 0123456789ABCDEFabcdef.' );
         return false;
      }
   }
   var sub1=val.substring(0,2);
   var sub2=val.substring(3,5);
   var sub3=val.substring(6,8);
   var sub4=val.substring(9,11);
   var sub5=val.substring(12,14);
   var sub6=val.substring(15);

   if (sub1=='ff' && sub2=='ff' && sub3=='ff' && sub4=='ff' && sub5=='ff' && sub6=='ff')
   {
	//alert('Invalid MAC address, it is a broadcast address.');
	//ShowError(document.getElementById(which),'Invalid MAC address, it is a broadcast address.' );
	return false;
   }
   if (sub1=='00' && sub2=='00' && sub3=='00' && sub4=='00' && sub5=='00' && sub6=='00')
   {
	//alert('Invalid MAC address, it is a null address.');
	//ShowError(document.getElementById(which),'Invalid MAC address, it is a null address.' );
	return false;
   }
   sub1='0x'+sub1;
   if((sub1 & 1)==1)
   {
	//alert('Invalid MAC address, it is a mutlicast address.');
	//ShowError(document.getElementById(which),'Invalid MAC address, it is a mutlicast address.');
	return false;
   }
   return true;
}

function ipportFormCheck()
{
	writeHiddenNum("lucknum_filter");
	
	if( document.BasicSettings.portFilterEnabled.options.selectedIndex == 0)
	{
		return true;
	}

	if(rules_num >= (MAX_RULES) ){
		alert(Get_string("The rule number is exceeded")+" "+ MAX_RULES +".");
		return false;
	}

	if( document.getElementById("sip_address").value == "" && 
		document.getElementById("dip_address").value == "" &&
		document.getElementById("sFromPort").value == "" &&
		document.getElementById("dFromPort").value == "" &&
		document.getElementById("mac_address").value == ""){
		//alert("Please input any IP or/and port value.");
		ShowError(document.ipportFilter.mac_address, 'Please enter IP MAC');
		return false;
	}
	
	if( document.getElementById("comment").value == "")
	{
		ShowError(document.ipportFilter.comment, 'Please enter comment');
		return false;
	}
	
	if (!isCharacterValid(document.ipportFilter.comment.value))
	{
		ShowError(document.ipportFilter.comment, 'comment invalid character');
		return false;
	}
	
	if (checkASC(document.ipportFilter.comment.value, "comment") == false) 
	{
		ShowError(document.ipportFilter.comment, "WIFI Basic Invalid Err");
		return false;
	}
	
	if ( checkinvalidssid(document.ipportFilter.comment.value) == false )
	{
		ShowError(document.ipportFilter.comment, "WIFI KEY Char Err");
		return false;
	}

	if (zte_validateMac(document.ipportFilter.mac_address.value,document.ipportFilter.mac_address) == false
	&& document.ipportFilter.mac_address.value != "")
		{
			   // document.filter_form.elements[i].focus();
			   ShowError(document.ipportFilter.mac_address,"Invalid MAC addr");
				return false;
		}
		
	document.ipportFilter.mac_address.value = document.ipportFilter.mac_address.value.toUpperCase();
		
	if(document.ipportFilter.sip_address.value != ""){
		if(! checkIpAddr(document.ipportFilter.sip_address) ){
			ShowError(document.ipportFilter.sip_address, 'IP format error');
			return false;
		}
    }
	
	if(document.ipportFilter.dip_address.value != ""){
		if(! checkIpAddr(document.ipportFilter.dip_address) ){
			ShowError(document.ipportFilter.dip_address, 'IP format error');
			return false;
		}
    }
		
	var protocol = document.ipportFilter.protocol.value;
	/*
	if ("TCP" == protocol || "UDP" == protocol)
	{
		
		if (document.ipportFilter.dFromPort.value == "")
		{
			ShowError(document.ipportFilter.dFromPort, 'Not set port range');
			return false;
		}
		if (document.ipportFilter.dToPort.value == "")
		{
			ShowError(document.ipportFilter.dToPort, 'Not set port range');
			return false;
		}
		
		if (document.ipportFilter.sFromPort.value == "")
		{
			ShowError(document.ipportFilter.sFromPort, 'Not set port range');
			return false;
		}
		if (document.ipportFilter.sToPort.value == "")
		{
			ShowError(document.ipportFilter.sToPort, 'Not set port range');
			return false;
		}
	}
	*/
					
	if(document.ipportFilter.sFromPort.value != ""){
		if(isNumOnly( document.ipportFilter.sFromPort.value ) == 0){
			//alert("Invalid port number: source port.");
			ShowError(document.ipportFilter.sFromPort, 'Invalid source port');
			//document.ipportFilter.sFromPort.focus();
			return false;
		}
		d1 = atoi(document.ipportFilter.sFromPort.value, 1);
		if(d1 > 65535 || d1 < 1){
			//alert("Invalid port number: source port.");
			ShowError(document.ipportFilter.sFromPort, 'Invalid source port');
			//document.ipportFilter.sFromPort.focus();
			return false;
		}
		
		if(document.ipportFilter.sToPort.value == "")
		{
			ShowError(document.ipportFilter.sToPort, 'Not set port range');
			return false;
		}
		
		if(document.ipportFilter.sToPort.value != ""){
			if(isNumOnly( document.ipportFilter.sToPort.value ) == 0){
				//alert("Invalid port number: source port.");
				ShowError(document.ipportFilter.sToPort, 'Invalid source port');
				return false;
			}		
			d2 = atoi(document.ipportFilter.sToPort.value, 1);
			if(d2 > 65535 || d2 < 1){
				//alert("Invalid source port number.");
				ShowError(document.ipportFilter.sToPort, 'Invalid source port');
				return false;
			}
			if(d1 > d2){
			//alert("Invalid source port range setting.");
			ShowError(document.ipportFilter.sToPort, 'Invalid source port range');
			return false;
			}
		}
	}

	if(document.ipportFilter.dFromPort.value != ""){
		if(isNumOnly( document.ipportFilter.dFromPort.value ) == 0){
			//alert("Invalid port number: dest port.");
			ShowError(document.ipportFilter.dFromPort, 'Invalid dest port');
			return false;
		}
		d1 = atoi(document.ipportFilter.dFromPort.value, 1);
		if(d1 > 65535 || d1 < 1){
			//alert("Invalid port number: dest port.");
			ShowError(document.ipportFilter.dFromPort, 'Invalid dest port');
			return false;
		}
		
		if(document.ipportFilter.dToPort.value == "")
		{
			ShowError(document.ipportFilter.dToPort, 'Not set port range');
			return false;
		}
		
		if(document.ipportFilter.dToPort.value != ""){
			if(isNumOnly( document.ipportFilter.dToPort.value ) == 0){
				//alert("Invalid port number: dest port.");
				ShowError(document.ipportFilter.dToPort, 'Invalid dest port');
				return false;
			}		
			d2 = atoi(document.ipportFilter.dToPort.value, 1);
			if(d2 > 65535 || d2 < 1){
				//alert("Invalid dest port number.");
				ShowError(document.ipportFilter.dToPort, 'Invalid dest port');
				return false;
			}
			if(d1 > d2){
			//alert("Invalid dest port range setting.");
			ShowError(document.ipportFilter.dToPort, 'Invalid dest port range');
			return false;
			}
		}
	}
	
	var rule = getIpAddress(document.ipportFilter.sip_address.value) + ",0," 
				+ getPort(document.ipportFilter.sFromPort.value) + "," 
				+ getPort(document.ipportFilter.sToPort.value) + ","
				+ getIpAddress(document.ipportFilter.dip_address.value) + ",0,"
				+ getPort(document.ipportFilter.dFromPort.value) + "," 
				+ getPort(document.ipportFilter.dToPort.value) + ","
				+ getProtocolType(document.ipportFilter.protocol.value) + ","
				+ getActionType(document.ipportFilter.action.value) + ","
				+ document.ipportFilter.comment.value + ","
				+ document.ipportFilter.mac_address.value;
	if (isRuleExist(rule))
	{
		ShowError(document.ipportFilter.comment, 'Rule has existed');
		return false;
	}
	
	document.getElementById('portFilterApply').disabled = true;
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

function defaultPolicyChanged()
{
	if( document.BasicSettings.defaultFirewallPolicy.options.selectedIndex == 0){
		document.ipportFilter.action.options.selectedIndex = 0;
	}else
		document.ipportFilter.action.options.selectedIndex = 1;
}
	
function updateState()
{
    if(! rules_num ){
 		disableTextField(document.ipportFilterDelete.deleteSelFilterPort);
 		disableTextField(document.ipportFilterDelete.reset);
	}else{
        enableTextField(document.ipportFilterDelete.deleteSelFilterPort);
        enableTextField(document.ipportFilterDelete.reset);
	}
	

	if( document.BasicSettings.defaultFirewallPolicy.options.selectedIndex == 0){
		document.ipportFilter.action.options.selectedIndex = 0;
	}else
	{
		document.ipportFilter.action.options.selectedIndex = 1;
		}

	protocolChange();

		if( document.BasicSettings.portFilterEnabled.options.selectedIndex == 1)
		{
			document.ipportFilter.style.display="";
			document.ipportFilterDelete.style.display="";
			//document.BasicSettings.defaultFirewallPolicy.disabled= false;
			document.getElementById("tmp1").style.display="";
			
		}
		else
		{
			document.ipportFilter.style.display="none";
			document.ipportFilterDelete.style.display="none";
			//document.BasicSettings.defaultFirewallPolicy.disabled= true;
			document.getElementById("tmp1").style.display="none";
			
		}
}

function actionChanged()
{
	if( document.BasicSettings.defaultFirewallPolicy.options.selectedIndex != 
		document.ipportFilter.action.options.selectedIndex)
		{
			//alert(Get_string("rule same with default") + " ");
		}
}

function protocolChange()
{
	if( document.ipportFilter.protocol.options.selectedIndex == 1 ||
		document.ipportFilter.protocol.options.selectedIndex == 2 ||
		document.ipportFilter.protocol.options.selectedIndex == 3){
		document.ipportFilter.dFromPort.disabled = false;
		document.ipportFilter.dFromPort.value = 1;
		document.ipportFilter.dToPort.disabled = false;
		document.ipportFilter.dToPort.value = 65535;
		document.ipportFilter.sFromPort.disabled = false;
		document.ipportFilter.sFromPort.value = 1;
		document.ipportFilter.sToPort.disabled = false;
		document.ipportFilter.sToPort.value = 65535;
	}else{
		document.ipportFilter.dFromPort.disabled = true;
		document.ipportFilter.dToPort.disabled = true;
		document.ipportFilter.sFromPort.disabled = true;
		document.ipportFilter.sToPort.disabled = true;

		document.ipportFilter.dFromPort.value = "";
			document.ipportFilter.dToPort.value = "";
			document.ipportFilter.sFromPort.value = "";
			document.ipportFilter.sToPort.value = "";
	}
}

function resetItems()
{
	document.ipportFilter.dFromPort.disabled = true;
	document.ipportFilter.dToPort.disabled = true;
	document.ipportFilter.sFromPort.disabled = true;
	document.ipportFilter.sToPort.disabled = true;
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
    
<form method="post" name="BasicSettings" action="/goform/BasicSettings" onSubmit="return formCheck()">
	<input type="hidden" name="lucknum_basic" id="lucknum_basic"/>
	<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
		<tr align="center">
			<td valign="top">
		<table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td name="portTitle" id="portTitle" class="listtopic" colspan=2>Firewall--&gt;MAC/IP/Port Filtering</td>
            </tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>                                                              
        </table>
        <table cellspacing="0" cellpadding="0" border="0" align="left" width="100%">
            <tr>
            	<td width="10px">&nbsp;</td>
				<td align="center" width="180" class="selectedMenu"><span name="firewallTitlePortFilter" id="firewallTitlePortFilter">&#8226; MAC/IP/Port Filtering</span></td>
                <td align="center" width="180" class="unselectedMenu">
				<a href="port_forward.asp"><span name="firewallTitlePortForward" id="firewallTitlePortForward" >&#8226;Port Forwarding</span></a></td>
                <td align="center" width="180" class="unselectedMenu">
				<a href="system_firewall.asp"><span name="firewallTitleSys" id="firewallTitleSys">&#8226;System Security</span></a></td>
				<td width="400px">&nbsp;</td>
            </tr>
        </table>   
        <br/><br/><br/>
<table width="96%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td class="title" colspan="2" id="portBasicSet" onMouseOver="MAC_IP_PORT_filter_toptip();" onMouseOut="return nd();">Basic Settings</td>
</tr>
<tr>
	<td class="head_top" id="portBasicFilter"  width="40%">
		MAC/IP/Port Filtering
	</td>
	<td class="head_top_content" width="60%">
	<select onChange="updateState()" name="portFilterEnabled" style="width:80px">
	<option id="portBasicDisable" value=0 <% getIPPortFilterEnableASP(0); %> >Disable</option>
    <option id="portBasicEnable" value=1 <% getIPPortFilterEnableASP(1); %> >Enable</option>
    </select>
    </td>
</tr>

<tr name = "tmp1" id="tmp1">
	<td class="head" id="portBasicDefaultPolicy">
		Default Policy -- The packet that doesn't match with any rules would be:
	</td>
	<td class="head_content">
		<select onChange="defaultPolicyChanged()" name="defaultFirewallPolicy" style="width:80px">
		<option id="portBasicDefaultPolicyAccept" value=0 <% getDefaultFirewallPolicyASP(0); %> >Accepted</option>
		<option id="portBasicDefaultPolicyDrop" value=1 <% getDefaultFirewallPolicyASP(1); %> >Dropped</option>
		</select>
	</td>
</tr>
</table>
<br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
  <tr align="right">
    <td>
	<input class="btn" type="submit" value="Apply" id="portBasicApply" name="portBasicApply">
    </td>
  </tr>
</table>

</form>

<form method="post" name="ipportFilter" action="/goform/ipportFilter" onSubmit="return ipportFormCheck()">
<input type="hidden" name="lucknum_filter" id="lucknum_filter"/>
<table cellSpacing="0" cellPadding="0" width="96%" border="0">
<tr>
	<td class="title" colspan="4" id="portFilterSet">MAC/IP/Port Filter Settings (The maximum rule count is 10)</td>
</tr>
<tr>
	<td class="head_top" colspan="2" id="portFilterMac" width="40%">
		MAC Address
	</td>
	<td colspan="2" class="head_top_content" width="60%">
		 <input id="mac_address" name="mac_address" type="text" size="18" > 
		 <span id="example_MAC">&nbsp;(XX:XX:XX:XX:XX:XX,&nbsp;&nbsp;eg:&nbsp;00:1E:90:FF:FF:FF)</span>	</td>
</tr>

<tr>
	<td class="head" colspan="2" id="portFilterDIPAddr">
		Dest IP Address
	</td>
	<td colspan="2" class="head_content">
		<input type="text" size="16" name="dip_address" id="dip_address">
		<span id="example_IP">&nbsp;( XXX.XXX.XXX.XXX, eg: 192.168.5.101)</span>
	</td>
</tr>

<tr>
	<td class="head" colspan="2" id="portFilterSIPAddr">
		Source IP Address
	</td>
	<td colspan="2" class="head_content">
  		<input type="text" size="16" name="sip_address" id="sip_address">
	</td>
</tr>

<tr>
	<td class="head" colspan="2">Applications</td>
	<td colspan="2" class="head_content">
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
	<td class="head" colspan="2" id="portFilterProtocol">
		Protocol
	</td>
	<td colspan="2" class="head_content">
		<select onChange="protocolChange()" name="protocol" id="procotol">
		<option value="None">None</option>
		<option value="TCP">TCP</option>
		<option value="UDP">UDP</option>
        <option select value="TCP&UDP">TCP+UDP</option>
		<option value="ICMP">ICMP</option>
		</select>&nbsp;&nbsp;
	</td>
</tr>

<tr>
	<td class="head" colspan="2" id="portFilterDPortRange">
		Dest Port Range
	</td>
	<td colspan="2"  class="head_content">
  		<input type="text" size="5" name="dFromPort" id="dFromPort">-
		<input type="text" size="5" name="dToPort" id="dToPort">&nbsp;( 1~65535)
	</td>
</tr>


<tr>
	<td class="head" colspan="2" id="portFilterSPortRange">
		Source Port Range
	</td>
	<td colspan="2" class="head_content">
  		<input type="text" size="5" name="sFromPort" id="sFromPort">-
		<input type="text" size="5" name="sToPort" id="sToPort">&nbsp;( 1~65535)
	</td>
</tr>

<tr>
	<td class="head" colspan="2" id="portFilterAction">
		Action
	</td>
	<td colspan="2" class="head_content">
		<select onChange="actionChanged()" name="action">
   		<option value="Drop" id="portFilterActionDrop">Drop</option>
		<option value="Accept" id="portFilterActionAccept">Accept</option>
   		</select>
	</td>
</tr>

<tr>
	<td class="head" colspan="2" id="portFilterComment">
		Comment
	</td>
	<td colspan="2" class="head_content">
		<input type="text" name="comment" id="comment" size="16" maxlength="32">
	</td>
</tr>
</table>
<br/>

<table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
  <tr align="right">
    <td>
	<input class="btn" type="submit" value="Apply" id="portFilterApply" name="portFilterApply"> &nbsp;&nbsp;
	<input class="btn" type="reset" value="Reset" id="portFilterReset" name="reset" onClick="resetItems()">
    </td>
  </tr>
</table>

</form>

<br>

<form action="/goform/ipportFilterDelete" method="POST" name="ipportFilterDelete">
<input type="hidden" name="lucknum_delete" id="lucknum_delete"/>
<table cellSpacing=0 cellPadding=10 width="96%" border=0>
	<tr>
		<td class="title" colspan="9" id="portCurrentFilter">Current MAC/IP/Port filtering rules in system: </td>
	</tr>

	<tr>
		<td id="portCurrentFilterNo" class="head_top" align="center"> No. 1 - 10</td>
		<td align=center id="portCurrentFilterMac" class="head_top"> MAC Address </td>
		<td align=center id="portCurrentFilterDIP" class="head_top"> Dest IP Address </td>
		<td align=center id="portCurrentFilterSIP" class="head_top"> Source IP Address </td>
		<td align=center id="portCurrentFilterProtocol" class="head_top"> Protocol</td>
		<td align=center id="portCurrentFilterDPort" class="head_top"> Dest Port Range</td>
		<td align=center id="portCurrentFilterSPort" class="head_top"> Source Port Range</td>
		<td align=center id="portCurrentFilterAction" class="head_top"> Action</td>
		<td align=center id="portCurrentFilterComment" class="head_top"> Comment</td>
	</tr>

	<% showIPPortFilterRulesASP(); %>
</table>
<br>

<table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
  <tr align="right">
    <td>
<input class="btn" type="submit" value="Delete" id="portCurrentFilterDel" name="deleteSelFilterPort" onClick="return deleteClick()">&nbsp;&nbsp;
<input class="btn" type="reset" value="Reset" id="portCurrentFilterReset" name="reset">    </td>
  </tr>
</table>


</form>


</body>
</html>
