<html>

<head>
<title>Verizon Fivespot</title>
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script>

var charging_mode = '<% asp_get("test_pbc"); %>';
var sleep_time    = '<% asp_get("sysIdleTimeToSleep"); %>';

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
	
	//var charging_mode_select = document.getElementById("charging_mode");
	var sleep_time_select    = document.getElementById("sleep_time");

/*
	if ( "0" == charging_mode )
	{
		charging_mode_select.options.selectedIndex = 0;
	}
	else
	{
		charging_mode_select.options.selectedIndex = 1;
	}
*/
	
	if ( "10" == sleep_time )
	{
		sleep_time_select.options.selectedIndex = 0;
	}
	else if ( "30" == sleep_time )
	{
		sleep_time_select.options.selectedIndex = 1;
	}
	else
	{
		sleep_time_select.options.selectedIndex = 2;
	}
}

function checkForm()
{
	//if (false == window.confirm("The device will be restarted! Would you like to continue?"))
	//{
	//	return false;
	//}
	
	writeHiddenNum();
	
	return true;
}

</script>
</head>

<body style="overflow:hidden;" onLoad="initPage();">
<form method="post" action="/goform/PowerControl" onSubmit="return checkForm();" >
<input type="hidden" name="lucknum" id="lucknum"/>
<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
	<tr align="center">
		<td valign="top">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td class="listtopic" colspan="2">Advanced--&gt;Power Management</td>
			</tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>   
		</table>
        <table cellspacing="0" cellpadding="0" border="0" align="left" width="100%">
            <tr>
            	<td width="10px">&nbsp;</td>
				<td align="center" width="170" class="unselectedMenu"><a href="status.asp">&#8226;Status</a></td>
                <td align="center" width="170" class="unselectedMenu"><a href="statistic.asp">&#8226;Statistics</a></td>
                <td align="center" width="200" class="unselectedMenu"><a href="restore.asp">&#8226;Restore & Reboot</a></td>
                <td align="center" width="200" class="selectedMenu">&#8226;Power Management</td>
				<td align="center" width="170px" class="unselectedMenu"><a href="active_mgmt.asp">&#8226;Activation</a></td>
              <td align="center" width="170px" class="unselectedMenu"><a href="prl_update_mgmt.asp">&#8226;Update PRL</a></td>
				<TD width="100px"></TD>
            </tr>
        </table>   
        <br/><br/><br/>
		<table width="98%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="title" colspan="2">Power Management</td>
			</tr>
            <!--
			<tr>
				<td class="head_top" width="35%">Auto Switch to Modem Mode when USB cable connected:</td>
				<td  class="head_top_content" width="65%">
                    <select id="charging_mode" name="charging_mode" style="width:120px">
                        <option value="0" id="charging_disable">Disable</option>
                        <option value="1" id="charging_enable">Enable</option>
                    </select>
				</td>
			</tr>
            -->
			<tr>
				<td class="head_top" width="40%">Allow device sleep when no WiFi client connected after:</td>
				<td  class="head_top_content" width="60%">
                    <select id="sleep_time" name="sleep_time"  style="width:120px">
                      <option value="10">After 10 Minutes</option>
                      <option value="30">After 30 Minutes</option>
                      <option value="-1">Never</option>
                    </select>
					&nbsp;&nbsp;&nbsp;
					<span>NOTE: Device will not sleep when charging by wall charger!</span>
      			</td>
			</tr>					
		</table>
        <br />
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
  			<tr align="right">
    			<td><input class="btn" type="submit" value="Apply" id="powerApply" name="powerApply" ></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>

</html>
