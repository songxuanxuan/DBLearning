<%@page import="com.util.news_bean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.newsDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大数据</title>
    <link href="css/box.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="top">
    <div class="box1">
        <div class="box1_l">
        <img src="" height="100" width="100" style="float: left;margin-left: 30px;margin-top: 20px;" />
        </div>
        <div class="stroke">
            <h1>云上贵阳&nbsp智慧消防</h1>
        </div>
    </div>
  
    <!--大报头栏-->
    <div class="box2">
        <!--<ul style="text-align: left">-->
            <li class="ll" ><a  href="index.jsp">首页</a> </li>
            <li ><a  href=" preNews.jsp">大数据要问</a> </li>
            <li ><a href=" fresh.jsp">大数据动态</a> </li>
            <li ><a  href=" note.jsp">通知通告</a> </li>
            <li ><a  href=" knowleage.jsp">大数据知识</a> </li>
            <li ><a  href=" workReport.jsp">工作简报</a> </li>
            <li ><a  href=" Dnews.jsp">大数据资讯</a> </li>
            <li class="lr" ><a href=" article.jsp">调研文章</a> </li>

        <!--</ul>-->

    </div>
    <!--导航栏-->
    <div class="box3">
        <div class="box3_l">
       <li> &nbsp&nbsp今天是：&nbsp
    
<%
	Date date=new Date();
	DateFormat dateformat= new SimpleDateFormat("yyyy-MM-dd-EE");
	String date1=dateformat.format(date);
%>
			<%=date1 %>
                </li>
        </div>
        <div class="box3_r">
            <form action=""method="post">
                <input type="text" />
                <input type="button" value="搜索" onclick="" />
            </form>

        </div>
    </div>
</div>
<div class="newslist">
<ul>
<!-- 循环遍历新闻获得标题、接受id以实现跳转； -->
<%	
	int pages=0;
	String pa=request.getParameter("pages");
	System.out.println(pages);
try {
    pages= Integer.valueOf(pa).intValue();
    System.out.println(pages);
} catch (NumberFormatException e) {
    e.printStackTrace();
}
// 	pages= Integer.parseInt(pages);
	newsDAO news=new newsDAO();
	List<news_bean> list=news.getNewsByKindD(1);
	int a=pages*16;
	
	for(int i=a;i<list.size();i++)
	{ 	
		if(list.get(i)==null) continue;
		news_bean n =list.get(i);
		String title=n.getTitle();		
%>
<li class="cut"><a href="details.jsp?id=<%=n.getId()%>"><%=title%></a><span><%=n.getAdd_time() %></span></li>
<%} %>
</ul>
<div  class="page">
	<ul>
	<li><button id="prev">上一页</button></li>
	<li><button id="next">下一页</button></li>
	<li>页码：<span></span></li>
	
	<li><input id="jumpNum" method="get" action="" /><button id="jump">跳转</button></li>
	</ul>
</div>
</div>
	<script language="javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var pages=0;
	$("document").ready(function(){
		page();		
	});
	function page(){
		$(".cut:lt(0)").hide();
		$(".cut:gt(20)").hide();
		$("span:last").replaceWith("<span>"+(pages+1)+"</span>");
		var t=pages*20;
		$("#prev").click(function(){
			if(pages>0){
				$(".cut:lt("+t+"),.cut:gt("+(t+20)+")").show();
				pages--;
				$("span:last").replaceWith("<span>"+(pages+1)+"</span>");
				t=20*pages;	
				$(".cut:lt("+t+")").hide();
				$(".cut:gt("+(t+20)+")").hide();	
			}	
		});
		$("#jump").click(function(){
			$(".cut").show();
			var p=$("#jumpNum").val();
			console.log(p.length);
			p=Number(p)-1;
			$(".cut:lt("+p*20+"),.cut:gt("+(p*20+20)+")").hide();
		});
		$("#next").click(function(){
			if(pages<$(".cut").size()/20){
				$(".cut:lt("+t+"),.cut:gt("+(t+20)+")").show();
				pages++;
				$("span:last").replaceWith("<span>"+(pages+1)+"</span>");
				t=20*pages;
				$(".cut:lt("+t+")").hide();
				$(".cut:gt("+(t+20)+")").hide();
			
			}
		});
	}
	
	
</script>
<%
	
%>
<div class="bottom">
    <div class="mynav">
        <div>
            <ul>
                <li><a href="#">加入收藏</a></li>
                <li><a href="#">加入收藏</a></li>
                <li><a href="#">加入收藏</a></li>
                <li><a href="#">加入收藏</a></li>
                <li><a href="#">加入收藏</a></li>

            </ul>
        </div>
    </div>
    <div class="copyright">
        <p>版权所有：贵阳消防支队</p>
    </div>
</div>
<script src="js/jquery.js" language="text/javascript"></script>
<script src="js/action.js" language="text/javascript"></script>
</body>
</html>