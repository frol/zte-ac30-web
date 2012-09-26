<html>
<head>
<title>Verizon Fivespot</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="../style/normal_ws.css" type=text/css rel=stylesheet>
<script language="JavaScript" src="../js/toptip.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/prompt.js"> </script>
<script language="JavaScript" src="../js/utils.js"></script>
<script language="JavaScript" src="../js/spec.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("main");

function checkDialModel()
{
    writeHiddenNum();
    return true;
} 

function check_idle_time(item)
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
        
        {
          continue;
        }
       	else
        {                      
           ShowError(document.getElementById("ppp_idle_time"),"WAN Connection idle time" );
           return false;           
        }
      }
       
     if ((item >120) || (item <1))
     {
     	 ShowError(document.getElementById("ppp_idle_time"),"WAN Connection idle time" );
         return false;       
     }
     
     return true;
 }
 


function getpppstate(){
	var ppp_state  ='<% asp_get("ppp_status"); %>';

	if (("ppp_disconnected" == ppp_state) ||("ppp_idle" == ppp_state) || ("ppp_ready" == ppp_state))
	{
		document.all("hppp_state").innerHTML = "Disconnected";  //Get_string('WAN Connection Disconnected');
	}
	else if ("ppp_on_demand" == ppp_state)
	{
		document.all("hppp_state").innerHTML = "OnDemand";    //Get_string('WAN Connection OnDemand');
	}
	else if ("ppp_connected" == ppp_state)
	{
		document.all("hppp_state").innerHTML = "Connected";   //Get_string('WAN Connection Connected');
	}
	else if ("ppp_disconnecting" == ppp_state)
	{
		document.all("hppp_state").innerHTML = "Disconnecting";   //Get_string('WAN Connection Disconnecting');
	}
	else 
	{
		document.all("hppp_state").innerHTML = "Unknown";		
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
}


function disableSubmit()
{
	form_linkset.Submit_linkset.disabled=true;
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

function initTranslation()
{   
	check_active_state();
	getpppstate();
}	

</script>

</head>

<body style="overflow:scroll;overflow-x:hidden;overflow-y:hidden"  onLoad="initTranslation();next_goto_page();"  bgcolor="white">
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

<form name="form_linkset" onSubmit="return checkDialModel();" action="/goform/network_connect" method="post" >
        <input type="hidden" name="lucknum" id="lucknum"/>
		<input type=hidden name="which_cgi" value="connect_wan">
        <input type=hidden name="webpage" value="net_connect.htm">  
        <table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td class=listtopic colspan=2 id="WANConnection">WAN Settings--&gt;WAN Connection Mode</td>
            </tr>                                                            
        </table>     
	<table cellspacing="0" cellpadding="10" width="100%" border="0">
		<tr>
			<td valign="top">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                <TD align="center" class="unselectedMenu" width=155 height="20" ><A href="wireless_info.asp">&nbsp;&#8226; Wireless Info</A></TD>
                <TD align="center" class="unselectedMenu" width=155 height="20"><A href="net_select.asp">&#8226;Network Select</A></TD>		
                <TD align="center" class="selectedMenu" width=250 height="20">&#8226;WAN Connection Mode</TD>
                <TD align="center" class="unselectedMenu" width=250 height="20"><A href="multi_apn.asp">&#8226;Multi APN</A></TD>
                	
               <TD width="695"></TD>
               </tr>
               </table>				
	    <br>                                                                      
        <table cellspacing=0 cellpadding=0 width=100% border=0> 
				<tr>
					<td height="20"  class="title" id="WANConnectionPPPMode">WAN Connection Mode</td>
				</tr>
				<tr>
					<td width="22%" valign="top" class="head_top">
					<input class="radiotype" type="radio" value="auto_dial_no_roaming" name="dial_mode" <% asp_match("dial_mode","auto_dial_no_roaming","checked"); %> ></td>
					<td id="WANConnectionAutoConnect"  class="head_top_content" valign="top" width="78%">
					<font face="Arial">Auto Connect (Domestic Only)</font></td>
				</tr>
                <tr>
                	<td class="head" valign="top" width="22%">
                    	<input class="radiotype" type="radio" value="auto_dial" name="dial_mode" <% asp_match("dial_mode","auto_dial","checked"); %> >
                    </td>
                    <td   class="head_content" valign="top" width="78%"><font face="Arial">Auto Connect (GlobalAccess Mode)</font></td>
                </tr>
                <tr>
					<td class="head" valign="top" width="22%">
					<input class="radiotype" type="radio" value="manual_dial" name="dial_mode" <% asp_match("dial_mode","manual_dial","checked"); %> ></td>
					<td   class="head_content" valign="top" width="78%" onMouseOver="Manual_Connect_toptip();" onMouseOut="return nd();">
					<font face="Arial"><span id="WANConnectionManualConnect">Manual Connect</span>&nbsp;&nbsp; </font>
					<select name="action">
                              <option id="WANConnectionManualConnectInternet"  style="font-family:Arial;" value="connect" <% asp_match("ppp_status","ppp_disconnected","selected"); %>>
							  Connect Internet </option>
                              <option id="WANConnectionManualDisconnectInternet" style="font-family:Arial;" value="disconnect"<% asp_match("ppp_status","ppp_connected","selected"); %>>
							  Disconnect Internet </option>
                            </select></td>
				</tr>
				<tr>
					<td id="WANConnectionPPPStatus" class="head" valign="top" width="22%" onMouseOver="Connection_Statu_toptip();" onMouseOut="return nd();">
					<font face="Arial">WAN Connection Status</font></td>
					<td class="head_content" valign="top" width="78%">
					<font face="Arial"><div id="hppp_state"></div></font></td>
				</tr>
			</table>
			<br>
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td valign="bottom">
					<div align="right">
						<input id="WANConnectionApply" type="submit" value="Apply" name="Submit_linkset" class="btn" style="font-family: Arial;">
					</div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</form>

</body>

</html>
