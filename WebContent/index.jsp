<%@page import="com.util.Grounp"%>
<%@page import="com.dao.grounpDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.newsDAO"%>
<%@page import="com.util.news_bean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大数据</title>
    <link href="css/box.css" rel="stylesheet" type="text/css" />
    <script src="js/myfocus-2.0.4.min.js"type="text/javascript"></script>
    <script type="text/javascript">
        //设置
        myFocus.set({
            id:'myFocus',//ID
            pattern:'mF_qiyi'//风格
        });
    </script>
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
<section id="1">
<div class="content">
    <div class="left">
        <div class="left1">
        <div class="title1">
            <h2 style="font-size:18px;color: #FFFFFF;margin: 0;">大数据要问
                <a href="preNews.jsp" id="morePre">更多</a></h2>
        </div>
        <!--标题1结束-->
        <div id="myFocus">
            <div class="pic">
            <ul>
                <li><a href="#"><img src="./pic/2.jpg" alt="11"/></a> </li>
                <li><a href="#"><img src="./pic/1.jpg" alt="222"/></a> </li>
                <li><a href="#"><img src="./pic/3.jpg" alt="333"/> </a></li>
                <li><a href="#"><img src="./pic/4.jpg" alt="444"/> </a></li>
            </ul>
            </div>

        </div>
        <!--图片滚动结束-->
<div class="new1">
<%
	newsDAO news=new newsDAO();
	List<news_bean> list =news.getNewsByKind(1);
	String[] li=new String[10];
	int[] n=new int[10];
	Date[] date2=new Date[10];
	for(int i=0;i<list.size()%10;i++)
		
	{
		if(list.get(list.size()-i-1)==null) continue;
		li[i]=list.get(list.size()-i-1).getTitle();
		n[i]=list.get(list.size()-i-1).getId();
		date2[i]=list.get(list.size()-i-1).getAdd_time();
		
	}
	
