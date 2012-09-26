<html>                                      
<head>                                                                      
<title>Verizon Fivespot</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../style/normal_ws.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="../js/prompt.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/utils.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/spec.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/validate.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/wlan.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/toptip.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/overlib.js" type="text/javascript"></script> 
<script language="JavaScript" src="../js/lang.js" type=text/JavaScript></script>
<script type="text/javascript">
		Butterlate.setTextDomain("air_network");
/*don't remove it*/
var which_index;
var profile_most_num;

	var default_apn = "ONDA";
	var g_apn = new Array(10);
	g_apn[0] = '<% asp_get("APN_config0"); %>';
	g_apn[1] = '<% asp_get("APN_config1"); %>';
	g_apn[2] = '<% asp_get("APN_config2"); %>';
	g_apn[3] = '<% asp_get("APN_config3"); %>';
	g_apn[4] = '<% asp_get("APN_config4"); %>';
	g_apn[5] = '<% asp_get("APN_config5"); %>';
	g_apn[6] = '<% asp_get("APN_config6"); %>';
	g_apn[7] = '<% asp_get("APN_config7"); %>';
	g_apn[8] = '<% asp_get("APN_config8"); %>';
	g_apn[9] = '<% asp_get("APN_config9"); %>';
	
	var m_profile_name;
	var m_wan_apn;	
	var m_auto_apn;	
		
	m_profile_name = '<% asp_get("m_profile_name"); %>';
	m_wan_apn = '<% asp_get("wan_apn"); %>';
	m_auto_apn = '<% asp_get("apn_select"); %>';
	
function initTranslation()
{
	e = document.getElementById("3G_tn_APNSet");
	e.innerHTML = Get_string("3G TN APN Setting");
	
	e = document.getElementById("3GCurrentSatus");
	e.innerHTML = Get_string("3G APN Current Status");
	
	e = document.getElementById("3GProfileSel");
	e.innerHTML = Get_string("3G APN Profile selecetion");
	
	e = document.getElementById("3GProfileName");
	e.innerHTML = Get_string("3G APN Profile Name");
	
	e = document.getElementById("3GAPNSetting");
	e.innerHTML = Get_string("3G APN APN Setting");
	
	e = document.getElementById("3GRadioAutoAPN");
	e.innerHTML = Get_string("3G APN Auto APN");
	
	e = document.getElementById("3GRadioManualAPN");
	e.innerHTML = Get_string("3G APN Manual APN");
	
	e = document.getElementById("3GAPN");
	e.innerHTML = Get_string("3G APN APN");
	
	e = document.getElementById("3GDialNo");
	e.innerHTML = Get_string("3G APN Dial No");
	
	e = document.getElementById("3GPDPType");
	e.innerHTML = Get_string("3G APN PDP Type");
	
	e = document.getElementById("3GPDPSet");
	e.innerHTML = Get_string("3G APN PDP Setting");
	
	e = document.getElementById("3GRadioAutoPDP");
	e.innerHTML = Get_string("3G APN Auto PDP");
	
	e = document.getElementById("3GRadioManualPDP");
	e.innerHTML = Get_string("3G APN Manual PDP");
	
	e = document.getElementById("3GPDPAddress");
	e.innerHTML = Get_string("3G APN PDP Address");
	
	e = document.getElementById("3GDNS");
	e.innerHTML = Get_string("3G APN DNS");
	
	e = document.getElementById("3GRadioAutoDNS");
	e.innerHTML = Get_string("3G APN Auto DNS");
	
	e = document.getElementById("3GRadioManualDNS");
	e.innerHTML = Get_string("3G APN Manual DNS");
	
	e = document.getElementById("3GPrimaryDNS");
	e.innerHTML = Get_string("3G APN Primary DNS");
	
	e = document.getElementById("3GSecondaryDNS");
	e.innerHTML = Get_string("3G APN Secondary DNS");
	
	e = document.getElementById("3GAuth");
	e.innerHTML = Get_string("3G APN Authentication");
	
	e = document.getElementById("3GUserName");
	e.innerHTML = Get_string("3G APN User Name");
	
	e = document.getElementById("3GPassword");
	e.innerHTML = Get_string("3G APN Password");
	
	e = document.getElementById("3GSave");
	e.value = Get_string("3G APN Save");
	
	e = document.getElementById("3GSetDefault");
	e.value = Get_string("3G APN Set Default");
	
	e = document.getElementById("3GAdd");
	e.value = Get_string("3G APN Add");
	
	e = document.getElementById("3GDel");
	e.value = Get_string("3G APNDelete");
}


function trim(stringToTrim) {
	return stringToTrim.replace(/^\s+|\s+$/g,"");
}

function apn_sel()
{
	document.getElementById('apn_input').style.display = "none";
	if(document.form_apn.apn_select[1].checked)
	{
		document.getElementById('apn_input').style.display = "";
		document.getElementById('wan_apn').disabled = false;
	}
  
}
function pdp_setting()
{
	document.getElementById('pdp_address').style.display = "none";
	if(document.form_apn.pdp_select[1].checked)
	{
		document.getElementById('pdp_address').style.display = "";
		document.getElementById('pdp_addr').disabled = false;
	}
  
}

