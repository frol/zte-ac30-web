
	
var daysOfMonth = new Array(
  31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
);

var daysOfMonthLY = new Array(
  31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
);
function isLeapYear(year) 
{
  year = year - 0;
  if ((year/4)   != Math.floor(year/4))   return false;
  if ((year/100) != Math.floor(year/100)) return true;
  if ((year/400) != Math.floor(year/400)) return false;
  return true;
}

function rmEntry(a,i)
{
	if (a.splice)
		a.splice(i,1);
	else
	{
		if (i>=a.length) return;
		for (var k=i+1;k<=a.length;k++)
			a[k-1]=a[k];
		a.length--;
	}
}
function refresh(destination) 
{
   window.location = destination ;		
}
function validatePasswdUpdate(val1, val2)
{
	if (!validatePasswd(val1,val2)) return false;
	
	 if (confirm('Do you want to change password really?')==false) 	 return false;
	 
	 return true;   
}

function isValidDate(day, month, year) 
{
  day = day - 0; 
  month = month - 0; 
  year = year - 0;
  if ((isLeapYear(year) && day > daysOfMonthLY[month-1]) ||
     (!isLeapYear(year) && day > daysOfMonth[month-1]))
    return false;
  else
    return true;
}


function validateIp(val)
{
	if(val.length==0) return true;
	ip = '(25[0-5]|2[0-4]\\d|1\\d\\d|\\d\\d|\\d)';
	ipdot = ip + '\\.';
	isIPaddress = new RegExp('^'+ipdot+ipdot+ipdot+ip+'$');
	if (!isIPaddress.test(val))
	{
		//alert("Not a valid IP1");
		return false;
	}
	isIPaddress = new RegExp('^'+ipdot+ipdot+ipdot+'(000|00|0)'+'$');
	if (isIPaddress.test(val))
	{
		//alert("Not a valid IP2");
		return false;
	}
	return true;
}


function validateLanIp(val)
{
	if(val.length==0)
	{
		alert("Lan IP address: not a valid IP.");
		return false;
	}
	if(validatetheIp(val)==false) return false;

	var ii; sval=String(val);
	i1=val.indexOf('.');
	sub1=val.substring(0,i1);

	tempval=val.substring(i1+1,val.length);
	i2=tempval.indexOf('.');
	sub2=tempval.substring(0,i2);

	tempval=tempval.substring(i2+1,tempval.length);
	i3=tempval.indexOf('.');
	sub3=tempval.substring(0,i3);

	tempval=tempval.substring(i3+1,tempval.length);
	i4=tempval.indexOf('.');
	sub4=tempval.substring(0,tempval.length);
	
	if(val=='0.0.0.0')
	{
		alert("Invalid Lan Ip address, cannot be 0.0.0.0!");
		return false;
	}
	if(sub1=='0')
	{
		alert("Invalid Lan Ip address, the first number cannot be 0!");
		return false;
	}
	if(sub4=='0' || sub4=='255')
	{
		alert("Invalid Lan Ip address, the last number cannot be 0 or 255!");
		return false;
	}
	if(sub1=='127')
	{
		alert("Invalid Lan Ip address, the first number cannot be 127!");
		return false;
	}
	if((sub1-0)<0 ||(sub1-0)>255 || (sub2-0)<0 || (sub2-0)>255 
		|| (sub3-0)<0 ||  (sub3-0)>255 || (sub4-0)<0||(sub4-0)>255 )
	{
		alert('Invalid IP address, numbers between \'.\' are too big, Please check again!');
		return false;
	}	//added by kevin


	if((sub1-0)>223)
	{
			alert("Invalid Lan Ip address, must under 224.0.0.0!");
		return false;
	}	
}

