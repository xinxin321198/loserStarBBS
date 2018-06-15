<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userName = request.getParameter("txtuserName");
	String passWord = request.getParameter("txtPassword");
	if(userName!=null&&!userName.equals("administrator"))
	{
		out.println("UserName Error!!");
		return ;
	}
	else if(passWord!=null&&!passWord.equals("administrator"))
	{
		out.println("PassWord Error!!");
		return;
	}
	else 
	{
		out.println("Welcome login!!");
		session.setAttribute("login","true");
		response.sendRedirect("index.jsp");
	}

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>