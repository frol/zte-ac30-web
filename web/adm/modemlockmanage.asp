<html>

<head>
<title>Verizon Fivespot</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("advanced");
function initTranslation()
{
	document.getElementById('ifsh_last_result').style.display = "none";
}


function next_goto_page()
{
	var pppstate = '<% asp_get("ppp_status"); %>';
	var cardstate = '<% asp_get("modem_main_state"); %>';
	
	
	if (cardstate == "modem_waitpin")
	{
	     //?pin
		 window.location = "/air_network/pin.asp";   
	}
	else if(cardstate == "modem_waitpuk")
	{
	     //?PUK
	     window.location = "/air_network/puk.asp";
	}
	else if(cardstate == "modem_imsi_waitnck")
	{
	     //?
	     window.location = "/air_network/unlock.asp";
	}
	else if (cardstate == "modem_sim_undetected")
	{
	     //dSIM
	     window.location = "/air_network/no_sim.asp";
	}
	else if (cardstate == "modem_undetected")
	{
	     //dMODEM
	     window.location = "/air_network/no_modem.asp";
	}
	else if (pppstate == "ppp_connecting")
	{
	     //?
		 window.location = "/air_network/pppconnect.asp";		 
	}

	ManageSelect();
	Insert_Notice();
}


function disableSubmit()
{
	pinmanage.PinManageApply.disabled=true;
	return true;
}

function ManageSelect()
{

	if(pinmanage.ManageAction[0].selected || pinmanage.ManageAction[1].selected)
	{
	    document.getElementById('modify_pin_1').style.display = "none";
		document.getElementById('modify_pin_2').style.display = "none";
	}
	else
	{
	    document.getElementById('modify_pin_1').style.display = "";
		document.getElementById('modify_pin_2').style.display = "";
	}
}

function Insert_Notice()
{
    var result = '<%asp_get("pin_manage_result");%>';
	var times = '<%asp_get("pinnumber");%>';
	var status = '<%asp_get("pin_status");%>';
		
	if (status == "0")
	{
	    document.getElementById("pin_status").innerHTML = Get_string('adv select disable');
	}
	if (status != "0")
	{
	    document.getElementById("pin_status").innerHTML = Get_string('adv select enable');
	}
	if (result != "")
	{
	    if(result == "0")
		{
					document.getElementById('ifsh_last_result').style.display = "";
	        document.getElementById("last_result").innerHTML = Get_string('adv pinm pin last result L1');
		}
		else
		{
				document.getElementById('ifsh_last_result').style.display = "";
		    document.getElementById("last_result").innerHTML = Get_string('adv pinm pin last result L2');
		}
	}
	if(times != "" && times != '')
	{
	    if(times == "0")
		{
		    document.pinmanage.ManageAction.disabled = true;
		    document.getElementById('old_pin').disabled = true;
		     document.getElementById('PIN_number').innerHTML = Get_string('adv You need restart device');
		}
		else
		{
		    pinmanage.ManageAction.disabled = false;
		    document.getElementById('old_pin').disabled = false;
		    //jrl_require
		     document.getElementById('PIN_number').innerHTML = times +Get_string('adv attempts remaining');
		}
	}
}

function isNum(item)
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
			continue;
		else
		{		   
		    return false;
		}

	}
	return true;
	
}

function CheckForm()
{
    var status = '<%asp_get("pin_status");%>';
		
	if (status == "0" && (document.pinmanage.ManageAction.value == "disable"))
	{
         ShowError(document.pinmanage.ManageAction, 'adv pinm pin already disabled'); 
		 return false; 
	}
	
	if (status == "0" && (document.pinmanage.ManageAction.value == "modify"))
	{
         ShowError(document.pinmanage.ManageAction, 'adv pinm pin has disabled'); 
		 return false; 
	}
	
	if (status == "1" && (document.pinmanage.ManageAction.value == "enable") )
	{	    
         ShowError(document.pinmanage.ManageAction, 'adv pinm pin already enable'); 
		 return false; 
	}
	
    if(document.pinmanage.old_pin.value == "")
	{
         ShowError(document.pinmanage.old_pin, 'adv pinm confirm pin number'); 
		 return false; 
	}
	if ((document.pinmanage.old_pin.value.length < 4) || (isNum(document.pinmanage.old_pin.value) == false)) 
    { 		 
         ShowError(document.pinmanage.old_pin, 'adv pinm pin right');
         return false; 
    }	
	
    if(document.pinmanage.ManageAction[2].selected )
	{
	    if(document.pinmanage.new_pin.value == "")
	    {
             ShowError(document.pinmanage.new_pin, 'adv pinm confirm newpin'); 
             return false; 
	    }
	    if ((document.pinmanage.new_pin.value.length < 4) || (isNum(document.pinmanage.new_pin.value) == false)) 
        { 
             ShowError(document.pinmanage.new_pin, 'adv pinm newpin right'); 
             return false; 
        }
		
		if (document.pinmanage.new_pin.value != document.pinmanage.confirm_pin.value) 
        {
             ShowError(document.pinmanage.new_pin, 'adv pinm pin and newpin not match'); 
             return false; 
        }		
	}
		
	pinmanage.adv_button_apply.disabled=true;
	return true;
	  
}

function pin_manage_toptip()
{
   toptip('adv pinm tip for mlock manage');
}

function pin_status_toptip()
{
    toptip('adv pinm tip for mlock status');
}

