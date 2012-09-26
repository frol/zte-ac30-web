<html>
<head>
<title>Verizon Fivespot</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="4; url=/adm/activing.asp" >
<link href="../style/normal_ws.css" type="text/css" rel="stylesheet">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">

var active_state ='<% asp_get("ppp0_record"); %>';
var active_flag ='<% asp_get("must_have_it"); %>';

function init_page()
{
	var flag = active_state_load(active_state);
	
	if(flag == 3)
	{
	    if(active_flag == 1)
		{ 
		  alert("Activate successfully!");
		}
		else
		{
		  alert("PRL update successfully!");
		}
		window.location = "/adm/home_wan.asp";
	}
	else if(flag == 2)
	{
		if(active_flag == 1)
		{ 
		  alert("Activate failed!");
		}
		else
		{
		  alert("PRL update failed!");
		}
		window.location = "/adm/home_wan.asp";
	}
	else if(flag == 4)
	{
		if(active_flag == 1)
		{ 
		 document.getElementById("message").innerHTML = "Activation in progress, please wait...";
		}
		else
		{
		 document.getElementById("message").innerHTML = "Update PRL in progress, please wait...";
		}
		
	}
	else if(flag == 1)
	{
		document.getElementById("message").innerHTML = "Programming in progress, please wait...";
	}
}

</script>
</head>

<body onLoad="init_page();">
<table height="100%" cellspacing="0" cellpadding="10" width="100%" border="0">
	<tr>
		<td valign="top">
		<br>
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td width="100%" valign="top" class="head_top">
				<p align="center">&nbsp;</p>
				<p align="center"><div id="message" align="center"></div></p>
				<p align="center">&nbsp;</p>
				</td>
			</tr>
		</table>
		<br>
		</td>
	</tr>
</table>
</body>

</html>
