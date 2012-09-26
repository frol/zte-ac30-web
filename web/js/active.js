
function active_state_load(active_state)
{
	var length = active_state.length;
	var i;
	var flag = 0;
	var active_state_out ="";
	for(i=0;i<length;i++)
	{
		if((active_state.charAt(i)=="a") || (active_state.charAt(i)=="A"))
		{
			active_state_out  += "2";
		}
		else if((active_state.charAt(i)=="b") || (active_state.charAt(i)=="B"))
		{
			active_state_out += "3";
		}
		else if((active_state.charAt(i)=="c") || (active_state.charAt(i)=="C"))
		{
			active_state_out += "4";
		}
		else if((active_state.charAt(i)=="d") || (active_state.charAt(i)=="D"))
		{
			active_state_out += "5";
		}
		else if((active_state.charAt(i)=="e") || (active_state.charAt(i)=="E"))
		{
			active_state_out += "6";
		}
		else if((active_state.charAt(i)=="f") || (active_state.charAt(i)=="F"))
		{
			active_state_out += "7";
		}
		else
		{
			active_state_out += active_state.charAt(i);
		}
	}
	active_state = active_state_out;
	if(active_state == "")
	{
		flag = 3;
	}
	else if(active_state == "0")
	{
		flag = 4;
	}
	else if(length>1&&((active_state.charAt(length-2)>'3'&&active_state.charAt(length-2)<'8')))
	{
		flag = 3;
	}
	else if(length>3&&(parseInt(active_state.charAt(length-4))%2 == 1))
	{
		flag = 3;
	}
	else if(length>2&&(parseInt(active_state.charAt(length-3))%4 != 0))
	{
		flag = 2;
	}
	else
	{
		flag = 1;
	}
	
	return flag;
}
