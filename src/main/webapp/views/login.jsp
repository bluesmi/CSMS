<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<HTML>
<head>
<TITLE>服装库存管理系统</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frame.css">
</head>

<BODY  BACKGROUND="<%=basePath%>image/bg.gif">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td width="100%" height="32"><TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
            <TR>
              <TD width="376"> <IMG SRC="<%=basePath%>image/top_1.jpg" WIDTH=376 HEIGHT=54 ALT=""></TD>
              <TD width="90%" align="right" valign="bottom" background="<%=basePath%>image/top_2.jpg"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="5%" align="center">&nbsp;</td>
                    <td width="80%" align="right">&nbsp;</td>
                    <td width="27%" align="right"><table width="75%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="128" height="24" align="right" ></td>
                        </tr>
                    </table></td>
                  </tr>
              </table></TD>
            </TR>
          </TABLE></td>
		</tr>
 
</table>

<form NAME="idFrmMain"   action="<%=basePath%>user/LoginServlet.do" method="Post">
<table   width="100%" height="40%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="middle">
			  <table width="300"  border="0" cellspacing="0" cellpadding="0">
              <tr>
			      <td>用户名:<input name="loginName" type="text" size="10"></td>
                 
                <td>密码:<input name="password" type="password" size="10"></td>
              
              <td width="42"><input name="imageField" type="submit"  value="登录" alt="登录" width="42" height="32" border="0"  ></td>
            </tr>
            <tr>${message}</tr>
        </table></td>
  </tr>
</table>
</form>

</BODY>
</HTML>

