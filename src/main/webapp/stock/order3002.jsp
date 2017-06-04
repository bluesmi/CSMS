<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<head>
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=GB2312">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>出库单</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/cjpm.css"> 
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cjcalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/addFunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/laydate/laydate.js"></script>
</head>
<script language="javascript">
	
</script>
<SCRIPT LANGUAGE="javaScript">
 
function gotos(strURL)
{
	document.forms[0].action=strURL;
	document.forms[0].submit();
}

function del(id)
{
	if(confirm("您确定删除该条明细？")){
		alert("删除成功！");
	}
}

function goSearch(){
	document.forms[0].action="${pageContext.request.contextPath }/stock/liststockout.jsp";
	document.forms[0].submit();
}
 function save()
{
	alert("保存成功！");
}
function back()
{
	history.back();
}

function addstockout(){
	idmig0101.action="${pageContext.request.contextPath }/AddStockoutServlet";
	idmig0101.submit();
	alert("出库订单创建成功");
	}
function updatestockout(){
	idmig0101.action="${pageContext.request.contextPath }/UpdateStockoutServlet2";
	idmig0101.submit();
	alert("出库订单保存成功");
	}
	function gotoadditem(){		
 		idmig0101.action="${pageContext.request.contextPath }/AddStockoutitemServletUI2";
		idmig0101.submit();
 		}
-->
</SCRIPT>

<BODY BACKGROUND="${pageContext.request.contextPath }/image/bg.gif">
<FORM NAME="mig0101" ID="idmig0101" METHOD="POST"  ACTION="">

<table border=0 cellspacing=0 cellpadding=2 width="100%" bgcolor="gray">
<tr>
	<td class="headerbar61">出库单详细</td>

	<td class="headerbar61"><p align="right">
		<input type="button" value=" 创 建  " onClick="JavaScript:addstockout();">
		<input type="button" value=" 保 存 " onClick="JavaScript:updatestockout();">
		<input type=button value=" 返 回 " onClick="JavaScript:history.back();">
    </p></td>	
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
<tr>
	<td></td>
</tr>
</table>
<table border=0 cellspacing=1 cellpadding=2 width="100%" bgcolor="gray">
<tr>
  <td class="textbar81" width="15%">单据号</td>
		<td class="textbar01" width="35%">
      <input type="text" value="${stockout.soid }" readonly style="width:200px" name="soid">    </td>
    <td class="textbar81" width="15%">单据日期</td>
		<td class="textbar01" width="35%">
			<input type="text" name="sotime" id="frmWRPT_OPT_DATE2_PJT70302" value="${stockout.sotime }" readonly="readonly" size="12">
			<img src="${pageContext.request.contextPath }/jquery/calendar.gif" width="18" height="17" onClick="laydate({elem: '#frmWRPT_OPT_DATE2_PJT70302'});" title="显示日历" />    </td>
</tr>
<tr>
    <td class="textbar81" width="15%">所出仓库</td>
	<td class="textbar01" width="35%">
			<select name="wid" style="width:200px">
				<option value="" selected>------</option>
				<option value="">------</option>
				<option <c:if test="${stockout.wid=='1' }">selected</c:if> value="1">一号仓库</option>
				<option <c:if test="${stockout.wid=='2' }">selected</c:if> value="2">二号仓库</option>
				<option <c:if test="${stockout.wid=='3' }">selected</c:if> value="3">三号仓库</option>
				<option <c:if test="${stockout.wid=='4' }">selected</c:if> value="4">四号仓库</option>			
			</select>    </td>
    <td class="textbar81" width="15%">接收人</td>
	  <td class="textbar01" width="35%"><input type="text" name="loginName" style="width:200px" value="${stockout.loginName }"></td>
</tr>
<tr>
    <td class="textbar81" width="15%">接收人电话</td>
				<td class="textbar01" width="35%">
      <input type="text" value="${stockout.sphone }" style="width:200px" name="sphone">    </td>    

    <td class="textbar81" width="15%">发往地址</td>
		<td class="textbar01"  width="35%">
      <input type="text" name="adress" value="${stockout.adress }" style="width:200px">    </td>     

</tr>
<tr>  
		<td class="textbar81" width="15%">备注</td>
    <td class="textbar01" colspan="3" width="85%">
    	<textarea cols="80" rows="4" name="soremark">${stockout.soremark }</textarea>    </td>
</tr>
</table>

<table border=0 cellspacing=0 cellpadding=0 width="100%" height=5>
<tr>
	<td></td>
</tr>
</table>

<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="2"  bgcolor="gray">
                <tr>
                    <td class="headerbar61"  colspan="1">出库单明细</td>
                    <td class="headerbar63"  colspan="1">
                    	<p align="right">
                    		                    		
										<input type="button" value=" 新增明细 " onClick="javascript:gotoadditem()"></p>
                    </td>                    							   
                </tr>
</table>
<input type="hidden" id="cnumber" name="cnumber" value="10">
<table id="tab0" border="0" cellspacing="1" cellpadding="2" width="100%" bgcolor="gray">
<tr>
<td  width="5%" class="headerbar82">序号</td>
	<td  width="20%" class="headerbar82">货号</td>
	<td  width="20%" class="headerbar82">品名</td>
	<td  width="15%" class="headerbar82">色号</td>
	<td  width="15%" class="headerbar82">尺码</td>
	<td  width="15%" class="headerbar82">数量</td>		
	<td  class="headerbar82">操作</td>
	
	
	<c:forEach items="${itemlist }" var="stockitem" varStatus="s">
<tr>
	<td   class="gridbar11" align="center">${s.count }</td>
	<td   class="gridbar11" align="center">${stockitem.cid }</td>
	<td   class="gridbar11">${stockitem.cloth.cname }</td>
	<td   class="gridbar11">${stockitem.cloth.ccolor }</td>
	<td  class="gridbar11">${stockitem.cloth.csize }</td>
	<td   class="gridbar11" align="center">${stockitem.sonumber }</td>
	<td  class="gridbar11" align="center">
						<a href = "#"><img src="${pageContext.request.contextPath }/image/del.gif" align="bottom" border="0" alt="删除" onClick="javascript:dodelete('${stockitem.soiid }')" /></a></td>	
</tr>
</c:forEach>
</table>

	  

</FORM>
</BODY>
</html>