function if_show()
{
	//Don't remove this line============================================
	document.getElementById('apn_current_status').style.display = "none";
	//Don't remove this line============================================
	document.getElementById('apn_input').style.display = "none";
	document.getElementById('pdp_address').style.display = "none";
	document.getElementById('p_dns').style.display = "none";
	document.getElementById('s_dns').style.display = "none";
	if(document.form_apn.dns_mode[1].checked)
	{
		document.getElementById('p_dns').style.display = "";
		document.getElementById('s_dns').style.display = "";
	}

	if(document.form_apn.pdp_select[1].checked)
	{
		document.getElementById('pdp_address').style.display = "";
	}

	if(document.form_apn.apn_select[1].checked)
	{
		document.getElementById('apn_input').style.display = "";
	}
}

	
function next_goto_page()
{
	var pppstate = '<% asp_get("ppp_status"); %>';
	var cardstate = '<% asp_get("modem_main_state"); %>';
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
	if ((pppstate == "ppp_connected")||(pppstate == "ppp_on_demand"))
	{
		document.form_apn.Submit_default.disabled=true;		
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
           ShowError(document.getElementById("wan_dial"),"3G APN SE Dial NO Error" );
           return false;
           
         }
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
function chkAPN() {  
	

	if(document.form_apn.apn_select[1].checked == true)
	{
		if(document.form_apn.wan_apn.value == "")
		{
			ShowError(document.getElementById("wan_apn"),"3G APN SE APN Cannot Empty" );
			return  false;
		}

	}
	if(document.form_apn.wan_dial.value == "")
	{
		ShowError(document.getElementById("wan_dial"),"3G APN SE NULL DIAL NO" );
		return  false;
	}
	if(document.form_apn.wan_dial.value != "")
	{
		if(false == checkdialno(document.form_apn.wan_dial.value))
		return  false;

	}

}
var kk=0;
var index_array = new Array();

function check_profile()
{
		var counter=0;
		var flag=-1;
		
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
	var arra = new Array();
		if(apn0 != ""){
			arra[counter++] =parsestr(apn0)[0];
		}
		if(apn1 != ""){
			arra[counter++] =parsestr(apn1)[0];
		}
		if(apn2 != ""){
			arra[counter++] =parsestr(apn2)[0];
		}
		if(apn3 != ""){
			arra[counter++] =parsestr(apn3)[0];
		}
		if(apn4 != ""){
			arra[counter++] =parsestr(apn4)[0];
		}
		if(apn5 != ""){
			arra[counter++] =parsestr(apn5)[0];
		}
		if(apn6 != ""){
			arra[counter++] =parsestr(apn6)[0];
		}
		if(apn7 != ""){
			arra[counter++] =parsestr(apn7)[0];
		}
		if(apn8 != ""){
			arra[counter++] =parsestr(apn8)[0];
		}
		if(apn9 != ""){
			arra[counter++] =parsestr(apn9)[0];
		}
		for(i=0;i<counter;i++)
		{
				//alert("for arra value o="+arra[i]);
			if(arra[i]==document.form_apn.profile_name.value)//====here is mod====
			{
				//alert("==ok  arra value="+arra[i]);
				//alert("profile_name.value="+document.form_apn.profile_name.value);
				document.form_apn.index.value = i;
				flag = 2;
				break;
			}
		}

		if(flag !=2)
		{
			if(counter==10)	//overflow
			{
				//alert("flag="+flag);
				//alert("counter="+counter);
				return false;
			}
			else
			{
				document.form_apn.index.value = counter ;
				//alert("counter<10&&flag !=2,document.form_apn.index.value="+document.form_apn.index.value);
				return true;
			}
		}

}
//============add 20090216=for multi apn=========HQS==========
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
	
	
var profile_num=0;
var opttext= new Array(kk);
var optvalue=new Array(kk);
var adjust_index=new Array(10);

function get_value()
{
	var arra = new Array();
		if(apn0 != "")
		{	
			profile_num=kk++;
			arra[profile_num] =parsestr(apn0)[0];
			adjust_index[profile_num]="APN_config0";
			
		}
		if(apn1 != "")
		{
			profile_num=kk++;
			arra[profile_num] =parsestr(apn1)[0];
			adjust_index[profile_num]="APN_config1";
			//alert("arra[1]="+arra[1]);
			//alert("kk="+kk);
		}
		if(apn2 != "")
		{
			profile_num=kk++;
			arra[profile_num] =parsestr(apn2)[0];
			adjust_index[profile_num]="APN_config2";
		}
		if(apn3 != "")
		{
			profile_num=kk++;
			arra[profile_num] =parsestr(apn3)[0];
			adjust_index[profile_num]="APN_config3";
		}
		if(apn4 != "")
		{
			profile_num=kk++;
			arra[profile_num] =parsestr(apn4)[0];
			adjust_index[profile_num]="APN_config4";
		}
		if(apn5 != "")
		{
			profile_num=kk++;
			arra[profile_num] =parsestr(apn5)[0];
			adjust_index[profile_num]="APN_config5";

		}
		if(apn6 != "")
		{
			profile_num=kk++;
			arra[profile_num] =parsestr(apn6)[0];
			adjust_index[profile_num]="APN_config6";
		}
		if(apn7 != "")
		{
			profile_num=kk++;
			arra[profile_num] =parsestr(apn7)[0];
			adjust_index[profile_num]="APN_config7";
		}
		if(apn8 != "")
		{
			profile_num=kk++;
			arra[profile_num] =parsestr(apn8)[0];
			adjust_index[profile_num]="APN_config8";
		}
		if(apn9 != "")
		{
			profile_num=kk++;
			arra[profile_num] =parsestr(apn9)[0];
			adjust_index[profile_num]="APN_config9";
			profile_most_num="full";
		}
		//alert("kk="+kk);
		//alert("profile_num="+profile_num);
	for(i=0;i<kk;i++)
	{
		if(arra[i] != "")
		{
			opttext[i]=arra[i];
			optvalue[i]="name"+i;
		}
	}
	
	var array_obj =new Array();
	var apn_index= '<% asp_get("apn_index"); %>';
	var apn_default="apn"+apn_index;
	//document.all.selShow.selectedIndex = apn_index;
	//alert(apn_default);
	array_obj=parsestr(apn_default);
	//alert('0 array_obj'+array_obj);
	document.form_apn.profile_name.value = array_obj[0];
	//alert("[2]="+array_obj[2]);
	if(array_obj[2] == 'auto')
	{
		document.form_apn.apn_select[0].checked=true;
		document.form_apn.wan_apn.value = '';
		document.getElementById('apn_input').style.display = "none";

	}
	else
	{
		document.form_apn.wan_apn.value = array_obj[1];
		document.form_apn.apn_select[1].checked=true;
		document.getElementById('apn_input').style.display = "";
	}
	document.form_apn.wan_dial.value = array_obj[3];
/*if(array_obj[4] == 'chap')
	{
		document.form_apn.ppp_auth_mode[0].checked=true;
	}
	else
	{
		document.form_apn.ppp_auth_mode[1].checked=true;
	}*/
	if(array_obj[4] == 'none')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 0;
	}
	else if(array_obj[4] == 'chap')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 1;
    }
    else if(array_obj[4] == 'pap')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 2;
	}
	
    else if(array_obj[4] == 'chap_pap')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 3;
	}
	
	
	document.form_apn.ppp_username.value = array_obj[5];
	document.form_apn.ppp_passwd.value = array_obj[6];
	//===================090331===============================
	if(array_obj[7] == 'IP'){
		document.form_apn.pdp_type[0].checked=true;
	}
	else{
		document.form_apn.pdp_type[1].checked=true;
	}
	if(array_obj[8] == 'manual'){
		document.form_apn.pdp_select[1].checked=true;
		document.form_apn.pdp_addr.value = array_obj[9];
		document.getElementById('pdp_address').style.display = "";

	}
	else{
		document.form_apn.pdp_select[0].checked=true;
		document.form_apn.pdp_addr.value = array_obj[9];
		document.getElementById('pdp_address').style.display = "none";
	}
	if(array_obj[10] == 'manual'){
		document.form_apn.dns_mode[1].checked=true;
		document.form_apn.prefer_dns_manual.value = array_obj[11];
		document.form_apn.standby_dns_manual.value = array_obj[12];
		document.getElementById('p_dns').style.display = "";
		document.getElementById('s_dns').style.display = "";
	}
	else{
		document.form_apn.dns_mode[0].checked=true;
		document.form_apn.prefer_dns_manual.value = array_obj[11];
		document.form_apn.standby_dns_manual.value = array_obj[12];
		document.getElementById('p_dns').style.display = "none";
		document.getElementById('s_dns').style.display = "none";
	}
	
	//-=======================================================

}
function change(object)
{
	var array_obj = new Array();
	opt=object.options[object.selectedIndex];
	//alert("selectedIndex="+object.selectedIndex);
	//alert(opt.value+" : "+opt.text);
	which_index = object.selectedIndex;
	var ttt = 'apn'+object.selectedIndex;
	
	//alert(object.options[object.selectedIndex].text);
	//delete a record middle it show error,so----------------------
	//middle_delete_show();
	//-------------------------------------------------------------
	var apn_obj = eval(ttt);
	
	for(i=0 ;i < document.form_apn.selShow.length ;i++)
	{
		//alert(document.form_apn.selShow[i].text + "  " + document.getElementById('profile_name').value);
		if(document.form_apn.selShow[i].text =="Add new")
		{
			object.remove(i);
		}
	}
	
	array_obj=parsestr(apn_obj);
	document.form_apn.profile_name.value = array_obj[0];
	//alert("[2]="+array_obj[2]);
	if(array_obj[2] == 'auto')
	{
		document.form_apn.apn_select[0].checked=true;
		document.form_apn.wan_apn.value = '';
		document.getElementById('apn_input').style.display = "none";

	}
	else
	{
		document.form_apn.apn_select[1].checked=true;
		document.form_apn.wan_apn.value = array_obj[1];
		document.getElementById('apn_input').style.display = "";
	}
	document.form_apn.wan_dial.value = array_obj[3];
/*	if(array_obj[4] == 'chap')
	{
		document.form_apn.ppp_auth_mode[0].checked=true;
	}
	else
	{
		document.form_apn.ppp_auth_mode[1].checked=true;
	}
	*/
		if(array_obj[4] == 'none')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 0;
	}
	else if(array_obj[4] == 'chap')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 1;
    }
    else if(array_obj[4] == 'pap')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 2;
	}
	
    else if(array_obj[4] == 'chap_pap')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 3;
	}
	
	document.form_apn.ppp_username.value = array_obj[5];
	document.form_apn.ppp_passwd.value = array_obj[6];
	//===================090331===============================
	if(array_obj[7] == 'IP'){
		document.form_apn.pdp_type[0].checked=true;
	}
	else{
		document.form_apn.pdp_type[1].checked=true;
	}
	if(array_obj[8] == 'manual'){
		document.form_apn.pdp_select[1].checked=true;
		document.form_apn.pdp_addr.value = array_obj[9];
		document.getElementById('pdp_address').style.display = "";

	}
	else{
		document.form_apn.pdp_select[0].checked=true;
		document.form_apn.pdp_addr.value = array_obj[9];
		document.getElementById('pdp_address').style.display = "none";
	}
	if(array_obj[10] == 'manual'){
		document.form_apn.dns_mode[1].checked=true;
		document.form_apn.prefer_dns_manual.value = array_obj[11];
		document.form_apn.standby_dns_manual.value = array_obj[12];
		document.getElementById('p_dns').style.display = "";
		document.getElementById('s_dns').style.display = "";
	}
	else{
		document.form_apn.dns_mode[0].checked=true;
		document.form_apn.prefer_dns_manual.value = array_obj[11];
		document.form_apn.standby_dns_manual.value = array_obj[12];
		document.getElementById('p_dns').style.display = "none";
		document.getElementById('s_dns').style.display = "none";
	}

	//-=======================================================


	//alert(document.getElementById('profile_name').value  + "  " +m_profile_name );
	//add by maxl
	if(document.getElementById('profile_name').value == parsestr(apn0)[0] 
	|| document.getElementById('profile_name').value ==m_profile_name)
	{
		document.getElementById('profile_name').disabled = true;
		document.form_apn.apn_select[0].disabled = true;
		document.form_apn.apn_select[1].disabled = true;	
		
		if(document.form_apn.apn_select[1].checked == true )
				document.getElementById('wan_apn').disabled = true;
			
		document.getElementById('wan_dial').disabled = true;
		/*
		document.form_apn.ppp_auth_mode[0].disabled = true;
		document.form_apn.ppp_auth_mode[1].disabled = true;
		*/
		document.getElementById('ppp_auth_mode').disabled = true;
		//alert('chang ppp_auth_mode is disabled');
		
		document.getElementById('ppp_username').disabled = true;
		document.getElementById('ppp_passwd').disabled = true;
		//090331===============================
		document.form_apn.pdp_select[0].disabled = true;
		document.form_apn.pdp_select[1].disabled = true;
		if(document.form_apn.pdp_select[1].checked == true )
				document.getElementById('pdp_addr').disabled = true;

		document.form_apn.pdp_type[0].disabled = true;
		document.form_apn.pdp_type[1].disabled = true;
		
		document.form_apn.dns_mode[0].disabled=true;
		document.form_apn.dns_mode[1].disabled=true;
		if(document.form_apn.dns_mode[1].checked == true )
		{
			document.getElementById('prefer_dns_manual').disabled = true;
			document.getElementById('standby_dns_manual').disabled = true;
		}
		//=========================================
	}
	else
	{
		document.getElementById('profile_name').disabled = false;
		document.form_apn.apn_select[0].disabled = false;
		document.form_apn.apn_select[1].disabled = false;	
		
		if(document.form_apn.apn_select[1].checked == true )
				document.getElementById('wan_apn').disabled = false;
				
		document.getElementById('wan_dial').disabled = false;
//		document.form_apn.ppp_auth_mode[0].disabled = false;
//		document.form_apn.ppp_auth_mode[1].disabled = false;
		document.getElementById('ppp_auth_mode').disabled = false;
//		alert('ppp_auth_mode is enabled');
		
		document.getElementById('ppp_username').disabled = false;
		document.getElementById('ppp_passwd').disabled = false;	
		
		//add 20090330
				document.form_apn.pdp_select[0].disabled = false;
		document.form_apn.pdp_select[1].disabled = false;
		if(document.form_apn.pdp_select[1].checked == true )
				document.getElementById('pdp_addr').disabled = false;

		document.form_apn.pdp_type[0].disabled = false;
		document.form_apn.pdp_type[1].disabled = false;
				
		document.form_apn.dns_mode[0].disabled=false;
		document.form_apn.dns_mode[1].disabled=false;
		if(document.form_apn.dns_mode[1].checked == true )
		{
			document.getElementById('prefer_dns_manual').disabled = false;
			document.getElementById('standby_dns_manual').disabled = false;
		}

	}
	
	if(m_auto_apn == "auto" )
	{
		document.getElementById("status").innerHTML = "<font face='Arial'  size='2'><strong>" 
		+ m_profile_name + " / AutoAPN "	+ "</strong></font></td>";
	}else
	{
		document.getElementById("status").innerHTML = "<font face='Arial'  size='2'><strong>" 
		+ m_profile_name + " / manual: "	+m_wan_apn + "</strong></font></td>";
	}
	
}

