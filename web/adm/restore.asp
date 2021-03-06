<html>

<head>
<title>Verizon Fivespot</title>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css" />
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("advanced");
function show_pin_mlock()
{
	var net_type = "<% asp_get('current_network_mode'); %>";
	if(net_type == "WCDMA")
	{
		document.getElementById("modem_lock_manage").style.display = "none";	
	}
	else if(net_type == "CDMA")
	{
		document.getElementById("pin_manage").style.display = "none";	
	}	
}
function initTranslation()
{
	show_pin_mlock();
}
function set_action_flag(action)
{
	if(action == "restore")
	{
		document.getElementById("action_flag").value = "restore";
		if(confirm('The parameters will be reset to the factory default parameters! The device will be restarted!') == false)
		{
	    	return false;
		}		
	}
	if(action == "reboot")
	{
		document.getElementById("action_flag").value = "reboot";
		if(confirm('The action will reboot the device!') == false)
		{
	    	return false;
		}	
	}
	
	writeHiddenNum();
	
	return true;
	
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

function load_default_toptip()
{
    toptip('adv restore tip');
}
function reboot_device_but()
{
    toptip('adv restore tip');
}
</script>
</head>

<body style="overflow-x:hidden;overflow-y:hidden" onLoad="check_active_state();">

<div id="MsgLayer1" style="BORDER-RIGHT: rgb(0,0,0) 1px; BORDER-TOP: rgb(0,0,0) 1px; Z-INDEX: 888; FILTER: Alpha(opacity=90); LEFT: 500px; BACKGROUND-IMAGE: url(../graphics/Msg_bg.gif); VISIBILITY: hidden; BORDER-LEFT: rgb(0,0,0) 1px; WIDTH: 351px; BORDER-BOTTOM: rgb(0,0,0) 1px; BACKGROUND-REPEAT: no-repeat; POSITION: absolute; TOP: 500px; HEIGHT: 92px; moz-opacity: 0.9; opacity: 0.9" onClick="setinner('hidden')">
</div>
<div id="MsgLayer2" style="BORDER-RIGHT: rgb(0,0,0) 1px; BORDER-TOP: rgb(0,0,0) 1px; Z-INDEX: 888; LEFT: 550px; VISIBILITY: hidden; BORDER-LEFT: rgb(0,0,0) 1px; WIDTH: 353px; BORDER-BOTTOM: rgb(0,0,0) 1px; POSITION: absolute; TOP: 300px; HEIGHT: 91px" onClick="setinner('hidden')">
	<div id="errLayer" style="Z-INDEX: 889; LEFT: 20px; WIDTH: 318px; POSITION: absolute; TOP: 30px; HEIGHT: 52px">
		<table height="48" width="320" border="0">
			<tr>
				<td width="320" align="center">
				<span class="msg" id="errmsg" name="errmsg"></span></td>
			</tr>
		</table>
	</div>
</div>
<iframe id="ifr" style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; Z-INDEX: 887; FILTER: Alpha(opacity=0); LEFT: 500px; VISIBILITY: hidden; BORDER-LEFT: medium none; WIDTH: 351px; BORDER-BOTTOM: medium none; POSITION: absolute; TOP: 500px; HEIGHT: 75px; moz-opacity: 0; opacity: 0" src="about:blank">
</iframe>
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;">
</div>

<form method="post" name="LoadDefaultSettings" action="/goform/LoadDefaultSettings" >
<input type="hidden" name="lucknum" id="lucknum"/>
<input type="hidden" name="action_flag"  id="action_flag" value="">
<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
	<tr align="center">
		<td valign="top">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td class="listtopic" colspan="2" id="adv_restore_title">Advanced--&gt;Restore&Reboot</td>
			</tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>   
		</table>
        
        <table cellspacing="0" cellpadding="0" border="0" align="left" width="100%">
            <tr>
            	<td width="10px">&nbsp;</td>
				<td align="center" width="170" class="unselectedMenu"><a href="status.asp"><span name="adv_sec_title_status" id="adv_sec_title_status">&#8226;Status</span></a></td>
                <td align="center" width="170" class="unselectedMenu"><a href="statistic.asp"><span class="unselectedMenu" name="adv_sec_title_statistics" id="adv_sec_title_statistics">&#8226;Statistics</span></a></td>
                <td align="center" width="200" class="selectedMenu">&#8226;Restore & Reboot</td>
                <td align="center" width="200" class="unselectedMenu"><a href="power_mgmt.asp">&#8226;Power Management</a></td>
				<td align="center" width="170px" class="unselectedMenu"><a href="active_mgmt.asp">&#8226;Activation</a></td>
                <td align="center" width="170px" class="unselectedMenu"><a href="prl_update_mgmt.asp">&#8226;Update PRL</a></td>
				<TD width="100px"></TD>
            </tr>
        </table>
        <br/><br/><br/>
		<table width="98%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="title" colspan="2" id="adv_load_factory_default" onMouseOver="load_default_toptip();" onMouseOut="return nd();">
					Load Factory Defaults</td>
				</tr>
				<tr>
					<td class="head_top" id="adv_load_default_button" width="35%">
					Load Default Button</td>
					<td class="head_top_content" width="65%">
					<input value="Restore" id="adv_button_restore" name="LoadDefault" style="{width:120px;}" type="submit" class="btn"  onClick="return set_action_flag('restore');"/></td>	
				</tr>
                </table><br>
                <table width="98%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="title" colspan="2" id="adv_reboot"  onMouseOut="return nd();">
					Reboot the Device</td>
				</tr>
                <tr>
					<td class="head_top" id="adv_load_default_button" width="35%">
					Reboot the Device Button</td>
					<td class="head_top_content" width="65%">
					<input value="Reboot" id="adv_button_reboot" name="RebootDevice" style="{width:120px;}" type="submit" class="btn" onClick="return set_action_flag('reboot');"/></td>	
				</tr>
			</table>
		</td>
	</tr>
</table>
		</form>
</body>

</html>
