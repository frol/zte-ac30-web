<html>

<head>
<title>Verizon Fivespot</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta content="MSHTML 6.00.2900.3086" name="GENERATOR">
<link href="style/normal_ws.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="js/lang.js"></script>
<script language="JavaScript" src="js/protect.js"></script>
<script type="text/javascript">
Butterlate.setTextDomain("main");
var message_info = new Array(30);
var reload_page ='<% asp_get("dlginfo"); %>';
function get_message()
{
message_info["MSG_PASSWORD_ERROR"] = Get_string('MSG_PASSWORD_ERROR');
message_info["MSG_CONN2INTERNET_VOIP"] = Get_string('MSG_CONN2INTERNET_VOIP');
message_info["MSG_HANGUP_PHONE_USESIP"] = Get_string('MSG_HANGUP_PHONE_USESIP');
message_info["MSG_PPP_ALREADY_CONNECTED_ONDEMAND"] = Get_string('MSG_PPP_ALREADY_CONNECTED_ONDEMAND');
message_info["MSG_PPP_CONNECT_FAILED"] = Get_string('MSG_PPP_CONNECT_FAILED');
message_info["MSG_PPP_ALREADY_CONNECTED"] = Get_string('MSG_PPP_ALREADY_CONNECTED');
message_info["MSG_GATEWAY_ERROR_STATE"] = Get_string('MSG_GATEWAY_ERROR_STATE');
message_info["MSG_REBOOT_ERROR"] = Get_string('MSG_REBOOT_ERROR');

message_info["PRL_UPDATE_PPP_DOING"] = Get_string('PRL_UPDATE_PPP_DOING');
message_info["ACTIVE_PPP_DOING"] = Get_string('ACTIVE_PPP_DOING');

	document.getElementById("message").innerHTML = message_info["<% asp_get("dlginfo"); %>"];
	var e = document.getElementById("Message_Continue");
			e.value = Get_string('Message_Continue');
}

function go_lastpage()
{
	if("PRL_UPDATE_PPP_DOING" == reload_page)
	{
		 window.location = "/adm/prl_update_mgmt.asp";
	}
	else if("ACTIVE_PPP_DOING" == reload_page)
	{
		 window.location = "/adm/active_mgmt.asp";
	}
	else
	{
	     history.go(-1);
	}
}

</script>

</head>

<body bgcolor="white" vlink="#0000cc" alink="#0000cc" link="#0000cc" onLoad="get_message();">
<table height="100%" cellspacing="0" cellpadding="10" width="100%" border="0">
	<tr>
		<td valign="top">
		<br>
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			
			<tr>
				<td width="100%" valign="top" class="head_top">
				<p align="center">&nbsp;</p>
				<p align="center"><div id="message"></div></p>
				<p align="center">&nbsp;</p>
				</td>
			</tr>
		</table>
		<br>
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td valign="bottom">
				<div align="right">
				<input id="Message_Continue" class="btn" style="FONT-FAMILY: Arial" type="button" value="Continue" name="continue" onclick="go_lastpage();">
				</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</body>

</html>