function when_load(object)
{
	var array_obj = new Array();
	opt=object.options[object.selectedIndex];
	//alert("selectedIndex="+object.selectedIndex);
	//alert(opt.value+" : "+opt.text);
	var apn_index= '<% asp_get("Current_index"); %>';
	var operation= '<% asp_get("action"); %>';
	/**bellow line is insteaded with above two lines**/
	//var apn_index= '<% asp_get("apn_index"); %>';
	var apn_default="apn"+apn_index;
	object.selectedIndex = apn_index;
	//alert(apn_default);
	//array_obj=parsestr(apn_default);

	var ttt = 'apn'+object.selectedIndex;
	var apn_obj = eval(ttt);
	
	for(i=0 ;i < document.form_apn.selShow.length ;i++)
	{
		//alert(document.form_apn.selShow[i].text + "  " + document.getElementById('profile_name').value);
		if(document.form_apn.selShow[i].text =="Add new")
		{
			object.remove(i);
		}
	}
	
	array_obj=parsestr(apn_obj);
	document.form_apn.profile_name.value = array_obj[0];
	//alert("[2]="+array_obj[2]);
	if(array_obj[2] == 'auto')
	{
		document.form_apn.apn_select[0].checked=true;
		document.form_apn.wan_apn.value = '';
		document.getElementById('apn_input').style.display = "none";

	}
	else
	{
		document.form_apn.apn_select[1].checked=true;
		document.form_apn.wan_apn.value = array_obj[1];
		document.getElementById('apn_input').style.display = "";
	}
	document.form_apn.wan_dial.value = array_obj[3];
/*	if(array_obj[4] == 'chap')
	{
		document.form_apn.ppp_auth_mode[0].checked=true;
	}
	else
	{
		document.form_apn.ppp_auth_mode[1].checked=true;
	}
	*/
    if(array_obj[4] == 'none')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 0;
	}
	else if(array_obj[4] == 'chap')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 1;
    }
    else if(array_obj[4] == 'pap')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 2;
	}
	
    else if(array_obj[4] == 'chap_pap')
	{
	document.form_apn.ppp_auth_mode.options.selectedIndex = 3;
	}
	

	document.form_apn.ppp_username.value = array_obj[5];
	document.form_apn.ppp_passwd.value = array_obj[6];
	//===================090331===============================
	if(array_obj[7] == 'IP'){
		document.form_apn.pdp_type[0].checked=true;
	}
	else{
		document.form_apn.pdp_type[1].checked=true;
	}
	if(array_obj[8] == 'manual'){
		document.form_apn.pdp_select[1].checked=true;
		document.form_apn.pdp_addr.value = array_obj[9];
		document.getElementById('pdp_address').style.display = "";

	}
	else{
		document.form_apn.pdp_select[0].checked=true;
		document.form_apn.pdp_addr.value = array_obj[9];
		document.getElementById('pdp_address').style.display = "none";
	}
	if(array_obj[10] == 'manual'){
		document.form_apn.dns_mode[1].checked=true;
		document.form_apn.prefer_dns_manual.value = array_obj[11];
		document.form_apn.standby_dns_manual.value = array_obj[12];
		document.getElementById('p_dns').style.display = "";
		document.getElementById('s_dns').style.display = "";
	}
	else{
		document.form_apn.dns_mode[0].checked=true;
		document.form_apn.prefer_dns_manual.value = array_obj[11];
		document.form_apn.standby_dns_manual.value = array_obj[12];
		document.getElementById('p_dns').style.display = "none";
		document.getElementById('s_dns').style.display = "none";
	}

	//-=======================================================


	//alert(document.getElementById('profile_name').value  + "  " +m_profile_name );
	//add by maxl
	if((document.getElementById('profile_name').value == parsestr(apn0)[0] 
	|| document.getElementById('profile_name').value ==m_profile_name)&&(operation != "save"))
	/***add judge condition:operation != "save"***/
	{
		document.getElementById('profile_name').disabled = true;
		document.form_apn.apn_select[0].disabled = true;
		document.form_apn.apn_select[1].disabled = true;	
		
		if(document.form_apn.apn_select[1].checked == true )
				document.getElementById('wan_apn').disabled = true;
			
		document.getElementById('wan_dial').disabled = true;
//		document.form_apn.ppp_auth_mode[0].disabled = true;
//		document.form_apn.ppp_auth_mode[1].disabled = true;
		document.getElementById('ppp_auth_mode').disabled = true;
//		alert('load ppp_auth_mode is disabled');

		document.getElementById('ppp_username').disabled = true;
		document.getElementById('ppp_passwd').disabled = true;
		//090331===============================
		document.form_apn.pdp_select[0].disabled = true;
		document.form_apn.pdp_select[1].disabled = true;
		if(document.form_apn.pdp_select[1].checked == true )
				document.getElementById('pdp_addr').disabled = true;

		document.form_apn.pdp_type[0].disabled = true;
		document.form_apn.pdp_type[1].disabled = true;
		
		document.form_apn.dns_mode[0].disabled=true;
		document.form_apn.dns_mode[1].disabled=true;
		if(document.form_apn.dns_mode[1].checked == true )
		{
			document.getElementById('prefer_dns_manual').disabled = true;
			document.getElementById('standby_dns_manual').disabled = true;
		}
		//=========================================
	}
	else
	{
		document.getElementById('profile_name').disabled = false;
		document.form_apn.apn_select[0].disabled = false;
		document.form_apn.apn_select[1].disabled = false;	
		
		if(document.form_apn.apn_select[1].checked == true )
				document.getElementById('wan_apn').disabled = false;
				
		document.getElementById('wan_dial').disabled = false;
//		document.form_apn.ppp_auth_mode[0].disabled = false;
//		document.form_apn.ppp_auth_mode[1].disabled = false;
		document.getElementById('ppp_auth_mode').disabled = false;
//		alert('load ppp_auth_mode is disabled');

		document.getElementById('ppp_username').disabled = false;
		document.getElementById('ppp_passwd').disabled = false;	
		
		//add 20090330
				document.form_apn.pdp_select[0].disabled = false;
		document.form_apn.pdp_select[1].disabled = false;
		if(document.form_apn.pdp_select[1].checked == true )
				document.getElementById('pdp_addr').disabled = false;

		document.form_apn.pdp_type[0].disabled = false;
		document.form_apn.pdp_type[1].disabled = false;
				
		document.form_apn.dns_mode[0].disabled=false;
		document.form_apn.dns_mode[1].disabled=false;
		if(document.form_apn.dns_mode[1].checked == true )
		{
			document.getElementById('prefer_dns_manual').disabled = false;
			document.getElementById('standby_dns_manual').disabled = false;
		}

	}
	
	if(m_auto_apn == "auto" )
	{
		document.getElementById("status").innerHTML = "<font face='Arial'  size='2'><strong>" 
		+ m_profile_name + " / AutoAPN "	+ "</strong></font></td>";
	}else
	{
		document.getElementById("status").innerHTML = "<font face='Arial'  size='2'><strong>" 
		+ m_profile_name + " / manual: "	+m_wan_apn + "</strong></font></td>";
	}

}

