
var Network_Verizon  = "Verizon Wireless";
var Network_Vodafone = "Vodafone";
var Network_Other    = "VZGlobal";

var mccmncArray = new Array();

mccmncArray[0] = "20205";
mccmncArray[1] = "20404";
mccmncArray[2] = "27801";
mccmncArray[3] = "50503";
mccmncArray[4] = "22210";
mccmncArray[5] = "23415";
mccmncArray[6] = "26202";
mccmncArray[7] = "26801";
mccmncArray[8] = "27201";
mccmncArray[9] = "21401";
mccmncArray[10] = "21670";
mccmncArray[11] = "27402";
mccmncArray[12] = "53001";
mccmncArray[13] = "60202";
mccmncArray[14] = "54201";
mccmncArray[15] = "22601";
mccmncArray[16] = "27602";
mccmncArray[17] = "23003";
mccmncArray[18] = "28602";
mccmncArray[19] = "62002";
mccmncArray[20] = "28802";
mccmncArray[21] = "42702";
mccmncArray[22] = "40401";
mccmncArray[23] = "40405";
mccmncArray[24] = "40411";
mccmncArray[25] = "40413";
mccmncArray[26] = "40415";
mccmncArray[27] = "40420";
mccmncArray[28] = "40427";
mccmncArray[29] = "40430";
mccmncArray[30] = "40443";
mccmncArray[31] = "40446";
mccmncArray[32] = "40460";
mccmncArray[33] = "40484";
mccmncArray[34] = "40486";
mccmncArray[35] = "40488";
mccmncArray[36] = "40566";
mccmncArray[37] = "40567";
mccmncArray[38] = "405750";
mccmncArray[39] = "405751";
mccmncArray[40] = "405752";
mccmncArray[41] = "405753";
mccmncArray[42] = "405754";
mccmncArray[43] = "405755";
mccmncArray[44] = "405756";

function getOperatorName(mcc, mnc)
{
	if (mnc.length == 1)
	{
		mnc = "0" + mnc;
	}
		
	var mccmnc = mcc + "" + mnc;
   	
	for (var i = 0; i < mccmncArray.length; i++)
	{
		if (mccmnc == mccmncArray[i])
		{
			return Network_Vodafone;
		}
	}
	
	return Network_Other;
}

function processCDMA(value)
{
	if(value >= 107)
	{
   		return 0;
	}
	else if((value < 107)&&(value >=95))
	{
	   return 1;	
	}
	else if((value < 95)&&(value >=85))
	{
	   return 2;	
	}
	else if((value < 85)&&(value >=75))
	{
	   return 3;	
	}
	else if((value < 75)&&(value >=65))
	{
	   return 4;	
	}
	else if((value < 65)&&(value > 0))
	{
	   return 5;	
	}
    else
    {
       return 0;
    }
}


function processWCDMA(value)
{
	if((value > 31) || (value < 3))
	{
    	return 0;
	}
	else if((value <7)&&(value >= 3))
	{
	   return 1;	
	}
	else if((value < 10)&&(value >= 7))
	{
	   return 2;	
	}
	else if((value < 13)&&(value >= 10))
	{
	   return 3;	
	}
	else if((value < 16)&&(value >= 13))
	{
	   return 4;	
	}
	else if((value <= 31)&&(value >= 16))
	{
	   return 5;	
	}
}

function getRoamType(roamType, networkMode)
{
	if (roamType == "" || roamType == " ")
	{
		return "---"; 
	}
	
	if ("CDMA" == networkMode)
	{
		if ("ROAM_INTERNAL" == roamType)
		{
			return "International";
		}
		else if ("ROAM_ON" == roamType)
		{
			return "Roaming";
		}
		else if ("ROAM_EXT" == roamType)
		{
			return "Extended Network";
		}
		else if ("ROAM_OFF" == roamType)
		{
			return "Home";
		}
		else
		{
			return "---";
		}
	}
	
	if ("WCDMA" == networkMode)
	{
		if ("roam_on" == roamType || "ROAM_ON" == roamType)
		{
			return "International";
		}
		else
		{
			return "---";
		}
	}
	
	return "---";
}