%>
            <ul>
                <li><a href="details.jsp?id=<%=n[0]  %>"><%=li[0] %></a>  </li>
                <li><a href="details.jsp?id=<%=n[1]  %>"><%=li[1] %></a>  </li>
                <li><a href="details.jsp?id=<%=n[2]  %>"><%=li[2] %></a>  </li>
                <li><a href="details.jsp?id=<%=n[3]  %>"><%=li[3] %></a>  </li>
                <li><a href="details.jsp?id=<%=n[4]  %>"><%=li[4] %></a>  </li>
                <li><a href="details.jsp?id=<%=n[5]  %>"><%=li[5] %></a>  </li>
                <li><a href="details.jsp?id=<%=n[6]  %>"><%=li[6] %></a>  </li>
                <li><a href="details.jsp?id=<%=n[7]  %>"><%=li[7] %></a>  </li>
                <li><a href="details.jsp?id=<%=n[8]  %>"><%=li[8] %></a>  </li>
                <li><a href="details.jsp?id=<%=n[9]  %>"><%=li[9] %></a>  </li>
            </ul>

        </div>
        <!--新闻正文结束    标题题目过长待解决@@@@@@-->
            <div class="newdate">
                <ul>
                    <li><%=date2[0] %></li>
                    <li><%=date2[1] %></li>
                    <li><%=date2[2] %></li>
                    <li><%=date2[3] %></li>
                    <li><%=date2[4] %></li>
                    <li><%=date2[5] %></li>
                    <li><%=date2[6] %></li>
                    <li><%=date2[7] %></li>
                    <li><%=date2[8] %></li>
                    <li><%=date2[9] %></li>
                </ul>
        </div>
        </div>
        <!--新闻日期结束-->
        <div class="left2_l">
        <div class="title2_l">大数据动态</div>        
        <div class=news2>
        <ul>
 <%
	List<news_bean> list_f=news.getNewsByKind(2);
	int pages_f =list_f.size()/5; 
	int a=list_f.size();
	int n5=a-5>0?a-5:0;
	for(int i=a-1;i>=n5;i--)
	{ 	
		if(list_f.get(i)==null) continue;
		news_bean n_f =list_f.get(i);
		String title=n_f.getTitle();
		if(title.length()>=14)
			title=title.substring(0, 14);
%>
<li class="newsTit">
	<div class="new_c" style="float:left;">
	<a  href="details.jsp?id=<%=n_f.getId()%>"><%=title%></a>
	</div>
	<div style="float:right;">
	<span><%=n_f.getAdd_time() %></span>
	</div>
</li>
            <!--新闻正文结束-->
            <%} %>
            </ul>
            </div>
        </div>
        <!--资讯-->
        <div class="left2_r">
            <div class="title2_l">大数据知识</div>
             <div class=news2>
             <ul>
 <%
	List<news_bean> list_kno=news.getNewsByKind(4);
	int pages_kno =list_kno.size()/5; 
	int b=list_kno.size();
	int n1=b-5>0?b-5:0;
	for(int i=(b-1);i>=n1;i--)
	{ 	
		if(list_kno.get(i)==null) continue;
		news_bean n_kno =list_kno.get(i);
		String title=n_kno.getTitle();
		if(title.length()>=14)
		title=title.substring(0, 14);
		
%>
<li class="newsTit">
	<div class="new_c" style="float:left;">
	<a  href="details.jsp?id=<%=n_kno.getId()%>"><%=title%></a>
	</div>
	<div style="float:right;">
	<span ><%=n_kno.getAdd_time()%></span>
	</div>
</li>
            <!--新闻正文结束-->
            <%} %>
            </ul>
            </div>
        </div>
        <div class="pic_show">
        </div>
        <!--图片展示-->
        <div class="left2_l">
        <div class="title2_l">工作简报</div>        
        <div class=news2>
        <ul>
 <%
	List<news_bean> list_k=news.getNewsByKind(5);
	int pages_k =list_k.size()/5; 
	int c=list_k.size();
	int n2=c-5>0?c-5:0;
	for(int i=(c-1);i>=n2;i--)
	{ 	
		if(list_k.get(i)==null) continue;
		news_bean n_k =list_k.get(i);
		String title=n_k.getTitle();
		if(title.length()>=14)
			title=title.substring(0, 14);
		
%>

<li class="newsTit">
	<div class="new_c" style="float:left;">
	<a  href="details.jsp?id=<%=n_k.getId()%>"><%=title%></a>
	</div>
	<div style="float:right;">
	<span ><%=n_k.getAdd_time() %></span>
	</div>
</li>
   
            <!--新闻正文结束-->
            <%} %>
            </ul>
            </div>
        </div>
        <!--资讯-->
        <div class="left2_r">
            <div class="title2_l">大数据资讯</div>
             <div class=news2>
             <ul>
 <%
	List<news_bean> list_rep=news.getNewsByKind(6);
	int pages_rep =list_rep.size()/5; 
// 	System.out.println(pages);
	int d=list_rep.size();
	int n3=d-5>0?d-5:0;
	for(int i=(d-1);i>=n3;i--)
	{ 	
		if(list_rep.get(i)==null) continue;
		news_bean n_rep =list_rep.get(i);
		String title=n_rep.getTitle();
		if(title.length()>=14)
			title=title.substring(0, 14);
		
%>

<li class="newsTit">
	<div class="new_c" style="float:left;">
	<a  href="details.jsp?id=<%=n_rep.getId()%>"><%=title%></a>
	</div>
	<div style="float:right;">
	<span ><%=n_rep.getAdd_time() %></span>
	</div>
</li>
            <!--新闻正文结束-->
            <%} %>
            </ul>
            </div>
        </div>
        <!--通知 -->
        </div>
    <!--左边全结束-->


    <div class="right" >
        <div class="grounp1">
            <div class="g1_title">
                <h2>建设工作领导小组</h2>
            </div>
            <div class="g1_title1_1">
                <a href="edit.jsp">编辑</a>
            </div>
            <div class="g1_mate">
<%
	grounpDAO gro=new grounpDAO();
	Grounp grounp=gro.showGrounp();
