<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="com.lxx.sql.DB"%>
<%@page import="com.lxx.sql.SQLHepler"%>

<%!
private String s = "";
boolean login = false;
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


login = Boolean.parseBoolean((String)session.getAttribute("login"));

String ids = request.getParameter("id");
int id = Integer.parseInt(ids);
String url = "jdbc:mysql://localhost/bbs?user=root&password=root&useUnicode=true&characterEncoding=utf-8";
Connection conn = DB.getConn(url);
Statement st = DB.getStatement(conn);
ResultSet rs = DB.getResultSet(st,"select * from article where id="+id);
				s = "";
				String deles = "";
				while(rs.next())
				{
					if(login)
					{
						deles = "<td><a href='delete.jsp?id="+id+"'>删除</a></td>";
					}
					s+="<tr><td>"+rs.getString("title")+"</td><td>"+rs.getString("cont")+"</td><td><a href='restore.jsp?id="+id+"'>回复</a></td>"+deles+"</tr>";
				}
				//继续找孩子
				s += SQLHepler.tree(conn,id,0,login);
				
				DB.closeRs(rs);
				DB.closeStmt(st);
				DB.closeConn(conn);
				login = false;
%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <table border="1"> 
  <%=s %>
  </table>
  </body>
</html>
