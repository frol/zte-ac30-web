<html>
<head>
<title>Verizon Fivespot</title>
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="../js/prompt.js"></script>
<meta http-equiv="Pragma" content="no-cache">
<meta content="MSHTML 6.00.2900.3086" name="GENERATOR">
<link href="../style/normal_ws.css" type="text/css" rel="stylesheet">
<script src="../js/validate.js" type="text/javascript"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="javascript">
Butterlate.setTextDomain("main");
function initTranslation()
{
	/*var e = document.getElementById("HomePin");
			e.innerHTML = Get_string('Home Pin');
	var e = document.getElementById("HomeVerifyPin");
			e.innerHTML = Get_string('Home Verify Pin');
	var e = document.getElementById("HomePinInput");
			e.innerHTML = Get_string('Home Pin');	
	var e = document.getElementById("HomePinApply");
			e.value = Get_string('WAN Connection Apply');
			//
	var e = document.getElementById("pin_error");
			e.innerHTML = Get_string('Home Pin remain time')+'asp_get("pinnumber")'+Get_string('Home Pin remain time 2');	
		
	var e = document.getElementById("HomePinSave");
			e.innerHTML = Get_string('Home Pin Save');
			
			
	var e = document.getElementById("HomeSavePinCode");
			e.innerHTML = Get_string('Home Save Pin Code');	
			
			
	var e = document.getElementById("HomePinSaveDisable");
			e.innerHTML = Get_string('Home Pin Save Disable');	
	var e = document.getElementById("HomePinSaveEnable");
			e.innerHTML = Get_string('Home Pin Save Enable');	
		*/
}	

function login()
{
	if(document.getElementById("save_pin_enablebox").checked)
	{
		document.form_pin.pin_save_flag.value = 1;
	}
	else
	{
		document.form_pin.pin_save_flag.value = 0;
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
		    //alert("It must be number!");
		    return false;
		}

	}
	return true;
	
}
    function check_input()
    {
	    login();
        if (form_pin.pin_code.value == "")
        {
            ShowError(document.getElementById("pin_code"), 'PIN CODE BLANK'); 
            return false;
        }
        else
        {
            if ((form_pin.pin_code.value.length >= 4)&&(isNum(form_pin.pin_code.value) == true))
            {
                form_pin.Submit_PIN.disabled=true;
                return true;
            }
            else
            {
             ShowError(document.getElementById("pin_code"), 'PIN CODE ERROR'); 
                return false;
            }
        }
        return true;
    }
    </script>
    </head>
    <body bgcolor="white" vlink="#0000cc" alink="#0000cc" link="#0000cc" onLoad="initTranslation();" style="overflow:scroll;overflow-x:hidden;overflow-y:hidden;">
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
    
    <form name="form_pin" onsubmit="return check_input();" action="/goform/pin"  method="post"> 
	<input type="hidden" name="which_cgi" value="pin">
	<input type="hidden" name="webpage" value="initial.htm">   
        <table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
            <tr align="center">
                <td valign="top">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td class="listtopic" colspan="2" id="HomePin">MODEM LOCK</td>
                    </tr>
                    <tr>
						<td colspan="2">&nbsp;</td>
					</tr>
                </table>
                <br>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td height="20" class="title"><span id="HomeVerifyPin">Verify Modem Lock</span></td>
                    </tr>
                    <tr>
                        <td width="22%" valign="top" class="head_top"><font face="Arial">Password</font></td>
                        <td class="head_top_content" valign="top" width="78%">
                        <input type="password" maxlength="8" size="22" name="pin_code" id="pin_code" style="font-family: Arial;">
						</td>
                    </tr>
                    <tr>
                        <td width="22%" valign="top" class="head" id="HomePinSave"><b><font face="Arial">Password</font> Save</b></font></td>
                        <td class="head_content" valign="top" width="78%" >						
					   <INPUT type=hidden value  name="pin_save_flag" id="pin_save_flag">&nbsp;&nbsp;
                       <INPUT type=checkbox class="radiotype" id="save_pin_enablebox" name="save_pin_enablebox" <% asp_match("pin_save_flag","1","checked"); %>> <span id="HomeSavePinCode">Save</span>
		
				</td>
              </tr>
				<tr>
				<td width="22%" valign="top" class="head">&nbsp;</td>
				<td class="head_content" valign="top" width="78%"><font face="Arial" color="#0088C6"><div id="pin_error">&nbsp;</div></font></td>
				</tr>
                </table>
                <br>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td valign="bottom">
                        <div align="right">
                            <input id="HomePinApply" type="submit" value="Apply" name="Submit_PIN" style="font-family: Arial;" class="btn">
                        </div>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
        </body>
    </form>
    </html>