//add hqs  20080703   for prompt in quick setup
function validatepdp_Ip(val)
{
	if(val.length==0)
	{
		//alert("Lan IP address: not a valid IP.");
		return false;
	}
	if(validatepdpIp(val)==false) return false;

	var ii; sval=String(val);
	i1=val.indexOf('.');
	sub1=val.substring(0,i1);

	tempval=val.substring(i1+1,val.length);
	i2=tempval.indexOf('.');
	sub2=tempval.substring(0,i2);

	tempval=tempval.substring(i2+1,tempval.length);
	i3=tempval.indexOf('.');
	sub3=tempval.substring(0,i3);

	tempval=tempval.substring(i3+1,tempval.length);
	i4=tempval.indexOf('.');
	sub4=tempval.substring(0,tempval.length);
	
	if(val=='0.0.0.0')
	{
		//alert("Invalid Lan Ip address, cannot be 0.0.0.0!");
		return false;
	}
	if(sub1=='0')
	{
		//alert("Invalid Lan Ip address, the first number cannot be 0!");
		return false;
	}
	if(sub4=='0' || sub4=='255')
	{
		//alert("Invalid Lan Ip address, the last number cannot be 0 or 255!");
		return false;
	}
	if(sub1=='127')
	{
		//alert("Invalid Lan Ip address, the first number cannot be 127!");
		return false;
	}
	if((sub1-0)<0 ||(sub1-0)>255 || (sub2-0)<0 || (sub2-0)>255 
		|| (sub3-0)<0 ||  (sub3-0)>255 || (sub4-0)<0||(sub4-0)>255 )
	{
		//alert('Invalid IP address, numbers between \'.\' are too big, Please check again!');
		return false;
	}	//added by kevin


	if((sub1-0)>223)
	{
			//alert("Invalid Lan Ip address, must under 224.0.0.0!");
		return false;
	}	
}
function validatepdpIp(val)
{
 	if(val.length==0) return;
 		var ii; sval=String(val);
 	if(val.length>15)
		{//alert('Invalid IP address, too long, Please check again');
			
			return false;}
 	i1=val.indexOf('.');
 	if(i1==-1)
		{//alert('Invalid IP address, missing \'.\' , Please check again!');
			
			return false;}
 	sub1=val.substring(0,i1);

	tempval=val.substring(i1+1,val.length);
 	i2=tempval.indexOf('.');
 	if(i2==-1)
		{//alert('Invalid IP address, missing \'.\' , Please check again!');
			
			return false;}
 	sub2=tempval.substring(0,i2);

 	tempval=tempval.substring(i2+1,tempval.length);
 	i3=tempval.indexOf('.');
 	if(i3==-1)
		{//alert('Invalid IP address, missing \'.\' , Please check again!');
			
			return false;}
 	sub3=tempval.substring(0,i3);
	
 	tempval=tempval.substring(i3+1,tempval.length);
 	i4=tempval.indexOf('.');
 	if(i4!=-1)
		{//alert("Invalid IP address, extra \'.\' , Please check again!");
			
			return false;}
 	sub4=tempval.substring(0,tempval.length);

	 if(sub1.length==0 || sub2.length==0 || sub3.length==0 || sub4.length==0)
	{//alert('Invalid IP address, missing numbers between \'.\', Please check again!');
		
		return false;}

 	if((sub1-0)<0 || (sub1-0)>255 || (sub2-0)<0 || (sub2-0)>255 ||
 	(sub3-0)<0 || (sub3-0)>255 || (sub4-0)<0 || (sub4-0)>255)
		{
			//alert('Invalid IP address, numbers between \'.\' are too big, Please check again!');
			
			return false;}

 	for (ii=0; ii<sval.length; ii++)
 	{
 		if (sval.charAt(ii)=='.')
 			{continue;}
 		else if (sval.charAt(ii)<'0' || sval.charAt(ii)>'9')
			 {
				//alert('Invalid Character '+'['+sval.charAt(ii)+'] '+' at Position '+(ii+1)+'! '+'Must be '+' 0123456789');
				return false;
 			}
 	}
}
//hqs end
function validateLanNetmask(val)
{
	if(val!='255.255.255.0' && val!='255.255.255.128' && val!='255.255.255.192' && val!='255.255.255.224' &&
           val!='255.255.255.240' && val!='255.255.255.248' && val!='255.255.255.252' && val!='255.255.255.254')
	{
		//alert('Invalid format, netmask here must be 255.255.255.0 or 255.255.255.128 or 255.255.255.192 or 255.255.255.224 or 255.255.255.240 or 255.255.255.248 or 255.255.255.252 or 255.255.255.254');
		return false;
	}
}

function validateYear(val)
{

	var bool=true;
	var i=0;

	if(val.length!=4 || val<0000)
		bool = false;
	if(bool==false)
	{
		alert("Invalid year format, please enter as (e.g. 2002)"); 
		return false;
	}
	for(i=0; i<val.length; i++)
	{
		if(val.charAt(i)<'0' || val.charAt(i)>'9')
		{	alert('Invalid number '+val.charAt(i)+' at position '+ (i+1)+'! Must be 0123456789');
			return false;
		}
	}
	if((val-0)<1970 || (val-0)>2037)
	{
		alert('Invalid,must between 1970..2037!');
		return false;
	}
}

