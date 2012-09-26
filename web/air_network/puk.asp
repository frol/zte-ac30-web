<html>
<head>
<title>Verizon Fivespot</title>
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<meta content="MSHTML 6.00.2900.3086" name="GENERATOR">
<link href="../style/normal_ws.css" type="text/css" rel="stylesheet">
<script language="JavaScript" src="../js/validate.js"></script>
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="javascript">
Butterlate.setTextDomain("main");
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

function login()
{
	if(document.getElementById("save_pin_enablebox").checked)
	{
		document.form_puk.pin_save_flag.value = 1;
	}
	else
	{
		document.form_puk.pin_save_flag.value = 0;
	}
}
function check_input() 
{   
		writeHiddenNum();
		
         login();
         if (form_puk.puk_code.value == "") 
         { 
             ShowError(document.getElementById("puk_code"), 'PUK CODE BLANK'); 
             return false; 
         }
         if ((form_puk.puk_code.value.length < 8)||(isNum(form_puk.puk_code.value) == false)) 
         { 
                 ShowError(document.getElementById("puk_code"),'PUK CODE ERROR'); 
                 return false; 
         } 

         if (form_puk.New_Pin.value == "") 
         { 
             ShowError(document.getElementById("New_Pin"), 'NEWPIN BLANK'); 
             return false; 
         } 
         if ((form_puk.New_Pin.value.length < 4) || (isNum(form_puk.New_Pin.value) == false)) 
         { 
             ShowError(document.getElementById("New_Pin"), 'NEWPIN ERROR'); 
             return false; 
         } 
         if (form_puk.New_Pin.value != form_puk.retype_new_pin.value) 
         { 
             ShowError(document.getElementById("retype_new_pin"), 'NEWPIN DONT MATCH'); 
             return false; 
         }

		 //document.getElementById("form_puk").submit();
		 return true;
} 
function puk_remain_time()
	{
		var puk_time_remain = '<%asp_get("puknumber");%>';
		document.getElementById("puk_error").innerHTML = puk_time_remain+' times remaining for you to input PUK!';
	}
	
function initTranslation()
{
	var e = document.getElementById("Home_Puk_Title");
			e.innerHTML = Get_string('Home PUK');
	var e = document.getElementById("Home_Puk");
			e.innerHTML = Get_string('Home PUK');
	var e = document.getElementById("HomeVerifyPuk");
			e.innerHTML = Get_string('Home Verify PUK');
	var e = document.getElementById("HomePukNew_PIN");
			e.innerHTML = Get_string('Home PUK New PIN');
	var e = document.getElementById("HomePUKConfirm_NewPIN");
			e.innerHTML = Get_string('Home PUK Confirm New PIN');	
	var e = document.getElementById("HomePuk_Apply");
			e.value = Get_string('WAN Connection Apply');
			//
	var e = document.getElementById("puk_error");
			//e.innerHTML = Get_string('Home PUK remain time')+'<%asp_get("puknumber");%>'+Get_string('Home PUK remain time 2');	
			e.innerHTML = '<%asp_get("puknumber");%>'+Get_string('Home PUK remain time 2');	
		
	var e = document.getElementById("HomePinSave");
			e.innerHTML = Get_string('Home Pin Save');
			
			
	var e = document.getElementById("HomeSavePinCode");
			e.innerHTML = Get_string('Home Save Pin Code');	
			
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
<form name="form_puk" onsubmit="return check_input();" action="/goform/puk" method="post">
	<input type="hidden" name="lucknum" id="lucknum"/>
	<input type="hidden" name="which_cgi" value="puk">
	<input type="hidden" name="webpage" value="initial.htm">
         <table class="mainTable" cellspacing="0" cellpadding="0" border="0" height="100%">
             <tr> 
                 <td valign="top">
				 <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td class="listtopic" colspan="2" id="Home_Puk_Title">PUK</td>
                    </tr>
                    <tr>
            			<td colspan="2">&nbsp;</td>
            		</tr> 
                </table>
                 <table cellspacing="0" cellpadding="0" width="100%" border="0"> 
				     <tr>
                        <td height="20" colspan="2" class="title"><span id="HomeVerifyPuk">Verify PUK</span></td>
                     </tr>
                     <tr> 
                         <td width="22%" valign="top" class="head_top" id="Home_Puk">PUK</td> 
                         <td class="head_top_content" valign="top" width="78%"> 
                         <input type="password" maxlength="8" size="14" value="" name="puk_code" id="puk_code"> 
                         </td> 
                     </tr> 
					 <tr>
						<td width="22%" valign="top" class="head">&nbsp;</td>
						<td class="head_content" valign="top" width="78%"><div id="puk_error"></div></td>
					</tr>
					 
                     <tr> 
                         <td width="22%" valign="top" class="head" id="HomePukNew_PIN">New PIN</td> 
                         <td class="head_content" valign="top" width="78%"> 
                         <input type="password" maxlength="8" size="14" value="" name="New_Pin" id="New_Pin"> 
                         </td> 
                     </tr>
					  
                     <tr> 
                         <td width="22%" valign="top" class="head" id="HomePUKConfirm_NewPIN">Confirm New PIN</td> 
                         <td class="head_content" valign="top" width="78%"> 
                         <input type="password" maxlength="8" size="14" value="" name="retype_new_pin" id="retype_new_pin"> 
                         </td> 
                     </tr>
					 <tr>
                        <td width="22%" valign="top" class="head" id="HomePinSave"><b>PIN Save</b></font></td>
                       <td class="head_content" valign="top" width="78%">
                        
					   <INPUT type=hidden value  name="pin_save_flag" id="pin_save_flag">&nbsp;&nbsp;
                       <INPUT type=checkbox class="radiotype" id="save_pin_enablebox" name="save_pin_enablebox" <% asp_match("pin_save_flag","1","checked"); %>> <span id="HomeSavePinCode" style="color:#000000">Save</span>
					  </td>
                    </tr>			   
                 </table>
				 <br>
				 <table cellspacing="0" cellpadding="0" width="100%" border="0">
				 	 <tr> 
                     <td align="right" colspan="2"> 
                     <input id="HomePuk_Apply" type="submit" value="Apply" name="Submit_puk" style="font-family: Arial;" class="btn"></td> 
                     </tr>
			      </table>   
                 </td> 
             </tr>             
         </table>
</body>
</form> 
</html>
