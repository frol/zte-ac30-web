<html>
<head>
<title>Verizon Fivespot</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="refresh" content="8; URL=stainfo.asp">
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/toptip.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
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


function initPage()
{
	check_active_state();
}
</script>
</head>

<body style="overflow:scroll;overflow-x:hidden;overflow-y:yes" onLoad="initPage();">
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
    <form id="form_stainfo">
	<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
	<table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td class=listtopic colspan=2 name="stateTitle" id="stateTitle">Wi-Fi Settings--&gt;Connected Devices</td>
            </tr>	                                                                
        </table>
		<table cellspacing="0" cellpadding="10" width="100%" border="0"  height="100%">
		<tr>
			<td valign="top">                                               
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
		<TD align="center" class="selectedMenu" width=170 height="20" id="wifistationlist" name="wifistationlist">&#8226;Connected Devices</TD>          
	 	<TD align="center" class="unselectedMenu" width=170 height="20" id="wifibasic" name="wifibasic"><A href="basic.asp">&#8226; Basic&nbsp;</A></TD>
		<TD align="center" class="unselectedMenu" width=170 height="20" id="wifisecurity" name="wifisecurity"><A href="security.asp">&#8226;Security</A></TD>
	   <TD width=400></TD>
	</table>	
	    <br>
	
<table width="100%" cellspacing="0" cellpadding="10">
  <tr> 
    <td class="title" colspan="8" id="stalistWirelessNet">Wireless Network</td>
  </tr>
  <tr>
    <td  align=center class="head_top" width="20%" id="stalistStation" onMouseOver="Station_List_toptip(); "onMouseOut="return nd();">Connected Device</td>
	<td  align=center class="head_left_top" width="80%" id="stalistMacAddr">MAC Address</td>
   
  </tr>
  <% getWlanStaInfo(); %>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>