function validateMonth(val)
{

	var i=0;

	month = val - 0;
	if(val.length!=2 || month<1 || month>12)
		{alert("Invalid month format, please enter as (e.g. 01...12)");return false;}
	for(i=0; i<val.length; i++)
	{
		if(val.charAt(i)<'0' || val.charAt(i)>'9')
		{	alert('Invalid number '+val.charAt(i)+' at position '+ (i+1)+'! Must be 0123456789');
			return false;
		}
	}
}

function validateDate(date,month,year)
{

	var i=0;

	if(month.length==0 || year.length==0)
	{
		alert('Please enter Year and Month First!');
		return false;
	}
	day = date - 0; month = month - 0; year = year - 0;
	if ((isLeapYear(year) && day > daysOfMonthLY[month-1]) ||
	     (!isLeapYear(year) && day > daysOfMonth[month-1]) ||
	     (date.length!=2))
	{
		alert('Invalid day format, please enter as (e.g. 01...31), some month may only as (00...28)');
	 	return false;
	}
	for(i=0; i<date.length; i++)
	{
		if(date.charAt(i)<'0' || date.charAt(i)>'9')
		{	alert('Invalid number '+date.charAt(i)+' at position '+ (i+1)+'! Must be 0123456789');
			return false;
		}
	}
}


function validateHour(val) 
{

	var i=0;

	hour = val - 0;
	if(val.length!=2 || hour<0 || hour>23)
	{
		 alert("Invalid hour format, please enter as (e.g. 00...23)");
		 return false;
	}
	for(i=0; i<val.length; i++)
	{
		if(val.charAt(i)<'0' || val.charAt(i)>'9')
		{	alert('Invalid number '+val.charAt(i)+' at position '+ (i+1)+'! Must be 0123456789');
			return false;
		}
	}
}

function validateMinute(val) 
{

	var i=0;

	min = val - 0;
	if(val.length!=2 || min<0 || min>59)
	{
	 	 alert("Invalid minute format, please enter as (e.g. 00...59)!");
		 return false;
	}
	for(i=0; i<val.length; i++)
	{
		if(val.charAt(i)<'0' || val.charAt(i)>'9')
		{	alert('Invalid number '+val.charAt(i)+' at position '+ (i+1)+'! Must be 0123456789');
			return false;
		}
	}
}

function validateSecond(val) {
}

function validateMTU(val) 
{
	var i=0;

	mval = val; mval=mval-0;
	if(val.length<3 || mval<128 || mval>1492)
	{
	 	 alert('Invalid MTU, must be between 128...1492!');
		 return false;
	}
	for(i=0; i<val.length; i++)
	{
		if(val.charAt(i)<'0' || val.charAt(i)>'9')
		{	alert('Invalid number '+val.charAt(i)+' at position '+ (i+1)+'! Must be 0123456789');
			return false;
		}
	}

}

function validateMRU(val)
{
	var i=0;

	mval = val; mval=mval-0;
	if(val.length<3 || mval<128 || mval>1492)
	{
	 	 alert('Invalid MRU, must be between 128...1492');
		 return false;
	}
	for(i=0; i<val.length; i++)
	{
		if(val.charAt(i)<'0' || val.charAt(i)>'9')
		{	alert('Invalid number '+val.charAt(i)+' at position '+ (i+1)+'! Must be 0123456789');
			return false;
		}
	}

}

function hex(val)
{
	var h = (val-0).toString(16);
	if(h.length==1) h='0'+h;
	return h.toUpperCase();
}

function Op_AND_4Byte(v1, v2) {
	var i;
	var var1 = new Array();
	var var2 = new Array();
	var result='0x';

	for (i=2,j=0;i<10;i+=2,j++) {
		var1[j]='0x'+v1.substring(i,i+2);
		var2[j]='0x'+v2.substring(i,i+2);
	}
	
	for (i=0;i<4;i++) {
		result = result + hex(var1[i]&var2[i]);
	}
	
	result = result-0;
	return result;
}

