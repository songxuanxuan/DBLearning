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
	addLoadEvent(subTitle());