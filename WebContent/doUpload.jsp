<%@page import="java.io.File"%>
<%@page import="com.dao.picDAO"%>
<%@page import="com.util.pic_bean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.dao.newsDAO"%>
<%@ page language="java" import="java.util.*,com.jspsmart.upload.*"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>上传处理页面</title>
	</head>

	<body>
	<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="n" class="com.util.news_bean" />
<%-- <jsp:setProperty name="newsAdd" property="*" /> --%>

<%
	newsDAO news=new newsDAO();
	pic_bean p=new pic_bean();
	picDAO pic=new picDAO();
	Date date=new Date();
	SimpleDateFormat d=new SimpleDateFormat("yyyyMMddhh");
	String mytime=d.format(date);
// 	news.addNews(newsAdd);

			//之所以要放到异常抛出结构里面，是为了避免直接访问此页报错 
			try{ 
				//指定动作 
				SmartUpload smart=new SmartUpload(); 
				smart.initialize(pageContext); 
				smart.upload(); 
				//把文件保存到同目录的pic文件夹 
// 				String title=smart.getRequest().getParameter("title");
				n.setTitle(smart.getRequest().getParameter("title"));
// 				System.out.println(smart.getRequest().getParameter("title"));
				n.setContent(smart.getRequest().getParameter("content"));
				//将请求得到的kinds转为int
				Integer k=smart.getRequest().getParameter("kinds") != null && !smart.getRequest().getParameter("kinds").equals("") ? Integer.parseInt(smart.getRequest().getParameter("kinds")) : null;
				n.setKinds(k);
				int nId=news.addNews(n);
				p.setnId(nId);
			

				for(int i=0;i<smart.getFiles().getCount();i++){
					
					if(smart.getFiles().getFile(i).getFileName().length()==0)	continue;
// 					System.out.println("这是第"+i+"  "+ smart.getFiles().getFile(i).getFileName().length());
					String name=smart.getFiles().getFile(i).getFileName();
					Random num=new Random(9999);
					String loc=request.getRealPath("\\");
					System.out.println("位置是"+loc);
					String relative="upload"+File.separator+mytime+num+name;
				
					name=loc+File.separator+"upload"+File.separator+mytime+num+name;
					
					smart.getFiles().getFile(i).saveAs(name);
					switch(i){
					case 0:
						p.setPic1(relative);
						break;
					case 1:
						p.setPic2(relative);
						break;
					case 2:
						p.setPic3(relative);
						break;
					case 3:
						p.setPic4(relative);
						break;
					}
				}
// 				smart.save("d:upload"); 
			
			} 
			catch(Exception e){ 
			} 
			pic.addpic(p);
			System.out.println("cesjuo");
		 %>
		<a href="index.jsp">返回</a>
	</body>
</html>