function validateGateway(wanIp,netmaskIp,gatewayIp) {

	var i1,i2,i3, wip, nip, gip;
	var lan4, mask4, pool4, net_no, lo_broadcast;

	if(gatewayIp.length==0) return true;
	if(validateWanIp(gatewayIp) == false) return false;

	i1=wanIp.indexOf('.');
	i2=wanIp.indexOf('.',(i1+1));
	i3=wanIp.indexOf('.',(i2+1));
	wip = hex(wanIp.substring(0,i1)) + hex(wanIp.substring((i1+1),i2)) +hex(wanIp.substring((i2+1),i3))+hex(wanIp.substring((i3+1),wanIp.length));
	wip = '0x'+wip;
	lan4 = wanIp.substring((i3+1),wanIp.length)-0;

	i1=netmaskIp.indexOf('.');
	i2=netmaskIp.indexOf('.',(i1+1));
	i3=netmaskIp.indexOf('.',(i2+1));
	nip = hex(netmaskIp.substring(0,i1)) + hex(netmaskIp.substring((i1+1),i2)) +hex(netmaskIp.substring((i2+1),i3)) +hex(netmaskIp.substring((i3+1),netmaskIp.length));
	nip = '0x'+nip;
	mask4 = netmaskIp.substring((i3+1),netmaskIp.length)-0;

	i1=gatewayIp.indexOf('.');
	i2=gatewayIp.indexOf('.',(i1+1));
	i3=gatewayIp.indexOf('.',(i2+1));
	gip = hex(gatewayIp.substring(0,i1)) + hex(gatewayIp.substring((i1+1),i2)) +hex(gatewayIp.substring((i2+1),i3)) +hex(gatewayIp.substring((i3+1),gatewayIp.length));
	gip = '0x'+gip;
	pool4 = gatewayIp.substring((i3+1),gatewayIp.length)-0;

	if (Op_AND_4Byte(wip, nip) != Op_AND_4Byte(gip, nip))
	{
		//alert("Invalid Ip: " +gatewayIp+" not in " + wanIp+"/"+netmaskIp+" netmask");
		return false;
	}

	net_no = (lan4 & mask4);
	lo_broadcast =  (lan4 & mask4) + (255-mask4);
	
	if (pool4==net_no) {
		//alert("Invalid Ip: " +gatewayIp+" is the Network Number.");
		return false;
	}
	if (pool4==lo_broadcast) {
		//alert("Invalid Ip: " +gatewayIp+" is the Broadcast address.");
		return false;
	}
}

	 
function validatePasswd(val1, val2){
	if(val1!=val2)
		{
		 alert("The new passwords you typed don\'t match, please check again!");
		 return false;
		}
		else
			return true;
}


function validateMac(val){
   var i;
   sval=String(val);

	if (sval.length == 0)
	{
		alert("MAC address can\'t be null!");
		return false;
	}

   if (sval.length>0 && sval.length!=17)
   {  alert('Invalid Length!');
      return false;
   }

   for (i=0; i<sval.length; i++)
   {  if ((i % 3)==2)
      {  if (sval.charAt(i)!=':')
         {  alert('Invalid Format at position '+(i+1)+'! Must be xx:xx:xx:xx:xx:xx.');
            return false;
         }
      }
      else if (!((sval.charAt(i)>='0' && sval.charAt(i)<='9') ||
                (sval.charAt(i)>='A' && sval.charAt(i)<='F')  ||
                (sval.charAt(i)>='a' && sval.charAt(i)<='f')))
      {  
         alert('Invalid Character['+sval.charAt(i)+'] at Position '+(i+1)+'! Must be 0123456789ABCDEFabcdef.');
         return false;
      }
   }
   var sub1=val.substring(0,2);
   var sub2=val.substring(3,5);
   var sub3=val.substring(6,8);
   var sub4=val.substring(9,11);
   var sub5=val.substring(12,14);
   var sub6=val.substring(15);

   if (sub1=='ff' && sub2=='ff' && sub3=='ff' && sub4=='ff' && sub5=='ff' && sub6=='ff')
   {
	alert('Invalid MAC address, it is a broadcast address.');
	return false;
   }
   if (sub1=='00' && sub2=='00' && sub3=='00' && sub4=='00' && sub5=='00' && sub6=='00')
   {
	alert('Invalid MAC address, it is a null address.');
	return false;
   }
   sub1='0x'+sub1;
   if((sub1 & 1)==1)
   {
	alert('Invalid MAC address, it is a mutlicast address.');
	return false;
   }
   return true;
}

