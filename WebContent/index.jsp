<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.picDAO"%>
<%@page import="com.util.pic_bean"%>
<%@page import="com.util.Grounp"%>
<%@page import="com.dao.grounpDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.newsDAO"%>
<%@page import="com.util.news_bean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>大数据</title>
    <link href="css/box.css" rel="stylesheet" type="text/css" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript " src="js/ieBetter.js"></script>
	<script language="javascript" src="js/jquery.js"></script>
    <script src="js/myfocus-2.0.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        //设置
        myFocus.set({
            id:'myFocus',//ID
            pattern:'mF_qiyi'//风格
        });
    </script>
</head>
<body>
<div class="login">
	<button id="closeL">关闭</button>
	<h2>登录</h2>	
	<p id="registV"></p>
	<form method="post" action="isCorrect" onsubmit="return checkValid1()">
	<p id="registV">请输入3个以上</p>
	<label>用户名:</label>
	<input class="input" type="text" name="username" value=""/><br>
	<label>密码:&nbsp&nbsp&nbsp&nbsp</label>
	<input class="input" type="text" name="password" value=""/><br>
	<input  id="loginB" class="button" type="button" value="登录"/>
	<button class="button" onclick="" id="regButton" />注册</button>
	</form>
</div>
<div class="register">
	<button id="closeR">关闭</button>
	<h2>注册</h2>	
	
	<form method="post" action="" onsubmit="return checkValid2()">
	<p id="registR">请输入3个以上</p>
	<label>用户名:</label>
	<input class="input" type="text" name="username" value="" /><br>
	<label>密码:&nbsp&nbsp&nbsp&nbsp</label>
	<input class="input" type="text" name="password" value="" /><br>
	<label>确认密码:&nbsp&nbsp</label>
	<input class="input" type="text" name="password1" value="" /><br>
	<label>姓名:</label>
	<input class="input" type="text" name="name" value="" /><br>
	<label>注册码:</label>
	<input class="input" type="text" name="code" id="code"/><br>
	<button id="registB" class="button" type="submit" onclick="">注册</button>
	<button class="button" onclick="" id="backButton"/>返回</button>
	</form>
</div>
<div class="cover"></div>
<div class="fly">
<img alt="666" src="pic/fly1.jpg">
</div>

<div class="top">
    <div class="box1">
        <div class="box1_l">
        <img src="pic/LOGO.png" height="200px" width="300px" style="float: left;margin-left: 70px;margin-top: 20px;" />
        </div>
    </div>
    <!--大报头栏-->
    <div class="box2">
        <!--<ul style="text-align: left">-->
            <li class="ll" ><a  href="index.jsp">首页</a> </li>
            <li ><a  href="preNews.jsp?">大数据要问</a> </li>
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
            <form action="search.jsp" method="post" enctype="application/x-www-form-urlencoded">
                <input name="key" type="text" />
                <input type="submit" value="搜索" onclick="" />
            </form>

        </div>
    </div>
</div>
<div class="content">
    <div class="left">
        <div class="left1">
        <div class="title1">
            <h2 style="font-size:18px;color: #FFFFFF;margin: 0;">大数据要问
                <a href="preNews.jsp" id="morePre">更多</a></h2>
        </div>
        <!--标题1结束-->
<%
	newsDAO news=new newsDAO();
	List<news_bean> list =news.getNewsByKind(1);
	String[] li=new String[10];
	int[] n=new int[10];
	Date[] date2=new Date[10];
	picDAO pi=new picDAO();
	pic_bean p1,p2,p3,p4;
	int count=list.size()<10?list.size():10;
	for(int i=0;i<count-1;i++)
		
	{
		if(list.get(list.size()-i-1)==null) continue;
		li[i]=list.get(list.size()-i-1).getTitle();
		n[i]=list.get(list.size()-i-1).getId();
		date2[i]=list.get(list.size()-i-1).getAdd_time();
	}
	p1=pi.getPicByNID(n[0]);
	p2=pi.getPicByNID(n[1]);
	p3=pi.getPicByNID(n[2]);
	p4=pi.getPicByNID(n[3]);
%>
        <div id="myFocus">
            <div class="pic">
            <ul>
                <li><a href="details.jsp?id=<%=p1.getnId()%>"><img src="${pageContext.servletContext.contextPath}<%=p1.getPic1()%>" alt="<%=li[0]%>"/></a> </li>
                <li><a href="details.jsp?id=<%=p2.getnId()%>"><img src="<%=p2.getPic1()%>" alt="<%=li[1]%>"/></a> </li>
                <li><a href="details.jsp?id=<%=p3.getnId()%>"><img src="<%=p3.getPic1()%>" alt="<%=li[2]%>"/></a> </li>
                <li><a href="details.jsp?id=<%=p4.getnId()%>"><img src="<%=p4.getPic1()%>" alt="<%=li[3]%>"/></a> </li>
                
            </ul>
            </div>

        </div>
        <!--图片滚动结束-->
