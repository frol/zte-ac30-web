//firewall
function MAC_IP_PORT_filter_toptip()
{
		toptip('port basic setting');
}
function URL_filter_toptip()
{
		toptip('content filter webs url filter current');
}
function PORT_FORWAR_toptip()
{
		toptip('forward virtual server');
}
function DMZ_toptip()
{
		toptip('dmz setting');
}
function Remote_management_toptip()
{
		toptip('sysfw remote management title');
}
function ping_from_wan_toptip()
{
		toptip('sysfw remote management title');
}

/* air network net_select.asp*/
function WCDMA_preferred_toptip()
{
    toptip('3G NS TT WCDMA Preferred');
}

function Only_WCDMA_toptip()
{
    toptip('3G NS TT Only WCDMA');
}

function Only_CDMA_toptip()
{
    toptip('3G NS TT Only CDMA');
}

function Only_GSM_toptip()
{
    toptip('3G NS TT Only GSM');
}

/* air network multi_apn.asp*/
function current_status_toptip()
{
    toptip('3G APN TT Current Status');
}

function profile_select_toptip()
{
    toptip('3G APN TT Profile Select');
}

function profile_name_toptip()
{
    toptip('3G APN TT Profile Name');
}

function setup_apn_toptip()
{
    toptip('3G APN TT ANP Set');
}

function dial_setting_toptip()
{
    toptip('3G APN TT Dial NO');
}

function PDP_Type_toptip()
{
    toptip('3G APN TT PDP Type');
}

function pdp_setting_toptip()
{
    toptip('3G APN TT PDP Set');
}

function dns_toptip()
{
    toptip('3G APN TT DNS');
}

function Primary_DNS_toptip()
{
    toptip('3G APN TT Primary DNS');
}

function Secondary_DNS_toptip()
{
    toptip('3G APN TT Secondary DNS');
}

function Authentication_toptip()
{
    toptip('3G APN TT Authentication');
}

function user_name_toptip()
{
    toptip('3G APN TT User Name');
}

function passwd_toptip()
{
    toptip('3G APN TT Password');
}
//net connect
function Auto_Connect_toptip()
{
		toptip('WAN Connection Auto Connect');
}
function ondemand_con_toptip()
{
		toptip('WAN Connection On Demand Connect');
}
function ondemand_idletime_toptip()
{
		toptip('WAN Connection Idle Time');
}
function Manual_Connect_toptip()
{
		toptip('WAN Connection Manual Connect');
}
function Connection_Statu_toptip()
{
		toptip('WAN Connection PPP Status');
}


//for wifi
//basic
function Radio_OnOff_toptip()
{
		toptip('This indicates the wireless operating status. The wireless can be turned on or off by this button. When the radio is on, the following parameters are in effect.');
}

function Network_Mode_toptip()
{
		toptip('If all of the wireless devices you want to connect with this router can connect in the same transmission mode, you can improve performance slightly by choosing the appropriate wireless mode. If you have some devices that use a different transmission mode, choose the appropriate wireless mode. Use the drop down list to select the wireless mode.');
}

function Network_Name_toptip()
{
		toptip('Service Set Identifier (SSID): Enter a string less than 32 characters as the name for your wireless local area network (WLAN)');
}

function Broadcast_Network_Name_toptip()
{
		toptip('Eanble: The gateway broadcasts the SSID and other devices can detect and connect to it.Disabled: The gateway disables broadcasting and hides the name of your network');
}

function AP_Isolation_toptip()
{
		toptip('When this feature is enabled, each of your wireless client will not be able to communicate with each other.');
}

function BSSID_toptip()
{
		toptip('Show the MAC address of the wifi');
}

function Frequency_A_toptip()
{
		toptip('A wireless network uses specific channels in the wireless spectrum to handle communication between clients. Some channels in your area may have interference from other electronic devices. Choose the clearest channel to help optimize the performance and coverage of your wireless network.');
}

function Frequency_B_toptip()
{
		toptip('A wireless network uses specific channels in the wireless spectrum to handle communication between clients. Some channels in your area may have interference from other electronic devices. Choose the clearest channel to help optimize the performance and coverage of your wireless network.');
}

function Frequency_G_toptip()
{
		toptip('A wireless network uses specific channels in the wireless spectrum to handle communication between clients. Some channels in your area may have interference from other electronic devices. Choose the clearest channel to help optimize the performance and coverage of your wireless network.');
}

function Rate_toptip()
{
		toptip('The rate selected in Network Mode.');
}

function WDS_Mode_toptip()
{
		toptip('Select the mode from the pull-down menu, Disable, Lazy Mode,Bridge Mode or Repeater Mode.(Default WDS mode is Disable.) If the users would like to set up the WDS function, the APs should use the same SSID and Channel then enter Wireless MAC of each other to make the WDS connection.');
}

function Phy_Mode_toptip()
{
		toptip('Select the option in the drop-down list to enable CCK,OFDM, HTMIX, or GREENFIELD mode for physical layer transceivers.');
}

function EncrypType_toptip()
{
		toptip('Select the option in the drop-down list to enable WEP, TKIP, and AES encryption types. If you select None, any data will be transmitted without encryption and any station can access the router.');
}

function Encryp_Key_toptip()
{
		toptip('cipher');
}

