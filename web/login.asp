<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="Wed, 20 Jun 1997 22:33:00 GMT">
<meta http-equiv="set-cookie" content="Wed, 20 Jun 1997 22:33:00 GMT">
<title>Verizon Fivespot</title>
<link href="style/web.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js/lang.js"></script>
<script language="javascript" type="text/javascript">
var login_error = '<% showLoginErrorInfo(); %>';
var  login_save =  '<% asp_get("save_login"); %>';

var isCookieEnable = document.cookie?true:false;
if (!isCookieEnable)
{
	alert("Please make sure the cookie is enabled, or else you can't login!");
}

function getTimeStr(){
    var myDate = new Date();
    var year = myDate.getYear().toString();   
    var fullYear = myDate.getFullYear().toString(); 
    var month = myDate.getMonth()+1;   
	var mlen = month.toString().length;
	if(mlen == 1)
	{
		month = "0"+month;
	}	
    var day = myDate.getDate().toString(); 
	var daylen = day.length;
	if(daylen == 1)
	{
		day = "0"+day;
	}	
    //var week =myDate.getDay();    
    var time = myDate.getTime().toString();     
    var hour = myDate.getHours().toString();  
	var hourlen = hour.length;
	if(hourlen == 1)
	{
		hour = "0"+hour;
	}
    var minute = myDate.getMinutes().toString(); 
	var minutelen = minute.length;
	if(minutelen == 1)
	{
		minute = "0"+minute;
	}
    //var sec = myDate.getSeconds();   
	var dateStr = month+day+hour+minute+year;
	document.getElementById("systemDate").value = dateStr;
}

function clearit()
{
	//document.loginFrm.user.value = '';
	document.loginFrm.psw.value = '';
	
	document.getElementById("save_login_enablebox").checked = false;
	document.loginFrm.save_login.value = 0;
}

function login()
{
	if(document.getElementById("save_login_enablebox").checked)
	{
		document.loginFrm.save_login.value = 1;
	}
	else
	{
		document.loginFrm.save_login.value = 0;
	}
	
	writeLucknum();
}

function initTranslation()
{
	getTimeStr();
	
	if(login_error == "error")
	{
	  var e = document.getElementById("error_prompt");
	  e.innerHTML = "The password is incorrect!"; 
	}
	if(login_save == "1")
	{
		//document.getElementById("user").value = ' asp_get("user_save"); ';
		document.getElementById("psw").value = '<% asp_get("psw_save"); %>';
	}
	//document.loginFrm.user.focus();
}

function writeLucknum()
{
	var rand = Math.floor(Math.random() * 1000000);
	var lucknum = document.getElementById("systemDate").value + rand;
    document.cookie = "lucknum=" + lucknum;   
	document.getElementById("lucknum").value = lucknum;
} 
</script>
</head>

<body style="text-align:center; vertical-align:middle" bgcolor="black"  onLoad="initTranslation();">
<div id="mainDiv" align="center" style="background-color:#000000; vertical-align:middle">
<form name="loginFrm" action="/goform/login" onSubmit="login();"  method=post>
<INPUT type="hidden" value="" name="systemDate" id="systemDate"> 
<INPUT type="hidden" value="" name="lucknum" id="lucknum"> 
<input type="hidden" value="admin" name="user" id="user">
<table style="width:429px; height:288px; background-image:url(img/login_bg.png); margin-top:15%;margin-left:auto; margin-right:auto;" cellpadding="0" cellspacing="0" align="center">
	<tr height="34px" valign="middle" align="center" style="width:429px">
    	<td colspan="2"><span id="LoginWelcome" style="font-weight:bold;font-size:18px; letter-spacing:2px; color:#FFFFFF">Welcome to Verizon Fivespot</span></td>
    </tr>
    <tr height="47px" align="left" valign="middle">
    	<td colspan="2">&nbsp;&nbsp;&nbsp;<img width="242" height="47" src="img/webserver_logo.gif" /></td>
    </tr>
    <tr height="30px" style="background-color:#900">
    	<td colspan="2" height="30px">
			<iframe src="login_status.asp" height="23px" width="100%" frameborder="0" scrolling="no" target="_top" style="background-color:#900"></iframe>
        </td>
    </tr>
    <tr height="30px">
    	<td width="192px" align="right" style="font-weight:bold;font-size:14px; letter-spacing:2px; color:#000000"><div id="LoginUSERNAME">User Name :&nbsp;&nbsp;</div></td>
        <td width="237px" align="left"><input style="margin-left:10px;" class="textBox" type="text" size="15" maxlength="16" height="15px;" id='user_disable' name="user_disable" value="admin" disabled></td>
    </tr>
    <tr height="30px">
    	<td width="192px" align="right" style="font-weight:bold;font-size:14px; letter-spacing:2px; color:#000000"><div id="LoginPassword">Password&nbsp;:&nbsp;&nbsp;</div></td>
        <td width="237px" align="left"><input style="margin-left:10px;" class="textBox" type="password" size="15" maxlength="50" height="15px"; id='psw' name="psw"></td>
    </tr>
	<tr height="20px">
    	<td width="190px">&nbsp;</td>
        <td valign="baseline" width="237px"><INPUT type=hidden value  name="save_login" id="save_login">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=checkbox class="radiotype" id="save_login_enablebox" name="save_login_enablebox"  <% asp_match("save_login","1","checked"); %>><span id="Login_save_button">Save</span></td>
    </tr>
    <tr align="center" height="10px"><td colspan="3" id="error_prompt" style="color:#FF0000"></td></tr>
    <tr height="30px">
    	<td>&nbsp;</td>
        <td><input id="LoginButton"  type="submit" value="Login" class="upgrageButton" style="margin-left:8%;"><input id="LoginClear" type="button" style="margin-left:30px;" value="Clear" class="upgrageButton" onClick="clearit();"></td>
    </tr>
    <tr height="3px">
    	<td colspan="2"><hr width="420px"/></td>
    </tr>
    <tr>
    	<td colspan="2"><div style="color:#000000;font-size:11px; letter-spacing:1px; text-align:center;" id="LoginCopyright">Copyright (c) 1998-2011 ZTE Corporation. All rights reserved.</div></td>
    </tr>
    
</table>
</form>
</div>

</body>
</html>
