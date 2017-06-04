<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<head>
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=UTF-8">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>出库单查询</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/cjpm.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cjcalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/page.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/laydate/laydate.js"></script>
</head>
<script language="javascript">
	var CalendarWebControl = new atCalendarControl();
</script>
<SCRIPT LANGUAGE="javaScript">
<!--
function addstockout(){
	idFrmMain.action="${pageContext.request.contextPath }/stock/order3002.jsp";
	idFrmMain.submit();
	}

function delCom(id){
	if(id == '1'){
		document.idFrmMain.gys.value = "";		
	}else{
		document.idFrmMain.sccj.value = "";
	}
}

function changesize(id){
	document.forms[0].action="order3001.htm";
	document.forms[0].submit();
}

function jump(id){
	document.forms[0].action="order3001.htm";
	document.forms[0].submit();	
}

function locatePage(id){
	document.forms[0].action="order3001.htm";
	document.forms[0].submit();		
}

function setValue()
{
	document.all.sccj.value="青岛雪中飞贸易有限公司";
}

function dodelete(soid){
	 	var b = window.confirm("您确认删除吗?");
	 	if(b){
	 			window.location.href = "${pageContext.request.contextPath }/DeleteStockoutServlet?soid=" + soid;  
	 			alert("出库单删除成功！");
	 		}
 		} 
 		
function goSearch()
{
	document.forms[0].action="${pageContext.request.contextPath }/QueryStockoutServlet";
	document.forms[0].submit();
}
-->
</SCRIPT>

<BODY BACKGROUND="${pageContext.request.contextPath }/image/bg.gif">
<FORM NAME="idFrmMain" ID="idmig0101" METHOD="POST"  ACTION="" ONSUBMIT="return false">
<input type="hidden" id="slide_img">
<table border=0 cellspacing=0 cellpadding=2 width="100%" bgcolor="gray">
<tr>
	<td class="headerbar61">出库单查询</td>
	<td class="headerbar61"><p align="right">		
		<input type="button" value=" 查 询 " onClick="JavaScript:goSearch();"></p></td>
</tr>
</table>


<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
<tr>
	<td></td>
</tr>
</table>

<table border=0 cellspacing=1 cellpadding=2 width="100%" bgcolor="gray">	
	<tr>
		<td class= "textbar81" width="15%">所出仓库</td>
		<td class="textbar01" width="35%">
			<select name="wid" style="width:152px">
				<option value="1">一号仓库</option>
				<option value="2">二号仓库</option>
				<option value="3">三号仓库</option>
				<option value="4">四号仓库</option>		
			</select>
		</td>
	  <td class="textbar81" width="15%">单据编号</td>
		<td class="textbar01" width="35%">
			<input type="text" name="soid" style="width:152px" value="${soid }">
		</td>				

	</tr>
	
	<tr>			  
		<td class="textbar81" width="15%">出库日期</td>
		<td class="textbar01" width="35%" colspan="3">
			<input type="text" name="frmWRPT_OPT_DATE2_PJT70302" id="frmWRPT_OPT_DATE2_PJT70302" value="2016-06-01" readonly="readonly" size="12">
			<input type="image" src="${pageContext.request.contextPath }/jquery/calendar.gif" width="18" height="17" onClick="laydate({elem: '#frmWRPT_OPT_DATE2_PJT70302'});" title="显示日历" />
			~ 
			<input type="text" name="frmWRPT_OPT_DATE3_PJT70302" id="frmWRPT_OPT_DATE3_PJT70302" value="2016-06-10" readonly="readonly" size="12">
			<input type="image" src="${pageContext.request.contextPath }/jquery/calendar.gif" width="18" height="17" onClick="laydate({elem: '#frmWRPT_OPT_DATE3_PJT70302'});" title="显示日历" />
	  </td>
		
	</tr>	
	
</table>

<table border=0 cellspacing=0 cellpadding=0 width="100%" height=5>
<tr>
	<td></td>
</tr>
</table>

<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="2"  bgcolor="gray">
	<tr>
  	<td class="headerbar61" width="100%" colspan="1">出库单明细</td>
		<td class="headerbar61"><p align="right">		
			<input type=button value=" 新 增 " onClick="javascript:addstockout()">  	
		</td>
</table>


<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="0"  bgcolor="gray">
	<tr>
  	<td  width="100%" colspan="1">
    	<table  border="0" cellspacing="1" cellpadding="2" width="100%">
				<tr>
					<td  width="5%"  class="headerbar82">序号</td>
					<td   width="15%"  class="headerbar82">单据编号</td>
					<td   width="20%" class="headerbar82">所出仓库</td>
					<td    width="15%" class="headerbar82">出库日期</td>					
					<td    width="15%" class="headerbar82">接收人</td>
					<td    width="25%" class="headerbar82">发往地址</td>
					<td  class="headerbar82">操作</td>			
				</tr>
				
				<c:forEach  items="${allStockout }" var="stock" varStatus="s">
				<tr>
					<td  class="gridbar11" align="center">${s.count }</td>
					<td  class="gridbar11" align="center"><a href="${pageContext.request.contextPath }/UpdateStockoutServletUI?soid=${stock.soid }">${stock.soid }</a></td>
					<td  class="gridbar11" align="center">${stock.wid }</td>
					<td  class="gridbar11" align="center">${stock.sotime }</td>
					<td  class="gridbar11" align="left">${stock.loginName }</td>
					<td  class="gridbar11" align="left">${stock.adress }</td>
					<td  class="gridbar11" align="center">
						<a href = "#"><img src="${pageContext.request.contextPath }/image/del.gif" align="bottom" border="0" alt="作废" onClick="javascript:dodelete('${stock.soid }')" /></a>					</td>
				</tr>
				</c:forEach>
			</table>
	  </td>
	</tr>
</table>
 

<table width="100%" border="0" cellpadding="0" cellspacing="2">
	<tr>
  	<td colspan="2" align="right" height="20"  nowrap class="textbar3" > 
	&nbsp;&nbsp; 共4条 &nbsp;&nbsp; 第1/1页 &nbsp;&nbsp;
 		<a  href="#" style="cursor:hand">首页</a>&nbsp;&nbsp; 
 		<a  style="cursor:hand" href="#">上一页</a>&nbsp;&nbsp; 
 		<a  style="cursor:hand" href="#">下一页</a>&nbsp;&nbsp; 
 		<a  style="cursor:hand" href="#">尾页</a>&nbsp;&nbsp; 
 		&nbsp;&nbsp;
	  </td>
  </tr>
</table>
</FORM>

</BODY>
</html>

