<%@page import="com.dao.grounpDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="grounp" class="com.util.Grounp" />
<jsp:setProperty name="grounp" property="*" />

<%
	grounpDAO gro=new grounpDAO();
	gro.addGrounp(grounp);
	response.sendRedirect("index.jsp");//session里面的数据都不在了
%>