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
        <img src="pic/LOGO.png" height="200px" width="300px" style="float: left;margin-left: 70px;margin-top: 20px;" />
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
</body>
</html>