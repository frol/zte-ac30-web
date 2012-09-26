<html>
<head>
<title>Verizon Fivespot</title>
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0"> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="style/normal_ws.css" type="text/css">
<script language="JavaScript" src="js/prompt.js"></script>
<script language="JavaScript" src="js/utils.js"></script>
<script language="JavaScript" src="js/spec.js"></script>
<script language="JavaScript" src="js/validate.js"></script>
<script language="JavaScript" src="js/wlan.js"></script>
<script language="JavaScript" src="js/toptip.js"></script>
<script language="JavaScript" src="js/overlib.js"></script>
<script language="JavaScript" src="js/lang.js" type=text/JavaScript></script>
<script language="JavaScript" src="js/protect.js"></script>             
<script language="JavaScript" src="js/active.js"></script>
<script language="JavaScript">
Butterlate.setTextDomain("wizard");

lastPage='C1';

function switchPage(c, n) {
  	if (getStyle(c) && getStyle(n)) {
		lastPage=c;
		setStyle(c, "hidden");
		setStyle(n, "visible");
	}
}
function apn_sel()
{
	document.getElementById('apn_input').style.display = "none";
	if(document.APN.zapn_select[1].checked)
	{
		document.getElementById('apn_input').style.display = "";
	}
  
}
function info_apn_control()
{
	document.getElementById('apn_manual').style.display = "none";
	if(document.APN.zapn_select[1].checked)
	{
		document.getElementById('apn_manual').style.display = "";
	}
}

///========================================================
function parsestr(str){
var   result=str.split('($)');
var arr = new Array();
for(var i=0;i<result.length;i++){
	arr[i]=result[i];
}

return arr;
}

	var apn0 = '<% asp_get("APN_config0"); %>';
	var apn1 = '<% asp_get("APN_config1"); %>';
	var apn2 = '<% asp_get("APN_config2"); %>';
	var apn3 = '<% asp_get("APN_config3"); %>';
	var apn4 = '<% asp_get("APN_config4"); %>';
	var apn5 = '<% asp_get("APN_config5"); %>';
	var apn6 = '<% asp_get("APN_config6"); %>';
	var apn7 = '<% asp_get("APN_config7"); %>';
	var apn8 = '<% asp_get("APN_config8"); %>';
	var apn9 = '<% asp_get("APN_config9"); %>';
	
	var array_obj = new Array();
	var apn_index= '<% asp_get("Current_index"); %>';
	var apn_default='apn'+apn_index;
	var apn_obj = eval(apn_default);

	array_obj=parsestr(apn_obj);
	//alert("array_obj="+array_obj);
	var profile_name=array_obj[0];
	var apn_select=array_obj[2];
	var apn_gno=array_obj[1];
	var dial_no=array_obj[3];
	var ppp_auth_mod=array_obj[4];
	var ppp_auth_name=array_obj[5];
	var ppp_auth_pswd=array_obj[6];
	//alert("apn_index="+apn_index);
	//alert("array_obj[0]="+array_obj[0]);
	//alert("profile_name="+profile_name);


///========================================================
	var broadcastssidEnable  = 'Disabled';//'<% getCfgZero(1, "HideSSID"); %>';
	var broadcast =	'<% asp_get("HideSSID"); %>';
	if(broadcast == 0)
	{
//		var broadcastssidEnable='enable';
		var broadcastssidEnable='Disabled';
	}
	else
	{
	    var broadcastssidEnable='Enabled';
//		var broadcastssidEnable='disable';
	}

addCfg("zssid_name",8,'<% asp_get("SSID1"); %>');
addCfg("zBroadcast",9,broadcastssidEnable);
addCfg("zencryption_mode",10,'<% asp_get("AuthMode"); %>');

addCfg("zencryption_WPA",11,'<% asp_get("EncrypType"); %>');
addCfg("zWPA_KEY",12,'<% asp_get("WPAPSK1"); %>');
addCfg("zNetwork_Key",14,'<% asp_get("Key1Str1"); %>');
addCfg("zWEP1Select",15,'<% asp_get("Key1Type"); %>');
addCfg("dd",16,"16");

