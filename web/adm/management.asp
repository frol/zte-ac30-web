<html>

<head>
<title>Verizon Fivespot</title>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("advanced");

var user_level='<% asp_get("user"); %>';

function show_pin_mlock()
{
	var net_type = "<% asp_get('current_network_mode'); %>";
	if(net_type == "WCDMA")//WCDMA
	{
		document.getElementById("modem_lock_manage").style.display = "none";	
	}
	else if(net_type == "CDMA")//CDMA
	{
		document.getElementById("pin_manage").style.display = "none";	
	}	
}

function validateUserName(item)
{
	var strlen = 0;
	var tmpchr,i;
	
	strlen = item.length;
	
	for (i=0; i<strlen; i++)
	{
		tmpchr = item.charAt(i);
		if ((tmpchr >= '0' && tmpchr <= '9')
			||(tmpchr >= 'A' && tmpchr <= 'Z')
			||(tmpchr >= 'a' && tmpchr <= 'z'))
		{
			continue;
		}
		else
		{
		    return false;
		}
	}

	return true;
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
function AdmFormCheck()
{	
	var user = '<% asp_get("user"); %>';
	if(user == "admin")
	{
		var current_password = '<% asp_get("admin_Password"); %>';
	}
	else
	{
		var current_password = '<% asp_get("normal_passwd"); %>';
	}
	
	if(document.getElementById("current_pwd").value == "")
	{
		ShowError(document.getElementById("current_pwd"), "The Current Password can not be empty!" ); 
		 return false; 
	}
	if(document.getElementById("new_pwd").value == "")
	{
		ShowError(document.getElementById("new_pwd"), "The New Password can not be empty!" ); 
		 return false; 
	}
	if(document.getElementById("new_pwd").value.length<4)
	{
		ShowError(document.getElementById("new_pwd"), "The length of the New Password can not be less than 4!" ); 
		 return false; 
	}
	if(document.getElementById("confirm_pwd").value.length == "")
	{
		ShowError(document.getElementById("confirm_pwd"), "The Verify Password can not be empty!" ); 
		return false; 
	}	
	if(document.getElementById("new_pwd").value != document.getElementById("confirm_pwd").value)
	{
		ShowError(document.getElementById("confirm_pwd"), "The Verify Password does not match the New Password, please check again!" ); 
		return false;
	}
	if(document.getElementById("current_pwd").value != current_password)
	{
		ShowError(document.getElementById("current_pwd"), "The Current Password is incorrect, please check again!" ); 
		return false;
	}
	
	writeHiddenNum();
	return true;
}


function initTranslation()
{
	var modified_res = '<% asp_get("modfyPwInfo"); %>'
	'<% asp_set("modfyPwInfo",""); %>'
	if(modified_res != "")
	{
		document.getElementById("adv_modify_result").innerHTML = Get_string(modified_res);
	}
	else
	{
		document.getElementById("tr_result").style.display = "none";
	}
}

function initValue()
{
	if(user_level == "admin")
	{
		document.getElementById("admuser").value = '<% asp_get("admin_user"); %>';
		document.getElementById("admpass").value = '<% asp_get("admin_Password"); %>';
	}
	else
	{
		document.getElementById("admuser").value = '<% asp_get("normal_user"); %>';
		document.getElementById("admpass").value = '<% asp_get("normal_passwd"); %>';
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

function pageInit()
{
	check_active_state();
	//initValue();
	initTranslation();
}

function account_toptip()
{
    toptip('adv management tip for account');
}
function password_toptip()
{
    toptip('adv management tip for passwd');
}
</script>
</head>

<body style="overflow-x:hidden;overflow-y:hidden" onLoad="pageInit()">
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

<!-- ================= Adm Settings ================= -->
<form method="post" name="Adm" action="/goform/setSysAdm">
  <input type="hidden" name="lucknum" id="lucknum"/>
  <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
      <td class="listtopic"  id="adv_management_title">Basic Setup--&gt;Password</td>
    </tr>
  </table>
  <table cellspacing="0" cellpadding="10" width="100%" border="0">
	<tr>
		<td valign="top">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
	 	<TD align="center" class="unselectedMenu" width=155 height="20"><A href="../setup.asp">&nbsp;&#8226;Quick Setup</A></TD>
        <TD align="center" class="selectedMenu" width=155 height="20" >&#8226;Password</TD>        		
  		<TD width=695></TD>
        </tr>
	    </table>
		<br>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="title" colspan="2" id="adv_management_admin_settings">Set Current User Password</td>
			</tr>
            <tr>
				<td class="head_top" id="adv_current_password" width="30%" onMouseOver="account_toptip();" onMouseOut="return nd();">
				Current Password</td>
				<td class="head_top_content" width="70%">
				<input type="password" name="current_pwd" size="16" maxlength="16" id="current_pwd">
				</td>
			</tr>
			<tr>
				<td class="head" id="adv_new_password" onMouseOver="password_toptip();" onMouseOut="return nd();">
				New Password</td>
				<td class="head_content">
				<input type="password" name="new_pwd" size="16" maxlength="16" id="new_pwd"></td>
			</tr>
            <tr>
				<td class="head" id="adv_confirm_password" onMouseOver="password_toptip();" onMouseOut="return nd();">
				Verify Password</td>
				<td class="head_content">
				<input type="password" name="confirm_pwd" size="16" maxlength="16" id="confirm_pwd"></td>
			</tr>
            <tr id="tr_result">
				<td class="head"  onMouseOver="password_toptip();" onMouseOut="return nd();">
				Modified result</td>
				<td class="head_content"  id="adv_modify_result"></td>
			</tr>
		</table>		
		<table width="100%" cellpadding="10" cellspacing="0">
			<tr align="right">
				<td>
				<input type="submit" class="btn" value="Apply" id="adv_button_apply" onClick="return AdmFormCheck()">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" class="btn" value="Cancel" id="adv_button_cancel" onClick="window.location.reload()">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>

</html>
