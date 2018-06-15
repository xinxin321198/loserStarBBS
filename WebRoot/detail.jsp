<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.lxx.sql.DB"%>

<%
String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	System.out.println(basePath);
	String ids = request.getParameter("id");
	int id = Integer.parseInt(ids);
	String url = "jdbc:mysql://localhost/bbs?user=root&password=root&useUnicode=true&characterEncoding=utf-8";
	Connection conn = DB.getConn(url);
	Statement st = DB.getStatement(conn);
	ResultSet rs = DB.getResultSet(st,"select title from article where id="+id);
	rs.next();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" class=" widthauto widthauto">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title><%=rs.getString("title") %></title>




<!--<base href="http://www.wpxap.com/">--><!--<base href=".">--><base href="."><link rel="stylesheet" type="text/css" href="./images/style_7_common.css"><link rel="stylesheet" type="text/css" href="./images/style_7_forum_viewthread.css">    

<script type="text/javascript" charset="utf-8" src="./images/NTQzOTgwNA==.js"></script><script type="text/javascript" charset="utf-8" src="./images/NTQzOTgwNA==(1).js"></script><script type="text/javascript">var STYLEID = '7', STATICURL = 'static/', IMGDIR = 'static/image/common', VERHASH = '2lM', charset = 'utf-8', discuz_uid = '0', cookiepre = 'zMYP_2132_', cookiedomain = '', cookiepath = '/', showusercard = '1', attackevasive = '0', disallowfloat = 'newthread|reply', creditnotice = '1|兑换卷|,2|智慧币|,3|信息|,4|技能|,5|经验值|,6|资源|,7|支持|,8|威望|', defaultstyle = '', REPORTURL = 'aHR0cDovL3d3dy53cHhhcC5jb20vZm9ydW0ucGhwP21vZD12aWV3dGhyZWFkJnRpZD0yOTUxMDkmZXh0cmE9cGFnZSUzRDEmcGFnZT0x', SITEURL = 'http://www.wpxap.com/', JSPATH = 'static/js/';</script>

<script src="./images/common.js" type="text/javascript"></script><meta name="application-name" content="Windows Phone 7论坛|智机网|WP7论坛">

<link rel="stylesheet" id="css_widthauto" type="text/css" href="./images/style_7_widthauto.css">

<script src="./images/forum.js" type="text/javascript"></script>
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>


<div id="qmenu_menu" class="p_pop blk" style="display: none;">
    <div class="ptm pbw hm"> 请 <a href="javascript:;" class="xi2" onclick="lsSubmit()"><strong>登录</strong></a> 后使用快捷导航<br>没有帐号？<a href="http://www.wpxap.com/member.php?mod=register.php" class="xi2 xw1">注册</a> </div>
  </div>

<div id="wp" class="wp">
<div class="box">
<script type="text/javascript">var fid = parseInt('2'), tid = parseInt('295109');</script>






<script type="text/javascript">zoomstatus = parseInt(1);var imagemaxwidth = '600';var aimgcount = new Array();</script>



<style id="diy_style" type="text/css"></style>

<!--[diy=diynavtop]--><div id="diynavtop" class="area"></div><!--[/diy]-->





<style id="diy_style" type="text/css"></style>

<div class="wp">

<!--[diy=diy1]--><div id="diy1" class="area"></div><!--[/diy]-->

</div>



<div id="ct" class="wp cl">

<div id="pgt" class="pgs mbm cl ">

<div class="pgt"></div>

<span class="y pgb"><a href="index.jsp">返回列表</a></span>

<a id="newspecial" href="restore.jsp?id=<%=id %>" title="发新帖"><img src="./images/pn_post.png" alt="发新帖"></a>

</div>








<div id="postlist" class="pl bm">

<table cellspacing="0" cellpadding="0">

<tbody><tr>

<td class="pls ptm pbm">



</td>

<td class="plc ptm pbn">


<div class="y">
<a href="http://www.wpxap.com/forum.php?mod=redirect&goto=nextoldset&tid=295109" title="回复">回复</a>


<a href="http://www.wpxap.com/forum.php?mod=redirect&goto=nextoldset&tid=295109" title="上一主题"><img src="./images/thread-prev.png" alt="上一主题" class="vm"></a>

<a href="http://www.wpxap.com/forum.php?mod=redirect&goto=nextnewset&tid=295109" title="下一主题"><img src="./images/thread-next.png" alt="下一主题" class="vm"></a>

</div>


<h1 class="ts">


<a href="http://www.wpxap.com/forum.php?mod=forumdisplay&fid=2&filter=typeid&typeid=3">标题</a>





</h1>

</td>

</tr>

</tbody></table>







<table cellspacing="0" cellpadding="0" class="ad"><tbody><tr><td class="pls"></td><td class="plc"></td></tr></tbody></table>
<div id="post_4712031">

<table id="pid4712031" summary="pid4712031" cellspacing="0" cellpadding="0">

<tbody><tr>

<td class="pls" rowspan="2">

<a name="newpost"></a> 

<div class="pi">

<div class="authi"><div class="touxian"><a href="http://www.wpxap.com/home.php?mod=space&uid=24834" target="_blank" class="xw1">clske</a>



</div></div>

</div>


<div class="p_pop blk bui" id="userinfo4712031" style="display: none; margin-top: -11px;">

<div class="m z">

<div id="userinfo4712031_ma"></div>


</div>

<div class="i y">

<div>

<strong><a href="http://www.wpxap.com/home.php?mod=space&uid=24834" target="_blank" class="xi2">账号</a></strong>

</div>



<div id="avatarfeed"><span id="threadsortswait"></span></div>

</div>

</div>


<div>


            


<p><em><a href="http://www.wpxap.com/home.php?mod=spacecp&ac=usergroup&gid=15" target="_blank">昵称</a></em></p>



</div>














</td>

<td class="plc">

<div class="pct">
<div class="pcb">
<div class="t_fsz">
内容
</div>

<div><font color="#dd4332">子回复	</font></div>
</div></div>






</td></tr>








</tbody></table>


</div>






</div>




</div>



	</div></div>



</body></html>