function validateStartEndIp(lanip,netip,startip, endip)
{
	if(endip.length==0) return;
	if((validateGateway(lanip,netip,endip)) == false) return false;

	i1=startip.indexOf('.');
	i2=startip.indexOf('.',(i1+1));
	i3=startip.indexOf('.',(i2+1));
	sip = hex(startip.substring(0,i1)) + hex(startip.substring((i1+1),i2)) +hex(startip.substring((i2+1),i3))+hex(startip.substring((i3+1),startip.length));
	sip = '0x'+sip;

	i1=endip.indexOf('.');
	i2=endip.indexOf('.',(i1+1));
	i3=endip.indexOf('.',(i2+1));
	eip = hex(endip.substring(0,i1)) + hex(endip.substring((i1+1),i2)) +hex(endip.substring((i2+1),i3))+hex(endip.substring((i3+1),endip.length));
	eip = '0x'+eip;

	if(sip>eip)
	{
		//alert("Invalid start and end IP address, end IP should be larger than start IP.");
		return 2;
	}
}


function validateNumber(val)
{
	var i=0;

	for(i=0; i<val.length; i++)
	{
		if (i == 0)
		{
			if (val.charAt(0) == '0')
			{
				return false;
			}
		}
		
		if(val.charAt(i)<'0' || val.charAt(i)>'9')
		{	//alert('Invalid number '+val.charAt(i)+' at position '+ (i+1)+' ! Must be 0123456789');
			return false;
		}
	}	
}

function validatePort(val)
{
	if(val.length==0) return true;
	if(validateNumber(val)==false) return false;
	if((val-0)<1 || (val-0)>65535)
	{
		alert('Invalid number! Must between 1..65535');
		return false;
	}
}

function validateIdleTime(val)
{
	if(validateNumber(val)==false) return false;
	if((val-0)<1 || (val-0)>1440)
	{
		alert('Invalid number! Must between 1..1440');
		return false;
	}
}

function validatelength(val)
{
	if(val.length>63)
	{
		alert('too long, must be less than 63 characters.');
		return false;
	}
}

function validatehttp_username(val)
{
	var i=0;

	if(validatelength(val)==false) return false;
	for(i=0; i<val.length; i++)
	{
		if(val.charAt(i)==':')
		{
			alert('Invalid Character at '+i+', cannot be character :');
			return false;
		}
	}
}

function validateSpecialChar(val)
{
	var i=0;

	for(i=0; i<val.length; i++)
	{
		if(val.charAt(i)=='&') 
			return false;
		if(val.charAt(i)=='(')
			return false;
		if(val.charAt(i)==')')
			return false;
		if(val.charAt(i)=='<')
			return false;
		if(val.charAt(i)=='>')
			return false;
		if(val.charAt(i)==';')
			return false;
		if(val.charAt(i)=='\\')
			return false;
		if(val.charAt(i)=='/')
			return false;
	}
	return true;
}

function validateStartEndPort(startval, endval){
	if(endval.length==0) return;
	if(validatePort(endval)==false) return false;
	start=startval;
	end= endval;
	start=start-0;
	end=end-0;
	if(startval.length==0)
	{
		alert("Please enter start port number.");
		return;
	}
	if(start>end)
	{
		alert("Start port number should be smaller than end port number.");
		return false;
	}
	if(start<0 || end<0)
	{
		alert("Invalid port number, port numbers should be positive integer.");
		return false;
	}
}