function option(){
    var opt;
	//get_value();
    document.getElementById("selContainer").innerHTML="";
    document.getElementById("selContainer").innerHTML="<select name='selShow' id='selShow' onchange='change(this);'></select>";
	
    for(i=0;i<opttext.length;i++)
    {    opt=new Option();
        //or you may code like below:
        //opt=document.createElement("OPTION");
        opt.text=opttext[i];
        opt.value=optvalue[i];
        document.form_apn.selShow.options.add(opt);
    }
}
function parsestr(str){
//var   str="ZTE\t4567\t89\t0"; 
var   result=str.split('($)');
var arr = new Array();
for(var i=0;i<result.length;i++){
//alert("result="+result[i]);
	arr[i]=result[i];
	//alert("arr="+arr);
}
//alert("arr_out="+arr);
//alert("arr0="+arr[0])
//alert("arr1="+arr[1])
//alert("arr2="+arr[2])
return arr;
}
var flag=-1;
function send_value()
{
		var counter=0;
		
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
	var arra = new Array();
		if(apn0 != ""){
			counter++;
			arra[0] =parsestr(apn0)[0];
		}
		if(apn1 != ""){
			counter++;
			arra[1] =parsestr(apn1)[0];
		}
		if(apn2 != ""){
			counter++;
			arra[2] =parsestr(apn2)[0];
		}
		if(apn3 != ""){
			counter++;
			arra[3] =parsestr(apn3)[0];
		}
		if(apn4 != ""){
			counter++;
			arra[4] =parsestr(apn4)[0];
		}
		if(apn5 != ""){
			counter++;
			arra[5] =parsestr(apn5)[0];
		}
		if(apn6 != ""){
			counter++;
			arra[6] =parsestr(apn6)[0];
		}
		if(counter != ""){
			counter++;
			arra[7] =parsestr(apn7)[0];
		}
		if(apn8 != ""){
			counter++;
			arra[8] =parsestr(apn8)[0];
		}
		if(apn9 != ""){
			counter++;
			arra[9] =parsestr(apn9)[0];
		}
		for(i=0;i<10;i++)
		{
				//alert("arra value o="+arra[i]);
				//alert("profile_name.value o="+document.form_apn.profile_name.value);
			if((arra[i]==document.form_apn.profile_name.value)&&(i != 0))
			{
				//alert("arra value="+arra[i]);
				//alert("profile_name.value="+document.form_apn.profile_name.value);
				document.form_apn.index.value = i;
				flag = 2;
				break;
			}
			else if((arra[i]==document.form_apn.profile_name.value)&&(i == 0))
			{
				flag=3;
				break;
			}
		}

}
function save_submit()
{
	document.form_apn.ifdelete.value = "save";
	if( document.getElementById('profile_name').disabled == true)
		{
			alert("You can't modify the APN properties that is in use. ");
			return false;
		}
		
	for(i=0 ;i < document.form_apn.selShow.length ;i++)
	{
		//alert(document.form_apn.selShow[i].text + "  " + document.getElementById('profile_name').value);
		if(document.form_apn.selShow[i].text == document.getElementById('profile_name').value
		&& document.form_apn.selShow.options[document.form_apn.selShow.selectedIndex].text != document.getElementById('profile_name').value   )
		{
		ShowError(document.getElementById('profile_name'),"3G APN SE Profile Name Exist" );
		return false;
		}
	}

	if(check_profile()== false)
	{
		alert("You can set 10 Profiles at most!");
		return false;
	}
	else
	{
		if(trim(document.getElementById('profile_name').value) =="" )
		{
			ShowError(document.getElementById('profile_name'),"3G APN SE Profile Name Cannot Empty" );
			return false;
		}
		if(trim(document.getElementById('profile_name').value) !="" )
		{
			if((checkASC_APN(document.form_apn.profile_name.value)==false)||(document.form_apn.profile_name.value.indexOf("($)")>=0))
				{
					ShowError(document.getElementById("profile_name"),"3G APN SE Invalid Char" );
					return false;
				}
		}
		if(trim(document.getElementById('wan_apn').value )=="" && document.form_apn.apn_select[1].checked == true)
		{
			ShowError(document.getElementById('wan_apn'),"3G APN SE APN Cannot Empty" );
			return false;
		}
		if(trim(document.getElementById('wan_apn').value )!="" && document.form_apn.apn_select[1].checked == true)
		{
				if((checkASC_APN(document.form_apn.wan_apn.value)==false )||(document.form_apn.wan_apn.value.indexOf("($)")>=0))
				{
					ShowError(document.getElementById("wan_apn"),"3G APN SE Invalid Char" );
					return false;
				}
		}
				//add
		if(trim(document.getElementById('wan_dial').value )=="")
		{
			ShowError(document.getElementById('wan_dial'),'3G APN SE NULL DIAL NO');
			return false;
		}
		if(false == checkdialno(document.form_apn.wan_dial.value))
		{
					return  false;
		}
		if(document.form_apn.pdp_select[1].checked == true)
		{
			if(validatepdp_Ip(document.form_apn.pdp_addr.value)==false) 
			{
				ShowError(document.getElementById("pdp_addr"),'3G APN PDP Address invalid');
				return false;
			}
		}
		if(document.form_apn.dns_mode[1].checked == true)
		{
			if(validatepdp_Ip(document.form_apn.prefer_dns_manual.value)==false)
			{ 
				ShowError(document.getElementById("prefer_dns_manual"),'3G APN Primary DNS invalid');
				return false;
			}
			else if(validatepdp_Ip(document.form_apn.standby_dns_manual.value)==false) 
			{
				ShowError(document.getElementById("standby_dns_manual"),'3G APN Secondary DNS invalid');
				return false;
			}
		}
		if(trim(document.getElementById('ppp_username').value) !="" )
		{
			if((checkASC_APN(document.form_apn.ppp_username.value)==false )||(document.form_apn.ppp_username.value.indexOf("($)")>=0))
				{
					ShowError(document.getElementById("ppp_username"),"3G APN SE Invalid Char" );
					return false;
				}
		}
		if(trim(document.getElementById('ppp_passwd').value) !="" )
		{
			if((checkASC_APN(document.form_apn.ppp_passwd.value)==false )||(document.form_apn.ppp_passwd.value.indexOf("($)")>=0))
				{
					ShowError(document.getElementById("ppp_passwd"),"3G APN SE Invalid Char" );
					return false;
				}
		}		
		document.form_apn.submit();
	}
	
}

