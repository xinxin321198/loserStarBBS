<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	String login = (String)session.getAttribute("login");
    	if(login!=null)
    	{
    		session.setAttribute("login",null);
    		out.println("退出成功！");
    	}
    	else
    	{
    		out.println("你没有登陆！");
    	}
    	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="index.jsp">返回主页</a>
</body>
</html>