%>

	<ul>
	<li>组&nbsp长:<%=grounp.getLeader() %></li>
	<li>副组长:<%=grounp.getDeputy() %></li>
	<li>成&nbsp员:<%=grounp.getStaff() %></li>
	<li>大数据建设指挥部</li>
	<li>组&nbsp长:<%=grounp.getCommander() %></li>
	<li>组&nbsp长:<%=grounp.getDeputy_comm() %></li>
	<li>组&nbsp长:<%=grounp.getStaff2() %></li>

	</ul>
            </div>
        </div>
        <div class="grounp2">
         <div class="g1_title">
                <h2>通知通告</h2>
            </div>
            <div class="g1_title1_1">
                <a href="edit.jsp">编辑</a>
            </div>
    <div class=news2>
             <ul>
 <%
	List<news_bean> list_note=news.getNewsByKind(3);
	int pages_note =list_note.size()/15; 
	int f=list_note.size();
	int n6=f-15>0?f-15:0;
	for(int i=f-1;i>=n6;i--)
	{ 	
		if(list_note.get(i)==null) continue;
		news_bean n_note =list_note.get(i);
		String title=n_note.getTitle();	
		if(title.length()>=14)
			title=title.substring(0, 14);
%>
<li class="newsTit">
	<div class="new_c" style="float:left;">
	<a  href="details.jsp?id=<%=n_note.getId()%>"><%=title%></a>
	</div>
	<div style="float:right;">
	<span ><%=n_note.getAdd_time()%></span>
	</div>
</li>
            <!--新闻正文结束-->
            <%} %>
            </ul>
            </div>
        
        </div>
        
        <div class="grounp3">
         <div class="g1_title">
                <h2>调研文章</h2>
            </div>
            <div class="g1_title1_1">
                <a href="edit.jsp">编辑</a>
            </div>
             <div class=news2>
             <ul>
 <%
	List<news_bean> list_arti=news.getNewsByKind(7);
	int pages_arti =list_arti.size()/5; 
// 	System.out.println(pages);
	int g=list_arti.size();
	int n4=g-5>0?g-5:0;
	for(int i=(g-1);i>=n4;i--)
	{ 	
		if(list_arti.get(i)==null) continue;
		news_bean n_arti =list_arti.get(i);
		String title=n_arti.getTitle();
		if(title.length()>=14)
			title=title.substring(0, 14);
		
%>

<li class="newsTit">
	<div class="new_c" style="float:left;">
	<a  href="details.jsp?id=<%=n_arti.getId()%>"><%=title%></a>
	</div>
	<div style="float:right;">
	<span ><%=n_arti.getAdd_time() %></span>
	</div>
</li>
            <!--新闻正文结束-->
            <%} %>
            </ul>
            </div>
            </div>

		</div>
    </div>


</section>
<!-- <section id="2"> -->
<!-- <div class="newslist"> -->
<!-- <ul> -->
<!-- <!-- 循环遍历新闻获得标题、接受id以实现跳转； --> -->
<%-- <% --%>
// 	newsDAO news2=new newsDAO();
// 	List<news_bean> list2=news.queryNews();
// 	int pages =list.size()/15; 
// // 	System.out.println(pages);
// 	int a=list.size()%15;
// 	for(int i=(a-1)+pages;i>=0;i--)
// 	{ 	
// 		if(list.get(i)==null) continue;
// 		news_bean n2 =list.get(i);
// 		String title=n2.getTitle();
		
<%-- %> --%>
<%-- <li class="newsTit"><a href="details.jsp?id=<%=n2.getId()%>"><%=title%></a></li> --%>
<%-- <%} %> --%>
<!-- </ul> -->
<!-- </div> -->
<!-- </section> -->
<!-- <section id="3"> -->
<!-- 33333 -->
<!-- </section> -->
<!-- <section id="4"> -->
<!-- 44444 -->
<!-- </section> -->
<!-- <section id="5"> -->

<!-- </section> -->
<!-- <section id="6"> -->

<!-- </section> -->
<!-- <section id="7"> -->

<!-- </section> -->
<!-- <section id="8"> -->

<!-- </section> -->
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
</html>