function addOptions(optionMenu, optionItems, optionValue) {

	removeOptions(optionMenu);

	for (i=0;i<optionItems.length; i++) {
		optionMenu[i]=new Option(optionItems[i], optionValue[i]);
	}
}

function removeOptions(optionMenu)
{
	var len = optionMenu.options.length;
	
	for (i=0; i<len; i++)
		optionMenu.remove(0);
}

function  add_submit(optionMenu)
{	
	var count =0;
	//if(optionMenu.length >=10)
	if(profile_most_num == "full")
	{
			alert("Sorry!  You can only add 10 items at most!");
			return false;
	}
		
	for(i=0;i< 10 ; i++)
	{
		var   result=(g_apn[i]).split('($)');
		if(result[0] != "")
		{
			count++;
		}
	}

	//alert("count :" + count + "\noptionMenu.length:" + optionMenu.length);
	if(count < optionMenu.length)
	{/*
		if(trim(document.getElementById('profile_name').value) =="" )
		{
			ShowError(document.getElementById('profile_name'),"3G APN SE Profile Name Cannot Empty" );
			return false;
		}
		if(trim(document.getElementById('wan_apn').value) ==""&& document.form_apn.apn_select[1].checked == true)
		{
			ShowError(document.getElementById('wan_apn'),"3G APN SE APN Cannot Empty" );
			return false;
		}*/
		/**let add button only has the new function,but don't has save function,so it don't need to check input also**/
		//if (confirm('do you want to save ?')==true)
		if (0)	
		{	
		     save_submit();
		}else
		{
			document.getElementById('profile_name').value = "";
			document.form_apn.apn_select[1].checked=true;
			document.getElementById('wan_apn').value = "";
			document.getElementById('wan_dial').value  = "";
			document.form_apn.ppp_auth_mode[1].checked=true;
			document.getElementById('ppp_username').value  = "";
			document.getElementById('ppp_passwd').value  = "";
			document.getElementById('pdp_addr').value = "";
			
			document.form_apn.dns_mode[1].checked == true;
			document.getElementById('prefer_dns_manual').value  = "";
			document.getElementById('standby_dns_manual').value  = "";

		}
		return false;
	}
		
 	opt=new Option();
	opt.text= "Add new";
	opt.value="new";
	optionMenu.options.add(opt);
	
	//clear 
	document.getElementById('profile_name').value = "";
	document.form_apn.apn_select[1].checked=true;
	document.getElementById('wan_apn').value = "";
	document.getElementById('wan_dial').value  = "";
	document.form_apn.ppp_auth_mode[0].checked=true;
	document.form_apn.ppp_auth_mode[1].checked=true;
	document.getElementById('ppp_username').value  = "";
	document.getElementById('ppp_passwd').value  = "";
			document.getElementById('pdp_addr').value = "";
			
			document.form_apn.dns_mode[1].checked == true;
			document.getElementById('prefer_dns_manual').value  = "";
			document.getElementById('standby_dns_manual').value  = "";
	//enable
	document.getElementById('profile_name').disabled = false;
		document.form_apn.apn_select[0].disabled = false;
		document.form_apn.apn_select[1].disabled = false;	
	document.getElementById('wan_apn').disabled = false;
	document.getElementById('wan_dial').disabled = false;
	
//	document.form_apn.ppp_auth_mode[0].disabled = false;
//	document.form_apn.ppp_auth_mode[1].disabled = false;
		document.getElementById('ppp_auth_mode').disabled = false;
//		alert('add ppp_auth_mode is disabled');
	
	document.getElementById('ppp_username').disabled = false;
	document.getElementById('ppp_passwd').disabled = false;
	
		document.form_apn.pdp_select[0].disabled = false;
		document.form_apn.pdp_select[1].disabled = false;
		document.form_apn.pdp_type[0].disabled = false;
		document.form_apn.pdp_type[1].disabled = false;
		document.getElementById('pdp_addr').disabled = false;
		
			document.form_apn.dns_mode[0].disabled = false;
			document.form_apn.dns_mode[1].disabled = false;
			document.getElementById('prefer_dns_manual').disabled = false;
			document.getElementById('standby_dns_manual').disabled = false;

			
	optionMenu.selectedIndex = optionMenu.length -1;
	document.form_apn.ifdelete.value = "add";
	apn_sel();
}
function dns_show()
{
	document.getElementById('p_dns').style.display = "none";
	document.getElementById('s_dns').style.display = "none";
	if(document.form_apn.dns_mode[1].checked)
	{
		document.getElementById('p_dns').style.display = "";
		document.getElementById('s_dns').style.display = "";
	}
  
}

