<html>
<head>
<title>Verizon Fivespot</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/toptip.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/wlan.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var  WPSonoff = '<% getCfgZero(1, "WscModeOption"); %>';

var MBSSID_MAX 				= 8;
var ACCESSPOLICYLIST_MAX	= 64;

var changed = 0;
var old_MBSSID;

var defaultShownMBSSID = 0;
var SSID = new Array();
var PreAuth = new Array();
var AuthMode = new Array();
var EncrypType = new Array();
var DefaultKeyID = new Array();
var Key1Type = new Array();
var Key1Str = new Array();
var Key2Type = new Array();
var Key2Str = new Array();
var Key3Type = new Array();
var Key3Str = new Array();
var Key4Type = new Array();
var Key4Str = new Array();
var WPAPSK = new Array();
var RekeyMethod = new Array();
var RekeyInterval = new Array();
var PMKCachePeriod = new Array();
var IEEE8021X = new Array();
var RADIUS_Server = new Array();
var RADIUS_Port = new Array();
var RADIUS_Key = new Array();
var session_timeout_interval = new Array();
var AccessPolicy = new Array();
var AccessControlList = new Array();

function checkMac(str){
	var len = str.length;
	if(len!=17)
		return false;

	for (var i=0; i<str.length; i++) {
		if((i%3) == 2){
			if(str.charAt(i) == ':')
				continue;
		}else{
			if (    (str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
					(str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
					(str.charAt(i) >= 'A' && str.charAt(i) <= 'F') )
			continue;
		}
		return false;
	}
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

    if ( checkAllNum(field.value) == 0)
        return false;

    if( (!checkRange(field.value,1,0,255)) ||
        (!checkRange(field.value,2,0,255)) ||
        (!checkRange(field.value,3,0,255)) ||
        (!checkRange(field.value,4,1,254)) ){
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
    return parseInt(str, 10);
}

function checkHex(str){
	var len = str.length;

	for (var i=0; i<str.length; i++) {
		if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
			(str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
			(str.charAt(i) >= 'A' && str.charAt(i) <= 'F') ){
				continue;
		}else
	        {
				
				return false;
			}
	}
    return true;
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

function checkStrictInjection(str)
{
	var len = str.length;
	for (var i=0; i<str.length; i++) {
		if ( str.charAt(i) == ';' || str.charAt(i) == ',' ||
			 str.charAt(i) == '\r' || str.charAt(i) == '\n'){
				return false;
		}else
	        continue;
	}
    return true;
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

function style_display_on()
{
	if (window.ActiveXObject) { // IE
		return "block";
	}
	else if (window.XMLHttpRequest) { // Mozilla, Safari,...
		return "table-row";
	}
}

var http_request = false;
function makeRequest(url, content, handler) {
	http_request = false;
	if (window.XMLHttpRequest) { // Mozilla, Safari,...
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {
			http_request.overrideMimeType('text/xml');
		}
	} else if (window.ActiveXObject) { // IE
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
	http_request.onreadystatechange = handler;
	http_request.open('POST', url, true);
	http_request.send(content);
}

function securityHandler() {
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			parseAllData(http_request.responseText);
			UpdateMBSSIDList();
			LoadFields(defaultShownMBSSID);

			LoadAP();
			ShowAP(defaultShownMBSSID);
			initmacfilter();
		} else {
			//alert('There was a problem with the request.');
		}
	}
}

function deleteAccessPolicyListHandler()
{
	window.location.reload(false);
}


function parseAllData(str)
{
	var all_str = new Array();
	all_str = str.split("\n");

	defaultShownMBSSID = parseInt(all_str[0]);

	for (var i=0; i<all_str.length-2; i++) {
		var fields_str = new Array();
		fields_str = all_str[i+1].split("\r");

		SSID[i] = fields_str[0];
		AuthMode[i] = fields_str[1];
		EncrypType[i] = fields_str[2];
		DefaultKeyID[i] = fields_str[3];
		Key1Type[i] = fields_str[4];
		Key1Str[i] = fields_str[5];
		Key2Type[i] = fields_str[6];
		Key2Str[i] = fields_str[7];
		Key3Type[i] = fields_str[8];
		Key3Str[i] = fields_str[9];
		Key4Type[i] = fields_str[10];
		Key4Str[i] = fields_str[11];
		WPAPSK[i] = fields_str[12];

		PreAuth[i] = "0";
		RekeyMethod[i] = "0";
		RekeyInterval[i] = "3600";
		PMKCachePeriod[i] = "0";
		IEEE8021X[i] = "0";
		RADIUS_Server[i] = "0";
		RADIUS_Port[i] = "0";
		RADIUS_Key[i] = "0";
		session_timeout_interval[i] = "0";
		AccessPolicy[i] = "0";
		AccessControlList[i] = "0";

		/* !!!! IMPORTANT !!!!*/
		if(IEEE8021X[i] == "1")
			AuthMode[i] = "IEEE8021X";

		if(AuthMode[i] == "OPEN" && EncrypType[i] == "NONE" && IEEE8021X[i] == "0")
			//AuthMode[i] = "Disable";
			AuthMode[i] = "OPEN";  
	}
}

function checkData()
{
	var securitymode;
	var encrypt_type;

	securitymode = document.security_form.security_mode.value;
	encrypt_type = document.security_form.security_shared_mode.value;
	if (((securitymode == "OPEN")&&(encrypt_type != "NONE")) || securitymode == "SHARED" )
	{
		if(! check_Wep(securitymode) )
			return false;
	}
	else if (securitymode == "WPAPSK" || securitymode == "WPA2PSK" || securitymode == "WPAPSKWPA2PSK" /* || security_mode == 5 */)
	{
		var keyvalue = document.security_form.passphrase.value;
		
	
		if (keyvalue.length == 0){
			ShowError(document.security_form.passphrase, "sec error11");
			return false;
		}

		if (keyvalue.length < 8){
			ShowError(document.security_form.passphrase, "sec error12");
			return false;
		}
		

		if(checkInjection(document.security_form.passphrase.value) == false){
			ShowError(document.security_form.passphrase, "sec error13");
			return false;
		}
		
		if(checkASC(document.security_form.passphrase.value,"passphrase")!=true)
		{  
			ShowError(document.security_form.passphrase, "sec error13");
			return false;
		}
			if( checkinvalidkey(document.security_form.passphrase.value) == false)
			{
				ShowError(document.security_form.passphrase, "WIFI KEY Char Err");
				return false;
			}
			
		if(document.security_form.passphrase.value.length ==64 && checkHex(document.security_form.passphrase.value) == false )
		{
			ShowError(document.security_form.passphrase, "sec error53");
			return false;			
		}
		

		if(document.security_form.cipher[0].checked != true && 
		   document.security_form.cipher[1].checked != true &&
   		   document.security_form.cipher[2].checked != true){
   		   ShowError(document.security_form.cipher[0], "sec error14");
   		   return false;
		}

		if(checkAllNum(document.security_form.keyRenewalInterval.value) == false){
			ShowError(document.security_form.keyRenewalInterval, "sec error15");
			return false;
		}
		if(document.security_form.keyRenewalInterval.value < 60){
			ShowError(document.security_form.keyRenewalInterval, "sec error16");
			// return false;
		}
		if(check_wpa() == false)
		{
			return false;
		}
	}
	else if (securitymode == "IEEE8021X")
	{
		if( document.security_form.ieee8021x_wep[0].checked == false &&
			document.security_form.ieee8021x_wep[1].checked == false){
			ShowError(document.security_form.ieee8021x_wep[0], "sec error17");
			return false;
		}
		if(check_radius() == false)
			return false;
	}else if (securitymode == "WPA" || securitymode == "WPA1WPA2")
	{
		if(check_wpa() == false)
			return false;
		if(check_radius() == false)
			return false;
	}else if (securitymode == "WPA2")
	{
		if(check_wpa() == false)
			return false;
		if( document.security_form.PreAuthentication[0].checked == false &&
			document.security_form.PreAuthentication[1].checked == false){
			ShowError(document.security_form.PreAuthentication[0], "sec error18");
			return false;
		}

		if(!document.security_form.PMKCachePeriod.value.length){
			ShowError(document.security_form.PMKCachePeriod, "sec error19");
			return false;
		}
		if(check_radius() == false)
			return false;
	}

	for(i=0; i<MBSSID_MAX; i++){


		if( document.getElementById("newap_text_" + i).value != ""){
			if(!checkMac(document.getElementById("newap_text_" + i).value)){
				ShowError(document.getElementById("newap_text_" + i), "sec error20");
				return false;
			}
		}
	}

	return true;
}

function check_wpa()
{
		if(document.security_form.cipher[0].checked != true && 
		   document.security_form.cipher[1].checked != true &&
   		   document.security_form.cipher[2].checked != true){
   		   ShowError(document.security_form.cipher[0], "sec error21");
   		   return false;
		}

		if(checkAllNum(document.security_form.keyRenewalInterval.value) == false){
			ShowError(document.security_form.keyRenewalInterval, "sec error22");
			return false;
		}
		if(document.security_form.keyRenewalInterval.value < 60){
			ShowError(document.security_form.keyRenewalInterval, "sec error23");
			// return false;
		}
		return true;
}

function check_radius()
{
	if(!document.security_form.RadiusServerIP.value.length){
		ShowError(document.security_form.RadiusServerIP, "sec error24");
		return false;		
	}
	if(!document.security_form.RadiusServerPort.value.length){
		ShowError(document.security_form.RadiusServerPort, "sec error25");
		return false;		
	}
	if(!document.security_form.RadiusServerSecret.value.length){
		ShowError(document.security_form.RadiusServerSecret, "sec error26");
		return false;		
	}

	if(checkIpAddr(document.security_form.RadiusServerIP) == false){
		ShowError(document.security_form.RadiusServerIP, "sec error27");
		return false;		
	}
	if( (checkRange(document.security_form.RadiusServerPort.value, 1, 1, 65535)==false) ||
		(checkAllNum(document.security_form.RadiusServerPort.value)==false)){
		ShowError(document.security_form.RadiusServerPort, "sec error28");
		return false;		
	}
	if(checkStrictInjection(document.security_form.RadiusServerSecret.value)==false){
		ShowError(document.security_form.RadiusServerSecret, "sec error29");
		return false;		
	}

	if(document.security_form.RadiusServerSessionTimeout.value.length){
		if(checkAllNum(document.security_form.RadiusServerSessionTimeout.value)==false){
			ShowError(document.security_form.RadiusServerSessionTimeout, "sec error30");
			return false;	
		}	
	}

	return true;
}

function securityMode(c_f)
{
	var security_mode;
	var encrypt_type;

	changed = c_f;

	hideWep();


	document.getElementById("div_security_shared_mode").style.visibility = "hidden";
	document.getElementById("div_security_shared_mode").style.display = "none";
	document.getElementById("div_wpa").style.visibility = "hidden";
	document.getElementById("div_wpa").style.display = "none";
	document.getElementById("div_wpa_algorithms").style.visibility = "hidden";
	document.getElementById("div_wpa_algorithms").style.display = "none";
	document.getElementById("wpa_passphrase").style.visibility = "hidden";
	document.getElementById("wpa_passphrase").style.display = "none";
	document.security_form.cipher[0].disabled = true;
	document.security_form.cipher[1].disabled = true;
	document.security_form.cipher[2].disabled = true;
	document.security_form.passphrase.disabled = true;
	document.security_form.keyRenewalInterval.disabled = true;
	document.security_form.PMKCachePeriod.disabled = true;
	//document.security_form.PreAuthentication.disabled = true;

	document.getElementById("div_radius_server").style.visibility = "hidden";
	document.getElementById("div_radius_server").style.display = "none";
	//document.getElementById("div_8021x_wep").style.visibility = "hidden";
	//document.getElementById("div_8021x_wep").style.display = "none";
	document.security_form.ieee8021x_wep.disable = true;
	document.security_form.RadiusServerIP.disable = true;
	document.security_form.RadiusServerPort.disable = true;
	document.security_form.RadiusServerSecret.disable = true;	
	document.security_form.RadiusServerSessionTimeout.disable = true;
	document.security_form.RadiusServerIdleTimeout.disable = true;	

	security_mode = document.security_form.security_mode.value;
	encrypt_type = document.security_form.security_shared_mode.value;
	
	if (security_mode == "OPEN" || security_mode == "SHARED" ||security_mode == "WEPAUTO"){
		showWep(security_mode);
	}else if (security_mode == "WPAPSK" || security_mode == "WPA2PSK" || security_mode == "WPAPSKWPA2PSK"){
		document.getElementById("div_wpa").style.visibility = "visible";
		if (window.ActiveXObject) { // IE
			document.getElementById("div_wpa").style.display = "block";
		}
		else if (window.XMLHttpRequest) { // Mozilla, Safari,...
			document.getElementById("div_wpa").style.display = "table";
		}

		document.getElementById("div_wpa_algorithms").style.visibility = "visible";
		document.getElementById("div_wpa_algorithms").style.display = style_display_on();
		document.security_form.cipher[0].disabled = false;
		document.security_form.cipher[1].disabled = false;
		document.security_form.cipher[2].disabled = false;  

		if(security_mode == "WPA2PSK" || security_mode == "WPAPSKWPA2PSK")
			document.security_form.cipher[2].disabled = false;

		document.getElementById("wpa_passphrase").style.visibility = "visible";
		document.getElementById("wpa_passphrase").style.display = style_display_on();
		document.security_form.passphrase.disabled = false;

		document.security_form.keyRenewalInterval.disabled = false;
	}else if (security_mode == "WPA" || security_mode == "WPA2" || security_mode == "WPA1WPA2")
	{
		document.getElementById("div_wpa").style.visibility = "visible";
		if (window.ActiveXObject) { // IE
			document.getElementById("div_wpa").style.display = "block";
		}else if (window.XMLHttpRequest) { // Mozilla, Safari,...
			document.getElementById("div_wpa").style.display = "table";
		}

		document.getElementById("div_wpa_algorithms").style.visibility = "visible";
		document.getElementById("div_wpa_algorithms").style.display = style_display_on();
		document.security_form.cipher[0].disabled = false;
		document.security_form.cipher[1].disabled = false;
		document.security_form.cipher[2].disabled = false; 
		document.security_form.keyRenewalInterval.disabled = false;
	
		document.getElementById("div_radius_server").style.visibility = "visible";
		document.getElementById("div_radius_server").style.display = style_display_on();
		document.security_form.RadiusServerIP.disable = false;
		document.security_form.RadiusServerPort.disable = false;
		document.security_form.RadiusServerSecret.disable = false;	
		document.security_form.RadiusServerSessionTimeout.disable = false;
		document.security_form.RadiusServerIdleTimeout.disable = false;	

		if(security_mode == "WPA2"){
			document.security_form.cipher[2].disabled = false;
			//document.getElementById("wpa_preAuthentication").style.visibility = "visible";
			//document.getElementById("wpa_preAuthentication").style.display = style_display_on();
			document.security_form.PreAuthentication.disabled = false;
			//document.getElementById("wpa_PMK_Cache_Period").style.visibility = "visible";
			//document.getElementById("wpa_PMK_Cache_Period").style.display = style_display_on();
			document.security_form.PMKCachePeriod.disabled = false;
		}

		if(security_mode == "WPA1WPA2"){
			document.security_form.cipher[2].disabled = false;
		}

	}else if (security_mode == "IEEE8021X"){
		//document.getElementById("div_8021x_wep").style.visibility = "visible";
		//document.getElementById("div_8021x_wep").style.display = style_display_on();

		document.getElementById("div_radius_server").style.visibility = "visible";
		document.getElementById("div_radius_server").style.display = style_display_on();
		document.security_form.ieee8021x_wep.disable = false;
		document.security_form.RadiusServerIP.disable = false;
		document.security_form.RadiusServerPort.disable = false;
		document.security_form.RadiusServerSecret.disable = false;	
		document.security_form.RadiusServerSessionTimeout.disable = false;
		//document.security_form.RadiusServerIdleTimeout.disable = false;
	}
}


function hideWep()
{
	document.getElementById("div_wep").style.visibility = "hidden";
	document.getElementById("div_wep").style.display = "none";
}
function showWep(mode)
{
	var security_mode;
	var encrypt_type;
	
	if(mode == "OPEN"){
		document.getElementById("div_security_shared_mode").style.visibility = "visible";
		document.getElementById("div_security_shared_mode").style.display = style_display_on();
	}
	
	security_mode = document.security_form.security_mode.value;
	encrypt_type = document.security_form.security_shared_mode.value;

if (((security_mode == "OPEN")&&(encrypt_type != "NONE")) || security_mode == "SHARED" )
	{
		document.getElementById("div_wep").style.visibility = "visible";

		if (window.ActiveXObject) { // IE 
			document.getElementById("div_wep").style.display = "block";
		}
		else if (window.XMLHttpRequest) { // Mozilla, Safari...
			document.getElementById("div_wep").style.display = "table";
		}
	}	
}


function check_Wep(securitymode)
{
	var defaultid = document.security_form.wep_default_key.value;
	var key_input;

	if ( defaultid == 0 )
		var keyvalue = document.security_form.wep_key_1.value;
	else if (defaultid == 1)
		var keyvalue = document.security_form.wep_key_2.value;
	else if (defaultid == 2)
		var keyvalue = document.security_form.wep_key_3.value;
	else if (defaultid == 3)
		var keyvalue = document.security_form.wep_key_4.value;

	if (keyvalue.length == 0 &&  (securitymode == "SHARED" || securitymode == "OPEN" )){
	    ++defaultid;
		ShowError(eval("document.security_form.wep_key_"+defaultid), "sec error31");
		return false;
	}

	var keylength = document.security_form.wep_key_1.value.length;
		if (document.security_form.WEP1Select.options.selectedIndex == 0){
			if(keylength != 0 && keylength != 5 && keylength != 13) {
				ShowError(document.security_form.wep_key_1, "sec error32");
				return false;
			}
			if(checkInjection(document.security_form.wep_key_1.value)== false){
				ShowError(document.security_form.wep_key_1, "sec error33");
				return false;
			}
			
		   if(checkASC_WEP(document.security_form.wep_key_1.value)!=true)
		    {  
			   ShowError(document.security_form.wep_key_1, "sec error33");
			   return false;
		    }

			if( checkinvalidkey(document.security_form.wep_key_1.value) == false)
			{
				ShowError(document.security_form.wep_key_1, "WIFI KEY Char Err");
				return false;
			}	
		}
		if (document.security_form.WEP1Select.options.selectedIndex == 1){
			if(keylength != 0 && keylength != 10 && keylength != 26) {
				ShowError(document.security_form.wep_key_1, "sec error34");
				return false;
			}
			if(checkHex(document.security_form.wep_key_1.value) == false){
				ShowError(document.security_form.wep_key_1, "sec error35");
				return false;
			}
		}
//	}

	keylength = document.security_form.wep_key_2.value.length;
		if (document.security_form.WEP2Select.options.selectedIndex == 0){
			if(keylength != 0 && keylength != 5 && keylength != 13) {
				ShowError(document.security_form.wep_key_2, "sec error36");
				return false;
			}
			if(checkInjection(document.security_form.wep_key_2.value)== false){
				ShowError(document.security_form.wep_key_2, "sec error37");
				return false;
			}	
		   if(checkASC_WEP(document.security_form.wep_key_2.value)!=true)
		    {  
			   ShowError(document.security_form.wep_key_2, "sec error37");
			   return false;
		    }			
			if( checkinvalidkey(document.security_form.wep_key_2.value) == false)
			{
				ShowError(document.security_form.wep_key_2, "WIFI KEY Char Err");
				return false;
			}
		}
		if (document.security_form.WEP2Select.options.selectedIndex == 1){
			if(keylength != 0 && keylength != 10 && keylength != 26) {
				ShowError(document.security_form.wep_key_2, "sec error38");
				return false;
			}
			if(checkHex(document.security_form.wep_key_2.value) == false){
				ShowError(document.security_form.wep_key_2, "sec error39");
				return false;
			}
		}
//	}

	keylength = document.security_form.wep_key_3.value.length;
		if (document.security_form.WEP3Select.options.selectedIndex == 0){
			if(keylength != 0 && keylength != 5 && keylength != 13) {
				ShowError(document.security_form.wep_key_3, "sec error40");
				return false;
			}
			if(checkInjection(document.security_form.wep_key_3.value)== false){
				ShowError(document.security_form.wep_key_3, "sec error41");
				return false;
			}
		   if(checkASC_WEP(document.security_form.wep_key_3.value)!=true)
		    {  
			   ShowError(document.security_form.wep_key_3, "sec error41");
			   return false;
		    }			
			if( checkinvalidkey(document.security_form.wep_key_3.value) == false)
			{
				ShowError(document.security_form.wep_key_3, "WIFI KEY Char Err");
				return false;
			}
		}
		if (document.security_form.WEP3Select.options.selectedIndex == 1){
			if(keylength != 0 && keylength != 10 && keylength != 26) {
				ShowError(document.security_form.wep_key_3, "sec error42");
				return false;
			}
			if(checkHex(document.security_form.wep_key_3.value) == false){
				ShowError(document.security_form.wep_key_3, "sec error43");
				return false;
			}			
		}
//	}

	keylength = document.security_form.wep_key_4.value.length;
		if (document.security_form.WEP4Select.options.selectedIndex == 0){
			if(keylength != 0 && keylength != 5 && keylength != 13) {
				ShowError(document.security_form.wep_key_4, "sec error44");
				return false;
			}
			if(checkInjection(document.security_form.wep_key_4.value)== false){
				ShowError(document.security_form.wep_key_4, "sec error45");
				return false;
			}
		   if(checkASC_WEP(document.security_form.wep_key_4.value)!=true)
		    {  
			   ShowError(document.security_form.wep_key_4, "sec error45");
			   return false;
		    }			
			
			if( checkinvalidkey(document.security_form.wep_key_4.value) == false)
			{
				ShowError(document.security_form.wep_key_4, "WIFI KEY Char Err");
				return false;
			}	
		}
		if (document.security_form.WEP4Select.options.selectedIndex == 1){
			if(keylength != 0 && keylength != 10 && keylength != 26) {
				ShowError(document.security_form.wep_key_4, "sec error46");
				return false;
			}

			if(checkHex(document.security_form.wep_key_4.value) == false){
				ShowError(document.security_form.wep_key_4, "sec error47");
				return false;
			}			
		}
//	}
	return true;
}

function check_WPS_status()
{
 if(WPSonoff == '0')
 return true; 
 else
 {
   ShowError(document.security_form.secureApply, "sec error55");
   return false;
  } 
 }
 
function submit_apply()
{
    if (checkData() == true && check_WPS_status() == true){
		changed = 0;
		
		writeHiddenNum();
		alert("Please reconnect WiFi!");
		document.security_form.submit();
	}
}

function LoadFields(MBSSID)
{
	var result;
	sp_select = document.getElementById("security_mode");

	sp_select.options.length = 0;

    sp_select.options[sp_select.length] = new Option("OPEN",	"OPEN",		false, AuthMode[MBSSID] == "OPEN");
    sp_select.options[sp_select.length] = new Option("SHARED",	"SHARED", 	false, AuthMode[MBSSID] == "SHARED");
    sp_select.options[sp_select.length] = new Option("WPA-PSK", "WPAPSK",	false, AuthMode[MBSSID] == "WPAPSK");
    sp_select.options[sp_select.length] = new Option("WPA2-PSK","WPA2PSK",	false, AuthMode[MBSSID] == "WPA2PSK");

	document.getElementById("WEP1").value = Key1Str[MBSSID];
	document.getElementById("WEP2").value = Key2Str[MBSSID];
	document.getElementById("WEP3").value = Key3Str[MBSSID];
	document.getElementById("WEP4").value = Key4Str[MBSSID];

	document.getElementById("WEP1Select").selectedIndex = (Key1Type[MBSSID] == "0" ? 1 : 0);
	document.getElementById("WEP2Select").selectedIndex = (Key2Type[MBSSID] == "0" ? 1 : 0);
	document.getElementById("WEP3Select").selectedIndex = (Key3Type[MBSSID] == "0" ? 1 : 0);
	document.getElementById("WEP4Select").selectedIndex = (Key4Type[MBSSID] == "0" ? 1 : 0);

	document.getElementById("wep_default_key").selectedIndex = parseInt(DefaultKeyID[MBSSID]);

	if(AuthMode[MBSSID] == "OPEN" && EncrypType[MBSSID] == "NONE")
		document.getElementById("security_shared_mode").selectedIndex = 1;
	else
		document.getElementById("security_shared_mode").selectedIndex = 0;

	if(EncrypType[MBSSID] == "TKIP")
		document.security_form.cipher[0].checked = true;
	else if(EncrypType[MBSSID] == "CCMP")
		document.security_form.cipher[1].checked = true;
	else if(EncrypType[MBSSID] == "TKIP CCMP")
		document.security_form.cipher[2].checked = true;
	else 
		document.security_form.cipher[0].checked = true;
 

	document.getElementById("passphrase").value = WPAPSK[MBSSID];
	document.getElementById("keyRenewalInterval").value = RekeyInterval[MBSSID];
	document.getElementById("PMKCachePeriod").value = PMKCachePeriod[MBSSID];
	if(PreAuth[MBSSID] == "0")
		document.security_form.PreAuthentication[0].checked = true;
	else
		document.security_form.PreAuthentication[1].checked = true;

	if(IEEE8021X[MBSSID] == "1"){
		if(EncrypType[MBSSID] == "WEP")
			document.security_form.ieee8021x_wep[1].checked = true;
		else
			document.security_form.ieee8021x_wep[0].checked = true;
	}
	
	document.getElementById("RadiusServerIP").value = RADIUS_Server[MBSSID];
	document.getElementById("RadiusServerPort").value = RADIUS_Port[MBSSID];
	document.getElementById("RadiusServerSecret").value = RADIUS_Key[MBSSID];			
	document.getElementById("RadiusServerSessionTimeout").value = session_timeout_interval[MBSSID];
	
	securityMode(0);

}


function ShowAP(MBSSID)
{
}

function LoadAP()
{
	for(var i=0; i<SSID.length; i++){
		var j=0;
		var aplist = new Array;

		if(AccessControlList[i].length != 0){
			aplist = AccessControlList[i].split(";");
			for(j=0; j<aplist.length; j++){
				document.getElementById("newap_"+i+"_"+j).value = aplist[j];
			}

			if(j%2){
				document.getElementById("newap_td_"+i+"_"+j).style.visibility = "hidden";
				document.getElementById("newap_td_"+i+"_"+j).style.display = "none";
				j++;
			}
		}

		for(; j<ACCESSPOLICYLIST_MAX; j+=2){
			document.getElementById("id_"+i+"_"+j).style.visibility = "hidden";
			document.getElementById("id_"+i+"_"+j).style.display = "none";
		}
	}
}

function selectMBSSIDChanged()
{
	if(changed){
		ret = confirm("Are you sure to ignore changed?");
		if(!ret){
			return false;
		}
		else
			changed = 0;
	}

	old_MBSSID = 0;

	MBSSIDChange(selected);
}


function MBSSIDChange(selected)
{
	LoadFields(selected);

	ShowAP(selected);

	WPAAlgorithms = EncrypType[selected];
	IEEE8021XWEP = IEEE8021X[selected];
	PreAuthentication = PreAuth[selected];

	changeSecurityPolicyTableTitle(SSID[selected]);

	for(i=0; i<MBSSID_MAX; i++)
		document.getElementById("newap_text_"+i).value = "";

	return true;
}

function changeSecurityPolicyTableTitle(t)
{
	var title = document.getElementById("sp_title");
	title.innerHTML = "\"" + t + "\"";
}

function delap(mbssid, num)
{
	makeRequest("/goform/APDeleteAccessPolicyList", mbssid+ "," +num, deleteAccessPolicyListHandler);
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

function initAll()
{
	check_active_state();
	
	//initTranslation();	
	makeRequest("/goform/wirelessGetSecurity?lucknum="+getlucknum(), "n/a", securityHandler);
}

function UpdateMBSSIDList()
{
	for(var i=0; i<SSID.length; i++){
		var j = 0;
	}
	
	old_MBSSID = defaultShownMBSSID;
}



function macfilterShowAP(MBSSID)
{
	var i;
	for(i=0; i<MBSSID_MAX; i++)
	{
		document.getElementById("AccessPolicy_"+i).style.visibility = "hidden";
		document.getElementById("AccessPolicy_"+i).style.display = "none";
	}

	document.getElementById("AccessPolicy_"+MBSSID).style.visibility = "visible";
	
	if (window.ActiveXObject) 
	{			// IE
		document.getElementById("AccessPolicy_"+MBSSID).style.display = "block";
	}
	else if (window.XMLHttpRequest) 
	{	// Mozilla, Safari,...
		document.getElementById("AccessPolicy_"+MBSSID).style.display = "table";
	}
}


//function securityHandler() {
function getmacfilterlist() 
{
	var i=0;
	var j=0;
	if (http_request.readyState == 4) 
	{
		if (http_request.status == 200) 
		{
			parseAllData(http_request.responseText);
				//UpdateMBSSIDList();
				//LoadFields(defaultShownMBSSID);

			for(j=0;j<ACCESSPOLICYLIST_MAX;j+=2)
			{
				document.getElementById("id_"+i+"_"+j).style.visibility = "visible";
				document.getElementById("id_"+i+"_"+j).style.display = style_display_on();
			}
			LoadAP();
			//alert("defaultShownMBSSID="+defaultShownMBSSID);
			//macfilterShowAP(defaultShownMBSSID);
		}
	}
}



function setChange(c)
{
	var macfilterstate;
	var i=0;
	changed = c;
	//alert("SSID.length="+SSID.length);
	
	
		macfilterstate = document.getElementById("apselect_0").value;
		//alert("macfilterstate="+macfilterstate);
		if(macfilterstate  == '0')
		{
			document.getElementById("macfilteraddress").style.visibility = "hidden";
		    document.getElementById("macfilteraddress").style.display = "none";
			for(var i=0; i<SSID.length; i++)
			//for(i=0; i<MBSSID_MAX; i++){
			{
				for(j=0;j<ACCESSPOLICYLIST_MAX;j+=2)
				{
					//document.getElementById("id_0"+"_"+j).style.visibility = "hidden";
					//document.getElementById("id_0"+"_"+j).style.display = "none";
					//alert("ACCESSPOLICYLIST_MAX="+ACCESSPOLICYLIST_MAX);
					//alert("j="+j);
					//alert("i="+i);
					document.getElementById("id_"+i+"_"+j).style.visibility = "hidden";
					document.getElementById("id_"+i+"_"+j).style.display = "none";
		    	}
			}	
		}
		else
		{
			document.getElementById("macfilteraddress").style.visibility = "visible";
		    document.getElementById("macfilteraddress").style.display = style_display_on();
			makeRequest("/goform/wirelessGetSecurity", "n/a", getmacfilterlist);
		}
		
	
}


function initmacfilter()
{
	var macfilterstate;
	var i=0;
	
		macfilterstate = document.getElementById("apselect_0").value;
		if(macfilterstate  == '0')
		{
			document.getElementById("macfilteraddress").style.visibility = "hidden";
		    document.getElementById("macfilteraddress").style.display = "none";
			//for(var i=0; i<SSID.length; i++)
			for(var i=0; i<1; i++)
			{
				for(j=0;j<ACCESSPOLICYLIST_MAX;j+=2)
				{
					document.getElementById("id_"+i+"_"+j).style.visibility = "hidden";
					document.getElementById("id_"+i+"_"+j).style.display = "none";
		    	}
			}	
		}
}

var WPAAlgorithms;
function onWPAAlgorithmsClick(type)
{
	if(type == 0 && WPAAlgorithms == "TKIP") return;
	if(type == 1 && WPAAlgorithms == "AES") return;
	if(type == 2 && WPAAlgorithms == "TKIPAES") return;
	setChange(1);
}

var IEEE8021XWEP;
function onIEEE8021XWEPClick(type)
{
	if(type == 0 && IEEE8021XWEP == false) return;
	if(type == 1 && IEEE8021XWEP == true) return;
	setChange(1);
}

var PreAuthentication;
function onPreAuthenticationClick(type)
{
	if(type == 0 && PreAuthentication == false) return;
	if(type == 1 && PreAuthentication == true) return;
	setChange(1);
}
</script>
</head>
<body onLoad="initAll();" style="overflow:scroll;overflow-x:hidden;overflow-y:yes">
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
	
<form method="post" name="security_form" action="/goform/APSecurity">
<input type="hidden" name="lucknum" id="lucknum"/>
<input type="hidden" name="ssidIndex" value="0">
<table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td class=listtopic colspan=2 id="wifisecuritytitle">Wi-Fi Settings--&gt;Security</td>
            </tr>                                                         
        </table>
	<table cellspacing="0" cellpadding="10" width="100%" border="0" height="100%">
		<tr>
			<td valign="top">
		 <table cellspacing="0" cellpadding="0" width="100%" border="0">
		<TD align="center" class="unselectedMenu" width=170 height="20" id="wifistationlist" name="wifistationlist"><A href="stainfo.asp">&#8226;Connected Devices</A></TD>          
	 	<TD align="center" class="unselectedMenu" width=170 height="20" id="wifisecuritymenu2" name="wifisecuritymenu2"><A href="basic.asp">&#8226; Basic&nbsp;</A></TD>
        <TD align="center" class="selectedMenu" width=170 height="20" id="wifisecurity" name="wifisecurity">&#8226;Security</TD>   
	   <TD width=400></TD>
	</table>  

<table border="0" cellpadding="10" cellspacing="0" width="100%">
  <tbody><tr>
    <td class="title" colspan="2" ><span id="sp_title">Wireless Lan Security </span></td>
  </tr>
  <tr id="div_security_infra_mode" name="div_security_infra_mode"> 
    <td class="head_top" id="secureSecureMode" width="30%" onMouseOver="Security_Mode_toptip(); " onMouseOut="return nd();">Authentication Type</td>
    <td class="head_top_content" width="70%">
      <select name="security_mode" id="security_mode" size="1" onChange="securityMode(1)">
      </select>

    </td>
  </tr>
  <tr id="div_security_shared_mode" name="div_security_shared_mode" style="visibility: hidden;"> 
    <td class="head" id="secureEncrypType" onMouseOver="Encrypt_Type_toptip(); " onMouseOut="return nd();">Encrypt Type</td>
    <td class="head_content">
      <select name="security_shared_mode" id="security_shared_mode" size="1" onChange="securityMode(1)">
		<option value=WEP>WEP</option>
		<option value=NONE id="secureEncrypTypeNone">NO ENCRYPTION</option>
      </select>
    </td>
  </tr>
</tbody></table>

<br>

<!-- WEP -->
<table id="div_wep" name="div_wep" border="0" cellpadding="10" cellspacing="0" width="100%" style="visibility: hidden;">
  <tbody><tr> 
    <td class="title" colspan="4" id="secureWEP">WEP</td>
  </tr>

  <tr> 
    <td class="head_top" colspan="2" id="secureWEPDefaultKey" width="30%" onMouseOver="Default_Key_toptip(); "onMouseOut="return nd();">Default Key</td>
    <td  class="head_top_content" colspan="2" width="70%">
      <select name="wep_default_key" id="wep_default_key" size="1" onChange="setChange(1)">
	<option value="0" id="secureWEPDefaultKey1">Key 1</option>
	<option value="1" id="secureWEPDefaultKey2">Key 2</option>
	<option value="2" id="secureWEPDefaultKey3">Key 3</option>
	<option value="3" id="secureWEPDefaultKey4">Key 4</option>
      </select>
    </td>
  </tr>
  
  <tr> 
    <td class="head" rowspan="4" id="secureWEPKey" onMouseOver="WEP_Keys_toptip(); "onMouseOut="return nd();">WEP Keys</td>
    <td class="head_content_2" id="secureWEPKey1">WEP Key 1 :</td>
    <td class="head_content_2"><input name="wep_key_1" id="WEP1" maxlength="26" type="password" value="" onKeyUp="setChange(1)">
	    <select id="WEP1Select" name="WEP1Select" onChange="setChange(1)"> 
		<option value="1">ASCII</option>
		<option value="0">Hex</option>
		</select></td>
  </tr>

  <tr> 
    <td class="head_content_2" id="secureWEPKey2">WEP Key 2 : </td>
    <td class="head_content"><input name="wep_key_2" id="WEP2" maxlength="26" type="password"  value="" onKeyUp="setChange(1)">
        <select id="WEP2Select" name="WEP2Select" onChange="setChange(1)">
		<option value="1">ASCII</option>
		<option value="0">Hex</option>
		</select></td>
  </tr>
  <tr> 
    <td class="head_content_2" id="secureWEPKey3">WEP Key 3 : </td>
    <td class="head_content"><input name="wep_key_3" id="WEP3" maxlength="26" type="password"  value="" onKeyUp="setChange(1)">
        <select id="WEP3Select" name="WEP3Select" onChange="setChange(1)">
		<option value="1">ASCII</option>
		<option value="0">Hex</option>
		</select></td>
  </tr>
  <tr> 
    <td class="head_content_2" id="secureWEPKey4">WEP Key 4 : </td>
    <td class="head_content"><input name="wep_key_4" id="WEP4" maxlength="26" type="password"  value="" onKeyUp="setChange(1)">
        <select id="WEP4Select" name="WEP4Select" onChange="setChange(1)">
		<option value="1">ASCII</option>
		<option value="0">Hex</option>
		</select></td>
  </tr>
</tbody></table>
<!-- <br /> -->

<!-- WPA -->
<table id="div_wpa" name="div_wpa" border="0" cellpadding="10" cellspacing="0" width="100%" style="visibility: hidden;">
  <tbody><tr>
    <td class="title" colspan="2" id="secreWPA">WPA</td>
  </tr>
  <tr id="div_wpa_algorithms" name="div_wpa_algorithms" style="visibility: hidden;"> 
    <td class="head_top" id="secureWPAAlgorithm" width="30%" onMouseOver="WPA_Algorithms_toptip(); "onMouseOut="return nd();">WPA Algorithms</td>
    <td class="head_top_content" width="70%">
      <input name="cipher" id="cipher" value="0" type="radio" onClick="onWPAAlgorithmsClick(0)">TKIP &nbsp;
      <input name="cipher" id="cipher" value="1" type="radio" onClick="onWPAAlgorithmsClick(1)">AES &nbsp;
      <input name="cipher" id="cipher" value="2" type="radio" onClick="onWPAAlgorithmsClick(2)">AUTO &nbsp;
    </td>
  </tr>
  <tr id="wpa_passphrase" name="wpa_passphrase" style="visibility: hidden;">
    <td class="head" id="secureWPAPassPhrase" onMouseOver="Pass_Phrase_toptip(); "onMouseOut="return nd();">Pass Phrase</td>
    <td class="head_content">
      <input name="passphrase" id="passphrase" type="password"  size="28" maxlength="64" value="" onKeyUp="setChange(1)">
    </td>
  </tr>

  <tr id="wpa_key_renewal_interval" name="wpa_key_renewal_interval" style="visibility: hidden;display:none">
    <td class="head" id="secureWPAKeyRenewInterval" onMouseOver="Key_Renewal_Interval_toptip(); "onMouseOut="return nd();">Key Renewal Interval</td>
    <td class="head_content">
      <input name="keyRenewalInterval" id="keyRenewalInterval" size="4" maxlength="4" value="3600" onKeyUp="setChange(1)"><span id="keyRenewalIntervalinput">seconds</span>
    </td>
  </tr>

  <tr id="wpa_PMK_Cache_Period" name="wpa_PMK_Cache_Period" style="visibility: hidden;display:none">
    <td class="head" id="secureWPAPMKCachePeriod" onMouseOver="PMK_Cache_Period_toptip(); "onMouseOut="return nd();">PMK Cache Period</td>
    <td class="head_content">
      <input name="PMKCachePeriod" id="PMKCachePeriod" size="4" maxlength="4" value="" onKeyUp="setChange(1)"><span id="PMKCachePeriodinput"> Minutes </span>
    </td>
  </tr>

  <tr id="wpa_preAuthentication" name="wpa_preAuthentication" style="visibility: hidden;display:none">
    <td class="head" id="secureWPAPreAuth" onMouseOver="Pre_Authentication_toptip(); "onMouseOut="return nd();">Pre-Authentication</td>
    <td class="head_content">
      <input name="PreAuthentication" id="PreAuthentication" value="0" type="radio" onClick="onPreAuthenticationClick(0)"><font id="secureWPAPreAuthDisable">Disable &nbsp;</font>
      <input name="PreAuthentication" id="PreAuthentication" value="1" type="radio" onClick="onPreAuthenticationClick(1)"><font id="secureWPAPreAuthEnable">Enable &nbsp;</font>
    </td>
  </tr>
</tbody></table>


<!-- 802.1x -->
<!-- WEP  -->
<table id="div_8021x_wep" name="div_8021x_wep" cellpadding="10" cellspacing="0" width="100%" style="visibility: hidden;display:none">
  <tbody>
  <tr>
    <td class="title" colspan="2" id="secure8021XWEP">802.1x WEP</td>
  </tr>
  <tr>
		<td class="head_top" id="secure1XWEP" width="30%" onMouseOver="WEP_toptip(); "onMouseOut="return nd();"> WEP </td>
		<td class="head_top_content" width="70%">
	      <input name="ieee8021x_wep" id="ieee8021x_wep" value="0" type="radio" onClick="onIEEE8021XWEPClick(0)"><font id="secure1XWEPDisable">Disable &nbsp;</font>
    	  <input name="ieee8021x_wep" id="ieee8021x_wep" value="1" type="radio" onClick="onIEEE8021XWEPClick(1)"><font id="secure1XWEPEnable">Enable</font>
		</td>
  </tr>
</tbody></table>

<br>
<table id="div_radius_server" name="div_radius_server" cellpadding="10" cellspacing="0" width="100%" style="visibility: hidden;">
<tbody>
   <tr>
    <td class="title" colspan="2" id="secureRadius">Radius Server</td>
   </tr>
    <tr> 
		<td class="head_top" id="secureRadiusIPAddr" width="30%" onMouseOver="IP_Address_toptip(); "onMouseOut="return nd();"> IP Address </td>
		<td class="head_top_content" width="70%">
		<input name="RadiusServerIP" id="RadiusServerIP" size="16" maxlength="32" value="" onKeyUp="setChange(1)"> </td>
	</tr>
    <tr> 
		<td class="head" id="secureRadiusPort" onMouseOver="Port_toptip(); "onMouseOut="return nd();"> Port </td>
		<td class="head_content"> <input name="RadiusServerPort" id="RadiusServerPort" size="5" maxlength="5" value="" onKeyUp="setChange(1)"> </td>
	</tr>
    <tr> 
		<td class="head" id="secureRadiusSharedSecret" onMouseOver="Shared_Secret_toptip(); "onMouseOut="return nd();"> Shared Secret </td>
		<td class="head_content"> <input name="RadiusServerSecret" id="RadiusServerSecret" size="16" maxlength="64" value="" onKeyUp="setChange(1)"> </td>
	</tr>
    <tr> 
		<td class="head" id="secureRadiusSessionTimeout" onMouseOver="Session_Timeout_toptip(); "onMouseOut="return nd();"> Session Timeout </td>
		<td class="head_content"> <input name="RadiusServerSessionTimeout" id="RadiusServerSessionTimeout" size="3" maxlength="4" value="0" onKeyUp="setChange(1)"> </td>
	</tr>
    <tr> 
		<td class="head" id="secureRadiusIdleTimeout" onMouseOver="Idle_Timeout_toptip(); "onMouseOut="return nd();"> Idle Timeout </td>
		<td class="head_content"> <input name="RadiusServerIdleTimeout" id="RadiusServerIdleTimeout" size="3" maxlength="4" value="" onKeyUp="setChange(1)" readonly> </td>
	</tr>
</tbody></table>

<script language="JavaScript" type="text/javascript">
var aptable;

for(aptable = 0; aptable < MBSSID_MAX; aptable++){
	document.write(" <table id=AccessPolicy_"+ aptable +" cellpadding=10 cellspacing=0 width=100% style=\"visibility: hidden;display:none\">");
	document.write(" <tbody> <tr> <td class=title colspan=2 >"+Get_string('wireless macfiltering')+"</td></tr>");
	document.write(" <tr> <td class=head_top id=wifisecuritymacfilter onMouseOver=\"Add_MAC_Filtering_Rule_toptip();\" onMouseOut=\"return nd();\">"+Get_string('wifi securitymacfilter')+"</td>");
	document.write(" <td class=head_top_content> <select name=apselect_"+ aptable + " id=apselect_"+aptable+" size=1 onchange=\"setChange(1)\">");
	document.write(" <option value=0 >"+Get_string('wireless disable')+"</option> <option value=1 >"+Get_string('wireless allow')+"</option><option value=2 >"+Get_string('wireless reject')+"</option></select> </td></tr>");

	document.write("<tr id=macfilteraddress name=macfilteraddress><td class=head id=wifisecuritymacaddress onMouseOver=\"MAC_Address_toptip();\" onMouseOut=\"return nd();\">"+Get_string('wifi securitymacaddress')+"</td>");
	document.write("<td class=head_content>	<input name=newap_text_"+aptable+" id=newap_text_"+aptable+" size=16 maxlength=20>	</td>	</tr>");
	
	for(i=0; i< ACCESSPOLICYLIST_MAX/2; i++){
		input_name = "newap_"+ aptable +"_" + (2*i);
		td_name = "newap_td_"+ aptable +"_" + (2*i);

		document.write(" <tr id=id_"+aptable+"_");
		document.write(i*2);
		document.write("> <td id=");
		document.write(td_name);
		document.write(" class=head> <input style=\"width: 30px;\" value=Del onclick=\"delap("+aptable+", ");
		document.write(2*i);
		document.write(")\" type=button > <input id=");
		document.write(input_name);
		document.write(" size=16 maxlength=20 readonly></td>");

		input_name = "newap_" + aptable + "_" + (2*i+1);
		td_name = "newap_td_" + aptable + "_" + (2*i+1);
		document.write("      <td id=");
		document.write(td_name);
		document.write(" class=head_content> <input style=\"width: 30px;\" value=Del onclick=\"delap("+aptable+", ");
		document.write(2*i+1);
		document.write(")\" type=button> <input id=");
		document.write(input_name);
		document.write(" size=16 maxlength=20 readonly></td> </tr>");
	}
	document.write("</tbody></table>");
}
</script>

<!-- <br /> -->
<table border="0" cellpadding="10" cellspacing="0" width="100%">
<tbody><tr align="right">
    <td>
      <input class="btn" value="Apply" id="secureApply" onClick="submit_apply()" type="button"> &nbsp; &nbsp;
      <input class="btn" value="Cancel" id="secureCancel" type="reset" onClick="window.location.reload()" >
    </td>
  </tr>
</tbody>
</table>
</td>
</tr>
</table>
</form>

</body></html>
 
