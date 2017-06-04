<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
</head>
  <frameset cols="180,10,*" name="sss" frameborder="NO" border="0" framespacing="0" rows="*">
    <frame name="left" noresize scrolling="auto" src="left.jsp">
    <frame src="middle.jsp" name="middle" scrolling="NO" noresize>
    <frame name="main" src="updatepassword.jsp" scrolling="auto">
   </frameset><noframes></noframes>
<noframes><body>
</body></noframes>
</html>