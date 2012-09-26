<html>
<head>
<title>Verizon Fivespot</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../style/normal_ws.css" type="text/css">
<script language="JavaScript" src="../js/prompt.js"></script>
<script language="JavaScript" src="../js/toptip.js"></script>
<script language="JavaScript" src="../js/lang.js"></script>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/wlan.js"></script>
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("wireless");

var  WPSonoff = '<% getCfgZero(1, "WscModeOption"); %>';


var PhyMode  = '<% getCfgZero(1, "WirelessMode"); %>';
var broadcastssidEnable  = '<% getCfgZero(1, "HideSSID"); %>';
var apisolated = '<% getCfgZero(1, "NoForwarding"); %>';
var countrycode = '<% getCfgGeneral(1, "CountryCode"); %>';
var channel_index  = '<% getWlanChannel(); %>';
var fxtxmode = '<% getCfgGeneral(1, "FixedTxMode"); %>';
var wdsMode  = '<% getCfgZero(1, "WdsEnable"); %>';
var wdsList  = '<% getCfgGeneral(1, "WdsList"); %>';
var wdsPhyMode  = '<% getCfgZero(1, "WdsPhyMode"); %>';
var wdsEncrypType  = '<% getWlanWdsEncType(); %>';
var wdsEncrypKey  = '<% getCfgGeneral(1, "WdsKey"); %>';

var ht_mode = '<% getCfgZero(1, "HT_OpMode"); %>';
var ht_bw = '<% getCfgZero(1, "HT_BW"); %>';
var ht_gi = '<% getCfgZero(1, "HT_GI"); %>';
var ht_stbc = '<% getCfgZero(1, "HT_STBC"); %>';
var ht_mcs = '<% getCfgZero(1, "HT_MCS"); %>';
var ht_htc = '<% getCfgZero(1, "HT_HTC"); %>';
var ht_rdg = '<% getCfgZero(1, "HT_RDG"); %>';
var ht_extcha = '<% getCfgZero(1, "HT_EXTCHA"); %>';
var ht_amsdu = '<% getCfgZero(1, "HT_AMSDU"); %>';
var ht_autoba = '<% getCfgZero(1, "HT_AutoBA"); %>';
var ht_badecline = '<% getCfgZero(1, "HT_BADecline"); %>';
var ht_f_40mhz = '<% getCfgZero(1, "HT_40MHZ_INTOLERANT"); %>';
var apcli_include = '<% getWlanApcliBuilt(); %>';
var max_stas_allowed = '<% getCfgZero(1, "MAX_Access_num"); %>';

var Selected_channel="no_channel";
ChannelList_24G = new Array(14);
ChannelList_24G[0] = "2412MHz (Channel 1)";
ChannelList_24G[1] = "2417MHz (Channel 2)";
ChannelList_24G[2] = "2422MHz (Channel 3)";
ChannelList_24G[3] = "2427MHz (Channel 4)";
ChannelList_24G[4] = "2432MHz (Channel 5)";
ChannelList_24G[5] = "2437MHz (Channel 6)";
ChannelList_24G[6] = "2442MHz (Channel 7)";
ChannelList_24G[7] = "2447MHz (Channel 8)";
ChannelList_24G[8] = "2452MHz (Channel 9)";
ChannelList_24G[9] = "2457MHz (Channel 10)";
ChannelList_24G[10] = "2462MHz (Channel 11)";
ChannelList_24G[11] = "2467MHz (Channel 12)";
ChannelList_24G[12] = "2472MHz (Channel 13)";
ChannelList_24G[13] = "2484MHz (Channel 14)";

ChannelList_5G = new Array(33);
ChannelList_5G[0] = "5180MHz (Channel 36)";
ChannelList_5G[1] = "5200MHz (Channel 40)";
ChannelList_5G[2] = "5220MHz (Channel 44)";
ChannelList_5G[3] = "5240MHz (Channel 48)";
ChannelList_5G[4] = "5260MHz (Channel 52)";
ChannelList_5G[5] = "5280MHz (Channel 56)";
ChannelList_5G[6] = "5300MHz (Channel 60)";
ChannelList_5G[7] = "5320MHz (Channel 64)";
ChannelList_5G[16] = "5500MHz (Channel 100)";
ChannelList_5G[17] = "5520MHz (Channel 104)";
ChannelList_5G[18] = "5540MHz (Channel 108)";
ChannelList_5G[19] = "5560MHz (Channel 112)";
ChannelList_5G[20] = "5580MHz (Channel 116)";
ChannelList_5G[21] = "5600MHz (Channel 120)";
ChannelList_5G[22] = "5620MHz (Channel 124)";
ChannelList_5G[23] = "5640MHz (Channel 128)";
ChannelList_5G[24] = "5660MHz (Channel 132)";
ChannelList_5G[25] = "5680MHz (Channel 136)";
ChannelList_5G[26] = "5700MHz (Channel 140)";
ChannelList_5G[28] = "5745MHz (Channel 149)";
ChannelList_5G[29] = "5765MHz (Channel 153)";
ChannelList_5G[30] = "5785MHz (Channel 157)";
ChannelList_5G[31] = "5805MHz (Channel 161)";
ChannelList_5G[32] = "5825MHz (Channel 165)";

HT5GExtCh = new Array(22);
HT5GExtCh[0] = new Array(1, "5200MHz (Channel 40)"); // channel 36's extension channel
HT5GExtCh[1] = new Array(0, "5180MHz (Channel 36)"); // channel 40's extension channel
HT5GExtCh[2] = new Array(1, "5240MHz (Channel 48)"); // channel 44's extension channel
HT5GExtCh[3] = new Array(0, "5220MHz (Channel 44)"); // channel 48's extension channel
HT5GExtCh[4] = new Array(1, "5280MHz (Channel 56)"); // channel 52's extension channel
HT5GExtCh[5] = new Array(0, "5260MHz (Channel 52)"); // channel 56's extension channel
HT5GExtCh[6] = new Array(1, "5320MHz (Channel 64)"); // channel 60's extension channel
HT5GExtCh[7] = new Array(0, "5300MHz (Channel 60)"); // channel 64's extension channel
HT5GExtCh[8] = new Array(1, "5520MHz (Channel 104)"); // channel 100's extension channel
HT5GExtCh[9] = new Array(0, "5500MHz (Channel 100)"); // channel 104's extension channel
HT5GExtCh[10] = new Array(1, "5560MHz (Channel 112)"); // channel 108's extension channel
HT5GExtCh[11] = new Array(0, "5540MHz (Channel 108)"); // channel 112's extension channel
HT5GExtCh[12] = new Array(1, "5600MHz (Channel 120)"); // channel 116's extension channel
HT5GExtCh[13] = new Array(0, "5580MHz (Channel 116)"); // channel 120's extension channel
HT5GExtCh[14] = new Array(1, "5640MHz (Channel 128)"); // channel 124's extension channel
HT5GExtCh[15] = new Array(0, "5620MHz (Channel 124)"); // channel 128's extension channel
HT5GExtCh[16] = new Array(1, "5680MHz (Channel 136)"); // channel 132's extension channel
HT5GExtCh[17] = new Array(0, "5660MHz (Channel 132)"); // channel 136's extension channel
HT5GExtCh[18] = new Array(1, "5765MHz (Channel 153)"); // channel 149's extension channel
HT5GExtCh[19] = new Array(0, "5745MHz (Channel 149)"); // channel 153's extension channel
HT5GExtCh[20] = new Array(1, "5805MHz (Channel 161)"); // channel 157's extension channel
HT5GExtCh[21] = new Array(0, "5785MHz (Channel 157)"); // channel 161's extension channel


function style_display_on()
{
	if (window.ActiveXObject)
	{ // IE
		return "block";
	}
	else if (window.XMLHttpRequest)
	{ // Mozilla, Safari,...
		return "table-row";
	}
}

