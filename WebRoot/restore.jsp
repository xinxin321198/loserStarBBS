<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="com.lxx.sql.DB"%>
    
<%
	String s = request.getParameter("id");
	int id = Integer.parseInt(s);
	
	String url = "jdbc:mysql://localhost/bbs?user=root&password=root&useUnicode=true&characterEncoding=utf-8";
	Connection conn = DB.getConn(url);
	Statement st = DB.getStatement(conn);
	ResultSet rs = DB.getResultSet(st,"select * from `bbs`.`article` where id="+id);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="restoreOK.jsp" method="post">
<%
while(rs.next())
{
	%>
		<input type="hidden" name="id" value="<%=id %>"/>
		<input type="hidden" name="rootid" value="<%=rs.getInt("rootid")%>"/>
	<%
}	
%>

<table border="1">
<tr><td>标题</td><td><input type="text" name="title" width="40"/></td></tr>
<tr><td>内容</td><td><textarea name="cont" cols="40" rows="10"></textarea></td></tr>
<tr><td><input type="submit" value="回复"/></td></tr>
</table>
</form>
</body>
</html>