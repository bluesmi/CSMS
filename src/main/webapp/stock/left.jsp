<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>无标题文档</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/frame.css">
	<script type="text/jscript" language="JavaScript" src="${pageContext.request.contextPath }/js/qq_hidemenu.js"></script>
</head>
<SCRIPT language=JavaScript>
function  Content(){
parent.main.location="main.jsp"
}
</SCRIPT>

<body   nLoad="widgets.ToggleWidget(hideTop2);widgets.ToggleWidget(hideBest);widgets.ToggleWidget(hideBoard);widgets.ToggleWidget(hideSearch);">
<table width="180" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" class="left"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td  height="9"></td>
      </tr>
      <tr>
        <td >
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				<td  class="left1">
				<a id="exp52" title="折叠" href="javascript:widgets.ToggleWidget(hideTop1);"><img id="exp5" alt="折叠" src="${pageContext.request.contextPath }/image/qq_minimize.gif"  border="0"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a id="exp51" title="折叠" href="javascript:widgets.ToggleWidget(hideTop1);">库存管理</a></td>
				</tr>
			</table>		</td>
        </tr>
      <tr>
        <td class="left2" >
		<div id="hideTop1" class="hiderScroll" img="exp5" openAlt="折叠" closedAlt="展开">
		<table width="100%"  border="0" cellspacing="1" cellpadding="0">
           
			 <tr>
              <td width="16%"><div align="right"><img src="${pageContext.request.contextPath }/image/dot1.gif" width="13" height="16"></div></td>
              <td width="84%"><a href="${pageContext.request.contextPath }/QueryAllStockinOrderServlet " target="main">入库管理</a></td>
            </tr>
			<tr>
              <td width="16%"><div align="right"><img src="${pageContext.request.contextPath }/image/dot1.gif" width="13" height="16"></div></td>
              <td width="84%"><a href="${pageContext.request.contextPath }/ListStockoutServlet" target="main">出库管理</a></td>
            </tr>
			
            <tr>
              <td colspan="2"  height="10"></td>
              </tr>
        </table>
		</div></td>
      </tr>
	   <tr>
        <td height="8"></td>
      </tr>

      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>