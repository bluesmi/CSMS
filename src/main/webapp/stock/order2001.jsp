<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>采购入库管理</title>
<link rel="stylesheet"
	href="<%=basePath%>css/cjpm.css">

<script type="text/javascript"
	src="<%=basePath%>js/cjcalendar.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery/jquery-1.5.1.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery/laydate/laydate.js"></script>

<script type="text/javascript"
	src="<%=basePath%>js/page.js"></script>
</head>
<script language="javascript">

</script>


<script language="javascript">
	function goto1(url) {
        var location = (window.location + '').split('/');
        var basePath = location[0] + '//' + location[2] + '/' + location[3] + '/';
		window.location = basePath+url;
	}

	function goSearch() {
        var location = (window.location + '').split('/');
        var basePath = location[0] + '//' + location[2] + '/' + location[3] + '/';
		var wid = $("#wid").val();
		var sid = $("#sid").val();
		var btime = $("#frmWRPT_OPT_DATE2_PJT70302").val();
		var otime = $("#frmWRPT_OPT_DATE3_PJT70302").val();
		if (sid != "") {
			window.location.href = basePath+"stockIn/QuerybySid.do?sid=" + sid;
		} else if (wid != "") {
			window.location = basePath+"stockIn/QueryByWid.do?wid=" + wid;

		} else if (btime != "" && otime != "") {
			var str = basePath+"stockIn/QueryByTime.do?btime=" + btime + "&otime="
					+ otime;
			
			window.location = str;

		} else {
			window.location = basePath+"stockIn/QueryAllStockinOrderServlet.do";

		}
	}
	function del(id) {
        var location = (window.location + '').split('/');
        var basePath = location[0] + '//' + location[2] + '/' + location[3] + '/';
		if (confirm("您确定删除该条入库订单吗？")) {

			var str = basePath+"stockIn/DeleteStockinorderServlet.do?sid=" + id;

			window.location.href = str;
		}
	}
	function delCom(id) {
		if (id == '1') {
			document.idFrmMain.gys.value = "";
		} else {
			document.idFrmMain.sccj.value = "";
		}
	}

	function changesize(id) {
		document.forms[0].action = "order2001.jsp";
		document.forms[0].submit();
	}

	function jump(id) {
		document.forms[0].action = "order2001.jsp";
		document.forms[0].submit();
	}

	function locatePage(id) {
		document.forms[0].action = "order2001.jsp";
		document.forms[0].submit();
	}
</script>

<BODY BACKGROUND="<%=basePath%>image/bg.gif">
	<FORM NAME="idFrmMain" ID="idmig0101" METHOD="POST" ACTION=""
		ONSUBMIT="return false">

		<table border=0 cellspacing=0 cellpadding=2 width="100%"
			bgcolor="gray">
			<tr>
				<td class="headerbar61">入库单查询</td>
				<td class="headerbar61"><p align="right">
						<input type=submit value=" 查 询 " onClick="JavaScript:goSearch();">
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
				<td class="textbar81" width="15%">所入仓库</td>
				<td class="textbar01" width="35%"><select name="storeRoom"
					id="wid" style="width:152px">
						<option value="">------</option>
						<option value="1">一号仓库</option>
						<option value="2">二号仓库</option>
						<option value="3">三号仓库</option>
						<option value="4">四号仓库</option>
				</select></td>
				<td class="textbar81" width="15%">单据编号</td>
				<td class="textbar01" width="35%"><input type="text" id="sid"
					name="number" style="width:152px"></td>

			</tr>

			<tr>
				<td class="textbar81" width="15%">入库日期</td>
				<td class="textbar01" width="35%" colspan="3"><input
					type="text" name="frmWRPT_OPT_DATE2_PJT70302"
					id="frmWRPT_OPT_DATE2_PJT70302" value="2016-06-01"
					readonly="readonly" size="12"> <img
					src="<%=basePath%>jquery/calendar.gif"
					width="18" height="17"
					onClick="laydate({elem: '#frmWRPT_OPT_DATE2_PJT70302'});"
					title="显示日历" /> ~ <input type="text"
					name="frmWRPT_OPT_DATE3_PJT70302" id="frmWRPT_OPT_DATE3_PJT70302"
					value="2016-06-04" readonly="readonly" size="12"> <img
					src="<%=basePath%>jquery/calendar.gif"
					width="18" height="17"
					onClick="laydate({elem: '#frmWRPT_OPT_DATE3_PJT70302'});"
					title="显示日历" /></td>

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
				<td class="headerbar61" width="100%" colspan="1">入库单明细</td>
				<td class="headerbar61">
					<p align="rigth">
						<input type=submit value=" 新 增 "
							onClick="JavaScript:goto1('stock/order2002.jsp')">
					</p>
				</td>
		</table>

		<table border="0" width="100%" id="table1" cellspacing="0"
			cellpadding="0" bgcolor="gray">
			<tr>
				<td width="100%" colspan="1">
					<table border="0" cellspacing="1" cellpadding="2" width="100%">
						<tr>
							<td width="10%" class="headerbar82">序号</td>
							<td width="20%" class="headerbar82">单据编号</td>
							<td width="25%" class="headerbar82">所入仓库</td>
							<td width="20%" class="headerbar82">入库日期</td>
							<td width="20%" class="headerbar82">经办人</td>

							<td class="headerbar82">操作</td>
						</tr>


						<c:forEach items="${allStockin}" var="item" varStatus="status">
							<tr>
								<td class="gridbar01" align="center">${status.count}</td>
								<td class="gridbar01" align="center"><a
									href="<%=basePath%>stockIn/QueryAllStockinOrderItemsServlet.do?sid=${item.sid}">${item.sid}</a></td>
								<td class="gridbar01" align="center">${item.wid}</td>
								<td class="gridbar01" align="center">${item.stime}</td>
								<td class="gridbar01" align="left">${item.loginName}</td>
								<td class="gridbar01" align="center"><img
									src="<%=basePath%>image/del.gif"
									align="bottom" border="0" alt="删除"
									onClick="JavaScript:del('${item.sid}')" /></td>
							</tr>
						</c:forEach>
						<c:forEach items="${stockin}" var="stockin" varStatus="status">
							<tr>
								<td class="gridbar01" align="center">${status.count }</td>
								<td class="gridbar01" align="center"><a
									href="<%=basePath%>stockIn/QueryAllStockinOrderItemsServlet.do?sid=${stockin.sid}">${stockin.sid}</a></td>
								<td class="gridbar01" align="center">${stockin.wid}</td>
								<td class="gridbar01" align="center">${stockin.stime}</td>
								<td class="gridbar01" align="left">${stockin.loginName}</td>
								<td class="gridbar01" align="center"><img
									src="<%=basePath%>image/del.gif"
									align="bottom" border="0" alt="删除"
									onClick="JavaScript:del('${stockin.sid}')" /></td>
							</tr>
						</c:forEach>

					</table>
				</td>
			</tr>
		</table>

		<table width="100%" border="0" cellpadding="0" cellspacing="2">
			<tr>
				<td colspan="2" align="right" height="20" nowrap class="textbar3">
					&nbsp; 共4条 &nbsp;&nbsp; 第1/1页 &nbsp;&nbsp; <a href="#"
					style="cursor:hand">首页</a>&nbsp;&nbsp; <a style="cursor:hand"
					href="#">上一页</a>&nbsp;&nbsp; <a style="cursor:hand" href="#">下一页</a>&nbsp;&nbsp;
					<a style="cursor:hand" href="#">尾页</a>&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</FORM>
</BODY>
</html>