var  apn_radio=0;
var apn=0;
var  pdp_type_radio=0;
var  pdp_setting_radio=0;
var  dns_radio=0;
var  authen_radio=0;
var  demand_radio=0;
var  idle_radio=0;
function validateIpWarning()
{
	if(validatepdp_Ip(document.APN.PDPIP.value)==false) 
	{
		ShowError(document.getElementById("PDPIP"),"PDP Address is invalid !" );
	return false;
	}
	else
	{
		return true;
	}
}

var ASCIIStrValid = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' + 'abcdefghijklmnopqrstuvwxyz' + '0123456789' +
                  '!#$&()*+,-./%.:;<=>?@[]^_{|}~\"' + '\\' + "\'" + " ";
function checkASC_APN(keyval)
{
	var j, k;
	var flag=0;
	for ( k=0; k<keyval.length; k++ ) {
		for(j=0;j<ASCIIStrValid.length;j++) {
			flag = 1;
			if(keyval.charAt(k) ==  ASCIIStrValid.charAt(j)) {
				flag = 2;
				break;
			}
		}   
	}
	if(flag == 2)
	{
			return true;
	}
	else
	{
			return false;
	}
}
function checkdialno(item)
 {
     var strlen = 0;
     var tmpchr,i;
     strlen = item.length;
     for (i=0; i<strlen; i++)
     {
      tmpchr = item.charAt(i)
       if ((tmpchr == "0") || (tmpchr == "1") || (tmpchr == "2") ||
          (tmpchr == "3") || (tmpchr == "4") || (tmpchr == "5") ||
          (tmpchr == "6") || (tmpchr == "7") || (tmpchr == "8") ||
          (tmpchr == "9") || (tmpchr == "A") || (tmpchr == "B") ||
          (tmpchr == "C") || (tmpchr == "D") || (tmpchr == "*") || (tmpchr == "#"))
          continue;
       else
         {
           ShowError(document.getElementById("zwan_dial"),"3G APN SE Dial NO Error" );
           return false;
           
         }
      }
 }
function chkAPN(f) 
{   
	form2Cfg(f);
	if(document.getElementById('gphonenum').value =="" && document.APN.zapn_select[1].checked == true)
		{
			ShowError(document.getElementById('gphonenum'),"3G APN SE APN Cannot Empty" );
			return false;
		}
		if(document.getElementById('gphonenum').value !="" && document.APN.zapn_select[1].checked == true)
		{
				if((checkASC_APN(document.APN.gphonenum.value)==false )||(document.APN.gphonenum.value.indexOf("($)")>=0))
				{
					ShowError(document.getElementById("gphonenum"),"3G APN SE Invalid Char" );
					return false;
				}
		}
		
		if(document.getElementById('zwan_dial').value =="")
		{
			ShowError(document.getElementById('zwan_dial'),'3G APN SE NULL DIAL NO');
			return false;
		}
		if(false == checkdialno(document.APN.zwan_dial.value))
		{
					return  false;
		}
	send_apn_value();
	switchPage('B','M');
}
function send_apn_value()
{
	var 	buffer = document.getElementById("zprofile_name").value;

	document.getElementById("Profile_Name_id").innerHTML = buffer; 
	document.INFO.Profile_Name.value = buffer;
	if(	document.APN.zapn_select[0].checked==true){
			buffer="auto";
	}
	else{
			buffer="manual";
	}

	document.getElementById("APN_Setting_id").innerHTML = buffer; 
	document.INFO.APN_Setting.value = buffer;
	//buffer = CA[2].v;
	buffer = document.getElementById("gphonenum").value;
  //alert("gphonenum="+buffer);
	document.getElementById("APN_id").innerHTML = buffer; 
	document.INFO.APN_name.value = buffer;
	//buffer = CA[3].v;
	buffer = document.getElementById("zwan_dial").value;
  //alert("zwan_dial="+buffer);
	document.getElementById("Dial_No_id").innerHTML = buffer; 
	document.INFO.Dial_No.value = buffer;
} 
function isNum(item)
{
	var strlen = 0;
	var tmpchr,i;

	strlen = item.length;
	for (i=0; i<strlen; i++)
	{
		tmpchr = item.charAt(i)
		if ((tmpchr == "0") || (tmpchr == "1") || (tmpchr == "2") ||
		    (tmpchr == "3") || (tmpchr == "4") || (tmpchr == "5") ||
		    (tmpchr == "6") || (tmpchr == "7") || (tmpchr == "8") ||
		    (tmpchr == "9") )
			continue;
		else
		{
		    return false;
		}

	}
	return true;

}