function set_default_submit()
{
	var ppp_state = '<% asp_get("ppp_status"); %>';	
	if(ppp_state == "ppp_connected" )
	{
		alert("You can't  change the current APN setting when ppp is connected.");
		return false;
	}
	if(ppp_state == "ppp_disconnecting")
	{
		alert("You can't  change the current APN setting when ppp is disconnecting.");
		return false;
	}
	if( ppp_state == "ppp_connecting" )
	{
		alert("You can't  change the current APN setting when ppp is connecting.");
		return false;
	}
	
	
	document.form_apn.ifdelete.value = "set_default";
	
	for(i=0 ;i < document.form_apn.selShow.length ;i++)
	{
		if(document.form_apn.selShow[i].text == document.getElementById('profile_name').value
		&& document.form_apn.selShow.options[document.form_apn.selShow.selectedIndex].text != document.getElementById('profile_name').value )
		{
		ShowError(document.getElementById('profile_name'),"3G APN SE Profile Name Exist" );
		return false;
		}
	}

	
	if( document.getElementById('profile_name').disabled == true)
	{
		document.form_apn.profilename.value = "";
		document.form_apn.profile_for_bug.value="";
		document.form_apn.default_index.value = which_index;
		//mod-1
	}else
	{
		document.form_apn.profile_for_bug.value=document.getElementById('profile_name').value;
		document.form_apn.profilename.value = document.getElementById('profile_name').value;
	}


	if(check_profile()== false)
	{
		alert("You can set 10 Profiles at most!");
		return false;
	}
	else
	{
	if(trim(document.getElementById('profile_name').value) =="" )
		{
			ShowError(document.getElementById('profile_name'),"3G APN SE Profile Name Cannot Empty" );
			return false;
		}
		if(trim(document.getElementById('profile_name').value) !="" )
		{
			if(checkASC_APN(document.form_apn.profile_name.value)==false )
				{
					ShowError(document.getElementById("profile_name"),"3G APN SE Invalid Char" );
					return false;
				}
		}
		if(trim(document.getElementById('wan_apn').value )=="" && document.form_apn.apn_select[1].checked == true)
		{
			ShowError(document.getElementById('wan_apn'),"3G APN SE APN Cannot Empty" );
			return false;
		}
		if(trim(document.getElementById('wan_apn').value )!="" && document.form_apn.apn_select[1].checked == true)
		{
				if(checkASC_APN(document.form_apn.wan_apn.value)==false )
				{
					ShowError(document.getElementById("wan_apn"),"3G APN SE Invalid Char" );
					return false;
				}
		}
				//add
		if(trim(document.getElementById('wan_dial').value )=="")
		{
			ShowError(document.getElementById('wan_dial'),'3G APN SE NULL DIAL NO');
			return false;
		}
		if(false == checkdialno(document.form_apn.wan_dial.value))
		{
					return  false;
		}
		if(document.form_apn.pdp_select[1].checked == true)
		{
			if(validatepdp_Ip(document.form_apn.pdp_addr.value)==false) 
			{
				ShowError(document.getElementById("pdp_addr"),'3G APN PDP Address invalid');
				return false;
			}
		}
		if(document.form_apn.dns_mode[1].checked == true)
		{
			if(validatepdp_Ip(document.form_apn.prefer_dns_manual.value)==false)
			{ 
				ShowError(document.getElementById("prefer_dns_manual"),'3G APN Primary DNS invalid');
				return false;
			}
			else if(validatepdp_Ip(document.form_apn.standby_dns_manual.value)==false) 
			{
				ShowError(document.getElementById("standby_dns_manual"),'3G APN Secondary DNS invalid');
				return false;
			}
		}
		if(trim(document.getElementById('ppp_username').value) !="" )
		{
			if(checkASC_APN(document.form_apn.ppp_username.value)==false )
				{
					ShowError(document.getElementById("ppp_username"),"3G APN SE Invalid Char" );
					return false;
				}
		}
		if(trim(document.getElementById('ppp_passwd').value) !="" )
		{
			if(checkASC_APN(document.form_apn.ppp_passwd.value)==false )
				{
					ShowError(document.getElementById("ppp_passwd"),"3G APN SE Invalid Char" );
					return false;
				}
		}	
				
		document.form_apn.submit();
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
           //alert("Please input the Dial No. rightly!(It may be 0~9 or A,B,C,D,*,#)");
           ShowError(document.getElementById("wan_dial"),'3G APN SE Dial NO Error');
           return false;
           
         }
      }

 }

