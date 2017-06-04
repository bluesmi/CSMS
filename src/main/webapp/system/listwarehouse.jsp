<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<head>
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=UTF-8">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>日志查询</title>
<link rel="stylesheet" href="<%=basePath%>css/cjpm.css">
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
<script type="text/javascript" src="<%=basePath%>js/cjcalendar.js"></script>
</head>
<script language="javascript">
	var CalendarWebControl = new atCalendarControl();
</script>
<SCRIPT LANGUAGE="javaScript">
<!--
function gotos()
{
	document.forms[0].action="<%=basePath%>system/addwarehouse.jsp";
	document.forms[0].submit();
}
function del(wid)
{
	var b = window.confirm("您确认删除吗?");
	 		if(b){
		 			window.location.href = "<%=basePath%>warehouse/DeleteWarehouseServlet.do?wid=" + wid;
		 			alert("删除成功");
	 			} 			
}
function goSearch()
{
	document.forms[0].action="<%=basePath%>warehouse/QueryWarehouseServlet.do";
	document.forms[0].submit();
}
 
 
-->
</SCRIPT>

<BODY BACKGROUND="<%=basePath%>image/bg.gif">
<FORM NAME="idFrmMain" ID="idmig0101" METHOD="POST"  ACTION="" ONSUBMIT="return false" >


<table border=0 cellspacing=0 cellpadding=2 width="100%" bgcolor="gray">
<tr>
	<td class="headerbar61">仓库查询</td>
    <td class="headerbar63" width="50%" colspan="1"><p align="right">
    	<input type=submit value=" 查 询 " onClick="JavaScript:goSearch();"></p></td>
  </tr>
</table>

<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
<tr>
	<td></td>
</tr>
</table>

<table border=0 cellspacing=1 cellpadding=2 width="100%" bgcolor="gray">
<tr>

    <td class="textbar81" width="15%">仓库编号</td>
		<td class="textbar01" width="35%">			
		<input type="text" name="wid" value="${wid }" style="width:210px ">	  </td>    
	<td class="textbar81" width="15%">仓库名称</td>
		<td class="textbar01" width="35%">			
		<input type="text" name="wname" value="${wname }" style="width:210px ">	  </td>    
</tr>   
   
</table>

<table border=0 cellspacing=0 cellpadding=0 width="100%" height=5>
<tr>
	<td></td>
</tr>
</table>

<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="2"  bgcolor="gray">
	<tr>
  	<td class="headerbar61" width="50%" colspan="1">仓库明细</td>
    <td class="headerbar63" width="50%" colspan="1"><p align="right">
    	<input type=submit value=" 新 增 " onClick="javascript:gotos()"></p></td>
  </tr>
</table>
  <table border=0 cellspacing=0 cellpadding=2 width="100%" height="5"> 
    <tr> 
      <td></td> 
    </tr> 
  </table> 
<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="0"  bgcolor="gray">
	<tr>
  	<td  width="100%" colspan="1">
  		<table  border="0" cellspacing="1" cellpadding="2" width="100%">
				<tr>
					<td  width="5%" class="headerbar82">序号</td>
					<td  width="10%" class="headerbar82">仓库编号</td>
					<td  width="20%" class="headerbar82">仓库名称</td>
					<td  width="10%" class="headerbar82">仓储量</td>
					<td  width="5%" class="headerbar82">操作</td>
				</tr>

		   <c:forEach items="${list }" var="w" varStatus="s">
				<tr>
					<td  width="5%" class="gridbar11"> ${s.count }</td>
					<td  width="10%" class="gridbar11"> <a href="<%=basePath%>warehouse/UpdateWarehouseServletUI.do?wid=${w.wid }" >${w.wid }</a></td>
					<td  width="20%" class="gridbar11"> ${w.wname }</td>
					<td  width="10%" class="gridbar11"> ${w.wnumber }</td>
					<td  width="5%" class="gridbar11">
				    <img src="<%=basePath%>image/del.gif" align="bottom" border="0" alt="删除" onclick="javascript:del('${w.wid}')"  style="cursor:hand"/></td>
				</tr>
			</c:forEach>
		</table>
			
		</td>
	</tr>
</table>

<table width="100%" border="0" cellpadding="1" cellspacing="2" >
        	<tr>
          	<td colspan="2" align="right" height="20"  nowrap class="textbar3" >
							&nbsp; 共4条 &nbsp; 第1/1页 &nbsp;      				<a  href="#" style="cursor:hand">首页</a>&nbsp; 
      				<a   style="cursor:hand" href="#">上一页</a>&nbsp;
      				<a  style="cursor:hand" href="#">下一页</a>&nbsp; 
      				<a   style="cursor:hand" href="#">尾页</a>&nbsp; 
							&nbsp;
						</td>
          </tr>
        </table>

			
</FORM>
</BODY>
</html>
