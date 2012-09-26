<html>
<head>
<title>Verizon Fivespot</title>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href=../style/normal_ws.css type=text/css rel=stylesheet>
<script language="JavaScript" src="../js/overlib.js"></script>
<script language="JavaScript" src="../js/toptip.js"></script>
<script src="../js/lang.js" type=text/JavaScript></script> 
<script language="JavaScript" src="../js/protect.js"></script>
<script language="JavaScript" src="../js/active.js"></script>  
<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("air_network");

var active_state ='<% asp_get("ppp0_record"); %>';
function check_active_state()
{
	var flag = active_state_load(active_state);
	if((flag == 1) ||(flag == 4))
	{
		window.location = "/adm/activing.asp";
	}
}

function next_goto_page()
{
	check_active_state();
	var pppstate = '<% asp_get("ppp_status"); %>';
	var cardstate = '<% asp_get("modem_main_state"); %>';
	if (cardstate == "modem_waitpin")
	{
		 window.location = "/air_network/pin.asp";   
	}
	else if(cardstate == "modem_waitpuk")
	{
	     window.location = "/air_network/puk.asp";
	}
	else if(cardstate == "modem_imsi_waitnck")
	{
	     window.location = "/air_network/unlock.asp";
	}
	else if (cardstate == "modem_sim_undetected")
	{
	     window.location = "/air_network/no_sim.asp";
	}
	else if (cardstate == "modem_undetected")
	{
	     window.location = "/air_network/no_modem.asp";
	}
	else if (pppstate == "ppp_connecting")
	{
		 window.location = "/air_network/pppconnect.asp";		 
	}
	else if (pppstate == "ppp_disconnecting")
	{
		 window.location = "pppdisconnect.asp";		 
	}
	if (pppstate == "ppp_connected")
	{
	    document.getElementById('Global_Mode').disabled = true;
	    document.getElementById('Only_WCDMA').disabled = true;
	    document.getElementById('GSM_preferred').disabled = true;
	    document.getElementById('Only_GSM').disabled = true;
		document.getElementById('Only_CDMA').disabled = true;
		document.getElementById('Only_EVDO').disabled = true;
		document.getElementById('CDMA_and_EVDO').disabled = true;
		document.getElementById('3GApply').disabled = true;	
	}
	else
	{
		document.getElementById('Global_Mode').disabled = false;
	    document.getElementById('Only_WCDMA').disabled = false;
	    document.getElementById('GSM_preferred').disabled = false;
	    document.getElementById('Only_GSM').disabled = false;
		document.getElementById('Only_CDMA').disabled = false;
		document.getElementById('Only_EVDO').disabled = false;
		document.getElementById('CDMA_and_EVDO').disabled = false;
		document.getElementById('3GApply').disabled = false;	
	}
}
    </script>
    </head> 

<body onLoad="next_goto_page(); " bgcolor="white" >
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
<form name="form_netselect" action="/goform/net_select"   method="post" onSubmit="writeHiddenNum();">
		<input type="hidden" name="lucknum" id="lucknum"/>
    	<INPUT type=hidden value=net_sel name=which_cgi> 
    	<INPUT type=hidden value=net_slct.htm name=webpage> 
        <table cellspacing=0 cellpadding=0 width=100% border=0>  
            <tr>                                                                    
                <td id="3GTitleNetWorkSelect" class=listtopic colspan=2>WAN Settings--&gt;Network Select</td>
            </tr>                                             
        </table>     
    	<table height="100%" cellspacing="0" cellpadding="10" width="100%" border="0">
            <tr>                                                                      
                <td valign="top">                                           
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                <TD align="center" class="unselectedMenu" width=155 height="20" ><A href="wireless_info.asp">&nbsp;&#8226; Wireless Info</A></TD>
                <TD align="center" class="selectedMenu" width=155 height="20">&#8226;Network Select</TD>		
                <TD align="center" class="unselectedMenu" width=250 height="20"><A href="net_connect.asp">&#8226;WAN Connection Mode</A></TD>	
                <TD align="center" class="unselectedMenu" width=250 height="20"><A href="multi_apn.asp">&#8226;Multi APN</A></TD>	
           
               <TD width="695"></TD>
               </tr>
               </table>
				                                                                          
                <br>                                                                     
                <table cellspacing="0" cellpadding="0" width="100%" border="0"> 
                    <tr>                                                                   
                        <td id="3G_tn_BandSelMode" class="title" height="20">Network Select</td>                         
                    </tr>                                          
                    <tr>                                           
                        <td width="22%" valign="top" class="head_top"> <input id="Global_Mode" class="radiotype" type="radio"  name="net_select"  value="Global_Mode" <% asp_match("net_select","Global_Mode","checked"); %>></td>
                        <td class="head_top_content" valign="top" width="78%" id="3GAuto">Global</td>
                    </tr>                                                    
                     <tr>                                                                    
                        <td class="head" valign="top" width="22%">
     <input id="Only_WCDMA" class="radiotype" type="radio"  name="net_select"  value="Only_WCDMA" <% asp_match("net_select","Only_WCDMA","checked"); %>></td>
                        <td class="head_content" valign="top" width="78%">WCDMA (GSM 3G) Only</td>                            
                    </tr> 
                    <tr>                                                                    
                        <td class="head" valign="top" width="22%">
     <input id="GSM_preferred" class="radiotype" type="radio"  name="net_select"  value="GSM_preferred" <% asp_match("net_select","GSM_preferred","checked"); %>></td>
                        <td class="head_content" valign="top" width="78%">GSM prefered</td>                            
                    </tr>
                    <tr>                                                                    
                        <td class="head" valign="top" width="22%">
     <input id="Only_GSM" class="radiotype" type="radio"  name="net_select"  value="WCDMA_AND_GSM" <% asp_match("net_select","WCDMA_AND_GSM","checked"); %>></td>
                        <td class="head_content" valign="top" width="78%">GSM</td>                            
                    </tr>
                     <tr>                                                                    
                        <td class="head" valign="top" width="22%">
     <input id="Only_CDMA" class="radiotype" type="radio"  name="net_select"  value="Only_CDMA" <% asp_match("net_select","Only_CDMA","checked"); %>></td>
                        <td class="head_content" valign="top" width="78%">CDMA Only</td>                            
                    </tr> 
                     <tr>                                                                    
                        <td class="head" valign="top" width="22%">
     <input id="Only_EVDO" class="radiotype" type="radio"  name="net_select"  value="Only_EVDO" <% asp_match("net_select","Only_EVDO","checked"); %>></td>
                        <td class="head_content" valign="top" width="78%">EVDO Only</td>                            
                    </tr> 
                    <tr>                                                  
                        <td class="head" valign="top" width="22%">
     					<input id="CDMA_AND_EVDO" class="radiotype" type="radio"  name="net_select"  value="CDMA_AND_EVDO" <% asp_match("net_select","CDMA_AND_EVDO","checked"); %>></td>
                        <td class="head_content" valign="top" width="78%">                        
                        	<font face="Arial">CDMA and EVDO</font></td>                            
                    </tr>                                                
                </table>                                                                 
                <br>                                                                     
                <table cellspacing="0" cellpadding="0" width="100%" border="0"> 
                    <tr>                                                                   
                        <td valign="bottom">                                               
                        <div align="right">                                                
                            <input id="3GApply" type="submit" value="Apply" name="Submit_netselect" style="font-family: Arial;" class="btn"> 
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