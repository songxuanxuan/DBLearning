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
	newsDAO news=new newsDAO();
	List<news_bean> list=news.queryNews();
	int pages =list.size()/15; 
// 	System.out.println(pages);
	int a=list.size()%15;
	for(int i=(a-1)+pages;i>=0;i--)
	{ 	
		if(list.get(i)==null) continue;
		news_bean n =list.get(i);
		String title=n.getTitle();
		
%>
<li class="newsTit"><a href="details.jsp?id=<%=n.getId()%>"><%=title%></a></li>
<%} %>
</ul>
</div>
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
<script src="js/method1.js" type="text/javascript"></script>
<!-- <script src="js/sectionShow.js" type="text/javascript"></script> -->
</body>
</body>
</html>