function manage_toptip()
{
    toptip('adv pinm tip for mlock action');
}
function current_pin_toptip()
{
    toptip('adv pinm tip for mlock');
}
function new_pin_toptip()
{
    toptip('adv pinm tip for newmlock');
}
function confirm_pin_toptip()
{
    toptip('adv pinm tip for confirm newmlock');
}
</script>
</head>

</head>

<body style="overflow-x:hidden;overflow-y:hidden" onLoad="initTranslation();next_goto_page()">
<!-- ================= toptip div begin================= -->
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
<!-- ================= toptip div end================= -->

<form method="post" name="pinmanage" action="/goform/pinmanage" onSubmit="return CheckForm();">
<table cellspacing="0" cellpadding="10" width="100%" border="0" bgcolor="#FFFFFF" height="100%">
	<tr>
		<td valign="top">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td class="listtopic" colspan="2" id="adv_pinm_title">Advanced--&gt;<span class="title">Modem Lock Manage</span> </td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td align="center" width="112" height="20" bgcolor="#CCCCCC">
				<a href="status.asp"><font color="#000000" face="Arial">
				<strong><span name="adv_sec_title_status" id="adv_sec_title_status">&#8226;Status</span></strong></font></a></td>
				<td align="center" width="114" height="20" bgcolor="#CCCCCC">
				<a href="statistic.asp"><font color="#000000" face="Arial">
				<strong><span name="adv_sec_title_statistics" id="adv_sec_title_statistics">&#8226;Statistics</span></strong></font></a></td>
				<!--
                <td align="center" width="115" height="20" bgcolor="#CCCCCC">
				<a href="management.asp"><font color="#000000" face="Arial">
				<strong><span name="adv_sec_title_management" id="adv_sec_title_management">&#8226;Management</span></strong></font></a></td>
                -->
			<!--
            	<td align="center" width="140" height="20" bgcolor="#CCCCCC">
				<a href="upload_firmware.asp"><font color="#000000" face="Arial">
				<strong><span name="adv_sec_title_upgrade" id="adv_sec_title_upgrade">&#8226;Upgrade</span></strong></font></a></td>
-->                
				<td align="center" width="149" height="20" bgcolor="#CCCCCC">
				<a href="restore.asp"><font color="#000000" face="Arial">
				<strong><span name="adv_sec_title_restore" id="adv_sec_title_restore">&#8226;Restore</span></strong></font></a></td>
<!--                
				<td align="center" width="160" height="20" bgcolor="#CCCCCC">
				<a href="shutdown.asp"><font color="#000000" face="Arial">
				<strong><span name="adv_sec_title_shutdown" id="adv_sec_title_shutdown">&#8226;Shutdown</span></strong></font></a></td>
                -->
				<td align="center" width="174" height="20" bgcolor="#0088C6">
				<font color="#000000" face="Arial">
		    <strong><span name="adv_sec_title_pin_manage" id="adv_sec_title_pin_manage">&#8226;<span class="title">Modem Lock Manage</span></strong></font></td>
				<td width="396"></td>
			</tr>
		</table>
		<br>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="title" colspan="2" id="adv_pinm" onMouseOver="pin_manage_toptip();" onMouseOut="return nd();">
				Modem Lock Manage</td>
			</tr>
			<tr>
				<td class="head_top" width="30%" id="adv_pinm_pin_status" onMouseOver="pin_status_toptip();" onMouseOut="return nd();"><span class="title">Modem Lock Status</span> </td>
				<td class="tail_top" id="PIN_Status" width="70%">
				<div id="pin_status">
				</div>
				</td>
			</tr>
			<tr>
				<td class="head" id="adv_pinm_action" width="30%" onMouseOver="manage_toptip();" onMouseOut="return nd();">
				Action</td>
				<td class="tail" width="70%">
				<select onChange="ManageSelect();" name="ManageAction">
				<option value="enable" id="adv_select_enable">Enable</option>
				<option value="disable" id="adv_select_disable">Disable</option>
				<option value="modify" id="adv_select_modify">Modify</option>
				</select>
				</td>
			</tr>
			<tr id="ifsh_last_result">
				<td class="head">&nbsp;</td>
				<td class="tail" width="70%" id="last_result">&nbsp;</td>
			</tr>
			<tr id="verify_pin">
				<td class="head" id="adv_pinm_pin" onMouseOver="current_pin_toptip();" onMouseOut="return nd();">
				Password</td>
				<td class="tail">
				<input type="password" maxlength="8" size="19" name="old_pin" id="old_pin">			
				</td>
			</tr>
			<tr id="modify_pin_1" name="modify_pin_1">
				<td class="head" id="adv_pinm_newpin" onMouseOver="new_pin_toptip();" onMouseOut="return nd();">
			  New Password</td>
				<td class="tail">
				<input type="password" maxlength="8" size="19" name="new_pin" id="new_pin">
				</td>
			</tr>
			<tr id="modify_pin_2" name="modify_pin_2">
				<td class="head" id="adv_pinm_confirm_newpin"  onmouseover="confirm_pin_toptip();" onMouseOut="return nd();">
			  Confirm New Password</td>
				<td class="tail" valign="top" width="78%">
				<input type="password" maxlength="8" size="19" name="confirm_pin" id="confirm_pin">
				</td>
			</tr>
			<tr>
				<td class="head" width="30%">&nbsp;</td>
				<td class="tail" id="PIN_number" width="70%">
				&nbsp;<div id="PIN_number"></div>
				</td>
			</tr>
		</table>
		<table width="100%" cellpadding="10" cellspacing="0">
			<tr align="right">
				<td>
				<input type="submit" class="btn" value="Apply" id="adv_button_apply" name="adv_button_apply">&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>

</html>
