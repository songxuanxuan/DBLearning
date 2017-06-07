
<%@page import="com.util.news_bean"%>
<%@page import="com.dao.newsDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="new1">
<%
	newsDAO news=new newsDAO();
	List<news_bean> list =news.queryNews();
	String[] li=new String[10];
	int[] n=new int[10];
	for(int i=0;i<list.size()%10;i++)
		
	{
		if(list.get(list.size()-i-1)==null) continue;
		li[i]=list.get(list.size()-i-1).getTitle();
		n[i]=list.get(list.size()-i-1).getId();
	}
	
%>
            <ul>
                <li><a href="details.jsp?id=<%=n[0]  %>"><%=li[0] %>-----<%=list.size()%></a>  </li>
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
</body>
</html>