function security_Collapse()
{
	if(document.Security_mod.zencryption_mode.options.selectedIndex == 0)
	{
		//document.getElementById('WPA_ENCRYPTION').style.display = "none";
		document.getElementById('WPA_Pre_Shared_Key').style.display = "none";
		//document.getElementById('WPA_Pre_Shared_Key_confirm').style.display = "none";
		
//		document.getElementById('Network_Key_Rotation_Interval').style.display = "none";
		document.getElementById('WEP_KEY').style.display = "none";
		
		document.INFO.security_shared_mode.value = "NONE";
	}
	if((document.Security_mod.zencryption_mode.options.selectedIndex == 1)||(document.Security_mod.zencryption_mode.options.selectedIndex == 2)/*||(document.Security_mod.zencryption_mode.options.selectedIndex == 3)*/)
	{
		//document.getElementById('WPA_ENCRYPTION').style.display = "";
		document.getElementById('WPA_Pre_Shared_Key').style.display = "";
		//document.getElementById('WPA_Pre_Shared_Key_confirm').style.display = "";
//		document.getElementById('Network_Key_Rotation_Interval').style.display = "";
		document.getElementById('WEP_KEY').style.display = "none";
	}
		if(document.Security_mod.zencryption_mode.options.selectedIndex == 3 )  //openwep shared
	{
		//document.getElementById('WPA_ENCRYPTION').style.display = "none";
		document.getElementById('WPA_Pre_Shared_Key').style.display = "none";
		//document.getElementById('WPA_Pre_Shared_Key_confirm').style.display = "none";
//		document.getElementById('Network_Key_Rotation_Interval').style.display = "none";
		document.getElementById('WEP_KEY').style.display = "";
	}
	if( document.Security_mod.zencryption_mode.options.selectedIndex == 4)  //openwep shared
	{
		//document.getElementById('WPA_ENCRYPTION').style.display = "none";
		document.getElementById('WPA_Pre_Shared_Key').style.display = "none";
		//document.getElementById('WPA_Pre_Shared_Key_confirm').style.display = "none";
//		document.getElementById('Network_Key_Rotation_Interval').style.display = "none";
		document.getElementById('WEP_KEY').style.display = "";
		
	    document.INFO.security_shared_mode.value = "WEP";
		
	}
}