<div class="new1">

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
        <div id=picFrame>
        <div id="pic_show">
           <ul>
        <%
        pic_bean p=new pic_bean();
        picDAO picD=new picDAO();
        news_bean newsP=new news_bean();
        String title_p=null;
       List<pic_bean> pic=picD.getPic();
       int length=pic.size()<5?pic.size():5;
       String absol=null;
       String sym=File.separator;
       for(int i=0;i<length;i++){
    	   p=pic.get(i);
    	   newsP=news.getNews(p.getnId());
    	   title_p=newsP.getTitle();
    	   String location=null;
    	   if(p.getPic1()!=null) {
    		 location=p.getPic1().replaceAll("\\\\", "/");
    	   }
//     	   absol=request.getContextPath()+location;
//     	   absol=absol.replaceAll("\\\\", "/");
        %>
        <li><a href="details.jsp?id=<%=p.getnId()%>"><img src="<%=location%>" alt="<%=title_p %>"/></a></li>
        <% } %>
        </ul>
        </div>
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
                <h2>建设工作领导小组<span><a id="loginButton" class="g1_title1_1" href="#">编辑</a></span></h2>                
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
                <h2>通知通告  </h2>
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
<!--             <div class="g1_title1_1"> -->
<!--                 <a href="edit.jsp">编辑</a> -->
<!--             </div> -->
             <div class=news2>
             <ul>
 <%
	List<news_bean> list_arti=news.getNewsByKind(7);
	int pages_arti =list_arti.size()/5; 
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
<div class="bottom">
		<div class="mynav">
			<table border="0" cellspacing="0" cellpadding="0" width="1000"
				bgcolor="#ffffff" align="center">
				<tbody>
					<tr>
						<td bgcolor="#ffffff" valign="top" align="middle">
							<table style="BORDER-TOP: #fff 6px solid" border="0"
								cellspacing="0" cellpadding="0" width="100%">
								<tbody>
									<tr>
										<td
											style="BORDER-BOTTOM: #e0e0e0 1px solid; BORDER-LEFT: #e0e0e0 1px solid; PADDING-BOTTOM: 4px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; BORDER-TOP: #e0e0e0 1px solid; BORDER-RIGHT: #e0e0e0 1px solid; PADDING-TOP: 4px"
											height="80" align="middle">
											<table border="0" cellspacing="2" cellpadding="0"
												width="100%">
												<tbody>
													<tr>
														<td align="middle" height="41"><a
															href="http://10.160.129.5:83/" title="消防部队政工网"
															target="_blank" border="0"><font color="#000000"
																size="3"><img
																	src="picOut/1.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://hx.xc.ga/" title="和谐警民关系网" target="_blank"
															border="0"><font color="#000000" size="3"><img
																	src="picOut/2.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://hj.xc.ga/" title="好警网" target="_blank"
															border="0"><font color="#000000" size="3"><img
																	src="picOut/3.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.2.60.3:86/" title="中国消防产品信息网"
															target="_blank" border="0"><font color="#000000"
																size="3"><img
																	src="picOut/4.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.160.129.5/" title="消防部队纪检网"
															target="_blank" border="0"><font color="#000000"
																size="3"><img
																	src="picOut/5.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.160.129.5:84/web71" title="消防部队审计网"
															target="_blank" border="0"><font color="#000000"
																size="3"><img
																	src="picOut/6.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.2.60.1/systemlink.htm" title="岗位考试"
															target="_blank" border="0"><font color="#000000"
																size="3"><img
																	src="picOut/7.gif"
																	width="131" height="41" border="0"></font></a></td>
													</tr>
													<tr>
														<td align="middle" height="41"><a
															href="http://10.2.60.88/zl" title="火灾隐患" target="_blank"
															border="0"><font color="#000000" size="3"><img
																	src="picOut/8.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.2.60.15:92/" title="危旧营房" target="_blank"
															border="0"><font color="#000000" size="3"><img
																	src="picOut/9.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.2.60.188/xiaofang/(S(uxd0d2jri3avjv20jdyhmqyu))/login.aspx"
															title="营房信息管理" target="_blank" border="0"><font
																color="#000000" size="3"><img
																	src="picOut/10.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.2.60.188:1198/" title="被装管理"
															target="_blank" border="0"><font color="#000000"
																size="3"><img
																	src="picOut/11.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.2.60.17:8080/equipment" title="装备管理"
															target="_blank" border="0"><font color="#000000"
																size="3"><img
																	src="picOut/12.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.160.129.20:100/FAMWEB/" title="部队资产"
															target="_blank" border="0"><font color="#000000"
																size="3"><img
																	src="picOut/13.gif"
																	width="131" height="41" border="0"></font></a></td>
														<td align="middle" height="41"><a
															href="http://10.2.60.7/kns50/" title="CNK"
															target="_blank" border="0"><font color="#000000"
																size="3"><img
																	src="picOut/14.gif"
																	width="131" height="41" border="0"></font></a></td>
													</tr>

												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>


						</td>
						<td width="0"></td>
					</tr>
				</tbody>
			</table>
		</div>
		
</div>
<div class="copyright">
		<img alt="aaa" src="">
        <p>版权所有：贵阳消防支队</p>
    </div>
<!--     <script src="js/method1.js" type="text/javascript"></script> -->
	<script type="text/javascript" src="js/action.js"></script>
</body>
</html>
