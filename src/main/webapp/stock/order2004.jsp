<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<head>
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>采购入库单详细</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/cjpm.css">
<script type="text/javascript"
	src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jquery/laydate/laydate.js'/>"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/page.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/cjcalendar.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/addFunction.js"></script>
</head>
<script language="javascript">
	var CalendarWebControl = new atCalendarControl();
</script>
<SCRIPT LANGUAGE="javaScript">
<!--
	var trFlag = 0;
	function tabMove0(objId, position) {
		if (event.keyCode == 13) {
			document.getElementById(objId).childNodes[2].innerHTML = '07长面包新款';
			document.getElementById(objId).childNodes[3].innerHTML = '045';
			tabMove(objId, position);
		}
	}
	function goto1() {
		window.location = "stock/order2003.jsp?sid=${stockin.sid}";
	}

	function del(siid) {
		if (confirm("您确定删除该条明细？")) {
			var str = "/clothing/DeleteStockinOrderItemServlet?siid=" + siid;
			window.location.href = str;
		}
	}

	function save() {

		$("#idmig0101").attr({
			"action" : "/clothing/UpdateStockinOrderServlet"
		})
		document.getElementById("idmig0101").submit();
		alert('保存成功');
	}
	function setValue() {
		document.forms[0].gys.value = "610";
	}
	function delCom(id) {
		if (id == "1") {
			document.forms[0].gys.value = "";
		} else {
			document.forms[0].sccj.value = "";
		}
	}
	function setValue1() {
		document.forms[0].sccj.value = "";
	}
	-->
</SCRIPT>

<BODY BACKGROUND="${pageContext.request.contextPath }/image/bg.gif">
	<FORM NAME="mig0101" ID="idmig0101" METHOD="POST" ACTION=""
		ONSUBMIT="return false">

		<table border=0 cellspacing=0 cellpadding=2 width="100%"
			bgcolor="gray">
			<tr>
				<td class="headerbar61">入库单详细</td>
				<td class="headerbar61"><p align="right">
						<input type=button value=" 保 存 " onClick="JavaScript:save();">
						<input type=button value=" 返 回 "
							onClick="JavaScript:history.back();">
					</p></td>
			</tr>
		</table>
		<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border=0 cellspacing=1 cellpadding=2 width="100%"
			bgcolor="gray">
			<tr>
				<td class="textbar81" width="15%">单据号</td>
				<td class="textbar01" width="35%"><input type="text" name="sid"
					value="${stockin.sid}" onfocus=this.blur() readonly size="20">
				</td>
				<td class="textbar81" width="15%">入库日期</td>
				<td class="textbar01" width="35%"><input type="text"
					name="stime" id="frmWRPT_OPT_DATE2_PJT70302"
					value="${stockin.stime}" readonly="readonly" size="12"> <img
					src="${pageContext.request.contextPath }/jquery/calendar.gif"
					width="18" height="17"
					onClick="laydate({elem: '#frmWRPT_OPT_DATE2_PJT70302'});"
					title="显示日历" /></td>
			</tr>
			<tr>
				<td class="textbar81" width="15%">所入仓库</td>
				<td class="textbar01" width="35%"><select name="wid"
					style="width:152px">
						<option value="" <c:if test="">selected</c:if>>------</option>
						<option <c:if test="${stockin.wid=='1' }">selected</c:if>
							value="1">一号仓库</option>
						<option <c:if test="${stockin.wid=='2' }">selected</c:if>
							value="2">二号仓库</option>
						<option <c:if test="${stockin.wid=='3' }">selected</c:if>
							value="3">三号仓库</option>
						<option <c:if test="${stockin.wid=='4' }">selected</c:if>
							value="4">四号仓库</option>
				</select></td>
				<td class="textbar81" width="15%">经办人</td>
				<td class="textbar01" width="35%"><input type="text"
					name="loginName" value="${stockin.loginName}" size="20"></td>
			</tr>
			<tr>
				<td class="textbar81" width="15%">备注</td>
				<td class="textbar01" width="85%" colspan="3"><textarea
						name="sremark" cols="80" rows="4">${stockin.sremark}</textarea></td>
			</tr>


		</table>

		<table border=0 cellspacing=0 cellpadding=0 width="100%" height=5>
			<tr>
				<td></td>
			</tr>
		</table>

		<table border="0" width="100%" id="table1" cellspacing="0"
			cellpadding="2" bgcolor="gray">
			<tr>
				<td class="headerbar61" colspan="1">入库单明细</td>
				<td class="headerbar63" colspan="1">
					<p align="right">

						<input type=button value=" 新增明细 " onClick="goto1();">
					</p>
				</td>
			</tr>
		</table>

		<table id="tab0" border="0" cellspacing="1" cellpadding="2"
			width="100%" bgcolor="gray">
			<tr>
				<td width="5%" class="headerbar82">序号</td>
				<td width="20%" class="headerbar82">货号</td>
				<td width="20%" class="headerbar82">品名</td>
				<td width="15%" class="headerbar82">色号</td>
				<td width="15%" class="headerbar82">尺码</td>
				<td width="15%" class="headerbar82">数量</td>
				<td class="headerbar82">操作</td>
			</tr>
			
	<c:forEach items="${list}" var="item" varStatus="status">
				<tr>
					<td class="gridbar01" align="center">${status.count}</td>
					<td class="gridbar01" align="center">${item.cloth.cid}</td>
					<td class="gridbar01">${item.cloth.cname}</td>
					<td class="gridbar01">${item.cloth.ccolor}</td>
					<td class="gridbar01">${item.cloth.csize}</td>
					<td class="gridbar01" align="center">${item.sinumber}</td>
					<td class="gridbar01" align="center"><a href="#"><img
							src="${pageContext.request.contextPath }/image/del.gif"
							align="bottom" border="0" alt="删除"
							onClick="javascript:del(${item.siid})" /></a></td>
				</tr>
			</c:forEach>

		
		</table>


	</FORM>
</BODY>
</html>

