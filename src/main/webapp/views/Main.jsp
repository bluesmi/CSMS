<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>服装库存管理系统</title>
</head>

<frameset rows="82,*,23" frameborder="NO" border="0" framespacing="0">
  <frame src="<%=basePath%>views/Menu.jsp" name="topFrame" scrolling="NO" noresize>
  <frame src="<%=basePath%>common/index.jsp" name="midFrame" scrolling="NO">
  <frame src="<%=basePath%>views/bottom.jsp" name="bottomFrame" scrolling="NO" noresize>
</frameset>
<noframes><body>
</body></noframes>
</html>