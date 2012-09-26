<html>
<head>
<title>Verizon Fivespot</title>
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">

function updateState()
{
	var rm = '<% getCfgGeneral(1, "RemoteManagement"); %>';
	
	if(rm == "1")
		document.websSysFirewall.remoteManagementEnabled.options.selectedIndex = 1;
	else
		document.websSysFirewall.remoteManagementEnabled.options.selectedIndex = 0;
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
}

</script>
</head>


<body style="overflow-x:hidden;overflow-y:hidden" onLoad="initPage();">
<form method=post name="websSysFirewall" action=/goform/websSysFirewall onSubmit="writeHiddenNum();">
<input type="hidden" name="lucknum" id="lucknum"/>
	<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
		<tr align="center">
			<td valign="top">
		<table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td name="sysfwTitle" id="sysfwTitle" class="listtopic" colspan=2>Firewall--&gt;System Security</td>
            </tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>                                                               
        </table>
        <table cellspacing="0" cellpadding="0" border="0" align="left" width="100%">
            <tr>
            	<td width="10px">&nbsp;</td>
				<td align="center" width="180" class="unselectedMenu"><a href="port_filtering.asp"><span name="firewallTitlePortFilter" id="firewallTitlePortFilter">&#8226; MAC/IP/Port Filtering</span></a></td>
                <td align="center" width="180" class="unselectedMenu"><a href="port_forward.asp"><span name="firewallTitlePortForward" id="firewallTitlePortForward" >&#8226;Port Forwarding</span></a></td>
                <td align="center" width="180" class="selectedMenu"><span name="firewallTitleSys" id="firewallTitleSys">&#8226;System Security</span></td>
				<td width="400px">&nbsp;</td>
            </tr>
        </table>   
        <br/><br/><br/>
<table width="98%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td class="title" colspan="2" id="sysfwRemoteManagementTitle">Login from WAN</td>
</tr>
<tr>
	<td class="head_top" id="sysfwRemoteManagementHead" width="40%">Login from WAN</td>
	<td  class="head_top_content" width="60%">
	<select name="remoteManagementEnabled">
	<option value=0 id="sysfwRemoteManagementDisable">Disable</option>
	<option value=1 id="sysfwRemoteManagementEnable">Enable</option>
	</select>
	</td>
</tr>
</table>
<br />

<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
  <tr align="right">
    <td><input class="btn" type="submit" value="Apply" id="sysfwApply" name="sysfwApply" >
      &nbsp;&nbsp;
      <input class="btn" type="reset" value="Reset" id="sysfwReset" name="sysfwReset">
    </td>
  </tr>
</table>
</form>

<br>


</body>
</html>
