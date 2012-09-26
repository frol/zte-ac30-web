<html>
<head>
<title>Verizon Fivespot</title>
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="/js/prompt.js"></script>
<meta http-equiv="Pragma" content="no-cache">
<meta content="MSHTML 6.00.2900.3086" name="GENERATOR">
<link href="../style/normal_ws.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="../js/validate.js"></script>
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="javascript">

Butterlate.setTextDomain("main");
function next_goto_page()
{
	var modestate = '<% asp_get("unlock_nck_time"); %>';

	if( modestate == "0")
	{
		document.getElementById('inputkey').style.display = "none";
	}
	else
	{
	    document.getElementById('inputkey').style.display = "";
	}

}
function isXNum(item)
{
	var i,strlen = 0;
	var isdigit = false;
	var tmpchr;

	strlen = item.length;
	//if((strlen < 1) || (strlen > 2))
	//	return false;
	for (i=0; i<strlen; i++)
	{
		tmpchr = item.charAt(i)
		if ((tmpchr == "0") || (tmpchr == "1") || (tmpchr == "2") ||
			(tmpchr == "3") || (tmpchr == "4") || (tmpchr == "5") ||
			(tmpchr == "6") || (tmpchr == "7") || (tmpchr == "8") ||
			(tmpchr == "9") || (tmpchr == "a") || (tmpchr == "b") || 
			(tmpchr == "c") || (tmpchr == "d") || (tmpchr == "e") || 
			(tmpchr == "f") || (tmpchr == "A") || (tmpchr == "B") || 
			(tmpchr == "C") || (tmpchr == "D") || (tmpchr == "E") || 
			(tmpchr == "F") )
			isdigit = true;
		else
			return false;
	}
	return true;
}

function check_unlock_value()
    {
        if (form_unlock.unlock_num.value == "")
        {
            ShowError(document.getElementById("unlock_key"), 'UNLOCK BLANK');
            return false;
        }

        if (document.form_unlock.unlock_num.value != "")
        {
            if (document.form_unlock.unlock_num.value.length != 16)
            {
                ShowError(document.getElementById("unlock_key"), 'UNLOCK LONG ERROR');
                return false;
            }
            if (document.form_unlock.unlock_num.value.length == 16)
            {
                
                if (false == isXNum(form_unlock.unlock_num.value))
            	{
                	ShowError(document.getElementById("unlock_key"), 'UNLOCK CHAR ERROR');
									return false;
            	}
            }
        }
	//	disableSubmit(); 
	return true;
    }
    
function initTranslation()
{
	var e = document.getElementById("HomeTheNetworkislocked");
			e.innerHTML = Get_string('Home The Network is locked');
	var e = document.getElementById("Homeunlockinputkey");
			e.innerHTML = Get_string('Home unlock input key');	
	var e = document.getElementById("HomeunlockApply");
			e.value = Get_string('WAN Connection Apply');
			//
	var e = document.getElementById("Homeunlockremaintime");
			e.innerHTML = Get_string('Home unlock remain time') +'<% asp_get("unlock_nck_time"); %>'+ Get_string('Home unlock remain time 2');	
		
}	 
</script>
</head>
<body onLoad="initTranslation();next_goto_page();" bgcolor="white" vlink="#0000cc" alink="#0000cc" link="#0000cc">
	<!-- ================= showerror div begin================= -->
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
	<!-- ================= showerror div end================= -->
	<!-- ================= toptip div begin================= -->
	<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
	<!-- ================= toptip div end================= -->
    <form name="form_unlock" onSubmit="return check_unlock_value();" action="/goform/unlock" method="post">
	<input type="hidden" name="which_cgi" value="unlock">
	<input type="hidden" name="webpage" value="initial.htm">
    <table height="100%" cellspacing="0" cellpadding="10" width="100%" border="0">
        <tr>
            <td valign="top">
            <!--<table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="listtopic" colspan="2">Network Locked</td>
                </tr>
            </table> -->
            <br>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td height="20">&nbsp;</td>
                </tr>  
                <tr>
                    <td width="100%" valign="top" class="head_top">
                    <p align="center" id="HomeTheNetworkislocked">The Network is locked! </p>
                    <p align="center" id="Homeunlockremaintime">There are <% asp_get("unlock_nck_time"); %> times to input the key now.</p>
                    </td>
                </tr>
                   <tr id = "inputkey" name = "inputkey">
   <td width="22%" valign="top" class="head">
    <p align="center"><font face="Arial"><b><span id="Homeunlockinputkey">Please input key to unlock the Network:</span></b></font>
    <input type="text" maxlength="16" size="22" id="unlock_key" name="unlock_num" style="font-family: Arial;"></p>
   </td>
  </tr>
            </table>
            <br>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td valign="bottom">
                    <div align="right">
                        <input id="HomeunlockApply" type="submit" value="Submit" name="Submit_unlock" style="font-family: Arial;" class="btn">
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