function AP_MAC_Address1_toptip()
{
		toptip('you have to fill in the WDS AP MAC. You can fill up to 4 sets of WDS AP MAC lists.');
}

function AP_MAC_Address2_toptip()
{
		toptip('you have to fill in the WDS AP MAC. You can fill up to 4 sets of WDS AP MAC lists.');
}

function AP_MAC_Address3_toptip()
{
		toptip('you have to fill in the WDS AP MAC. You can fill up to 4 sets of WDS AP MAC lists.');
}

function AP_MAC_Address4_toptip()
{
		toptip('you have to fill in the WDS AP MAC. You can fill up to 4 sets of WDS AP MAC lists.');
}

function Operating_Mode_toptip()
{
		toptip('Select the mixed or green field mode as the operation mode.Mixed Mode: In this mode packets are transmitted with a preamble compatible with the legacy 802.11a/g, the rest of the packet has a new format. In this mode the receiver shall be able to decode both the Mixed Mode packets and legacy packets. Green Field: In this mode high throughput packets are transmitted without a legacy compatible part.');
}

function Channel_BandWidth_toptip()
{
		toptip('Select the 40Mhz or 20/40Mhz as the channel bandwidth.');
}

function Guard_Interval_toptip()
{
		toptip('Support Short/Long GI, the purpose of the guard interval is to introduce immunity to propagation delays, echoes and reflections, to which digital data is normally very sensitive.');
}

function MCS_toptip()
{
		toptip('Fix MCS rate for HT rate. The Modulation and Coding Scheme (MCS) is a value that determines the modulation, coding and number of spatial channels.');
}

function Reverse_Direction_Grant_toptip()
{
		toptip('Select Disable or Enable this function. (Default setting is Enable.)');
}

function Extension_Channel_toptip()
{
		toptip('You can select any one of the two Channels from the drop-down menu. The Extension channel is also able to send and receive data.');
}

function Aggregation_MSDU_toptip()
{
		toptip('Mark to enable Hyper Throughput TX Aggregate MAC Service Data Unit, and clear to disable.');
}

function Auto_Block_ACK_toptip()
{
		toptip('Select to block ACK (Acknowledge Number) or not during data transferring.');
}

function Decline_BA_Request_toptip()
{
		toptip('Select to reject peer BA-Request or not.');
}

//advanced

function Beacon_Interval_toptip()
{
		toptip('adv BeaconInterval');
}

function Data_Beacon_Rate_toptip()
{
		toptip('adv DTIM');
}

function Fragment_Threshold_toptip()
{
		toptip('adv Frag');
}

function RTS_Threshold_toptip()
{
		toptip('adv RTS');
}

function TX_Power_toptip()
{
		toptip('adv TxPW');
}

function Short_Preamble_toptip()
{
		toptip('adv ShortPre');
}

function Short_Slot_toptip()
{
		toptip('adv ShortSlot');
}

function Tx_Burst_toptip()
{
		toptip('adv TxBurst');
}

function Pkt_Aggregate_toptip()
{
		toptip('adv PktAggr');
}

function IEEE_80211H_toptip()
{
		toptip('adv 80211H');
}

function Country_Code_toptip()
{
		toptip('adv CountryCode');
}

function WMM_Capable_toptip()
{
		toptip('adv WMM');
}

function APSD_Capable_toptip()
{
		toptip('adv APDS');
}
//security
function Security_Mode_toptip()
{
		toptip('secure SecureMode');
}

function Default_Key_toptip()
{
		toptip('secure WEPDefaultKey');
}

function WEP_Keys_toptip()
{
		toptip('secure WEPKey');
}

function Encrypt_Type_toptip()
{
		toptip('secure EncrypType');
}

function WPA_Algorithms_toptip()
{
		toptip('secureWPA Algorithm');
}

function Key_Renewal_Interval_toptip()
{
		toptip('secureWPA Key Renew Interval');
}

function IP_Address_toptip()
{
		toptip('secure RadiusIPAddr');
}

function Port_toptip()
{
		toptip('secure RadiusPort');
}

function Shared_Secret_toptip()
{
		toptip('secure RadiusSharedSecret');
}

function Session_Timeout_toptip()
{
		toptip('secure RadiusSessionTimeout');
}

function Idle_Timeout_toptip()
{
		toptip('secure RadiusIdleTimeout');
}

function Pass_Phrase_toptip()
{
		toptip('secureWPA PassPhrase');
}

function PMK_Cache_Period_toptip()
{
		toptip('secure WPA PMKCachePeriod');
}

function Pre_Authentication_toptip()
{
		toptip('secure WPAPreAuth');
}

function Add_MAC_Filtering_Rule_toptip()
{
		toptip('wifi securitymacfilter');
}

function MAC_Address_toptip()
{
		toptip('wifi securitymacaddress');
}

function WEP_toptip()
{
		toptip('secure1X WEP');
}
//wps
function WPS_toptip()
{
		toptip('wps WPS_text');
}

function WPS_mode_toptip()
{
		toptip('wps Mode_text');
}

function Client_PIN_toptip()
{
		toptip('wps PINNum_text');
}

//Station List
function Station_List_toptip()
{
		toptip('stalist Station');
}

