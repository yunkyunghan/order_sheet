var num = 0;

function newsListMore(){
	var newsList = document.getElementById("newsList");
	
	for (i=0;i<5;i++) {
		newsList.innerHTML += "<div class='listBox' onclick=\"location.href='newsboardview.html'\">"
									+ "<ul><li class='subjectsList'>모바일 결제 시장 활로 열린다</li>"
									+ "<li class='listRegdate'>2010-01-04</li></ul>"
									+ "<div class='listDot'>"
									+ "<img  src='images/dot.png' alt='' width='17' height='16'/>"
									+ "</div></div>";
	}
	listBottomBtnChange();
}

function entListMore(){
	var entList = document.getElementById("entList");
	
	for (i=0;i<5;i++) {
		entList.innerHTML += "<div class='entListBox' onclick=\"location.href='entboardview.html'\">"
						  +"<ul><li class='subjectsList'>휴대폰 OS 상관없이 웹 접속</li>"
						  +"<li class='listRegdate'>2010-01-04</li></ul>"
						  +"<div class='entListThumnail'>"
						  +"<img src='images/5.png' width='84' height='63' alt='썸네일 이미지 1' />"
						  +"</div>"
						  +"<div class='listDot'><img  src='images/dot.png' alt='' width='17' height='16'/></div>"
						  +"</div>";
	}
	
	listBottomBtnChange();
}

function movieListMore(){
	var movieList = document.getElementById("movieList");
	
	for (i=0;i<3;i++) {
		movieList.innerHTML +="<div class='movieListBox' onclick=\"location.href='movieboardview.html'\">"
							+"<div class='movieListThumnail'>"
							+"<div  class='btn_play2'><img src='images/play_24bit.png' width='19' height='19' alt='' /></div>"
							+"<img src='images/1.png' width='84' height='63' alt='썸네일 이미지 1' />"
							+"<div class='movieSubjects'>모바일 결제<br/>결실 맺을 것</div>"
							+"</div></div>";
	}
	listBottomBtnChange();
}

function listBottomBtnChange()
{
	var more = document.getElementById("more");
	var moveTop = document.getElementById("moveTop");
	more.style.display = "none";
	moveTop.style.width = "100%";
}

var font = 1;

function fontSizeUp(){
	var fontSizeUp = document.getElementById("boardContents");
	font += 0.1;
	fontSizeUp.style.fontSize = font + "em";
}

function fontSizeDown(){
	var fontSizeUp = document.getElementById("boardContents");
	font -= 0.1;
	fontSizeUp.style.fontSize = font + "em";

}

function weatherSlider(w)
{
    // Global Variable
    imageList = new Object();
    item_width = w;
    curr_position = 0;
    curr_idx = 0;
    tmp = 0;

    var slider = document.getElementById("imageSlider");
    var groups = slider.getElementsByTagName("div");
    for(var i=0; i < groups.length; i++)
    {
        if(groups[i].className == "imageList") imageList = groups[i].getElementsByTagName("ul")[0]; // Image List (UL Element)
    }
  
	//var lis = imageList.getElementsByTagName("li");
    //imageList.style.width = (w * lis.length) + "px";
    
    // Controller
    var bts = slider.getElementsByTagName("img");
    for(var i=0; i<bts.length; i++)
    {
        if(bts[i].className == 'btn_prev')
        {
            bts[i].onclick = function() { weatherPrev(); } // Click To Prev
        }
        else if(bts[i].className == 'btn_next')
        {
            bts[i].onclick = function() { weatherNext(); } // Click To Next
        }
    }
}

function weatherNext() // Next Behavior
{
	if(curr_idx == 1){
		alert("다음 날씨가 없습니다.");
		return;
	}
	else if(curr_idx < 4)
    {
        imageList.style.left = (curr_position - item_width) + "px";
        curr_position -= item_width;
     
        for(var i=(curr_idx+3); i>=(curr_idx+1); i--){	//값을 증가시켜야 되기 때문에 젤 큰값부터 증가시켜 id 중복을 피한다.	
        		document.getElementById("weatherIcon"+i).outerHTML = "<li id='weatherIcon"+(i+1)+"'><div class='weeklyW_Box'><div class='wieeklyW_Image'>9/"+(25+(i+2))+"<br/><img src='images/weather/button_"+(5+i)+".png' width='64' height='64' alt=''/></div><div class='highTemperature'>"+(24-i)+"℃</div><div class='lowTemperature'>"+(19-i)+"℃</div></div></li>";	
		}
    	curr_idx++;
    }
}

function weatherPrev() // Prev Behavior
{
	if(curr_idx == -1){
		alert("이전 날씨가 없습니다.");
		return;
	}
	
	else if(curr_idx > -1)
    {
        imageList.style.left = (curr_position + item_width) + "px";
        curr_position += item_width;
        for(var i=(curr_idx+1); i<=(curr_idx+3); i++){	//값을 증가시켜야 되기 때문에 젤 큰값부터 증가시켜 id 중복을 피한다.	
    		document.getElementById("weatherIcon"+i).outerHTML = "<li id='weatherIcon"+(i-1)+"'><div class='weeklyW_Box'><div class='wieeklyW_Image'>9/"+(25+i)+"<br/><img src='images/weather/button_"+(3+i)+".png' width='64' height='64' alt=''/></div><div class='highTemperature'>"+(26-i)+"℃</div><div class='lowTemperature'>"+(21-i)+"℃</div></div></li>";	
        }
    }
    curr_idx--;
}

/* 주소창 자동 숨김 */
window.addEventListener('load', function(){
    setTimeout(function() { 
 window.scrollTo(0, 1);
    }, 100);
}, false);