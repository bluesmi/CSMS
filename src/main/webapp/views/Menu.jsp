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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/frame.css">
<title></title>
 

<script language="JavaScript">
	function clearStyle(){
	  ttd1.className='top1';
	  ttd2.className='top1';
	  ttd3.className='top1';
	  ttd4.className='top1';
	  ttd5.className='top1';
	  ttd6.className='top1';
	  ttd7.className='top1';
	  ttd8.className='top1';	
	  ttd9.className='top1';	
	  ttd10.className='top1';
	  ttd11.className='top1';	
	  ttd12.className='top1';		
	  ttd13.className='top1';	
	}
	
	function gotos(itt){ 	
	  clearStyle(); 	 
	  var obj = document.getElementById("ttd"+itt); 	 
	  obj.className="top2";	 
	}

</script>
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #FFFFFF;
	font-weight: bold;
}
.style2 {color: #FFFFFF}
-->
</style>
</head>
<body style="overflow:hidden ">
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
                          <td width="128" height="24" align="right" background="<%=basePath%>image/top.jpg"><img src="<%=basePath%>image/bian.gif" width="128" height="24" border="0" usemap="#Map"></td>
                        </tr>
                    </table></td>
                  </tr>
              </table></TD>
            </TR>
          </TABLE></td>
		</tr>
	    <tr>
			<td height="29" background="<%=basePath%>image/top_m.gif">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				  <tr>
					<td>&nbsp;</td>
					<td><img src="<%=basePath%>image/top_line.gif" width="2" height="29"></td>
					<td class="top1" onClick="gotos(1);" id="ttd1" >
						<a href="<%=basePath%>system/index.jsp" target="midFrame">系统管理</a>
					</td> 
					<td><img src="<%=basePath%>image/top_line.gif" width="2" height="29"></td>
					<td class="top1" onClick="gotos(8);" id="ttd8">
						<a href="<%=basePath%>stock/index.jsp" target="midFrame">库存管理</a>
					</td>					
					<td><img src="<%=basePath%>image/top_line.gif" width="2" height="29"></td>
					<td class="top1" onClick="gotos(10);" id="ttd10">
						<a href="<%=basePath%>common/index.jsp" target="midFrame">辅助管理</a>
					</td>
					
					<td><img src="<%=basePath%>image/top_line.gif" width="2" height="29"></td>
					<td align="right">${sessionScope.sessionUser.loginName},您好！<span id="clock"></span></td>
				  </tr>
			 </table>
		</td>
	 </tr>
</table>
    <map name="Map">
      <area shape="rect" coords="1,3,63,25" href="#">
      <area shape="rect" coords="68,3,127,25" href="<%=basePath%>login.html" target="_parent">
</map>
</body>
</html>



