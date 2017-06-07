//根据id显示页面
function showSection(id) {
    if(!document.getElementsByTagName("section")) return false;
    var sec=document.getElementsByTagName("section");
    for(var i=0;i<sec.length;i++)
    {
        if(sec[i].getAttribute("id")!=id)
        {

            sec[i].style.display="none";
        }
        else
        {
            sec[i].style.display="block";

        }
    }

}
//导航点击事件
function onClickNav() {

    if(!document.getElementsByTagName("nav")) return false;
    var navs=document.getElementsByTagName("nav");

    var sec=navs[0].getElementsByTagName("a");          //这个得到的是a的链接！！！！！！！！！！@@@@


    for(var i=0;i<sec.length;i++)
    {
        var secId=sec[i].getAttribute("href");
        // console.log(sec[0].getAttribute("href"));
        if(secId!=1) {
            document.getElementById(secId).style.display = "none";
        }
        sec[i].destination=secId;

        sec[i].onclick=function () {
            showSection(this.destination);

            return false;

        }
        // sec[i].onmouseover=function () {
        //     document.write("飘过")
        //
        // }
    }
}

//跳转显示更多
function onClickPre() {
    var pre=document.getElementById("morePre");
    pre.onclick=function () {
        showSection(2);
        return false;
    }

}
addLoadEvent(onClickNav(),onClickPre());
// onClickNav();