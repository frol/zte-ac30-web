var tmp_ctl;
function setinner(type)
{
document.getElementById("MsgLayer1").style.visibility = type ;
document.getElementById("MsgLayer2").style.visibility = type ;
document.getElementById("ifr").style.visibility=type;
}

function getElementPos(ctl) 
{
 var ua = navigator.userAgent.toLowerCase();
 var isOpera = (ua.indexOf('opera') != -1);
 var isIE = (ua.indexOf('msie') != -1 && !isOpera); 
 var el =ctl;
var wx = (window.innerWidth) ? window.innerWidth : (document.documentElement && document.documentElement.clientWidth) ? document.documentElement.clientWidth : document.body.offsetWidth;     
var wy = (window.innerHeight) ? window.innerHeight : (document.documentElement && document.documentElement.clientHeight) ? document.documentElement.clientHeight : document.body.offsetHeight; 
try
{
 if(el.parentNode === null || el.style.display == 'none')
 	{
			
  		return { x:(wx/2), y:(wy/2) };
	} 
}
catch (e) {
return { x:(wx/2), y:(wy/2) };
}	
var w=120,h=88; //move MsgLayer     
 var parent = null;
 var pos = [];     
 var box;     
 if(el.getBoundingClientRect)    //IE
 {         
  box = el.getBoundingClientRect();
  var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
  var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);
  return {x:box.left + scrollLeft-w, y:box.top + scrollTop-h};
 }else if(document.getBoxObjectFor)    // gecko    
 {
  box = document.getBoxObjectFor(el); 
  var borderLeft = (el.style.borderLeftWidth)?parseInt(el.style.borderLeftWidth):0; 
  var borderTop = (el.style.borderTopWidth)?parseInt(el.style.borderTopWidth):0; 
  pos = [box.x - borderLeft, box.y - borderTop];
 } else    // safari & opera    
 {
  pos = [el.offsetLeft, el.offsetTop];  
  parent = el.offsetParent;     
  if (parent != el) 
  { 
   while (parent) 
   {  
    pos[0] += parent.offsetLeft; 
    pos[1] += parent.offsetTop; 
    parent = parent.offsetParent;
   }  
  } 
  
 } 
 return { x:pos[0]-w, y:pos[1]-h };
}


function ShowError(ctl, msgid)
{
	//add by hqs for xml multi_lang
	Butterlate.setTextDomain("showError");
var pos=getElementPos(ctl);
tmp_ctl=ctl;
var divx=pos.x+"px";
var divy=pos.y+"px";
document.getElementById("MsgLayer1").style.top=divy;
document.getElementById("MsgLayer1").style.left=divx;
document.getElementById("MsgLayer1").style.visibility="visible";
document.getElementById("MsgLayer2").style.top=divy;
document.getElementById("MsgLayer2").style.left=divx;
document.getElementById("MsgLayer2").style.visibility="visible";
document.getElementById("errmsg").innerHTML = Get_string(msgid);
document.getElementById("ifr").style.top=divy;
document.getElementById("ifr").style.left=divx;
document.getElementById("ifr").style.visibility="visible";
if(ctl != null && ctl.disabled == false)
{
ctl.focus();
//ctl.select();
}
}

window.onresize=resetDIV;
function resetDIV()
{
var pos=getElementPos(tmp_ctl);
var divx=pos.x+"px";
var divy=pos.y+"px";
document.getElementById("MsgLayer1").style.top=divy;
document.getElementById("MsgLayer1").style.left=divx;
document.getElementById("MsgLayer2").style.top=divy;
document.getElementById("MsgLayer2").style.left=divx;
document.getElementById("ifr").style.top=divy;
document.getElementById("ifr").style.left=divx;
}


document.onmousedown=cd;
document.onkeydown=cd;
function  cd()
{
setinner("hidden");
}