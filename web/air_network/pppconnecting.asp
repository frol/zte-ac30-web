<html>
<head>
<title>Verizon Fivespot</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../style/normal_ws.css" type="text/css" rel="stylesheet">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" type="text/javascript">
function next_goto_page()
{

    var pppstate = '<% asp_get("ppp_status"); %>';
	if (pppstate == "ppp_connecting")
	{
		 window.location = "/air_network/pppconnect.asp";   		 
	}
	else if (pppstate == "ppp_disconnected")
	{
		alert("connect ppp fail!");
		window.location = "/air_network/net_connect.asp";   
	}
	else if ((pppstate == "ppp_connected") || (pppstate == "ppp_on_demand"))
	{
		window.location = "/air_network/net_connect.asp";   
	}
	
  
}

</script>
<meta content="MSHTML 6.00.2900.3086" name="GENERATOR">
</head>

<body onLoad="next_goto_page();">

</body>

</html>
