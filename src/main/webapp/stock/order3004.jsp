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
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=GB2312">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>采购入库单详细</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/cjpm.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/page.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cjcalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/addFunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/laydate/laydate.js"></script>
	<script type="text/javascript"src="${pageContext.request.contextPath }/jquery/jquery-1.5.1.js"></script>
</head>
<SCRIPT LANGUAGE="javaScript">
<!--
var trFlag = 0;
function tabMove0(objId, position){
  if (event.keyCode == 13) {
          document.getElementById(objId).childNodes[2].innerHTML='07长面包新款';
          document.getElementById(objId).childNodes[3].innerHTML='045';
          tabMove(objId, position);
  }	
}
function gotos(strURL)
{
	document.forms[0].action=strURL;
	var thisForm = document.forms['mig0101']; //获取name为form1的form表单 
	alert(thisForm.soid.value); //输出表单name属性值为form1的soid的值 
	document.forms[0].submit();
}
function gotoadditem(soid){
    var location = (window.location + '').split('/');
    var basePath = location[0] + '//' + location[2] + '/' + location[3] + '/';
	window.location.href = basePath+"stockoutitems/AddStockoutitemServletUI.do?soid=${stockout.soid}" ;
	 			
 		}

function del(id)
{
	if(confirm("您确定删除该条明细？")){
		alert("删除成功！");
	}
}

function save(){
	alert('保存成功');
}
function setValue(){
	document.forms[0].gys.value = "610";	
}
function delCom(id){
	if(id == "1"){
		document.forms[0].gys.value = "";	
	}else{
		document.forms[0].sccj.value = "";	
	}
}
function setValue1(){
	document.forms[0].sccj.value="";
}


 function dodelete(soiid){
	 		var b = window.confirm("您确认删除吗?");
	 		if(b){
	 			window.location.href = "${pageContext.request.contextPath }/stockoutitems/DeleteStockoutitemServlet.do?soiid=" + soiid;
	 			}
	 			
 		} 
function update(){
	$("#idmig0101").submit();
	alert("出库单保存成功！");
}
-->
</SCRIPT>

<BODY BACKGROUND="${pageContext.request.contextPath }/image/bg.gif">
<FORM NAME="mig0101" ID="idmig0101" METHOD="POST"  ACTION="<%=basePath%>stockout/UpdateStockoutServlet.do" >

<table border=0 cellspacing=0 cellpadding=2 width="100%" bgcolor="gray">
<tr>
	<td class="headerbar61">入库单详细</td>
	<td class="headerbar61"><p align="right">
		<input type="button" value="确认">
		<input type="button" value=" 保 存 " onClick="JavaScript:update();">
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
      <input type="text" value="${stockout.soid }" name="soid" readonly size="20">
    </td>
    <td class="textbar81" width="15%">出库日期</td>
		<td class="textbar01" width="35%">
			<input type="text" name="sotime" id="frmWRPT_OPT_DATE2_PJT70302" value="${stockout.sotime }" readonly="readonly" size="12">
			<img src="${pageContext.request.contextPath }/jquery/calendar.gif" width="18" height="17" onClick="laydate({elem: '#frmWRPT_OPT_DATE2_PJT70302'});" title="显示日历" />		
    </td>
</tr>
<tr>
    <td class="textbar81" width="15%">所出仓库</td>
		<td class="textbar01"  width="35%">
      <select name="wid" style="width:152px">
				<option value="">------</option>
				<option <c:if test="${stockout.wid=='1' }">selected</c:if> value="1">一号仓库</option>
				<option <c:if test="${stockout.wid=='2' }">selected</c:if> value="2">二号仓库</option>
				<option <c:if test="${stockout.wid=='3' }">selected</c:if> value="3">三号仓库</option>
				<option <c:if test="${stockout.wid=='4' }">selected</c:if> value="4">四号仓库</option>		
			</select>
    </td> 
    
    <td class="textbar81" width="15%">接收人</td>
	  <td class="textbar01" width="35%"><input type="text" name="loginName" style="width:200px" value="${stockout.loginName }"></td>
</tr>
<tr>
    <td class="textbar81" width="15%">接收人电话</td>
				<td class="textbar01" width="35%">
      <input type="text" value="${stockout.sphone }" style="width:200px" name="sphone">    </td>    
       
    <td class="textbar81" width="15%">发送地址</td>
		<td class="textbar01"  width="35%">
      <input type="text" name="adress" value="${stockout.adress }" size="20">
    </td>      
</tr>
<tr>
    <td class="textbar81" width="15%">备注</td>
		<td class="textbar01"  width="85%" colspan="3">
      <textarea name="soremark" cols="80" rows="4">${stockout.soremark }</textarea>
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
                    <td class="headerbar61" colspan="1">入库单明细</td>
                    <td class="headerbar63" colspan="1">
                    	<p align="right">

										<input type=button value=" 新增明细 " onClick="javascript:gotoadditem('${stockout.soid }')"></p>
                    </td>
                </tr>
</table>

<table id="tab0" border="0" cellspacing="1" cellpadding="2" width="100%" bgcolor="gray">
<tr>
	<td  width="5%" class="headerbar82">序号</td>
	<td  width="20%" class="headerbar82">货号</td>
	<td  width="20%" class="headerbar82">品名</td>
	<td  width="15%" class="headerbar82">色号</td>
	<td  width="15%" class="headerbar82">尺码</td>
	<td  width="15%" class="headerbar82">数量</td>		
	<td  class="headerbar82">操作</td>
</tr>

<c:forEach items="${allStockoutitem}" var="stockitem" varStatus="s">
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

