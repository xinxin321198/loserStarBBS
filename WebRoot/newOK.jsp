<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@page import="com.lxx.sql.DB"%>
<%@page import="com.lxx.sql.SQLHepler"%>
    
<%
	request.setCharacterEncoding("utf8");
	String cont = request.getParameter("cont");
	cont = cont.replaceAll("\n","<br/>");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=root&useUnicode=true&characterEncoding=utf-8";
	Connection conn = DB.getConn(url);
	SQLHepler.add(conn,request.getParameter("title"),cont);
	
	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
发表成功
<a href="index.jsp">返回主页</a>
</body>
</html>