function  delete_submit()
{
		if( document.getElementById('profile_name').disabled == true)
		{
			alert("You can't delete the default profile.");
			return false;
		}
	document.form_apn.ifdelete.value = "delete";
	//alert("ifdelete="+document.form_apn.ifdelete.value);
		send_value();
		if(flag == 3)
		{
			alert("You can't delete the default profile");
			return false;
		}
		else if(flag == -1)
		{
			alert("Have not this profile in system currently");
		}
		else if(flag == 2)
		{
			document.form_apn.submit();
		}

}


</script>                                                                   
<style type="text/css">
<!--
.STYLE4 {font-size: 14px}
-->
</style>
</head>
<body bgcolor="white" vlink="#0000cc" alink="#0000cc" link="#0000cc" onLoad="initTranslation(); get_value();if_show();option();when_load(document.form_apn.selShow);next_goto_page();" style="overflow:scroll;overflow-x:hidden"; autocomplete="off">
	<!-- ================= showerror div begin================= -->
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
	<!-- ================= showerror div end================= -->
	<!-- ================= toptip div begin================= -->
	<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
	<!-- ================= toptip div end================= -->
    
<form name="form_apn" id="form_apn" onsubmit="return chkAPN();" method="post" action="/goform/multi_apn_proc">
	<input type="hidden" name="which_cgi" value="multi_apn">
	<input type="hidden" name="webpage" value="multi_apn.htm">
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td id="3GTitleWirelessIfo" class=listtopic colspan=2>WAN Settings--&gt;Wireless Info</td>
            			</tr>
			  </table>                                                                  
