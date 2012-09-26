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

var net_type  = '<% asp_get("current_network_mode"); %>';
var pppstate  = '<% asp_get("ppp_status"); %>';
var cardstate = '<% asp_get("modem_main_state"); %>';
	
var mcc = '<% asp_get("mcc"); %>';
var mnc = '<% asp_get("mnc"); %>';

var active_state ='<% asp_get("ppp0_record"); %>';

var last_updatatime ='<% asp_get("need_restore"); %>';

function check_updatatime()
{   
   if("0" == last_updatatime)
	{return true;}
   else
   {
    var minutes = 1000 * 60;
    var hours = minutes * 60;
    var now;
    var time_now;
    var time_past;
    var interval;
    var d;
	now = Date();
	time_past = Date.parse(last_updatatime);
    time_now = Date.parse(now);
	interval=time_now-time_past;
	d=interval/hours;

 if(d > 720)
	{return true;}
 else
    {
	return false;}
	}
}


function check_active_state()
{
	var flag = active_state_load(active_state);
	if((flag == 1) ||(flag == 4))
	{
		window.location = "/adm/activing.asp";
	}
}

function next_goto_page()
{
	if (pppstate == "ppp_connecting")
	{
		 window.location = "/air_network/pppconnect.asp";		 
	}
	else if (pppstate == "ppp_disconnecting")
	{
		 window.location = "/air_network/pppdisconnect.asp";		 
	}
}

function checkForm()
{
	
	if(pppstate == 'ppp_connected') {
		alert("You can't update PRL when ppp is connected.");
		return false;
	}
	
	if ( net_type != "CDMA" )
	{
		alert("It works in CDMA mode ONLY!");
		return false;
	}
	
	if ( false == check_updatatime())
	{
		alert("The final update time for PRL  is within 30 days!");
		return false;
	}
	
	
	if ( mcc != "310"
	  && mcc != "311"
	  && mcc != "312"
	  && mcc != "313"
	  && mcc != "314"
	  && mcc != "315"
	  && mcc != "316"
	  && mcc != "200" )
	{
		if ( window.confirm("You are not in Verizon Wireless network now, are you sure to continue?") == false )
		{
			return false;
		}
	}
	
	
	writeHiddenNum();
	
	var array_up = new Array();
	var now_up = Date();
	array_up = now_up.split(" ");
	now_up = array_up[0]+","+array_up[1]+","+array_up[2]+","+array_up[3]+","+array_up[4];
	document.getElementById("prl_update_time").value  = now_up;
	
	return true;
}

function initPage()
{   
	check_active_state();
	next_goto_page();
}
</script>
</head>

<body style="overflow-x:hidden;overflow-y:hidden" onLoad="initPage();">

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

<form method="post" name="PRLUpdateControl" action="/goform/PRLUpdateControl" onSubmit="return checkForm();">
<input type="hidden" name="lucknum" id="lucknum"/>
<input type="hidden" name="prl_update_time" id="prl_update_time" />
<table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
	<tr align="center">
		<td valign="top">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td class="listtopic" colspan="2" id="adv_restore_title">Advanced--&gt;Update PRL</td>
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
                <td align="center" width="200" class="unselectedMenu"><a href="restore.asp">&#8226;Restore & Reboot</a></td>
                <td align="center" width="200" class="unselectedMenu"><a href="power_mgmt.asp">&#8226;Power Management</a></td>
				<td align="center" width="170px" class="unselectedMenu"><a href="active_mgmt.asp">&#8226;Activation</a></td>
                <td align="center" width="170px" class="selectedMenu"><span class="selectedMenu">&#8226;Update PRL</span></td>
				<TD width="100px"></TD>
            </tr>
        </table>
        <br/><br/><br/>
		<table width="98%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="title" colspan="2">
					Update PRL</td>
				</tr>
				<tr>
					<td class="head_top" width="35%">
					Update PRL</td>
					<td class="head_top_content" width="65%">
					<input value="Update" style="{width:120px;}" type="submit" class="btn" id="update" name="update"/>
					&nbsp;&nbsp;&nbsp;
					<span>NOTE: It just can be update once every 30 days!</span>
					</td>	
				</tr>
                </table>
		</td>
	</tr>
</table>
</form>
</body>

</html>
