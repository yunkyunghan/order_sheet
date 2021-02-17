    // 메뉴의 총 갯수
     var main_cnt = 4
     function showhide(num)    {
     	return;
          for (i=1; i<=main_cnt; i++)   {
              menu=eval("document.all.block"+i+".style");
              if(menu) {
              imgch=eval("document.bar"+i);
              if (num==i) {
                 if (menu.display=="block")  {
                   menu.display="none";
                   // 마우스 오버시 나타나는 이미지의 경로 및 파일명, 열려진 메뉴
                   imgch.src="http://newkr.hancomkorea.com/images/common/button/menu_open_01.gif";
                }else {
                  menu.display="block";
                  // 마우스 아웃시 나타나는 이미지의 경로 및 파일명, 닫혀진 메뉴
                  imgch.src="http://newkr.hancomkorea.com/images/common/button/menu_close_01.gif";
                }
              }
              }
          }
      }

     function show(num)    {
     	return;
          for (i=1; i<=main_cnt; i++)   {
              menu=eval("document.all.block"+i+".style");
              imgch=eval("document.bar"+i);
               if(menu) {
              if (num==i) {
                  menu.display="block";
                  // 마우스 오버시 나타나는 이미지의 경로 및 파일명, 열려진 메뉴
                  imgch.src="http://newkr.hancomkorea.com/images/common/button/menu_open_01.gif";
              }else {
                 menu.display="none";
                 // 마우스 아웃시 나타나는 이미지의 경로 및 파일명, 닫혀진 메뉴
                 imgch.src="http://newkr.hancomkorea.com/images/common/button/menu_close_01.gif";
              }
              }
            }
        }


function MM_openBrWindow(theURL,winName,features) {
  window.open(theURL,winName,features);
}
		
		
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}


function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}



function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
    //-->
function insertFlash(swf, width, height, bgcolor, id, flashvars)
{
	var strFlashTag = new String();

	if (navigator.appName.indexOf("Microsoft") != -1)
	{
		strFlashTag += '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" ';
		strFlashTag += 'codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=version=8,0,0,0" ';
		strFlashTag += 'id="' + id + '" width="' + width + '" height="' + height + '">';
		strFlashTag += '<param name="movie" value="' + swf + '"/>';

		if(flashvars != null) {strFlashTag += '<param name="flashvars" value="' + flashvars + '"/>'};
		strFlashTag += '<param name="quality" value="best"/>';
		strFlashTag += '<param name="bgcolor" value="' + bgcolor + '"/>';
		strFlashTag += '<param name="menu" value="false"/>';
		strFlashTag += '<param name="salign" value="LT"/>';
		strFlashTag += '<param name="scale" value="noscale"/>';
		// strFlashTag += '<param name="wmode" value="transparent"/>';
		strFlashTag += '<param name="allowScriptAccess" value="sameDomain"/>';
		strFlashTag += '</object>';
	}
	else
	{
		strFlashTag += '<embed src="' + swf + '" ';
		strFlashTag += 'quality="best" ';
		strFlashTag += 'bgcolor="' + bgcolor + '" ';
		strFlashTag += 'width="' + width + '" ';
		strFlashTag += 'height="' + height + '" ';
		strFlashTag += 'menu="false" ';
		strFlashTag += 'scale="noscale" ';
		strFlashTag += 'id="' + id + '" ';
		strFlashTag += 'salign="LT" ';
		//strFlashTag += 'wmode="transparent" ';
		strFlashTag += 'allowScriptAccess="sameDomain" ';
		if(flashvars != null) {strFlashTag += 'flashvars="' + flashvars + '" '};
		strFlashTag += 'type="application/x-shockwave-flash" ';
		strFlashTag += 'pluginspage="http://www.macromedia.com/go/getflashplayer">';
		strFlashTag += '</embed>';
	}

	document.write(strFlashTag);
}