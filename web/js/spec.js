var cPage=window.location.toString().replace(/.*\//,'');
cPage=cPage.replace(/\?.*/,'');

var mNum=0;
var isHelp=0;
var isWz=0;
var wz_step=0;
var wz_wantype=0;
function Page(g,s,p,t,f)
{
    this.g=g;
	this.s=s;
	this.p=p;
	this.t=t;
	this.idx=mNum++;
	if (f) this.f=f; else this.f=0;
}
function Group(s,p,t)
{
	this.s=s;
    this.p=p;
	this.t=t;
}


if (cPage.replace(/#.*/,'')=='do_help.htm')
{
	var ti=window.location.hash.replace(/#/,'');
	if (ti.indexOf("wz") >=0)
	{
		wz_step=ti.substr(2,1);
		Pages[0].s=ti.replace(/wz.!/,'');
		cPage=Pages[0].p;
		isHelp=1;
		isWz=1;

	}
	else
	for (i=0; i< Pages.length;i++)
	{
		if (Pages[i].s==ti)
		{
			cPage=Pages[i].p;
			isHelp=1;
		}
	}
}

if (cPage.replace(/#.*/,'')=='wizard.htm')
{
	isWz=1;
}

function findPage()
{
for (var i=0;i<Pages.length;i++)
	if (Pages[i].p==cPage) return Pages[i];
return Pages[0];
}

function topMenu(p)
{
var m='<table width=100% cellSpacing=0 bgColor=#465f88><TR class=menu1><TD height=27 width=20></TD>';
	for (var i=0;i<Groups.length;i++)
	{
		m+='<TD>';
		var b=((i!=p.g)? 1 : 0);
		if (b) m+=('<a href='+Groups[i].p+'>');
		m+='&nbsp;'+Groups[i].s+'&nbsp;';
		if (b) m+='</a>';
		m+='</TD>';
	}
	m+='<TD><a href=javascript:preLogout();>&nbsp;Logout</a></td>';
    m+='<TD width=40%>&nbsp;</TD>';
  	m+='</TR></table>';
	return m;
}

function leftMenu(p)
{
	if (isWz) return "<script>showWzStep();</script>";
	
  var m='<TABLE cellSpacing=0 cellPadding=3 width=100% class=menu2  bgcolor=#600080>';
	
	var s="";
  s+="<div id=Menu0 style='cursor:hand; width:100; height:19' class=menu2>";
  s+="<p style=\"margin-top: 5; margin-bottom: 5; margin-left: 18\">";
  s+="<SPAN style=\"color: #ffffff\">";
  s+='<a href='+Groups[0].p+'>'+'&nbsp;'+Groups[0].s +'</a>';
  s+="</SPAN></p>";
  s+="</div>";
 
	for (var i=1; i<10; i++)
	{	
    //s+="<div id=Menu"+i+" style=\"cursor:hand; width:100; height:19\" class=menu2 onClick=toggle(this,"+i+")>";
    s+="<div id=Menu"+i+" style=\"cursor:hand; width:100; height:19\" class=menu2>";
    s+="<p style=\"margin-top:5; margin-bottom:5\">&nbsp;<img src='";
    if (i!=p.g) 
      s+="images/indexe.gif" 
    else 
    	s+="images/indexd.gif";
    s+="' width=13 height=13 border=0 align=absmiddle id=Menu"+i+"Img>";
    s+='<a href='+Groups[i].p+'>'+'&nbsp;'+Groups[i].s +'</a>';
    s+="</div>"
 
    if (i!=p.g)
    {
    	//s+="<div id=ChildMenu"+i+" style='display:none;'>";
    	continue;
    }
    else
    {
    	s+="<div id=ChildMenu"+i+">";
    	//alert('group no:'+p.g);
    }   
    
    
    
    s+="<TABLE cellSpacing=0 cellPadding=0 width=194 border=0 class=menu2>";
    s+="<TBODY>";
    for (var j=0; j<Pages.length;j++)
    {
 	
 	    var t='p.g='+p.g;
 	    t+=', Pages['+j+'].g='+Pages[j].g;
 	    //alert(t);
 	    //alert('p.g='+p.g+', Pages[j].g'=Pages[j].g);
  
 	    if (Pages[j].g<i) continue;
 	    if (Pages[j].g>i) break;
	    if (Pages[j].f&1) continue;
		 
      s+="<TD width=26 align=right valign=middle height=15><IMG src='";
      if (Pages[j].p==cPage)
		  {s+="images/triangle_sel.gif";
      }
      else
      {s+="images/triangle.gif";
      }  
      
      s+="' height=13 width=13 align=absMiddle border=0 id=Bar"+"></TD>";
      //s+="<TD valign=middle>";
      //s+="<table border=1 width=100% bordercolor=#C0C0C0 bordercolordark=#C0C0C0 bordercolorlight=#808080>";
      //s+="<tr>";
      s+="<td  align=left nowrap>";
      //s+="<a onmouseout='Mouse(this,2)' onmouseover='Mouse(this,1)' style='cursor:hand' onclick=ClicktSubItem('"+ChildSrcs[i][j]+"')>";
      s+=('<a href='+Pages[j].p+'>');
      s+="&nbsp;"+Pages[j].t;
      s+="</a>";
      //s+="</td>";
      //s+="</tr>";
      //s+="</table>";
      s+="</TD>";
      s+="</TR>";
    }
    s+="</TBODY></TABLE></div>";

  }
  m+=s;		
	

	return m;
}


function ShowTitle()
{
	var p=findPage();
  var m;
  
	m='<table cellspacing=0 cellpadding=0 width=100%><tr bgcolor=#0088C6><td class=title2 nowrap>&nbsp;'+p.t+'</td></tr></table>'
  document.writeln(m);
}

function ShowPgScript(w, s)
{
	var m;
	m="<table cellspacing=0 cellpadding=0 width="+ w +"%><tr><td class=pgscript>";
	m+=s;
	m+="</td></tr></table><BR>";
	
	document.writeln(m);
}

function showtip(tipStr)
{ 
document.all.tip.innerHTML=tipStr; 
document.all.tip.style.left=window.event.x; 
document.all.tip.style.top=window.event.y; 
document.all.tip.style.display=""; 
} 
function hidetip(){ 
document.all.tip.style.display="none"; 
}

function pageHead()
{
	var p=findPage();

  var m='<table cellSpacing=0 cellPadding=0 width=100% height=85 bgcolor=#600080><tr><td height=74>'+showlogo()+'</td></tr>';
	//m+='<tr><td>'+topMenu(p)+'</td></tr></table>';
	//m+='<TABLE><TR><TD class=title1 height=40>'
  //    +Groups[p.g].t+
  //	'</TD></TR></TABLE>\
  //<HR width=100% SIZE=1>'
  m+='</TABLE>';
  
 
  m+='<TABLE height=700 style="position:absolute; left:-2px;top:82px;">\
  <TR>\
  <TD valign=top width=196 bgcolor=#600080>'+leftMenu(p)+'</TD>\
  <TD valign=top align=center>';
  
	if (isHelp==0)
	{
		m+='<table width=802><tr bgcolor=#FFBB00 ><td class=title2 nowrap>'+p.t+'</td>'
		//m+='<table width=100%><tr bgcolor=#FFFFFF ><td class=title2 nowrap>'+p.t+'</td>'
		//if (isWz==0)
		//	m+='<td align=right><input type=button class=btn onClick=doHelp("'+p.s+'") value=" Help "></td>'
		m+='</tr></table>';
	}

  document.writeln(m);
}


function doHelp(t)
{
//window.open('help.htm#'+t,'help','toolbar=0,status=0,menubar=0,scrollbars=1,resizable=1,width=530,height=400,left=150,top=150');
window.location='do_help.htm#'+t;
}

function showWzStep() {
	
	var m="";
  m+="<div id=Menu0 style='cursor:hand; width:100; height:19' class=menu2>";
  m+="<p style=\"margin-top: 5; margin-bottom: 5; margin-left: 18\">";
  m+="<SPAN style=\"color: #ffffff\">";
  m+='<a href='+Groups[0].p+'>'+'&nbsp;'+Groups[0].s +'</a>';
  m+="</SPAN></p>";
  m+="</div>";
  
	for (var i=1; i<10; i++)
	{	
    m+="<div id=Menu"+i+" style=\"cursor:hand; width:100; height:19\" class=menu2>";
    m+="<p style=\"margin-top:5; margin-bottom:5\">&nbsp;<img src='images/indexe.gif' width=13 height=13 border=0 align=absmiddle id=Menu"+i+"Img>";
    m+='<a href='+Groups[i].p+'>'+'&nbsp;'+Groups[i].s +'</a>';
    m+="</div>"
  }
  
  document.write(m);
}

function showlogo()
{
	var m='<table cellspacing=0 bgcolor=#600080><tr align=left>';
	m+='<td width=50><img border=0 src=images/logo.gif></td>';
	m+='<td width=150><img border=0 src=images/name.gif></td>';
	m+='<td width=600></td></tr></table>';
	return m;
}

function wanChgPage(m) {
	switch (m)
	{
		case 1: window.location='wan_statics.htm'; break;
		case 2: window.location='wan_dhcps.htm'; break;
/*OPT#CONFIG_PPPOE*/
		case 3: window.location='wan_pppoe.htm'; break;
/*END_OPT*/
/*OPT#CONFIG_PPTP*/
		case 4: window.location='wan_pptp.htm'; break;
/*END_OPT*/
/*OPT#CONFIG_L2TP*/
		case 5: window.location='wan_l2tp.htm'; break;
/*END_OPT*/
/*OPT#CONFIG_DHCPPXY*/
		case 6: window.location='wan_dhcppxy.htm'; break;
/*END_OPT*/
		default: return;
	}
}



function genTimeOpt()
{
	var s='';
	for (i=0; i<timeTable.length; i++)
	{
		var t=timeTable[i];
		s+='<option value='+t[0]+'> (GMT'+t[1]+') '+t[2]+'</option>\n';
	}
	document.write(s);
}



function show_month_option()
{
	var str=new String("");
	var i;

	for(i=1;i<=12;i++)
	{
		str="";
		str+="<option value="+i+">"+month[i-1]+"</option>";
		document.write(str);
	}
}
function show_day_option()
{
	var str=new String("");
	var i;

	for(i=1;i<=31;i++)
	{
		str="";
		str+="<option value="+i+">"+i+"</option>";
		document.write(str);
	}
}