function filterIp(lanip, netip, fip)
{
	var i=0;
	var tempip;

	i=fip.lastIndexOf('.');

	tempip=fip.substring(i+1,fip.length);
	if(tempip=='*')
		tempip=fip.substring(0,i+1)+'0';
	else tempip=fip;

	if(validateGateway(lanip,netip,tempip)==false)
		return false;
}
function validateEt1Mac(val){
   var i;
   sval=String(val);

   if (sval.length>0 && sval.length!=17)
   {  alert('Invalid Length!');
      return false;
   }

   for (i=0; i<sval.length; i++)
   {  if ((i % 3)==2)
      {  if (sval.charAt(i)!=':')
         {  alert('Invalid Format at position '+(i+1)+'! Must be :');
            return false;
         }
      }
      else if (!((sval.charAt(i)>='0' && sval.charAt(i)<='9') ||
                (sval.charAt(i)>='A' && sval.charAt(i)<='F')  ||
                (sval.charAt(i)>='a' && sval.charAt(i)<='f')))
      {  
         alert('Invalid Character['+sval.charAt(i)+'] at Position '+(i+1)+'! Must be 0123456789ABCDEFabcdef');
         return false;
      }
   }
   var sub1=val.substring(0,2);
   var sub2=val.substring(3,5);
   var sub3=val.substring(6,8);
   var sub4=val.substring(9,11);
   var sub5=val.substring(12,14);
   var sub6=val.substring(15);

   if (sub1=='ff' && sub2=='ff' && sub3=='ff' && sub4=='ff' && sub5=='ff' && sub6=='ff')
   {
	alert('Invalid MAC address, it is a broadcast address.');
	return false;
   }
   if(sub1=='00' && sub2=='00' && sub3=='00' && sub4=='00' && sub5=='00' && sub6=='00')
   {
        alert('Invalid Mac address, it must not be "00:00:00:00:00:00"!');
        return false;
   }
   sub1='0x'+sub1;
   if((sub1 & 1)==1)
   {
	alert('Invalid MAC address, it is a mutlicast address.');
	return false;
   }
   return true;
}

function validatehop(val)
{
	if(val=='') return true;
	if(validateNumber(val)==false) return false;
	if((val-0)<1 || (val-0)>15)
	{
		alert("Invalid, must between 1..15");
		return false;
	}	
}

function validateNetMask(val)
{
	if(val.length==0) return true;
	if(val!='255.255.255.0' && val!='255.255.255.128' && val!='255.255.255.192' && val!='255.255.255.224' &&
           val!='255.255.255.240' && val!='255.255.255.248' && val!='255.255.255.252' && val!='255.255.255.254'&& val!='255.255.255.255' && 
	   val!='255.255.0.0' && val!='255.255.128.0' && val!='255.255.192.0' && val!='255.255.224.0' &&
	   val!='255.255.240.0' && val!='255.255.248.0' && val!='255.255.252.0' && val!='255.255.254.0' &&
	   val!='255.0.0.0' && val!='255.128.0.0' && val!='255.192.0.0' && val!='255.224.0.0' &&
	   val!='255.240.0.0' && val!='255.248.0.0' && val!='255.252.0.0' && val!='255.254.0.0' &&
	   val!='128.0.0.0' && val!='192.0.0.0' && val!='224.0.0.0' &&
	   val!='240.0.0.0' && val!='248.0.0.0' && val!='252.0.0.0' && val!='254.0.0.0')
	{
		//alert('Invalid netmask format.');
		return false;
	}
}

function validateRouteIp(val)
{
	if(val=='0.0.0.0' || val=='255.255.255.255')
	{
		alert('Invalid IP address. Cannot be 0.0.0.0 or 255.255.255.255');
		return false;
	}

	if(validateIp(val)==false) return false;
}

function validateDhcpLease(val)
{
	if(validateNumber(val)==false) return false;
	if((val-0)<=0)
	{
		//alert("DHCP Lease Time: Cannot be empty or 0");
		return false;
	}
}

function validateWanIp(val)
{
	if(validateIp(val)==false) return false;

	var ii; sval=String(val);
	i1=val.indexOf('.');
	sub1=val.substring(0,i1);

	tempval=val.substring(i1+1,val.length);
	i2=tempval.indexOf('.');
	sub2=tempval.substring(0,i2);

	tempval=tempval.substring(i2+1,tempval.length);
	i3=tempval.indexOf('.');
	sub3=tempval.substring(0,i3);

	tempval=tempval.substring(i3+1,tempval.length);
	i4=tempval.indexOf('.');
	sub4=tempval.substring(0,tempval.length);
	
	if(sub4=='0' || sub4=='00' || sub4=='255')
	{
		//alert("Last number can\'t be 0 or 255");
		return false;
	}
	if(sub1=='127')
	{
		//alert("can\'t be 127.x.x.x");
		return false;
	}
	if(val=='0.0.0.0')
	{
		//alert("cannot be 0.0.0.0");
		return false;
	}

	if((sub1-0)>223)
	{
		//alert("Must under 224.0.0.0");
		return false;
	}
}