<table cellspacing="0" cellpadding="10" width="100%" border="0">
		<tr>
			<td valign="top">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
		<br>
		
		<TD align="center" class="unselectedMenu" width=155 height="20" ><A href="wireless_info.asp">&nbsp;&#8226; Wireless Info</A></TD>
		<TD align="center" class="unselectedMenu" width=155 height="20"><A href="net_select.asp">&#8226;Network Select</A></TD>          
		<TD align="center" class="unselectedMenu" width=250 height="20"><A href="net_connect.asp">&#8226;WAN Connection Mode</A></TD>
		<TD align="center" class="selectedMenu" width=250 height="20">&#8226;Multi APN</TD>
		<TD width="695"></TD>
	</table>                                                               
		                                                        
        <br >                                                                      
        <table name="apn_all" cellspacing="0" cellpadding="0" width="100%" border="0">
            
				<tr>
					<td id="3G_tn_APNSet" class="title" height="20"><b><font face="Arial" color="#0088C6">APN Setting</font></b></td>
				</tr>
				<tr id="apn_current_status">
					<td id="3GCurrentSatus" class="head_top" valign="top" width="22%" onMouseOver="current_status_toptip();" onMouseOut="return nd();"><font face="Arial"><strong> current status</strong></font></td>
					<td class="tail_top" id="status" name="status" valign="top" width="22%"><font face="Arial"  size="2"><strong>  (profile  /  APN)</strong></font></td>
				</tr>
				
				<tr>
					<td id="3GProfileSel" class="head_top" valign="top" width="22%"  onMouseOver="profile_select_toptip();" onMouseOut="return nd();"><font face="Arial"><strong>Profile Selection</strong> </font></td>
					<td class="tail_top" valign="top" width="78%">
					<span id="selContainer">
					<select id="selShow"><option >Empty</option></select>
					</span>
				<!--<select name="action">
                              <option style="font-family:Arial;" value="APN default" >
							  APN default </option>
                              <option style="font-family:Arial;" value="APN-1">
							  APN-1 </option>
							  <option style="font-family:Arial;" value="APN-2">
							  APN-2 </option>
							  <option style="font-family:Arial;" value="APN-3">
							  APN-3 </option>
                      </select></td>-->				</tr>
				<tr>
					<td id="3GProfileName" class="head" valign="vncellt" width="22%" onMouseOver="profile_name_toptip();" onMouseOut="return nd();"><font face="Arial">Profile Name</font></td>
					<td class="tail" valign="listr" width="78%" ><input type="text" maxlength="30" size="19" name="profile_name" id="profile_name"  style="font-family: Courier New;" ></td>
				</tr>
				<tr  valign="top">
						<td id="3GAPNSetting" width="22%" class="head" onMouseOver="setup_apn_toptip();" onMouseOut="return nd();">APN Setting </td>
						<td width="78%" class="tail">
						<input class="radiotype" type="radio" value="auto" name="apn_select" onClick="apn_sel();" > 
						<span id="3GRadioAutoAPN">Auto APN</span>
						<input class="radiotype" type="radio" value="manual" name="apn_select" onClick="apn_sel();" > 
				        <span id="3GRadioManualAPN">Manual APN</span></td>
		  </tr>
				
				<tr id="apn_input">
					<td id="3GAPN" class="head" valign="top" width="22%"><font face="Arial">APN</font></td>
					<td class="tail" valign="top" width="78%" >
					<input type="text" maxlength="30" size="19" name="wan_apn" id="wan_apn"   style="font-family: Courier New;" /></td>
				</tr>
				<tr>
					<td id="3GDialNo" class="head" valign="top" width="22%" onMouseOver="dial_setting_toptip();" onMouseOut="return nd();"><font face="Arial">Dial No. </font></td>
					<td class="tail" valign="top" width="78%" >
					<input type="text" maxlength="30" size="19" name="wan_dial" id="wan_dial"   style="font-family: Courier New;" /></td>
				</tr>
				<tr>
						<td id="3GPDPType" class="head" onMouseOver="PDP_Type_toptip();" onMouseOut="return nd();">PDP Type </td>
						<td width="78%" class="tail">
						<input class="radiotype" type="radio" value="IP" name="pdp_type" >
						<font face="Arial">IP&nbsp;&nbsp; </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="radiotype" type="radio" value="PPP" name="pdp_type" > 
						PPP</td>
					</tr>
				<tr  valign="top">
						<td id="3GPDPSet" width="22%" class="head" onMouseOver="pdp_setting_toptip();" onMouseOut="return nd();">PDP Setting </td>
						<td width="78%" class="tail">
						<input class="radiotype" type="radio" value="auto" name="pdp_select" onClick="pdp_setting();" > 
						<span id="3GRadioAutoPDP">Auto PDP&nbsp;&nbsp;</span>
					<input class="radiotype" type="radio" value="manual" name="pdp_select" onClick="pdp_setting();" > 
						<span id="3GRadioManualPDP">Manual PDP </span></td>
					</tr>	
					<tr id="pdp_address">
						<td id="3GPDPAddress" width="22%" class="head"><span>PDP Address</span></td>
						<td width="78%" class="tail">
						<input type="text" maxlength="15" size="15" name="pdp_addr"   id="pdp_addr" style="font-family: Courier New;">
						</td>
					</tr>				
				<tr>
						<td id="3GDNS" width="22%" valign="top" class="head" onMouseOver="dns_toptip();" onMouseOut="return nd();">DNS</td>
						<td width="78%" valign="top" class="tail">
						<input class="radiotype" type="radio" value="auto" name="dns_mode" onClick="dns_show();" > 
						<span id="3GRadioAutoDNS">Auto DNS</span>
						<input class="radiotype" type="radio" value="manual" name="dns_mode" onClick="dns_show();" > 
						<span id="3GRadioManualDNS">Manual DNS</span> </td>
					</tr>
					<tr id="p_dns" name="p_dns">
						<td id="3GPrimaryDNS" width="22%" valign="top" class="head" onMouseOver="Primary_DNS_toptip();" onMouseOut="return nd();">Primary DNS</td>
						<td class="tail" valign="top" width="78%">
						<input maxlength="15" size="15" name="prefer_dns_manual"  id="prefer_dns_manual" style="font-family: Courier New;">
						</td>
					</tr>
					<tr id="s_dns" name="s_dns">
						<td id="3GSecondaryDNS" width="22%" valign="top" class="head" onMouseOver="Secondary_DNS_toptip();" onMouseOut="return nd();">Secondary DNS</td>
						<td class="tail" valign="top" width="78%">
						<input maxlength="15" size="15" name="standby_dns_manual"  id="standby_dns_manual" style="font-family: Courier New;">
						</td>
					</tr>				
				<tr>
					<td id="3GAuth" class="head" valign="top" width="22%"  onMouseOver="Authentication_toptip();" onMouseOut="return nd();"><font face="Arial">Authentication</font></td>
					<td class="tail" valign="top" width="78%" >
					<!--<input class="radiotype" type="radio" value="chap" name="ppp_auth_mode" id="ppp_auth_mode"> 
						CHAP&nbsp;&nbsp;&nbsp;
						<input class="radiotype" type="radio" value="pap" name="ppp_auth_mode" id="ppp_auth_mode"> 
						PAP-->
                      <select id="ppp_auth_mode" name="ppp_auth_mode" size="1">
			<option value="none" id="ppp_auth_mode1">NONE</option>
			<option value="chap" id="ppp_auth_mode2">CHAP</option>
			<option value="pap" id="ppp_auth_mode3">PAP</option>
			<option value="chap_pap" id="ppp_auth_mode4">CHAP PAP</option>		</select>  
                        </td>
				</tr>
				<tr>
					<td id="3GUserName" class="head" valign="top" width="22%" onMouseOver="user_name_toptip();" onMouseOut="return nd();"><font face="Arial">User Name</font></td>
					<td class="tail" valign="top" width="78%" >
					<input type="text" maxlength="30" size="19" name="ppp_username" id="ppp_username" style="font-family: Courier New;" />					</td>
				</tr>
				<tr>
					<td id="3GPassword" class="head" valign="top" width="22%" onMouseOver="passwd_toptip();" onMouseOut="return nd();"><font face="Arial">Password</font></td>
					<td class="tail" valign="top" width="78%" >
					<input type="password" maxlength="30" size="19" name="ppp_passwd" id="ppp_passwd" value=""   style="font-family: Courier New;" />					</td>
				</tr>
			</table>
			<br>
				<input type="hidden" name="index">
				<input type="hidden" name="default_index">
				<input type="hidden" name="ifdelete">
				<input type="hidden" name="profilename">
				<input type="hidden" name="profile_for_bug">
	<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <th align=right>
		<input id="3GSave" type="button" name="Submit" onClick="save_submit();" value=" Save " style="font-family: Arial;" class="btn">
		<input id="3GSetDefault" type="button" name="Submit_default" value="Set default" onClick="set_default_submit(selShow);" style="font-family: Arial;" class="btn">
		<input id="3GAdd" type="button" name="Submit" value=" Add  " onClick="add_submit(selShow);" style="font-family: Arial;" class="btn">
		<input id="3GDel" type="button" name="Submit" value="Delete" onClick="delete_submit();" style="font-family: Arial;" class="btn">
        </th>      
		</tr>
    </table>
</table>      
</body>       
</form>  
</html>       
