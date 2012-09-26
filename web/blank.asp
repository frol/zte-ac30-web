<html>
<head>
<script language="JavaScript" src="js/protect.js"></script>
<script language="javascript">
var s_random = '<% asp_get("luck_num"); %>';

function whenclose()
{
	window.location = "/goform/logout_wclose";
}

function validate()
{
	var c_random = getlucknum();
	if (s_random != c_random)
	{
		window.location = "/goform/logout_wclose";
	}
}
</script>
</head>

<body onbeforeunload="whenclose();" onLoad="validate();">
</body>

</html>