function validatetheIp(val)
{
 	if(val.length==0) return;
 		var ii; sval=String(val);
 	if(val.length>15)
		{alert('Invalid IP address, too long, Please check again');return false;}
 	i1=val.indexOf('.');
 	if(i1==-1)
		{alert('Invalid IP address, missing \'.\' , Please check again!');return false;}
 	sub1=val.substring(0,i1);

	tempval=val.substring(i1+1,val.length);
 	i2=tempval.indexOf('.');
 	if(i2==-1)
		{alert('Invalid IP address, missing \'.\' , Please check again!');return false;}
 	sub2=tempval.substring(0,i2);

 	tempval=tempval.substring(i2+1,tempval.length);
 	i3=tempval.indexOf('.');
 	if(i3==-1)
		{alert('Invalid IP address, missing \'.\' , Please check again!');return false;}
 	sub3=tempval.substring(0,i3);
	
 	tempval=tempval.substring(i3+1,tempval.length);
 	i4=tempval.indexOf('.');
 	if(i4!=-1)
		{alert("Invalid IP address, extra \'.\' , Please check again!");return false;}
 	sub4=tempval.substring(0,tempval.length);

	 if(sub1.length==0 || sub2.length==0 || sub3.length==0 || sub4.length==0)
	{alert('Invalid IP address, missing numbers between \'.\', Please check again!');return false;}

 	if((sub1-0)<0 || (sub1-0)>255 || (sub2-0)<0 || (sub2-0)>255 ||
 	(sub3-0)<0 || (sub3-0)>255 || (sub4-0)<0 || (sub4-0)>255)
		{alert('Invalid IP address, numbers between \'.\' are too big, Please check again!');return false;}

 	for (ii=0; ii<sval.length; ii++)
 	{
 		if (sval.charAt(ii)=='.')
 			{continue;}
 		else if (sval.charAt(ii)<'0' || sval.charAt(ii)>'9')
			 {
				alert('Invalid Character '+'['+sval.charAt(ii)+'] '+' at Position '+(ii+1)+'! '+'Must be '+' 0123456789');
				return false;
 			}
 	}
}

function validateDNS(val)
{
	if(validatetheIp(val)==false) return false;

	var ii; sval=String(val);
	i1=val.indexOf('.');
	sub1=val.substring(0,i1);

	tempval=val.substring(i1+1,val.length);
	i2=tempval.indexOf('.');
	sub2=tempval.substring(0,i2);

	tempval=tempval.substring(i2+1,tempval.length);
	i3=tempval.indexOf('.');
	sub3=tempval.substring(0,i3);

	tempval=tempval.substring(i3+1,tempval.length);
	i4=tempval.indexOf('.');
	sub4=tempval.substring(0,tempval.length);
	
	
	if(sub1=='127')
	{
		alert('Invalid Ip address, the first number cannot be 127');
		return false;
	}
	if(val=='0.0.0.0')
	{
		alert('Invalid Ip address, cannot be 0.0.0.0');
		return false;
	}
	if(sub4=='0' || sub4=='255')
	{
		alert('Invalid Ip address, the last number cannot be 0 or 255');
		return false;
	}
	if((sub1-0)>223)
	{
		alert('Invalid Ip address, must under 224.0.0.0');
		return false;
	}
	return true;
}
function validateDialno(item)
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
		    (tmpchr == "9") || (tmpchr == "A") || (tmpchr == "B") ||
			(tmpchr == "C") || (tmpchr == "D") || (tmpchr == "*") || (tmpchr == "#"))
			continue;
		else
		{
		    alert("Please input the Dial No. rightly!(It must be 0~9 or A,B,C,D,*,#)");//(It may be 0~9 or A,B,C,D,*,#)
		    return false;
		}

	}

	return true;
	
}
/*begin add by zhengyuting for validate user name on 20071130*/
function validateUserName(item)
{
	var strlen = 0;
	var tmpchr,i;
	
	strlen = item.length;
	
	for (i=0; i<strlen; i++)
	{
		tmpchr = item.charAt(i);
		if ((tmpchr >= '0' && tmpchr <= '9')
			||(tmpchr >= 'A' && tmpchr <= 'Z')
			||(tmpchr >= 'a' && tmpchr <= 'z'))
		{
			continue;
		}
		else
		{
		    return false;
		}
	}

	return true;
}
/*end add by zhengyuting for validate user name on 20071130*/

