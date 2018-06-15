<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="com.lxx.sql.DB"%>

<%!
	boolean login  = false;
	String s ="";
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(basePath);
String pageNos = request.getParameter("pageNo");
int pageNo = 1;
int size = 20;
int start;
int totalCount;
int totalPage;
if(pageNos==null||pageNos.equals("")||pageNos.equals("0"))
{
	pageNo = 1;
}
else 
{
	try
	{
		pageNo = Integer.parseInt(pageNos);	
	}
	catch (NumberFormatException e)
	{
		pageNo = 1;
	}
	
}
String logins = (String)session.getAttribute("login");
if(logins!=null)
{
	login = Boolean.parseBoolean(logins);
}

String url = "jdbc:mysql://localhost/bbs?user=root&password=root&useUnicode=true&characterEncoding=utf-8";
Connection conn = DB.getConn(url);

Statement stCount = DB.getStatement(conn);
ResultSet rsCount = DB.getResultSet(stCount,"select count(*) from article where pid = 0");
rsCount.next();
totalCount = rsCount.getInt(1);
if(0==totalCount%size)
{
	totalPage = totalCount/size;
}
else
{
	totalPage = totalCount/size+1;
}
if(pageNo>totalPage)
{
	pageNo = totalPage;
}
start = (pageNo-1)*size;
Statement st = DB.getStatement(conn);
ResultSet rs = DB.getResultSet(st,"select * from `bbs`.`article` where pid=0 order by id asc limit "+start+","+size+"");

				s = "";
				String dels = "";
	

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- saved from url=(0044)file:///C:/Users/lsy/Desktop/index/index.htm -->
<html xmlns="http://www.w3.org/1999/xhtml" class=" widthauto widthauto">
<head>
<base href="<%=basePath%>">


<title>小罗练习论坛</title>





<!--<base href="http://www.wpxap.com/">--><!--<base href=".">--><base href=".">
<link rel="stylesheet" type="text/css" href="./images/style_7_common.css">
<link rel="stylesheet" type="text/css" href="./images/style_7_forum_forumdisplay.css">    

<script type="text/javascript" charset="utf-8" src="./images/NTQzOTgwNA==.js"></script><script type="text/javascript" charset="utf-8" src="./images/NTQzOTgwNA==(1).js"></script><script type="text/javascript">var STYLEID = '7', STATICURL = 'static/', IMGDIR = 'static/image/common', VERHASH = '2lM', charset = 'utf-8', discuz_uid = '0', cookiepre = 'zMYP_2132_', cookiedomain = '', cookiepath = '/', showusercard = '1', attackevasive = '0', disallowfloat = 'newthread|reply', creditnotice = '1|兑换卷|,2|智慧币|,3|信息|,4|技能|,5|经验值|,6|资源|,7|支持|,8|威望|', defaultstyle = '', REPORTURL = 'aHR0cDovL3d3dy53cHhhcC5jb20vZm9ydW0ucGhwP21vZD1mb3J1bWRpc3BsYXkmZmlkPTImcGFnZT0x', SITEURL = 'http://www.wpxap.com/', JSPATH = 'static/js/';</script>

<link rel="stylesheet" id="css_widthauto" type="text/css" href="./images/style_7_widthauto.css">

<script src="./images/forum.js" type="text/javascript"></script>
</head>
<body id="nv_forum" class="pg_forumdisplay" onkeydown="if(event.keyCode==27) return false;">
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
 <a href="login.jsp">管理员登陆(账号：administrator 密码：administrator)</a>
  <a href="exit.jsp">退出登陆</a>

<div id="qmenu_menu" class="p_pop blk" style="display: none;">
    <div class="ptm pbw hm"> 请 <a href="javascript:;" class="xi2" onclick="lsSubmit()"><strong>登录</strong></a> 后使用快捷导航<br/>没有帐号？<a href="http://www.wpxap.com/member.php?mod=register.php" class="xi2 xw1">注册</a> </div>
  </div>

<style>.tl .by {width:125px;} .pstyle img {width:25px;height:25px;float:left;border: 1px solid #ccc; padding: 2px; margin: 0px; background-color: #fff;margin:3px 3px 0 0;}</style>

<div id="wp" class="wp">
<div class="box">

<style id="diy_style" type="text/css"></style>

<!--[diy=diynavtop]--><div id="diynavtop" class="area"></div><!--[/diy]-->

<div class="wp">

<!--[diy=diy1]--><div id="diy1" class="area"></div><!--[/diy]-->

</div>

<div class="boardnav">

<div id="ct" class="wp cl ct2">




<div class="mn">

<div class="bm bml pbn">


<div class="drag">

<!--[diy=diy4]--><div id="diy4" class="area"></div><!--[/diy]-->

</div>












<div id="pgt" class="bm bw0 pgs cl">

<div class="pg"><a href="index.jsp?pageNo=1"><%=new String("<<") %></a><a href='index.jsp?pageNo=<%=pageNo-1 %>'><%=new String("<") %></a><a href='index.jsp?pageNo=<%=pageNo+1 %>'><%=new String(">") %></a><a href='index.jsp?pageNo=<%=totalPage %>'><%=new String(">>") %></a>  共<%=totalPage %>页&nbsp&nbsp当前第<%=pageNo %>页</div> 


<a href="new.jsp"title="发新帖"><img src="./images/pn_post.png" alt="发新帖" /></a>

</div>







<div id="threadlist" class="tl bm bmw">




<div class="bm_c">


<script type="text/javascript">var lasttime = 1329213124;</script>


<div id="forumnew" style="display:none"></div>

<form method="post" autocomplete="off" name="moderate" id="moderate" action="http://www.wpxap.com/forum.php?mod=topicadmin&action=moderate&fid=2&infloat=yes&nopost=yes">

<input type="hidden" name="formhash" value="c0458ee5">

<input type="hidden" name="listextra" value="page%3D1">

<table summary="forum_2" cellspacing="0" cellpadding="0">


<tbody>

<tr>
<%			
				while(rs.next())
				{
					if(login)
					{
						dels="<td><a href='delete.jsp?id="+rs.getInt("id")+"'>删除</a></td>";
					}
					%>					
<td class="icn"><img src="./images/ann_icon.gif"></td>
<td><%="<a href='detail.jsp?id="+rs.getInt("id")+"' target='_blank'><font color='#EE5023'><b>"+rs.getString("title")+"</b></font></a>"+dels %></td>

<td class="num">&nbsp;</td>

<td class="by">&nbsp;</td>

</tr>

</tbody>

<tbody id="stickthread_410">

<tr>
<td class="icn">
</td>


</tr>

</tbody>	
					<% 
				}
				DB.closeRs(rsCount);
				DB.closeStmt(stCount);
				DB.closeRs(rs);
				DB.closeStmt(st);
				DB.closeConn(conn);
				login = false; %>



</table>

</form>

</div>

</div>





<div class="bm bw0 pgs cl">

<div class="pg"><a href="index.jsp?pageNo=1"><%=new String("<<") %></a><a href='index.jsp?pageNo=<%=pageNo-1 %>'><%=new String("<") %></a><a href='index.jsp?pageNo=<%=pageNo+1 %>'><%=new String(">") %></a><a href='index.jsp?pageNo=<%=totalPage %>'><%=new String(">>") %></a>  共<%=totalPage %>页&nbsp&nbsp当前第<%=pageNo %>页</div> 

<a href="new.jsp" title="发新帖"><img src="./images/pn_post.png" alt="发新帖"></a>

</div>

</div>

</div>

</div>

	</div></div>
	</div>

</body></html>