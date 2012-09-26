<html>
<head>
<title>Verizon Fivespot</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../style/normal_ws.css" type="text/css" rel="stylesheet">     
<title>DHCP Client List</title>
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("internet");

var active_state ='<% asp_get("ppp0_record"); %>';
function check_active_state()
{
	var flag = active_state_load(active_state);
	if((flag == 1) ||(flag == 4))
	{
		window.location = "/adm/activing.asp";
	}
}

function initValue()
{
	check_active_state();
}

function analyze_dhcpclient_info()
{
	var dhcpclient_info = '<% getDhcpCliList(); %>';
	if(dhcpclient_info.length > 0)
	{
		var iCheckIfOldFormat=-1;
		iCheckIfOldFormat=dhcpclient_info.indexOf("&zte&");
		if(-1 == iCheckIfOldFormat)
		{
			document.write(dhcpclient_info);
			return;
		}
		var strAdd = ["<tr><td  class=\"head3\">", "</td><td class=\"tail\">", "</td><td class=\"tail\">", "</td></tr>"];
		var iLen = dhcpclient_info.length;
		var strForWrite="";
		var iAddPos=0;
		var iLastFoundPos=-1;
		var iFinish=1;
		
		while(1)
		{
			iLastFoundPos=dhcpclient_info.indexOf("&zte&");
			if(-1 == iLastFoundPos)
			{
				strForWrite=strForWrite+strAdd[2];
				strForWrite=strForWrite+dhcpclient_info;
				strForWrite=strForWrite+strAdd[3];
				//alert("hi end: "+strForWrite)
				break;
			}			
			strForWrite=strForWrite+strAdd[iAddPos%4];			
	
			strForWrite=strForWrite+dhcpclient_info.substr(0, iLastFoundPos);
			if(2 == iAddPos%4)
			{
				strForWrite=strForWrite+strAdd[3];
				iAddPos=0;
			}
			else
				iAddPos++;
			dhcpclient_info=dhcpclient_info.substr(iLastFoundPos+5);
			//alert(dhcpclient_info)
			//alert("hi mid: "+strForWrite)
		}
		document.write(strForWrite);
	}
	else
	{
	}
}

function dhcp_clients_toptip()
{
    toptip('Router DHCP Clients Title');
}
</script>
</head>


<body style="overflow:scroll;overflow-x:hidden;overflow-y:hidden;" onLoad="initValue();">
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
        <td valign=top>                                     
        <table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td class="listtopic" colspan=2 id="RouterDHCPClientsTitle">Hotspot--&gt;DHCP Clients</td>
            </tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>                                            
        </table> 
        <table cellspacing="0" cellpadding="0" border="0" align="left" width="100%">
            <tr>
            	<td width="10px">&nbsp;</td>
                <td align="center" width="120" class="unselectedMenu"><a href="lan.asp"><span id="RouterLanMenu2">&#8226;LAN</span></a></td>
                <td align="center" width="120" class="selectedMenu"><span id="selectedMenu">&#8226;DHCP Clients </span></td>
				<td width="400px">&nbsp;</td>
            </tr>
        </table>   
        <br/><br/><br/>                      
<table width="98%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td class="title" colspan="3" id="RouterDHCPClientsSubTitle" onMouseOver="dhcp_clients_toptip();" onMouseOut="return nd();">DHCP Clients</td>
  </tr>
  <tr>
    <td width="34%" class="head_top"  id="RouterDHCPClientsHost">Host Name</td>
    <td width="33%" class="head_left_top"  id="RouterDHCPClientsMAC">MAC Address</td>
    <td width="33%" class="head_left_top"  id="RouterDHCPClientsIP">IP Address</td>
  </tr>
  <script language="JavaScript" type="text/javascript">
     analyze_dhcpclient_info();
  </script>
  <tr>
  	<td colspan="3" height="30px" align="left" class="hintMsg">&nbsp;Note: This page is for reference only.</td>
  </tr>
</table>                                                     
        <br>                                                                             
        <table cellspacing=0 cellpadding=0 width=98% border=0>         
            <tr>                                                                           
                <td valign=bottom>                                                       
                <div align=right>                                                        
                    <input class=btn style=FONT-FAMILY: Arial type=button value=Refresh  id="RouterDHCPClientsRefresh" name=Submit_refresh onclick=location.reload()>
                </div>
                </td> 
            </tr>   
        </table>  
        </td>     
    </tr>       
</table>


</body>
</html>


