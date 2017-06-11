/**
 * Created by fxxk on 2017/5/21.
 */
function updateNews(nam) {
    if(!getElementsByClassName("nam")) return false;
    if(!getElementsByTagName("li")) return false;
    var news=document.getElementsByClassName("nam");
    var title=news.getElementsByTagName("li");
    for(var i=0;i<title.length;i++){
      title[i].firstChild.nodeValue;

    }

}// 调用更新标题的方法来更新一个ul里的所有标题

//在前面插入
function insertAfter(elem,tarclass) {
    var parent = tarclass.parentNode;
    if (parent.lastChild == tarclass) {
    parent.appendChild(elem);
    }
    else
    {
        parent.insertBefore(elem,tarclass.nextSibling);
    }
}

//加载时调用方法
function addLoadEvent(func) {
    var oldOnload=window.onload;
    if(typeof oldOnload !="Function")
    {
        window.onload=func;
    }
    else
    {
        oldOnload();
        func();
    }
}

//在newsList后面插入新闻
function addNews(title,address) {
    var news=document.createElement("li");
    var link=document.createElement("a");
    // var location=document.getElementsByClassName("newsList");
    link.href=address;
    link.textContent=title;
    news.appendChild(link);
    location.appendChild(news);
}

function subTitle(){

	var link=document.getElementsByTagName("a");
	
	var subTitle=null;
	var title=null;
	var add="...";
	for(var i in link){
	
		title=link[i].innerHTML;
		if(title.length<15) continue;
		subTitle=title.substr(0,15);
		subTitle=subTitle.concat(add);
		link[i].lastChild.nodeValue=subTitle;
		
	}
	
}

//图片轮播
function picChange(id){
	var pic=document.getElementById(id);
	pic.style.position="relative";
	pic.style.top=0;
	pic.style.left=0;
	setInterval("moveElement(0,-400,'pic_show')", 2000);
	
}

//移动动画
function moveElement(x,y,elemID){
	console.log(elemID);
	var elem=document.getElementById(elemID);
	var presentX=parseInt(elem.style.top);
	var presentY=parseInt(elem.style.left);
	if (presentX < x) {
		presentX++;
		}
	if (presentX < x) {
		presentX--;
	}
	if (presentY < y) {
		presentY++;
	}
	if (presentY < y) {
		presentY--;
	}
	if(presentX==x&&presentY==y){
		return true;
	}
	elem.style.top=presentX+"px";
	elem.style.left=presentY+"px";
	
	
}
//	addLoadEvent(picChange("pic_show"));
//	picChange("pic_show");