function checkInjection(str)
{
	var len = str.length;
	for (var i=0; i<str.length; i++) {
		if ( str.charAt(i) == '\r' || str.charAt(i) == '\n'){
				return false;
		}else
	        continue;
	}
    return true;
}
function checkHex(str){
	var len = str.length;

	for (var i=0; i<str.length; i++) {
		if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
			(str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
			(str.charAt(i) >= 'A' && str.charAt(i) <= 'F') ){
				continue;
		}else
	        return false;
	}
    return true;
}
function check_Wep(securitymode)
{
	var key_input;
		var keyvalue = document.Security_mod.zNetwork_Key.value;
//if (securitymode == "WEPAUTO"){
	if ( (securitymode == "OPEN" && document.INFO.security_shared_mode.value == "WEP") || securitymode == "SHARED"){
	if (keyvalue.length == 0)
	{
		ShowError(document.getElementById("zNetwork_Key"), "sec error31");
		return false;
	}

	var keylength = document.Security_mod.zNetwork_Key.value.length;
	if (keylength != 0)
	{
		if (document.Security_mod.zWEP1Select.options.selectedIndex == 0)
		{
			if(keylength != 5 && keylength != 13) 
			{
				ShowError(document.getElementById("zNetwork_Key"), "sec error32");
				return false;
			}
			if(checkInjection(document.Security_mod.zNetwork_Key.value)== false)
			{
				ShowError(document.getElementById("zNetwork_Key"), "sec error33");
				return false;
			}
			if( checkinvalidkey(document.Security_mod.zNetwork_Key.value) == false)
			{
				ShowError(document.getElementById("zNetwork_Key"), "WIFI KEY Char Err");
				return false;
			}

		}
		if (document.Security_mod.zWEP1Select.options.selectedIndex == 1)
		{
			if(keylength != 10 && keylength != 26) 
			{
				ShowError(document.getElementById("zNetwork_Key"), "sec error34");
				return false;
			}
			if(checkHex(document.Security_mod.zNetwork_Key.value) == false)
			{
				ShowError(document.getElementById("zNetwork_Key"), "sec error35");
				return false;
			}
		}
	}
}
}
function checkAllNum(str)
{
    for (var i=0; i<str.length; i++){
        if((str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.' ))
            continue;
        return false;
    }
    return true;
}
function  check_NoWEP(securitymode)
{
	if (securitymode == "WPAPSK" || securitymode == "WPA2PSK" || securitymode == "WPAPSKWPA2PSK")
	{
		var keyvalue = document.Security_mod.zWPA_KEY.value;
		if (keyvalue.length == 0)
		{
			ShowError(document.getElementById("zWPA_KEY"), "sec error11");
			return false;
		}
		if (keyvalue.length < 8)
		{
			ShowError(document.getElementById("zWPA_KEY"), "sec error12");
			return false;
		}
		if(checkInjection(document.Security_mod.zWPA_KEY.value) == false)
		{
			ShowError(document.getElementById("zWPA_KEY"), "sec error13");
			return false;
		}
		if(checkASC(document.Security_mod.zWPA_KEY.value,"zWPA_KEY")!=true)
		{ 
			ShowError(document.getElementById("zWPA_KEY"), "sec error13");
			return false;
		}
	    if( checkinvalidkey(document.Security_mod.zWPA_KEY.value) == false)
		{
			ShowError(document.getElementById("zWPA_KEY"), "WIFI KEY Char Err");
			return false;
		}
			
	   if(document.Security_mod.zWPA_KEY.value.length ==64 && checkHex(document.Security_mod.zWPA_KEY.value) == false )
		{
			ShowError(document.getElementById("zWPA_KEY"), "sec error53");
			return false;			
		}		
	}
}
function chSecurity_mod(f)
{
	
  	form2Cfg(f);
	if (checkASC(document.Security_mod.zssid_name.value,"zssid_name")==false) 
	{
		ShowError(document.getElementById("zssid_name"), "WIFI Basic Invalid Err");
		document.getElementById("zssid_name").focus();
		return false;
	}
		   
	if( checkinvalidssid(document.Security_mod.zssid_name.value) == false)
	{
		ShowError(document.Security_mod.zssid_name, "WIFI Basic Char Err");
		document.Security_mod.zssid_name.focus();
		return false;
	}
	
	if( check_blank_ssid(document.Security_mod.zssid_name.value) == false)
	{
		ShowError(document.Security_mod.zssid_name, "WIFI SSID Char Err");
		document.Security_mod.zssid_name.focus();
		return false;
	}
  
		if(check_NoWEP(document.Security_mod.zencryption_mode.value)== false)
		{
			return false;
		}
		if(check_Wep(document.Security_mod.zencryption_mode.value)== false)
		{
			return false;
		}
  	send_Security_value();
	switchPage('A','B');
}
function send_Security_value()
{
  	var	buffer = document.Security_mod.zssid_name.value;
	  //alert("zssid_name="+buffer);
	document.getElementById("SSID_id").innerHTML = showSSID(buffer); 
	document.INFO.SSID_name.value = buffer;
	buffer = document.Security_mod.zBroadcast.value;
	  //alert("zBroadcast="+buffer);
	document.getElementById("SSID_Broadcast_id").innerHTML = buffer+"&nbsp;";
	if(buffer == 'Enabled'){
		document.INFO.SSID_Broadcast.value = '1';	
	}
	else{
		document.INFO.SSID_Broadcast.value = '0';	
	}
  //var	buffer = CA[10].v;
	var	buffer = document.Security_mod.zencryption_mode.value;
	document.INFO.Encryption_Mode_hid.value = buffer;
	if(buffer == "OPEN"  )
	{
		if(document.INFO.security_shared_mode.value == "NONE")
		{
		document.getElementById("Encryption_Mode_id").innerHTML = "NO ENCRYPTION"; 
		}
		else
		{
		document.getElementById("Encryption_Mode_id").innerHTML = "WEP"; 
		}
	}
	else 	if(buffer == "WPAPSK"){
		document.getElementById("Encryption_Mode_id").innerHTML = "WPA"; 
	}
	else 	if(buffer == "WPA2PSK"){
		document.getElementById("Encryption_Mode_id").innerHTML = "WPA2"; 
	}
	else 	if(buffer == "WPAPSKWPA2PSK"){
		document.getElementById("Encryption_Mode_id").innerHTML = "WPA-PSK/WPA2-PSK"; 
	}
		else 	if(buffer == "SHARED"){
		document.getElementById("Encryption_Mode_id").innerHTML = "SHARED"; 
	}	
	else
	{
      alert('send_Security_value is error');
    }

	//buffer = document.Security_mod.zencryption_WPA.value;//CA[11].v;
	  //alert("zencryption_WPA="+buffer);
	document.INFO.WPA_ENCRYPTION_hid.value = buffer;
	buffer = document.getElementById("zWPA_KEY").value;//CA[11].v;
	  //alert("zWPA_KEY="+buffer);
	document.INFO.WPA_PreShared_Key.value = buffer;
//	buffer = document.Security_mod.zRotation_Interval.value;//CA[12].v;
	  //alert("zRotation_Interval="+buffer);
	document.INFO.Key_Rotation_Interval_hid.value = buffer;
	buffer = document.Security_mod.zNetwork_Key.value;//CA[13].v;
	  //alert("zNetwork_Key="+buffer);
	document.INFO.Network_Key_1.value = buffer;
	buffer = document.Security_mod.zWEP1Select.value;//CA[15].v;
	  //alert("zWEP1Select="+buffer);
	document.INFO.WEP1Select.value = buffer;
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
		    if(place=="zssid_name")
		    {	
		        ShowError(document.getElementById("zssid_name"),"This character is not accepted." );
		    }
		    else if(place=="zWPA_KEY")
		    {
		    	ShowError(document.getElementById("zWPA_KEY"),"This character is not accepted." );
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


function chkDNS_OUR(f) 
{
  form2Cfg(f);
  if (checkASC(document.Security_mod.zssid_name.value,"zssid_name")==false) 
	{
		ShowError(document.getElementById("zssid_name"), "WIFI Basic Invalid Err");
		document.getElementById("zssid_name").focus();
		return false;
	}
	
 if( checkinvalidssid(document.Security_mod.zssid_name.value) == false)
   {
      ShowError(document.Security_mod.zssid_name, "WIFI Basic Char Err");
	  document.Security_mod.zssid_name.focus();
      return false;
   }
		
  send_ssid_value();
}
function send_ssid_value()
{
  var	buffer = document.Security_mod.zssid_name.value;//CA[7].v;
	  //alert("zssid_name="+buffer);
	document.getElementById("SSID_id").innerHTML = showSSID(buffer);; 
	document.INFO.SSID_name.value = buffer;
	buffer = document.Security_mod.zBroadcast.value;//CA[8].v;
	  //alert("zBroadcast="+buffer);
	document.getElementById("SSID_Broadcast_id").innerHTML = buffer+"&nbsp;";
	if(buffer == 'Enabled'){
		document.INFO.SSID_Broadcast.value = '1';	
	}
	else{
		document.INFO.SSID_Broadcast.value = '0';	
	}
}
function submitINFO(f)
{
	f.submit();
}

function chkHost(f) {
	switchPage('A','B');
}

function initAPN(f){
	cfg2Form(f);
	
	if(apn_select == "auto")
	{
		document.APN.zapn_select[0].checked=true;
		document.getElementById('apn_input').style.display = "none";
	}
	else
	{
		document.APN.zapn_select[1].checked=true;
		document.getElementById('apn_input').style.display = "";
	}
}
function initAUTHEN(f){
	cfg2Form(f);
}

function initDNS(f) {
	cfg2Form(f);
}
function initSecurity_mod(f)
{
	document.INFO.security_shared_mode.value = '<% asp_get("EncrypType"); %>';
	var security_shared_mode_temp = document.INFO.security_shared_mode.value;
	cfg2Form(f);
	
	if(document.Security_mod.zencryption_mode.value == "OPEN" && security_shared_mode_temp == "NONE") 
	{
		document.getElementById('WPA_Pre_Shared_Key').style.display = "none";
		document.getElementById('WEP_KEY').style.display = "none";
		document.Security_mod.zencryption_mode.options.selectedIndex=0;
	}
	else if((document.Security_mod.zencryption_mode.value == "WPAPSK")||(document.Security_mod.zencryption_mode.value == "WPA2PSK")||(document.Security_mod.zencryption_mode.value == "WPAPSKWPA2PSK"))
	{
		document.getElementById('WPA_Pre_Shared_Key').style.display = "";
		document.getElementById('WEP_KEY').style.display = "none";

		if(document.Security_mod.zencryption_mode.value == "WPAPSK")
		{
   		 document.Security_mod.zencryption_mode.options.selectedIndex=1;
		}
		else if(document.Security_mod.zencryption_mode.value == "WPA2PSK")
		{
   		 document.Security_mod.zencryption_mode.options.selectedIndex=2;
		}		
		else 
		{
   		 document.Security_mod.zencryption_mode.options.selectedIndex=1;
		}
	}
	else 	if( (document.Security_mod.zencryption_mode.value == "OPEN" && security_shared_mode_temp == "WEP") || document.Security_mod.zencryption_mode.value == "SHARED")
	{
		document.getElementById('WPA_Pre_Shared_Key').style.display = "none";
		document.getElementById('WEP_KEY').style.display = "";

		if(document.Security_mod.zencryption_mode.value == "OPEN" && security_shared_mode_temp == "WEP")
		{
		 document.Security_mod.zencryption_mode.options.selectedIndex=4;
		}
		else if(document.Security_mod.zencryption_mode.value == "SHARED")
		{
		 document.Security_mod.zencryption_mode.options.selectedIndex=3;			
		}
	}
	else 
	{
		//alert('error mode');
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

function init() {

	var pppstate = '<% asp_get("ppp_status"); %>';

	check_active_state();
   //initAPN(document.APN);
   //initAUTHEN(document.AUTHEN);
   //initDNS(document.DNS);
   initSecurity_mod(document.Security_mod);
}

function checkSubmit()
{
	writeHiddenNum();
	alert("Please reconnect WiFi!");
	return true;
}

</script>
</head>

<body style="overflow:scroll;overflow-x:hidden;overflow-y:yes" leftmargin="0" bgcolor="white" topmargin="0" marginheight="0" marginwidth="0" onLoad="init();">
	<div id="MsgLayer1" style="BORDER-RIGHT: rgb(0,0,0) 1px; BORDER-TOP: rgb(0,0,0) 1px; Z-INDEX: 888; FILTER: Alpha(opacity=90); LEFT: 500px; BACKGROUND-IMAGE: url(img/Msg_bg.gif); VISIBILITY: hidden; BORDER-LEFT: rgb(0,0,0) 1px; WIDTH: 351px; BORDER-BOTTOM: rgb(0,0,0) 1px; BACKGROUND-REPEAT: no-repeat; POSITION: absolute; TOP: 500px; HEIGHT: 92px; moz-opacity: 0.9; opacity: 0.9" onClick="setinner('hidden')">
	</div>
	<div id="MsgLayer2" style="BORDER-RIGHT: rgb(0,0,0) 1px; BORDER-TOP: rgb(0,0,0) 1px; Z-INDEX: 888; LEFT: 550px; VISIBILITY: hidden; BORDER-LEFT: rgb(0,0,0) 1px; WIDTH: 353px; BORDER-BOTTOM: rgb(0,0,0) 1px; POSITION: absolute; TOP: 300px; HEIGHT: 91px" onClick="setinner('hidden')">
		<div id="errLayer" style="Z-INDEX: 889; LEFT: 20px; WIDTH: 318px; POSITION: absolute; TOP: 11px; HEIGHT: 52px">
			<table height="48" width="320" border="0">
				<tr>
					<td width="320"><span class="msg" id="errmsg" name="errmsg">
					</span></td>
				</tr>
			</table>
		</div>
	</div>
	<iframe id="ifr" style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; Z-INDEX: 887; FILTER: Alpha(opacity=0); LEFT: 500px; VISIBILITY: hidden; BORDER-LEFT: medium none; WIDTH: 351px; BORDER-BOTTOM: medium none; POSITION: absolute; HEIGHT: 75px; moz-opacity: 0; opacity: 0" src="about:blank">
	</iframe>
        
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>

<div id="A" style="position:absolute;visibility:visible;width: 100%;">	
	<form name="Security_mod">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
		  <tr>
		    <td class="listtopic" colspan="10" id="Wizard_Quick_Setup">Basic Setup--&gt;Quick Setup</td>
	      </tr>
	  </table>
		<table cellspacing="0" cellpadding="10" width="100%" border="0">
			<tr>
				<td valign="top">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
	 	<TD align="center" class="selectedMenu" width=155 height="20">&nbsp;&#8226;Quick Setup</TD>
        <TD align="center" class="unselectedMenu" width=155 height="20" ><A href="adm/management.asp">&#8226;Password</A></TD>        		
  		<TD width=695></TD>
        </tr>
	    </table>
        <br>
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td class="title" height="24" id="Quick_Setup_SSID">SSID</td>
					</tr>
					<tr>
						<td width="22%"  class="head_top" onMouseOver="" onMouseOut="" id="Quick_Setup_SSID_Name">
						Name(SSID)</td>
						<td class="head_top_content"  width="78%">
						<input type="text" id="zssid_name" name="zssid_name" maxlength="32" size="32" >
						</td>
					</tr>
                    <tr>
						<td class="head" valign="top" width="22%" onMouseOver="" onMouseOut="" id="Quick_Setup_SSID_Broadcast02">SSID Broadcast</td>
						<td   class="head_content" valign="top" width="78%" onMouseOver="" onMouseOut="">
							<select name="zBroadcast">
                    <option id="Quick_Setup_Broadcast_EB"   style="font-family:Arial;" value="Enabled">Enabled</option>
                    <option id="Quick_Setup_Broadcast_DB"  style="font-family:Arial;" value="Disabled">Disabled</option>
             </select>
             </td>
				</tr>
				</table>
                <br>
				<table cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
						<td height="20" class="title" id="Quick_Setup_Encryption_Mode_title">Encryption Mode</td>
					</tr>
					<tr>
						<td class="head_top" valign="top" width="22%" id="Quick_Setup_Encryption_Mode">Encryption Mode</td>
						<td   class="head_top_content" valign="top" width="78%" onMouseOver="" onMouseOut="">
					<select name="zencryption_mode" id="zencryption_mode" onChange="security_Collapse();">
                    <option id="Quick_Setup_Encryption_Mode_NO"   style="font-family:Arial;" value="OPEN">NO ENCRYPTION</option>
                    <option id="Quick_Setup_Encryption_Mode_WPAPSK"  style="font-family:Arial;" value="WPAPSK">WPA-TKIP</option>
                    <option id="Quick_Setup_Encryption_Mode_WPA2PSK"  style="font-family:Arial;" value="WPA2PSK">WPA2-AES</option>
                    <option  id="Quick_Setup_Encryption_Mode_SHARED"  style="font-family:Arial;" value="SHARED">SHARED</option>
                    <option  id="Quick_Setup_Encryption_Mode_OPENWEP"  style="font-family:Arial;" value="OPEN">WEP</option>

             </select>
             </td>
				</tr>

				<tr id="WPA_Pre_Shared_Key" style="display:none">
						<td width="22%" height="28" valign="top" class="head" onMouseOver="" onMouseOut="" id="Quick_Setup_WPA_Key">
						Pre-shared Key</td>
						<td class="head_content" valign="top" width="78%">
						<input type="password" id="zWPA_KEY" name="zWPA_KEY" size="32" maxlength="64" >
						</td>
				  </tr>			
	
					<tr id="WEP_KEY" style="display:none">
						<td width="22%" height="28" valign="top" class="head" onMouseOver="" onMouseOut="" id="Quick_Setup_Network_Key_1">Network Key 1</td>
						<td class="head_content" valign="top" width="78%">
							<input  type="password"  id="zNetwork_Key" name="zNetwork_Key"  size="19" maxlength="26">
							<select name="zWEP1Select">
								<option id="Quick_Setup_ASCII"  style="font-family:Arial;" value="1">ASCII</option>
								<option id="Quick_Setup_Hex"   style="font-family:Arial;" value="0">Hex</option>
							</select>

						</td>
				  </tr>					
				  </table>
				<br>
				<div align="right">
							<input type="button" class="btn" onClick="chSecurity_mod(document.Security_mod);" value=" Next " id="FirstNext">
				</div>
			  </td>
		  </tr>
	  </table>
  </form>	
</div>
<div id="B" style="position:absolute; visibility:hidden; width: 100%;">
	<form name="INFO" target="_self" action="/goform/Quick_Setup" method="post" onSubmit="return checkSubmit();">
        <input type="hidden" name="lucknum" id="lucknum"/>
		<input type="hidden" name="which_cgi" value="setofquick">
		<input type="hidden" name="webpage" value="net_connect.asp">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td class="listtopic" colspan="10" id="Quick_Setup_Configuration_Follows">Basic Setup-->Configuration as Follows</td>
			</tr>					
		</table>
		<table cellspacing="0" cellpadding="10" width="100%" border="0">
			<tr>
				<td valign="top">
       <table cellspacing="0" cellpadding="0" width="100%" border="0">
       <tr>
	 	<TD align="center" class="selectedMenu" width=155 height="20">&nbsp;&#8226;Quick Setup</TD>
        <TD align="center" class="unselectedMenu" width=155 height="20" ><A href="adm/management.asp">&#8226;Password</A></TD>        		
  		<TD width=695></TD>
        </tr>
	    </table>
        <br>
					<table cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr >
						<td width="22%" valign="top" class="head_top" id="Quick_Setup_Configuration_NameSSID">Name (SSID):</td>
						<td class="head_top_content" valign="top" width="78%">
						<label id="SSID_id">&nbsp;</label></td>						
						<td>
						<input type="hidden" maxlength="30" size="19" name="SSID_name" style="font-family: Arial;">
						</td>				
					</tr>					
					
					<tr >
						<td width="22%" valign="top" class="head" id="Quick_Setup_Configuration_SSIDBroadcast">SSID Broadcast:</td>
						<td class="head_content" valign="top" width="78%">
						<label id="SSID_Broadcast_id">&nbsp;</label></td>						
						<td>
						<input type="hidden" maxlength="30" size="19" name="SSID_Broadcast" style="font-family: Arial;">
						</td>
					</tr>

					<tr>						<td width="22%" valign="top" class="head" id="Quick_Setup_Configuration_EncryptionMode">Encryption Mode:</td>

						<td class="head_content" valign="top" width="78%">
						<label id="Encryption_Mode_id">&nbsp;</label></td>
						<td>
						<input type="hidden" maxlength="30" size="19" name="Encryption_Mode_hid" style="font-family: Arial;">
						<input type="hidden" maxlength="30" size="19" name="WPA_ENCRYPTION_hid" style="font-family: Arial;">
						<input type="hidden" maxlength="30" size="19" name="WPA_PreShared_Key" style="font-family: Arial;">
						<input type="hidden" maxlength="30" size="19" name="Key_Rotation_Interval_hid" style="font-family: Arial;">
						<input type="hidden" maxlength="30" size="19" name="Network_Key_1" style="font-family: Arial;">
						<input type="hidden" maxlength="30" size="19" name="WEP1Select" style="font-family: Arial;">
						<input type="hidden" maxlength="30" size="19" name="security_shared_mode" style="font-family: Arial;">
						</td>
					</tr>
					</table>
				<br>
				<div align="right">
							<input id="Quick_Setup_Configuration_back" name="button4" type="button" class="btn" onClick="switchPage(&quot;B&quot;,lastPage)" value=" Back " align="left">
							<input id="Quick_Setup_Configuration_Apply" align="right" type="submit" class="btn" name="Submit"   value="Apply">
				</div>			
				</td>
		</tr>
	</table>
	</form>
</div>

</body>

</html>
