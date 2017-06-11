<%@page import="com.util.pic_bean"%>
<%@page import="com.dao.picDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.dao.newsDAO"%>
<%@page import="com.util.news_bean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>大数据要闻</title>
<link href="css/box.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="top">
		<div class="box1">
			<div class="box1_l">
				<img src="" height="100" width="100"
					style="float: left; margin-left: 30px; margin-top: 20px;" />
			</div>
			<div class="stroke">
				<h1>云上贵阳&nbsp智慧消防</h1>
			</div>
		</div>
		<!--大报头栏-->
		<div class="box2">
			<!--<ul style="text-align: left">-->
			<li class="ll"><a href="index.jsp">首页</a></li>
			<li><a href=./preNews.jsp>大数据要问</a></li>
			<li><a href=fresh.html>大数据动态</a></li>
			<li><a href=note.html>通知通告</a></li>
			<li><a href=knowleage.html>大数据知识</a></li>
			<li><a href=workReport.html>工作简报</a></li>
			<li><a href=Dnews.html>大数据资讯</a></li>
			<li class="lr"><a href=article.html>调研文章</a></li>

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
	<div class="details">
	<%
	int id=Integer.parseInt(request.getParameter("id"));
	newsDAO news=new newsDAO();
	news_bean n=news.getNews(id);
	picDAO pic=new picDAO();
	pic_bean p=pic.getPicByNID(id);
	String loc1=p.getPic1();
	String loc2=p.getPic2();
	String loc3=p.getPic3();
	String loc4=p.getPic4();
// 	if(!(loc1 instanceof String)) loc1="#";
// 	if(!(loc2 instanceof String)) loc2="#";
// 	if(!(loc3 instanceof String)) loc3="#";
// 	if(!(loc4 instanceof String)) loc4="#";
	%>
	<h2><%=n.getTitle()%></h2>
	<p>发布人：&nbsp<%=n.getUpload_user() %>;&nbsp&nbsp&nbsp&nbsp发布时间: &nbsp<%=n.getAdd_time() %></p>
	<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=n.getContent() %></p>
	<div class=picDetail>
	<img src="<%=p.getPic1() %>" noerror="this.style.display='none'" />
	<img src="<%=p.getPic2() %>" noerror="this.style.display='none'" />
	<img src="<%=p.getPic3() %>" noerror="this.style.display='none'" />
	<img src="<%=p.getPic4() %>" noerror="this.style.display='none'" />
	
	</div>
	</div>
	
</body>
</html>