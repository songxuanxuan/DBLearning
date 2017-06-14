<%@page import="com.dao.userDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%-- <jsp:useBean id="user" class="com.util.user_bean"></jsp:useBean> --%>
<%-- <jsp:setProperty name="user" property="*" /> --%>
<%
	userDAO actionUser=new userDAO();
	String username=request.getParameter("username");
	boolean is=actionUser.isExist(username);
	System.out.println(is);
	request.setAttribute("is", is);
%>