function insertChannelOption(vChannel, band)
{
	var y = document.createElement('option');

	if (1*band == 24)
	{
		y.text = ChannelList_24G[1*vChannel - 1];
		y.value = 1*vChannel;
	}
	else if (1*band == 5)
	{
		y.value = 1*vChannel;
		if (1*vChannel <= 140)
			y.text = ChannelList_5G[((1*vChannel) - 36) / 4];
		else
			y.text = ChannelList_5G[((1*vChannel) - 36 - 1) / 4];
	}

	if (1*band == 24)
		var x=document.getElementById("sz11gChannel");
	else if (1*band == 5)
		var x=document.getElementById("sz11aChannel");

	try
	{
		x.add(y,null); 
	}
	catch(ex)
	{
		x.add(y); 
	}
}

function CreateExtChannelOption(vChannel)
{
	var y = document.createElement('option');

	y.text = ChannelList_24G[1*vChannel - 1];
	y.value = 1;

	var x = document.getElementById("n_extcha");

	try
	{
		x.add(y,null); // standards compliant
	}
	catch(ex)
	{
		x.add(y); // IE only
	}
}

function insertExtChannelOption()
{
	var wmode = document.wireless_basic.wirelessmode.options.selectedIndex;
	var option_length; 
	var CurrentCh;

		if (1*wmode == 3)
	{
		var x = document.getElementById("n_extcha");
		var length = document.wireless_basic.n_extcha.options.length;

		if (length > 1)
		{
			x.selectedIndex = 1;
			x.remove(x.selectedIndex);
		}
		if (1*wmode == 3)
		{
			CurrentCh = document.wireless_basic.sz11gChannel.value;
			option_length = document.wireless_basic.sz11gChannel.options.length;

			if ((CurrentCh >=1) && (CurrentCh <= 4))
			{
				x.options[0].text = ChannelList_24G[1*CurrentCh + 4 - 1];
				x.options[0].value = 1*CurrentCh + 4;
			}
			else if ((CurrentCh >= 5) && (CurrentCh <= 7))
			{
				x.options[0].text = ChannelList_24G[1*CurrentCh - 4 - 1];
				x.options[0].value = 0; //1*CurrentCh - 4;
				CurrentCh = 1*CurrentCh;
				CurrentCh += 4;
				CreateExtChannelOption(CurrentCh);
			}
			else if ((CurrentCh >= 8) && (CurrentCh <= 9))
			{
				x.options[0].text = ChannelList_24G[1*CurrentCh - 4 - 1];
				x.options[0].value = 0; //1*CurrentCh - 4;

				if (option_length >=14)
				{
					CurrentCh = 1*CurrentCh;
					CurrentCh += 4;
					CreateExtChannelOption(CurrentCh);
				}
			}
			else if (CurrentCh == 10)
			{
				x.options[0].text = ChannelList_24G[1*CurrentCh - 4 - 1];
				x.options[0].value = 0; //1*CurrentCh - 4;

				if (option_length > 14)
				{
					CurrentCh = 1*CurrentCh;
					CurrentCh += 4;
					CreateExtChannelOption(CurrentCh);
				}
			}
			else if (CurrentCh >= 11)
			{
				x.options[0].text = ChannelList_24G[1*CurrentCh - 4 - 1];
				x.options[0].value = 0; //1*CurrentCh - 4;
			}
			else
			{
				x.options[0].text = "Auto Select";
				x.options[0].value = 0;
			}
		}
	}
}

function ChannelOnChange()
{
	if (document.wireless_basic.n_bandwidth[1].checked == true)
	{
		var w_mode = document.wireless_basic.wirelessmode.options.selectedIndex;

		if (1*w_mode == 3)
		{
			if (document.wireless_basic.n_bandwidth[1].checked == true)
			{
				document.getElementById("extension_channel").style.visibility = "visible";
				document.getElementById("extension_channel").style.display = style_display_on();
				document.wireless_basic.n_extcha.disabled = false;
			}

			if (document.wireless_basic.sz11gChannel.options.selectedIndex == 0)
			{
				document.getElementById("extension_channel").style.visibility = "hidden";
				document.getElementById("extension_channel").style.display = "none";
				document.wireless_basic.n_extcha.disabled = true;
			}
		}
	}

	insertExtChannelOption();
}

function Channel_BandWidth_onClick()
{
	var w_mode = document.wireless_basic.wirelessmode.options.selectedIndex;

	if (document.wireless_basic.n_bandwidth[0].checked == true)
	{
		document.getElementById("extension_channel").style.visibility = "hidden";
		document.getElementById("extension_channel").style.display = "none";
		document.wireless_basic.n_extcha.disabled = true;
	}
	else
	{
		document.getElementById("extension_channel").style.visibility = "visible";
		document.getElementById("extension_channel").style.display = style_display_on();
		document.wireless_basic.n_extcha.disabled = false;
	}
}

function Check5GBandChannelException()
{
}

function initbChannel()
{
      var i = 0;

	document.wireless_basic.sz11bChannel.options.length =0;
	document.wireless_basic.sz11bChannel.options[0] = new Option("AutoSelect", "0");

	for (i = 0; i <=10; i++)
	{
	document.wireless_basic.sz11bChannel.options[i+1] = new Option((2412+5*i)+"MHz(Channel" + (i+1) + ")", i+1);   
	}

	if(countrycode == "JP")
		{
	for (i = 11; i < 13; i++)
	{
		document.wireless_basic.sz11bChannel.options[i+1] = new Option((2412+5*i)+"MHz(Channel" + (i+1) + ")", i+1);   
	}

	}
    	document.wireless_basic.sz11bChannel.options.selectedIndex = 1*channel_index;

}

