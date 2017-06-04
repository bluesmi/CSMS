<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
if(request.getParameter("message")!=null){
    String message=(String)request.getParameter("message");
    if(!message.equals("")){
       out.println("<script type='text/javascript'>");
       out.println("alert('"+message+"')");
       out.println("</script>");
    }
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>在线通知</title>
<link rel="stylesheet" href="<%=basePath%>css/cjpm.css">
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
<script type="text/javascript" src="<%=basePath%>js/msn_message.js"></script>
<style type="text/css">
<!--
body {
	background-color: #f8f7f7;
}
-->
</style></head>

<BODY BACKGROUND="<%=basePath%>image/bg.gif">

<FORM NAME="BSDTERM001" ID="BSDTERM001" METHOD="post"  action="<%=basePath%>user/UpdateUserPasswordServlet.do">
<table border=0 cellspacing=0 cellpadding=2 width="100%" bgcolor="gray">
			<tr>
				<td class="headerbar61"> 修改密码</td>
				<td class="headerbar61"><p align="right"><input type=submit value=" 保 存 "></p></td>
			</tr>
			</table>
			<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
			<tr>
				<td></td>
			</tr>
			</table>
			<table border=0 cellspacing=1 cellpadding=2 width="100%" bgcolor="gray">
			<tr>
				<td class="textbar81" width="15%">旧密码</td>
				<td class="textbar01" width="85%"><input type="password" name="password" size="30" value="${user.password }"></td>				
			</tr>	
			<tr>
				<td class="textbar81" width="15%">新密码</td>
				<td class="textbar01" width="85%"><input type="password" name="newpass" size="30" value="${user.newpass }"></td>				
			</tr>	
			<tr>
				<td class="textbar81" width="15%">确认密码</td>
				<td class="textbar01" width="85%"><input type="password" name="repassword" size="30" value="${user.repassword }"></td>				
			</tr>			
			</table>
			${message }
</FORM>
</body>
</html>


