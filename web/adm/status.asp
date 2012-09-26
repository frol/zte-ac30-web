<html>

<head>
<title>Verizon Fivespot</title>
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="refresh" content="10; URL=./status.asp">
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/toptip.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script>
var active_state ='<% asp_get("ppp0_record"); %>';
function check_active_state()
{
	var flag = active_state_load(active_state);
	if((flag == 1) ||(flag == 4))
	{
		window.location = "/adm/activing.asp";
	}
}

function show_meid()
{
	var meid = '<% asp_get("whattodo"); %>';
	if(("ac30pass" == meid )||("0" == meid))
	{
	document.getElementById("MEID").innerHTML =" ";	
	}
	else
	document.getElementById("MEID").innerHTML = meid;	
}
function initPage()
{   
    check_active_state();
	show_meid();
}

</script>
</head>

<body style="overflow-x:hidden;overflow-y:hidden" onLoad="initPage();">

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


<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
	<tr align="center">
		<td valign="top">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td class="listtopic" colspan="2" id="adv_status_title">Advanced--&gt;Status</td>
			</tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>   
		</table>
        <table cellspacing="0" cellpadding="0" border="0" align="left" width="100%">
            <tr>
            	<td width="10px">&nbsp;</td>
				<td align="center" width="170px" class="selectedMenu"><span name="adv_sec_title_status" id="adv_sec_title_status">&#8226;Status</span></td>
                <td align="center" width="170px" class="unselectedMenu"><a href="statistic.asp"><span class="unselectedMenu" name="adv_sec_title_statistics" id="adv_sec_title_statistics">&#8226;Statistics</span></a></td>
                <td align="center" width="200" class="unselectedMenu"><a href="restore.asp">&#8226;Restore & Reboot</a></td>
                <td align="center" width="200px" class="unselectedMenu"><a href="power_mgmt.asp">&#8226;Power Management</a></td>
				<td align="center" width="170px" class="unselectedMenu"><a href="active_mgmt.asp">&#8226;Activation</a></td>
                <td align="center" width="170px" class="unselectedMenu"><a href="prl_update_mgmt.asp">&#8226;Update PRL</a></td>
				<TD width="100px"></TD>
            </tr>
        </table>
        <br/><br/><br/>
		<table width="98%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="title" colspan="2" id="adv_status_system_info">System Info</td>
			</tr>
			<tr>
				<td class="head_top" width="35%" valign="top"  id="adv_status_imei">
				<font face="Arial"><b>IMEI</b></font></td>
				<td class="head_top_content" width="65%" valign="top">
				<font face="Arial"><%asp_get("imei");%>&nbsp;</font></td>
			</tr>
            <tr>
				<td class="head" width="35%" valign="top"  id="adv_status_MEID">
				<font face="Arial"><b>MEID</b></font></td>
				<td class="head_content" width="65%" valign="top">
				<font face="Arial" id="MEID">&nbsp;</font></td>
			</tr>
			<tr>
				<td valign="top" class="head" id="adv_status_usbmodem_version">
				<font face="Arial"><b>Wireless access module software version</b></font></td>
				<td class="head_content" valign="top"><font face="Arial"><%asp_get("wa_inner_version");%>&nbsp;</font></td>
			</tr>
			<tr>
				<td valign="top" class="head" id="adv_status_hw_version"><font face="Arial"><b>Hardware version</b></font></td>
				<td class="head_content" valign="top"><font face="Arial"><%asp_get("hw_version");%>&nbsp;</font></td>
			</tr>
			<tr>
				<td class="head" id="adv_status_system_uptime">System Up Time</td>
				<td class="head_content"><% getSysUptime(); %>&nbsp;</td>
			</tr>						
		</table>
		</td>
	</tr>
</table>

</body>

</html>
