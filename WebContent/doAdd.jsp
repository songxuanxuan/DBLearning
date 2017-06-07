<%@page import="com.util.news_bean"%>
<%@page import="com.dao.newsDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="newsAdd" class="com.util.news_bean" />
<jsp:setProperty name="newsAdd" property="*" />

<%
	newsDAO news=new newsDAO();
	news.addNews(newsAdd);
	response.sendRedirect("index.jsp");//session里面的数据都不在了
	

%>
<script>
	alert("添加好了");
</script>