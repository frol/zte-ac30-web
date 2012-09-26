<html>

<head>
<title>Verizon Fivespot</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta http-equiv="refresh" content="6; URL=statistic.asp">
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
function initTranslation()
{
	var wrb = '<% asp_get("wan_received_bytes"); %>';
	document.getElementById("wan_received_bytes").innerHTML = wrb+"&nbsp;";
	var wtb = '<% asp_get("wan_transfer_bytes"); %>';
	document.getElementById("wan_transfer_bytes").innerHTML = wtb+"&nbsp;";
	var wrtb = '<% asp_get("wan_received_total_bytes"); %>';
	document.getElementById("wan_received_total_bytes").innerHTML = wrtb+"&nbsp;";
	var wttb = '<% asp_get("wan_transfer_total_bytes"); %>';
	document.getElementById("wan_transfer_total_bytes").innerHTML = wttb+"&nbsp;";
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
</script>

</head>

<body style="overflow-x:hidden;overflow-y:hidden" onLoad="check_active_state();initTranslation()">
<form action="/goform/statistic_clear" onSubmit="writeHiddenNum();" method="post">
<input type="hidden" name="lucknum" id="lucknum"/>
<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
	<tr align="center">
		<td valign="top">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td class="listtopic" colspan="2" id="adv_statistics_title">Advanced--&gt;Statistics</td>
			</tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>   
		</table>
        
        <table cellspacing="0" cellpadding="0" border="0" align="left" width="100%">
            <tr>
            	<td width="10px">&nbsp;</td>
				<td align="center" width="170" class="unselectedMenu"><a href="status.asp">&#8226;Status</a></td>
                <td align="center" width="170" class="selectedMenu">&#8226;Statistics</td>
                <td align="center" width="200" class="unselectedMenu"><a href="restore.asp">&#8226;Restore & Reboot</a></td>
                <td align="center" width="200" class="unselectedMenu"><a href="power_mgmt.asp">&#8226;Power Management</a></td>
				<td align="center" width="170px" class="unselectedMenu"><a href="active_mgmt.asp">&#8226;Activation</a></td>
                <td align="center" width="170px" class="unselectedMenu"><a href="prl_update_mgmt.asp">&#8226;Update PRL</a></td>
				<TD width="100px"></TD>
            </tr>
        </table>
        <br/><br/><br/>
		<table width="98%" border="0" cellpadding="0" cellspacing="0">       
			<tr>
				<td class="title" colspan="2" id="adv_statistics_wan_lan">WAN</td>
			</tr>
			<tr>
				<td  width="35%" class="head_top" id="adv_statistics_wan_rx_packets">WAN Rx data(KB): </td>
				<td width="65%" class="head_top_content" id="wan_received_bytes">&nbsp;</td>
			</tr>
			<tr>
				<td class="head" id="adv_statistics_wan_rx_bytes">WAN Tx data(KB): </td>
				<td class="head_content" id="wan_transfer_bytes">&nbsp;</td>
			</tr>
			<tr>
				<td class="head" id="adv_statistics_wan_tx_packets">WAN Rx Total data(KB): </td>
				<td class="head_content" id="wan_received_total_bytes">&nbsp;</td>
			</tr>
			<tr>
				<td class="head" id="adv_statistics_wan_tx_bytes">WAN Tx Total data(KB): </td>
				<td class="head_content" id="wan_transfer_total_bytes">&nbsp;</td>
			</tr>
		</table>
        <table width="98%" cellpadding="10" cellspacing="0" style="text-align:left">
        <tr class="hintMsg"><td>Attention: WAN usage (as counted by the device on the Statistics page) is estimated and may not be accurate for billing purposes.
</td></tr>
		</table>
        <table width="98%" cellpadding="10" cellspacing="0">
			<tr align="right">
				<td>
                <input type="submit" class="btn" value="Clean"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
   
</table>
</form>
</body>

</html>
