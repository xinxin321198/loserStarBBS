<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@page import="com.lxx.sql.DB"%>
<%@page import="com.lxx.sql.SQLHepler"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String sid  = request.getParameter("id");
	int id = Integer.parseInt(sid);
	boolean login = Boolean.parseBoolean((String)session.getAttribute("login"));
	if(login)
	{
		String url = "jdbc:mysql://localhost/bbs?user=root&password=root&useUnicode=true&characterEncoding=utf-8";
		Connection conn = DB.getConn(url);	
		SQLHepler.delete(conn,id);

		response.sendRedirect("index.jsp");	
	}
	else
	{
		out.println("请管理员登陆才能删除帖子");
		out.println("<a href='index.jsp'>返回主页</a>");
	}
 %>


</body>
</html>