function initgChannel()
{
      var i = 0;
	document.wireless_basic.sz11gChannel.options.length =0;
	document.wireless_basic.sz11gChannel.options[0] = new Option("AutoSelect", "0");
	
	for (i = 0; i <= 10; i++)
	{
		document.wireless_basic.sz11gChannel.options[i+1] = new Option((2412+5*i)+"MHz(Channel" + (i+1) + ")", i+1);   
	}
	if(countrycode == "JP")
     	{
		for (i = 11; i < 13; i++)
		{
			document.wireless_basic.sz11gChannel.options[i+1] = new Option((2412+5*i)+"MHz(Channel" + (i+1) + ")", i+1);   
		}

	}
 	document.wireless_basic.sz11gChannel.options.selectedIndex = 1*channel_index;

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

function initValue()
{
	check_active_state();
	
	var ssidArray;
	var wdslistArray;
	var broadcastssidArray;
	var channel_11a_index;
	var current_channel_length;

	if (countrycode == '')
	   {
		 countrycode = 'NONE';
    	document.wireless_basic.country_code.options.selectedIndex = 2;
	    }	
	else if (countrycode == "US")
		{
		document.wireless_basic.country_code.options.selectedIndex = 0;
		}
	else if (countrycode == "JP")
		{
		document.wireless_basic.country_code.options.selectedIndex = 1;
		}
     else 
		{
	     document.wireless_basic.country_code.options.selectedIndex = 2;		
		}
//       alert('000');
	 initbChannel();
	 initgChannel();
		

	document.getElementById("div_11a_channel").style.visibility = "hidden";
	document.getElementById("div_11a_channel").style.display = "none";
	document.wireless_basic.sz11aChannel.disabled = true;
	document.getElementById("div_11b_channel").style.visibility = "hidden";
	document.getElementById("div_11b_channel").style.display = "none";
	document.wireless_basic.sz11bChannel.disabled = true;
	document.getElementById("div_11g_channel").style.visibility = "hidden";
	document.getElementById("div_11g_channel").style.display = "none";
	document.wireless_basic.sz11gChannel.disabled = true;
	document.getElementById("div_11n").style.display = "none";
	document.wireless_basic.n_mode.disabled = true;
	document.wireless_basic.n_bandwidth.disabled = true;
	document.wireless_basic.n_rdg.disabled = true;
	document.wireless_basic.n_gi.disabled = true;
	document.wireless_basic.n_mcs.disabled = true;
	//document.getElementById("div_11n_plugfest").style.display = "none";
	//document.wireless_basic.f_40mhz.disabled = true;

	PhyMode = 1*PhyMode;

	if (PhyMode >= 8)
	{
		if (window.ActiveXObject) // IE
			document.getElementById("div_11n").style.display = "block";
		else if (window.XMLHttpRequest)  // Mozilla, Safari,...
			document.getElementById("div_11n").style.display = "table";
		document.wireless_basic.n_mode.disabled = false;
		document.wireless_basic.n_bandwidth.disabled = false;
		document.wireless_basic.n_rdg.disabled = false;
		document.wireless_basic.n_gi.disabled = false;
		document.wireless_basic.n_mcs.disabled = false;
		//document.getElementById("div_11n_plugfest").style.display = "block";
		//document.wireless_basic.f_40mhz.disabled = false;
	}

	if ((PhyMode == 0) || (PhyMode == 4) || (PhyMode == 9))
	{
		if (PhyMode == 0)
			document.wireless_basic.wirelessmode.options.selectedIndex = 0;
		else if (PhyMode == 4)
			document.wireless_basic.wirelessmode.options.selectedIndex = 2;
		else if (PhyMode == 9)
			//document.wireless_basic.wirelessmode.options.selectedIndex = 5;  
			document.wireless_basic.wirelessmode.options.selectedIndex = 3;

		document.getElementById("div_11g_channel").style.visibility = "visible";
		document.getElementById("div_11g_channel").style.display = style_display_on();
		document.wireless_basic.sz11gChannel.disabled = false;
		Selected_channel="g_channel";
	}
	else if (PhyMode == 1)
	{
		document.wireless_basic.wirelessmode.options.selectedIndex = 1;
		document.getElementById("div_11b_channel").style.visibility = "visible";
		document.getElementById("div_11b_channel").style.display = style_display_on();
		document.wireless_basic.sz11bChannel.disabled = false;
		Selected_channel="b_channel";
	}
	
	broadcastssidArray = broadcastssidEnable.split(";");
	if (1*broadcastssidArray[0] == 0)
		document.wireless_basic.broadcastssid[1].checked = true;
	else
		document.wireless_basic.broadcastssid[0].checked = true;

	if (1*ht_bw == 0)
	{
		document.wireless_basic.n_bandwidth[0].checked = true;
		document.getElementById("extension_channel").style.visibility = "hidden";
		document.getElementById("extension_channel").style.display = "none";
		document.wireless_basic.n_extcha.disabled = true;
	}
	else
	{
		document.wireless_basic.n_bandwidth[1].checked = true;
		document.getElementById("extension_channel").style.visibility = "visible";
		document.getElementById("extension_channel").style.display = style_display_on();
		document.wireless_basic.n_extcha.disabled = false;
	}

	channel_index = 1*channel_index;
	if ((PhyMode == 0) || (PhyMode == 4) || (PhyMode == 9))
	{
		document.wireless_basic.sz11gChannel.options.selectedIndex = channel_index;

		current_channel_length = document.wireless_basic.sz11gChannel.options.length;

		if ((channel_index + 1) > current_channel_length)
			document.wireless_basic.sz11gChannel.options.selectedIndex = 0;
	}
	else if (PhyMode == 1)
	{
		document.wireless_basic.sz11bChannel.options.selectedIndex = channel_index;

		current_channel_length = document.wireless_basic.sz11bChannel.options.length;

		if ((channel_index + 1) > current_channel_length)
			document.wireless_basic.sz11bChannel.options.selectedIndex = 0;
	}
	else if ((PhyMode == 2) || (PhyMode == 8))
	{
		if (countrycode == 'NONE')
		{
			if (channel_index <= 64)
			{
				channel_11a_index = channel_index;
				channel_11a_index = channel_11a_index / 4;
				if (channel_11a_index != 0)
					channel_11a_index = channel_11a_index - 8;
			}
			else if ((channel_index >= 100) && (channel_index <= 140))
			{
				channel_11a_index = channel_index;
				channel_11a_index = channel_11a_index / 4;
				channel_11a_index = channel_11a_index - 16;
			}
			else if (channel_index >= 149)
			{
				channel_11a_index = channel_index - 1;
				channel_11a_index = channel_11a_index / 4;
				channel_11a_index = channel_11a_index - 17;
				//zhao delete		/*fangxia dell */
			}
			else
			{
				channel_11a_index = 0;
			}
		}
		else if ((countrycode == 'US') || (countrycode == 'HK') || (countrycode == 'FR') || (countrycode == 'IE'))
		{
			if (channel_index <= 64)
			{
				channel_11a_index = channel_index;
				channel_11a_index = channel_11a_index / 4;
				if (channel_11a_index != 0)
					channel_11a_index = channel_11a_index - 8;
			}
			else if (channel_index >= 149)
			{
				channel_11a_index = channel_index - 1;
				channel_11a_index = channel_11a_index / 4;
				channel_11a_index = channel_11a_index - 28;
			}
			else
			{
				channel_11a_index = 0;
			}
		}
		else if (countrycode == 'JP')
		{
			if (channel_index <= 48)
			{
				channel_11a_index = channel_index;
				channel_11a_index = channel_11a_index / 4;
				if (channel_11a_index != 0)
					channel_11a_index = channel_11a_index - 8;
			}
			else
			{
				channel_11a_index = 0;
			}
		}
		else if (countrycode == 'TW')
		{
			if (channel_index <= 64)
			{
				channel_11a_index = channel_index;
				channel_11a_index = channel_11a_index / 4;
				if (channel_11a_index != 0)
					channel_11a_index = channel_11a_index - 12;
			}
			else if (channel_index >= 149)
			{
				channel_11a_index = channel_index - 1;
				channel_11a_index = channel_11a_index / 4;
				channel_11a_index = channel_11a_index - 32;
			}
			else
			{
				channel_11a_index = 0;
			}
		}
		else if (countrycode == 'CN')
		{
			if (channel_index >= 149)
			{
				channel_11a_index = channel_index - 1;
				channel_11a_index = channel_11a_index / 4;
				channel_11a_index = channel_11a_index - 36;
			}
			else
			{
				channel_11a_index = 0;
			}
		}
		else
		{
			channel_11a_index = 0;
		}

		Check5GBandChannelException();

		if (channel_index > 0)
			document.wireless_basic.sz11aChannel.options.selectedIndex = channel_11a_index;
		else
			document.wireless_basic.sz11aChannel.options.selectedIndex = channel_index;
	}

	if (apisolated == "1")
		document.wireless_basic.apisolated[0].checked = true;
	else
		document.wireless_basic.apisolated[1].checked = true;

	document.wireless_basic.wds_phy_mode.options.length = 1;
	if (PhyMode != 1) {
		document.wireless_basic.wds_phy_mode.options[1] = new Option("OFDM", "OFDM;OFDM;OFDM;OFDM");
		if (PhyMode != 0 && PhyMode != 2 && PhyMode != 4)
		{
			document.wireless_basic.wds_phy_mode.options[2] = new Option("HTMIX", "HTMIX;HTMIX;HTMIX;HTMIX");
			document.wireless_basic.wds_phy_mode.options[3] = new Option("GREENFIELD", "GREENFIELD;GREENFIELD;GREENFIELD;GREENFIELD");
		}
	}

	if (wdsList != "")
	{
		wdslistArray = wdsList.split(";");
		for(i = 1; i <= wdslistArray.length; i++)
			eval("document.wireless_basic.wds_"+i).value = wdslistArray[i - 1];
	}

	wdsMode = 1*wdsMode;
	if (wdsMode == 0)
		document.wireless_basic.wds_mode.options.selectedIndex = 0;
	else if (wdsMode == 4)
		document.wireless_basic.wds_mode.options.selectedIndex = 1;
	else if (wdsMode == 2)
		document.wireless_basic.wds_mode.options.selectedIndex = 2;
	else if (wdsMode == 3)
		document.wireless_basic.wds_mode.options.selectedIndex = 3;

	if (wdsPhyMode.indexOf("CCK") >= 0 || wdsPhyMode.indexOf("cck") >= 0)
		document.wireless_basic.wds_phy_mode.options.selectedIndex = 0;
	else if (wdsPhyMode.indexOf("OFDM") >= 0 || wdsPhyMode.indexOf("ofdm") >= 0)
		document.wireless_basic.wds_phy_mode.options.selectedIndex = 1;
	else if (wdsPhyMode.indexOf("HTMIX") >= 0 || wdsPhyMode.indexOf("htmix") >= 0)
		document.wireless_basic.wds_phy_mode.options.selectedIndex = 2;
	else if (wdsPhyMode.indexOf("GREENFIELD") >= 0 || wdsPhyMode.indexOf("greenfield") >= 0)
		document.wireless_basic.wds_phy_mode.options.selectedIndex = 3;
	document.wireless_basic.wds_encryp_type.options.selectedIndex = 1*wdsEncrypType;
	document.wireless_basic.wds_encryp_key.value = wdsEncrypKey;

	WdsModeOnChange();

	insertExtChannelOption();

	if (1*ht_mode == 0)
	{
		document.wireless_basic.n_mode[0].checked = true;
	}
	else if (1*ht_mode == 1)
	{
		document.wireless_basic.n_mode[1].checked = true;
	}

	else if (1*ht_mode == 2)
	{
		document.wireless_basic.n_mode[2].checked = true;
	}

	if (1*ht_gi == 0)
	{
		document.wireless_basic.n_gi[0].checked = true;
	}
	else if (1*ht_gi == 1)
	{
		document.wireless_basic.n_gi[1].checked = true;
	}
	else if (1*ht_gi == 2)
	{
		document.wireless_basic.n_gi[2].checked = true;
	}

	if (1*ht_mcs <= 15)
		document.wireless_basic.n_mcs.options.selectedIndex = ht_mcs;
	else if (1*ht_mcs == 32)
		document.wireless_basic.n_mcs.options.selectedIndex = 16;
	else if (1*ht_mcs == 33)
		document.wireless_basic.n_mcs.options.selectedIndex = 17;

	if (1*ht_rdg == 0)
		document.wireless_basic.n_rdg[0].checked = true;
	else
		document.wireless_basic.n_rdg[1].checked = true;

	var option_length = document.wireless_basic.n_extcha.options.length;

	if (1*ht_extcha == 0)
	{
		if (option_length > 1)
			document.wireless_basic.n_extcha.options.selectedIndex = 0;
	}
	else if (1*ht_extcha == 1)
	{
		if (option_length > 1)
			document.wireless_basic.n_extcha.options.selectedIndex = 1;
	}
	else
	{
		document.wireless_basic.n_extcha.options.selectedIndex = 0;
	}

	if (1*PhyMode == 8)
	{
		if (document.wireless_basic.sz11aChannel.options.selectedIndex == 0)
		{
			document.getElementById("extension_channel").style.visibility = "hidden";
			document.getElementById("extension_channel").style.display = "none";
			document.wireless_basic.n_extcha.disabled = true;
		}
	}
	else if (1*PhyMode == 9)
	{
		if (document.wireless_basic.sz11gChannel.options.selectedIndex == 0)
		{
			document.getElementById("extension_channel").style.visibility = "hidden";
			document.getElementById("extension_channel").style.display = "none";
			document.wireless_basic.n_extcha.disabled = true;
		}
	}

	if (1*ht_amsdu == 0)
		document.wireless_basic.n_amsdu[0].checked = true;
	else
		document.wireless_basic.n_amsdu[1].checked = true;

	if (1*ht_autoba == 0)
		document.wireless_basic.n_autoba[0].checked = true;
	else
		document.wireless_basic.n_autoba[1].checked = true;

	if (1*ht_badecline == 0)
		document.wireless_basic.n_badecline[0].checked = true;
	else
		document.wireless_basic.n_badecline[1].checked = true;

	if (1*apcli_include == 1)
	{
		document.wireless_basic.mssid_7.disabled = true;
	}
	
	if(1*max_stas_allowed>0 && 1*max_stas_allowed <6)
	{
	  document.wireless_basic.Allow_MAX_STAs.options.selectedIndex = 1*(max_stas_allowed-1) ;
	}

}

function wirelessModeChange()
{   
       var   current_bchannel_length =  document.wireless_basic.sz11bChannel.options.length;
       var   current_gchannel_length =  document.wireless_basic.sz11gChannel.options.length;
	   
       var   current_bchannel_index =  document.wireless_basic.sz11bChannel.options.selectedIndex;
       var   current_gchannel_index =  document.wireless_basic.sz11gChannel.options.selectedIndex;
    //   alert('b'+current_bchannel_index +'    g'+current_gchannel_index);
	var wmode;
	document.getElementById("div_11a_channel").style.visibility = "hidden";
	document.getElementById("div_11a_channel").style.display = "none";
	document.wireless_basic.sz11aChannel.disabled = true;
	document.getElementById("div_11b_channel").style.visibility = "hidden";
	document.getElementById("div_11b_channel").style.display = "none";
	document.wireless_basic.sz11bChannel.disabled = true;
	document.getElementById("div_11g_channel").style.visibility = "hidden";
	document.getElementById("div_11g_channel").style.display = "none";
	document.wireless_basic.sz11gChannel.disabled = true;
	//document.getElementById("div_abg_rate").style.visibility = "hidden";
	//document.getElementById("div_abg_rate").style.display = "none";
	//document.wireless_basic.abg_rate.disabled = true;
	document.getElementById("div_11n").style.display = "none";
	document.wireless_basic.n_mode.disabled = true;
	document.wireless_basic.n_bandwidth.disabled = true;
	document.wireless_basic.n_rdg.disabled = true;
	document.wireless_basic.n_gi.disabled = true;
	document.wireless_basic.n_mcs.disabled = true;

	wmode = document.wireless_basic.wirelessmode.options.selectedIndex;

	wmode = 1*wmode;
	if (wmode == 0 || wmode == 2 )
	{
		document.wireless_basic.wirelessmode.options.selectedIndex = (wmode == 0)?0:2 ;
		document.getElementById("div_11g_channel").style.visibility = "visible";
		document.getElementById("div_11g_channel").style.display = style_display_on();
		document.wireless_basic.sz11gChannel.disabled = false;
		Selected_channel="g_channel";
		document.wireless_basic.sz11gChannel.options.selectedIndex = current_gchannel_index;

	}
	else if (wmode == 1)
	{
		document.wireless_basic.wirelessmode.options.selectedIndex = 1;
		document.getElementById("div_11b_channel").style.visibility = "visible";
		document.getElementById("div_11b_channel").style.display = style_display_on();
		document.wireless_basic.sz11bChannel.disabled = false;
		Selected_channel="b_channel";
	 document.wireless_basic.sz11bChannel.options.selectedIndex = current_bchannel_index;
	}
	
	document.wireless_basic.wds_phy_mode.options.length = 1;
	if (wmode != 1) {
		document.wireless_basic.wds_phy_mode.options[1] = new Option("OFDM", "OFDM;OFDM;OFDM;OFDM");
		if (wmode != 0 && wmode != 2)
		{
			document.wireless_basic.wds_phy_mode.options[2] = new Option("HTMIX", "HTMIX;HTMIX;HTMIX;HTMIX");
			document.wireless_basic.wds_phy_mode.options[3] = new Option("GREENFIELD", "GREENFIELD;GREENFIELD;GREENFIELD;GREENFIELD");
		}
	}
}
function CountryCodeOnChange()
{
	  var countrycode_idex ;
	  var i = 0;
	  var wmode;
         var current_channel_length;

  	wmode = document.wireless_basic.wirelessmode.options.selectedIndex;
	countrycode_idex = document.wireless_basic.country_code.options.selectedIndex;
	wmode = 1*wmode;
	countrycode_idex = 1*countrycode_idex;
	 

	document.wireless_basic.sz11bChannel.options.length =0;
	document.wireless_basic.sz11bChannel.options[0] = new Option("AutoSelect", "0");

	for (i = 0; i <= 10; i++)
	{
		document.wireless_basic.sz11bChannel.options[i+1] = new Option((2412+5*i)+"MHz(Channel" + (i+1) + ")", i+1);   
	}
	
	if(countrycode_idex == 1)
	{
			for (i = 11; i < 13; i++)
			{
				document.wireless_basic.sz11bChannel.options[i+1] = new Option((2412+5*i)+"MHz(Channel" + (i+1) + ")", i+1);   
			}

	}
	 
	document.wireless_basic.sz11gChannel.options.length =0;
	document.wireless_basic.sz11gChannel.options[0] = new Option("AutoSelect", "0");
	for (i = 0; i <= 10; i++)
	{
		document.wireless_basic.sz11gChannel.options[i+1] = new Option((2412+5*i)+"MHz(Channel" + (i+1) + ")", i+1);   
	}
	if(countrycode_idex == 1)
	{
		for (i = 11; i < 13; i++)
		{
		document.wireless_basic.sz11gChannel.options[i+1] = new Option((2412+5*i)+"MHz(Channel" + (i+1) + ")", i+1);   
		}

	}


	if (wmode == 0 || wmode == 2  )
	{
	      current_channel_length = document.wireless_basic.sz11gChannel.options.length;

		document.getElementById("div_11a_channel").style.visibility = "hidden";
		document.getElementById("div_11a_channel").style.display = "none";
		document.wireless_basic.sz11aChannel.disabled = true;
		document.getElementById("div_11b_channel").style.visibility = "hidden";
		document.getElementById("div_11b_channel").style.display = "none";
		document.wireless_basic.sz11bChannel.disabled = true;

		document.getElementById("div_11g_channel").style.visibility = "visible";
		document.getElementById("div_11g_channel").style.display = style_display_on();
		document.wireless_basic.sz11gChannel.disabled = false;
		Selected_channel="g_channel";
		if(1*channel_index+1 > current_channel_length)
		{
		  document.wireless_basic.sz11gChannel.options.selectedIndex = 0;
		}	
		else
		{
		  document.wireless_basic.sz11gChannel.options.selectedIndex = 1*channel_index;
	       }
			
	}
	else if (wmode == 1)
	{
	      current_channel_length = document.wireless_basic.sz11bChannel.options.length;

		document.getElementById("div_11a_channel").style.visibility = "hidden";
		document.getElementById("div_11a_channel").style.display = "none";
		document.wireless_basic.sz11aChannel.disabled = true;
		document.getElementById("div_11g_channel").style.visibility = "hidden";
		document.getElementById("div_11g_channel").style.display = "none";
		document.wireless_basic.sz11gChannel.disabled = true;

		document.getElementById("div_11b_channel").style.visibility = "visible";
		document.getElementById("div_11b_channel").style.display = style_display_on();
		document.wireless_basic.sz11bChannel.disabled = false;
		Selected_channel="b_channel";
		if(1*channel_index+1 > current_channel_length)
		{
		  document.wireless_basic.sz11bChannel.options.selectedIndex = 0;
		}
            else
		{
		  document.wireless_basic.sz11bChannel.options.selectedIndex = 1*channel_index;
	       }

	}
	
	
}
function WdsModeOnChange()
{
	document.getElementById("div_wds_phy_mode").style.visibility = "hidden";
	document.getElementById("div_wds_phy_mode").style.display = "none";
	document.wireless_basic.wds_phy_mode.disabled = true;
	document.getElementById("div_wds_encryp_type").style.visibility = "hidden";
	document.getElementById("div_wds_encryp_type").style.display = "none";
	document.wireless_basic.wds_encryp_type.disabled = true;
	document.getElementById("div_wds_encryp_key").style.visibility = "hidden";
	document.getElementById("div_wds_encryp_key").style.display = "none";
	document.wireless_basic.wds_encryp_key.disabled = true;
	document.getElementById("wds_mac_list_1").style.visibility = "hidden";
	document.getElementById("wds_mac_list_1").style.display = "none";
	document.wireless_basic.wds_1.disabled = true;
	document.getElementById("wds_mac_list_2").style.visibility = "hidden";
	document.getElementById("wds_mac_list_2").style.display = "none";
	document.wireless_basic.wds_2.disabled = true;
	document.getElementById("wds_mac_list_3").style.visibility = "hidden";
	document.getElementById("wds_mac_list_3").style.display = "none";
	document.wireless_basic.wds_3.disabled = true;
	document.getElementById("wds_mac_list_4").style.visibility = "hidden";
	document.getElementById("wds_mac_list_4").style.display = "none";
	document.wireless_basic.wds_4.disabled = true;

	if (document.wireless_basic.wds_mode.options.selectedIndex >= 1)
	{
		document.getElementById("div_wds_phy_mode").style.visibility = "visible";
		document.getElementById("div_wds_phy_mode").style.display = style_display_on();
		document.wireless_basic.wds_phy_mode.disabled = false;
		document.getElementById("div_wds_encryp_type").style.visibility = "visible";
		document.getElementById("div_wds_encryp_type").style.display = style_display_on();
		document.wireless_basic.wds_encryp_type.disabled = false;

		if (document.wireless_basic.wds_encryp_type.options.selectedIndex >= 1)
		{
			document.getElementById("div_wds_encryp_key").style.visibility = "visible";
			document.getElementById("div_wds_encryp_key").style.display = style_display_on();
			document.wireless_basic.wds_encryp_key.disabled = false;
			
			if (document.wireless_basic.wds_encryp_type.options.selectedIndex == 1)
			{
				document.getElementById("div_wds_encryp_key").style.visibility = "hidden";
				document.getElementById("div_wds_encryp_key").style.display = "none";
				document.wireless_basic.wds_encryp_key.disabled = true;
			}
		}
	}

	if (document.wireless_basic.wds_mode.options.selectedIndex >= 2)
	{
		document.getElementById("wds_mac_list_1").style.visibility = "visible";
		document.getElementById("wds_mac_list_1").style.display = style_display_on();
		document.wireless_basic.wds_1.disabled = false;
		document.getElementById("wds_mac_list_2").style.visibility = "visible";
		document.getElementById("wds_mac_list_2").style.display = style_display_on();
		document.wireless_basic.wds_2.disabled = false;
		document.getElementById("wds_mac_list_3").style.visibility = "visible";
		document.getElementById("wds_mac_list_3").style.display = style_display_on();
		document.wireless_basic.wds_3.disabled = false;
		document.getElementById("wds_mac_list_4").style.visibility = "visible";
		document.getElementById("wds_mac_list_4").style.display = style_display_on();
		document.wireless_basic.wds_4.disabled = false;
	}
}

function WdsSecurityOnChange()
{
	document.getElementById("div_wds_encryp_key").style.visibility = "hidden";
	document.getElementById("div_wds_encryp_key").style.display = "none";
	document.wireless_basic.wds_encryp_key.disabled = true;

	if (document.wireless_basic.wds_encryp_type.options.selectedIndex >= 1)
	{
		document.getElementById("div_wds_encryp_key").style.visibility = "visible";
		document.getElementById("div_wds_encryp_key").style.display = style_display_on();
		document.wireless_basic.wds_encryp_key.disabled = false;
		
		if (document.wireless_basic.wds_encryp_type.options.selectedIndex == 1) 
		{
			document.getElementById("div_wds_encryp_key").style.visibility = "hidden";
			document.getElementById("div_wds_encryp_key").style.display = "none";
			document.wireless_basic.wds_encryp_key.disabled = true;
		}
	}
}

function checkInjection(str)
{
	var len = str.length;
	for (var i=0; i<str.length; i++) {
		if ( str.charAt(i) == '\r' || str.charAt(i) == '\n'){
				return false;
		}else
	        continue;
	}
    return true;
}

function checkHex(str){
	var len = str.length;

	for (var i=0; i<str.length; i++) {
		if ((str.charAt(i) >= '0' && str.charAt(i) <= '9') ||
			(str.charAt(i) >= 'a' && str.charAt(i) <= 'f') ||
			(str.charAt(i) >= 'A' && str.charAt(i) <= 'F') ){
				continue;
		}else
	        return false;
	}
    return true;
}




function CheckValue()
{
	var wireless_mode;
	var submit_ssid_num;
	var channel_11a_index;
	var check_wds_mode;
	var all_wds_list;

	if (checkASC(document.wireless_basic.ssid.value,"ssid")==false) 
	{
		ShowError(document.wireless_basic.ssid, "WIFI Basic Invalid Err");
		document.wireless_basic.ssid.focus();
		document.wireless_basic.ssid.select();	
		return false;
	}
	if (checkinvalidssid(document.wireless_basic.ssid.value)==false) 
	{
		ShowError(document.wireless_basic.ssid, "WIFI Basic Char Err");
		document.wireless_basic.ssid.focus();
		return false;
	}
	
	if (check_blank_ssid(document.wireless_basic.ssid.value)==false) 
	{
		ShowError(document.wireless_basic.ssid, "WIFI SSID Char Err");
		document.wireless_basic.ssid.focus();
		return false;
	}

	submit_ssid_num = 1;

	document.wireless_basic.bssid_num.value = submit_ssid_num;

	all_wds_list = '';
	if (document.wireless_basic.wds_mode.options.selectedIndex >= 2)
	{
		var re = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
		for (i = 1; i <= 4; i++)
		{
			if (eval("document.wireless_basic.wds_"+i).value == "")
				continue;
			if (!re.test(eval("document.wireless_basic.wds_"+i).value)) {
				ShowError(eval("document.wireless_basic.wds_"+i), "WIFI Basic MAC Format Err");
				return false;
			}
			else {
				all_wds_list += eval("document.wireless_basic.wds_"+i).value;
				all_wds_list += ';';
			}
		}
		if (all_wds_list == "")
		{
			ShowError(document.wireless_basic.wds_1, "WIFI Basic WDS MAC Empty");
			document.wireless_basic.wds_1.focus();
			document.wireless_basic.wds_1.select(); 
			return false;
		}
		else
		{
			document.wireless_basic.wds_list.value = all_wds_list;
			//don't let ap mac address disappear
			/*document.wireless_basic.wds_1.disabled = true;
			document.wireless_basic.wds_2.disabled = true;
			document.wireless_basic.wds_3.disabled = true;
			document.wireless_basic.wds_4.disabled = true;*/
		}
		//document.wireless_basic.rebootAP.value = 1;
	}
	if(Selected_channel=="a_channel")
	{
		if(document.wireless_basic.sz11aChannel.value=="")
		{
			ShowError(document.wireless_basic.sz11aChannel, "sec error48");
			return false;
		}
	}	
	
	if(Selected_channel=="b_channel")
	{	
		if(document.wireless_basic.sz11bChannel.value=="")
		{
			ShowError(document.wireless_basic.sz11bChannel, "sec error48");
			return false;
		}
	}
	if(Selected_channel=="g_channel")
	{	
		if(document.wireless_basic.sz11gChannel.value=="")
		{
			ShowError(document.wireless_basic.sz11gChannel, "sec error48");
			return false;
		}	
	}
	
	if(document.wireless_basic.wds_encryp_type.options.selectedIndex > 1)
	{
	    var keyvalue = document.wireless_basic.wds_encryp_key.value;
		
		if (keyvalue.length == 0){
			ShowError(document.wireless_basic.wds_encryp_key, "sec error49");
			return false;
		}

		if (keyvalue.length < 8){
			ShowError(document.wireless_basic.wds_encryp_key, "sec error50");
			return false;
		}
		
			
		if(checkInjection(document.wireless_basic.wds_encryp_key.value) == false){
			ShowError(document.wireless_basic.wds_encryp_key, "sec error51");
			return false;
		}
		
		if(checkASC(document.wireless_basic.wds_encryp_key.value,"passphrase")!=true)
		{ 
			ShowError(document.wireless_basic.wds_encryp_key, "sec error51");
			return false;
		}
		
		
	}	
	
	writeHiddenNum();
	alert("Please reconnect WiFi!");
	
	return true;
}

function check_WPS_status()
{
 if(WPSonoff == '0')
 return true;
 else 
 {
   ShowError(document.wireless_basic.basicApply, "sec error55");
   return false;
  }
 }
 
function Radio_OnOff_toptip()
{
		toptip('WIFI Basic Radio OnOff');
}

function Network_Mode_toptip()
{
		toptip('WIFI Basic Network Mode');
}

function Network_Name_toptip()
{
		toptip('WIFI Basic Network Name');
}

function Broadcast_Network_Name_toptip()
{
		toptip('WIFI Basic Broadcast Network Name');
}

function AP_Isolation_toptip()
{
		toptip('WIFI Basic AP Isolation');
}

function BSSID_toptip()
{
		toptip('WIFI Basic BSSID');
}

function Frequency_toptip()
{
		toptip('WIFI Basic Frequency');
}

function Rate_toptip()
{
		toptip('WIFI Basic Rate');
}
//fangxia add
function MAX_Staion_number_toptip()
{
		toptip('The MAX number of staions that can connect with AP ');
}


function WDS_Mode_toptip()
{
		toptip('WIFI Basic WDS Mode');
}

function Phy_Mode_toptip()
{
		toptip('WIFI Basic Phy Mode');
}
function EncrypType_toptip()
{
		toptip('WIFI Basic Encryp Type');
}
function Encryp_Key_toptip()
{
		toptip('WIFI Basic Encryp Key');
}
function AP_MAC_Address_toptip()
{
		toptip('WIFI Basic MAC Address');
}
function Operating_Mode_toptip()
{
		toptip('WIFI Basic Operating Mode');
}
function Channel_BandWidth_toptip()
{
		toptip('WIFI Basic Channel BandWidth');
}
function Guard_Interval_toptip()
{
		toptip('WIFI Basic Guard Interval');
}
function MCS_toptip()
{
		toptip('WIFI Basic MCS');
}
function Reverse_Direction_Grant_toptip()
{
		toptip('WIFI Basic Reverse Direction Grant');
}

function Extension_Channel_toptip()
{
		toptip('WIFI Basic Extension Channel');
}
function Aggregation_MSDU_toptip()
{
		toptip('WIFI Basic Aggregation MSDU');
}
function Auto_Block_ACK_toptip()
{
		toptip('WIFI Basic Auto Block ACK');
}
function Decline_BA_Request_toptip()
{
		toptip('WIFI Basic Decline BA Request');
}

</script>
</head>


<body onLoad="initValue();" style="overflow:scroll;overflow-x:hidden;overflow-y:yes">
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

<form method=post name=wireless_basic action="/goform/wirelessBasic" onSubmit="return CheckValue()" autocomplete="off">
	<input type="hidden" name="lucknum" id="lucknum"/>
	<table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td class=listtopic colspan=2 id="basicTitle" name="basicTitle">Wi-Fi Settings--&gt;Basic</td>
            </tr>	                                                                
        </table>
		<table cellspacing="0" cellpadding="10" width="100%" border="0"  height="100%">
		<tr>
			<td valign="top">
		  <table cellspacing="0" cellpadding="0" width="100%" border="0">
		<TD align="center" class="unselectedMenu" width=170 height="20" id="wifistationlist" name="wifistationlist"><A href="stainfo.asp">&#8226;Connected Devices</A></TD>          
	 	<TD align="center" class="selectedMenu" width=170 height="20" id="wifibasic" name="wifibasic">&#8226; Basic&nbsp;</TD>
        <TD align="center" class="unselectedMenu" width=170 height="20" id="wifisecurity1" name="wifisecurity1"><A href="security.asp">&#8226;Security</A></TD>   
        <!--
        <TD align="center" class="unselectedMenu" width=170 height="20" id="wifiWPS1" name="wifiWPS1"><A href="../wps/wps.asp">&#8226;WPS</A></TD>
        -->   
	   <TD width=400></TD>
	</table>	
<table cellSpacing=0 cellPadding=10 width="100%" border=0>
  <tr> 
    <td  class="title" colspan="2" id="basicWirelessNet">Wireless Network</td>
  </tr>
  <tr> 
    <td class="head_top" id="basicNetMode" width="30%" onMouseOver="Network_Mode_toptip(); " onMouseOut="return nd();">Network Mode</td>
    <td class="head_top_content" width="70%">
    <select name="wirelessmode" id="wirelessmode" size="1" onChange="wirelessModeChange()">
      <option value=0>11b/g Mixed Mode</option>
      <option value=1>11b Only</option>
      <option value=4>11g Only</option>
    </select></td>
  </tr>
  <input type="hidden" name="bssid_num" value="1">
  <tr> 
    <td class="head" id="basicSSID" onMouseOver="Network_Name_toptip(); " onMouseOut="return nd();">Network Name(SSID)</td>
    <td class="head_content"><input type=text name=ssid size=40 maxlength=32 value="<% getCfgGeneral(1, "SSID1"); %>"></td>
  </tr>
  <!--zhaoy delete-->
    <tr> 
    <td class="head" id="basicBroadcastSSID" onMouseOver="Broadcast_Network_Name_toptip(); " onMouseOut="return nd();">Broadcast Network Name (SSID)</td>
    <td class="head_content">
      <input type=radio name=broadcastssid value="1" checked><font id="basicBroadcastSSIDEnable"><span id="basicBroadcastSSIDEnablenote">Enable&nbsp;</span></font>
      <input type=radio name=broadcastssid value="0"><font id="basicBroadcastSSIDDisable"><span id="basicBroadcastSSIDDisablenote">Disable</span></font>
    </td>
  </tr>
  <tr> 
    <td class="head" id="basicApIsolated" onMouseOver="AP_Isolation_toptip(); " onMouseOut="return nd();">AP Isolation</td>
    <td class="head_content">
      <input type=radio name=apisolated value="1"><font id="basicApIsolatedEnable"><span id="basicApIsolatedEnablenote">Enable&nbsp;</span></font>
      <input type=radio name=apisolated value="0" checked><font id="basicApIsolatedDisable"><span id="basicApIsolatedDisablenote">Disable</span></font>
    </td>
  </tr>
  <!--fangxia add begin-->
    <tr> 
    <td class="head" id="advCountryCode" onMouseOver="Country_Code_toptip(); " onMouseOut="return nd();">Country Code</td>
    <td class="head_content">
      <select name="country_code"  id="country_code" size="1"  onChange="CountryCodeOnChange()">
        <option value="US" id="advCountryCodeUS">US (United States)</option>
        <option value="JP" id="advCountryCodeJP">JP (Japan)</option>
        <option value="NONE" selected id="advCountryCodeNONE">NONE</option>       
      </select>
    </td>
  </tr>
  
  <!--fangxia add end-->
 <tr id="div_11a_channel" name="div_11a_channel">
    <td class="head" onMouseOver="Frequency_toptip(); " onMouseOut="return nd();"><font id="basicFreqA"><span id="basicFreqAnote">Frequency (Channel)</span></font></td>
    <td class="head_content">
      <select id="sz11aChannel" name="sz11aChannel" size="1" onChange="ChannelOnChange()">
	<option value=0 id="basicFreqAAuto">AutoSelect</option>
	<% getWlan11aChannels(); %>
      </select>
    </td>
  </tr>
  <!-- -->
  
  <tr id="div_11b_channel" name="div_11b_channel">
    <td class="head" onMouseOver="Frequency_toptip(); " onMouseOut="return nd();"><font id="basicFreqB"><span id="basicFreqBnote">Frequency (Channel)</span></font></td>
    <td class="head_content">
      <select id="sz11bChannel" name="sz11bChannel" size="1" onChange="ChannelOnChange()">
      </select>
    </td>
  </tr>
  <tr id="div_11g_channel" name="div_11g_channel">
    <td class="head" onMouseOver="Frequency_toptip(); " onMouseOut="return nd();"><font id="basicFreqG"><span id="basicFreqGnote">Frequency (Channel)</span></font></td>
    <td class="head_content">
      <select id="sz11gChannel" name="sz11gChannel" size="1" onChange="ChannelOnChange()">
      </select>
    </td>
 </tr>
    <tr id="MAX_staion_number">
    <td class="head" onMouseOver="MAX_Staion_number_toptip(); " onMouseOut="return nd();"><font id="MAX_staion_number"><span id="MAX_staion_number_note">Maximum connected Wi-Fi devices</span></font></td>
    <td class="head_content">
		<select name="Allow_MAX_STAs">
        <!--<option value="6">Auto</option>-->
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>       
      </select>
    </td>
  </tr>
</table>

<br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr align="right">
    <td><input type=submit class="btn" value="Apply" id="basicApply" onClick="return check_WPS_status();">      &nbsp; &nbsp;
      <input type=reset  class="btn" value="Cancel" id="basicCancel" onClick="window.location.reload()">
    </td>
  </tr>
</table>


<br>
<table width="100%" border="0" cellpadding="10" cellspacing="0" style="visibility:hidden">
  <tr> 
    <td class="title" id="basicWDSTitle" colspan="2">Wireless Distribution System(WDS)</td>
  </tr>
  <tr> 
    <td class="head_top" id="basicWDSMode" width="30%" onMouseOver="WDS_Mode_toptip(); " onMouseOut="return nd();">WDS Mode</td>
    <td class="head_top_content" width="70%">
      <select name="wds_mode" id="wds_mode" size="1" onChange="WdsModeOnChange()">
	<option value=0 SELECTED id="basicWDSDisable">Disable</option>
	<option value=4>Lazy Mode</option>
	<option value=2>Bridge Mode</option>
	<option value=3>Repeater Mode</option>
      </select>
    </td>
  </tr>
  <tr id="div_wds_phy_mode" name="div_wds_phy_mode"> 
    <td class="head" id="basicWDSPhyMode" onMouseOver="Phy_Mode_toptip(); " onMouseOut="return nd();">Phy Mode</td>
    <td class="head_content">
      <select name="wds_phy_mode" id="wds_phy_mode" size="1">
	<option value="CCK;CCK;CCK;CCK" selected>CCK</option>
      </select>
    </td>
  </tr>
  <tr id="div_wds_encryp_type" name="div_wds_encryp_type"> 
    <td class="head" id="basicWDSEncrypType" onMouseOver="EncrypType_toptip(); " onMouseOut="return nd();">EncrypType</td>
    <td class="head_content">
      <select name="wds_encryp_type" id="wds_encryp_type" size="1" onChange="WdsSecurityOnChange()">
	<option value="NONE;NONE;NONE;NONE" selected>NONE</option>
	<option value="WEP;WEP;WEP;WEP">WEP</option>
	<option value="TKIP;TKIP;TKIP;TKIP">TKIP</option>
	<option value="AES;AES;AES;AES">AES</option>
      </select>
    </td>
  </tr>
  <tr id="div_wds_encryp_key" name="div_wds_encryp_key">
    <td class="head" id="basicWDSEncrypKey" onMouseOver="Encryp_Key_toptip(); " onMouseOut="return nd();">Encryp Key</td>
    <td class="head_content"><input type=text name=wds_encryp_key size=28 maxlength=64 value=""></td>
  </tr>
  <tr id="wds_mac_list_1" name="wds_mac_list_1">
    <td class="head" id="basicWDSAPMacAddr" onMouseOver="AP_MAC_Address_toptip(); " onMouseOut="return nd();">AP MAC Address</td>
    <td class="head_content"><input type=text name=wds_1 size=20 maxlength=17 value=""></td>
  </tr>
  <tr id="wds_mac_list_2" name="wds_mac_list_2">
    <td class="head" id="basicWDSAPMacAddr" onMouseOver="AP_MAC_Address_toptip(); " onMouseOut="return nd();">AP MAC Address</td>
    <td class="head_content"><input type=text name=wds_2 size=20 maxlength=17 value=""></td>
  </tr>
  <tr id="wds_mac_list_3" name="wds_mac_list_3">
    <td class="head" id="basicWDSAPMacAddr" onMouseOver="AP_MAC_Address_toptip(); " onMouseOut="return nd();">AP MAC Address</td>
    <td class="head_content"><input type=text name=wds_3 size=20 maxlength=17 value=""></td>
  </tr>
  <tr id="wds_mac_list_4" name="wds_mac_list_4">
    <td class="head" id="basicWDSAPMacAddr" onMouseOver="AP_MAC_Address_toptip(); " onMouseOut="return nd();">AP MAC Address</td>
    <td class="head_content"><input type=text name=wds_4 size=20 maxlength=17 value=""></td>
  </tr>
  <input type="hidden" name="wds_list" value="1">
</table>
<br>
<table id="div_11n" name="div_11n" width="100%" border="0" cellpadding="10" cellspacing="0">
  <tr> 
    <td class="title" colspan="2" id="basicHTPhyMode">HT Physical Mode</td>
  </tr>
  <tr>
    <td class="head_top" id="basicHTOPMode" width="30%" onMouseOver="Operating_Mode_toptip(); " onMouseOut="return nd();">Operating Mode</td>
    <td class="head_top_content" width="70%">
      <input type=radio name=n_mode value="0" checked><font id="basicHTMixed"><span id="basicHTMixednote">Mixed Mode&nbsp;</span></font>
      <input type=radio name=n_mode value="1"><span id="basicHTMixedgreennote">Green Field</span>
    </td>
  </tr>
  <tr>
    <td class="head" id="basicHTChannelBW" onMouseOver="Channel_BandWidth_toptip(); " onMouseOut="return nd();">Channel BandWidth</td>
    <td class="head_content">
      <input type=radio name=n_bandwidth value="0" onClick="Channel_BandWidth_onClick()" checked>20&nbsp;
      <input type=radio name=n_bandwidth value="1" onClick="Channel_BandWidth_onClick()">20/40
    </td>
  </tr>
  <tr>
    <td class="head" id="basicHTGI" onMouseOver="Guard_Interval_toptip(); " onMouseOut="return nd();">Guard Interval</td>
    <td class="head_content">
      <input type=radio name=n_gi value="0" checked><font id="basicHTLongGI">long&nbsp;</font>
      <input type=radio name=n_gi value="1"><font id="basicHTAutoGI">Auto</font>
    </td>
  </tr>
  <tr>
    <td class="head" id="basicMCS" onMouseOver="MCS_toptip(); " onMouseOut="return nd();">MCS</td>
    <td class="head_content">
      <select name="n_mcs" size="1">
	<option value = 0>0</option>
	<option value = 1>1</option>
	<option value = 2>2</option>
	<option value = 3>3</option>
	<option value = 4>4</option>
	<option value = 5>5</option>
	<option value = 6>6</option>
	<option value = 7>7</option>
	<option value = 8>8</option>
	<option value = 9>9</option>
	<option value = 10>10</option>
	<option value = 11>11</option>
	<option value = 12>12</option>
	<option value = 13>13</option>
	<option value = 14>14</option>
	<option value = 15>15</option>
	<option value = 32>32</option>
	<option value = 33 selected id="basicHTAutoMCS">Auto</option>
      </select>
    </td>
  </tr>
  <tr>
    <td class="head" id="basicHTRDG" onMouseOver="Reverse_Direction_Grant_toptip(); " onMouseOut="return nd();">Reverse Direction Grant(RDG)</td>
    <td class="head_content">
      <input type=radio name=n_rdg value="0" checked><font id="basicHTRDGDisable"><span id="basicHTRDGDisablenote">Disable&nbsp;</span></font>
      <input type=radio name=n_rdg value="1"><font id="basicHTRDGEnable"><span id="basicHTRDGEnablenote">Enable</span></font>
    </td>
  </tr>
  <tr name="extension_channel" id="extension_channel">
    <td class="head" id="basicHTExtChannel" onMouseOver="Extension_Channel_toptip(); " onMouseOut="return nd();">Extension Channel</td>
    <td class="head_content">
      <select id="n_extcha" name="n_extcha" size="1">
	<option value=1 selected>2412MHz (Channel 1)</option>
      </select>
    </td>
  </tr>
  <tr>
    <td class="head" id="basicHTAMSDU" onMouseOver="Aggregation_MSDU_toptip(); " onMouseOut="return nd();">Aggregation MSDU(A-MSDU)</td>
    <td class="head_content">
      <input type=radio name=n_amsdu value="0" checked><font id="basicHTAMSDUDisable"><span id="basicHTAMSDUDisablenote">Disable&nbsp;</span></font>
      <input type=radio name=n_amsdu value="1"><font id="basicHTAMSDUEnable"><span id="basicHTAMSDUEnablenote">Enable</span></font>
    </td>
  </tr>
  <tr>
    <td class="head" id="basicHTAddBA" onMouseOver="Auto_Block_ACK_toptip(); " onMouseOut="return nd();">Auto Block ACK</td>
    <td class="head_content">
      <input type=radio name=n_autoba value="0" checked><font id="basicHTAddBADisable"><span id="basicHTAddBADisablenote">Disable&nbsp;</span></font>
      <input type=radio name=n_autoba value="1"><font id="basicHTAddBAEnable"><span id="basicHTAddBAEnablenote">Enable</span></font>
    </td>
  </tr>
  <tr>
    <td class="head" id="basicHTDelBA" onMouseOver="Decline_BA_Request_toptip(); " onMouseOut="return nd();">Decline BA Request</td>
    <td class="head_content">
      <input type=radio name=n_badecline value="0" checked><font id="basicHTDelBADisable"><span id="basicHTDelBADisablenote">Disable&nbsp;</span></font>
      <input type=radio name=n_badecline value="1"><font id="basicHTDelBAEnable"><span id="basicHTDelBAEnablenote">Enable</span></font>
    </td>
  </tr>
</table>
<br>
<!--fangxia changed-->
</td></tr></table>
</form>  
</body>
</html>

