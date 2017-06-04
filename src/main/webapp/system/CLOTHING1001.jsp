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
<title>日志查询</title>
<link rel="stylesheet"
	href="<%=basePath%>css/cjpm.css">
<script type="text/javascript"
	src="<c:url value='<%=basePath%>jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<%=basePath%>js/page.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/cjcalendar.js"></script>
</head>
<script language="javascript">
	var CalendarWebControl = new atCalendarControl();
</script>
<SCRIPT LANGUAGE="javaScript">
    var location = (window.location+'').split('/');
    var basePath = location[0]+'//'+location[2]+'/'+location[3]+'/';

    function doQuery() {
		var cid = $("#cid").val();
		var cname = $("#cname").val();
		var ccolor = $("#ccolor").val();
		var csize = $("#csize").val();
		if (cid != "") {
			window.location.href = basePath+"cloth/QueryClothServlet.do?cid=" + cid;
		} else if (cname != "") {
			//alert(cname);
			var urlcname = encodeURI(encodeURI(cname));
			//alert(urlcname); 
			window.location = basePath+"cloth/QueryByCnameServlet.do?cname="
					+ urlcname;
			/* $.get("QueryByCnameServlet",{cname:cname});	
			var jsondate=${allCloth1};
			for(i=0;i<jsondate.length;i++){
			var arr=jsondate[i];
			${"#foreach"}.append("<td class="gridbar11" align="center">"+arr.cid+" </td>");
			${"#foreach"}.append("<td class="gridbar11" align="center">"+arr.cname+" </td>") */

		} else if(ccolor !=""){
			
			var urlccolor = encodeURI(encodeURI(ccolor));
			window.location =  basePath+"cloth/QueryByCcolorServlet.do?ccolor="
					+ urlccolor;
		} else if(csize !=""){
			var urlcsize = encodeURI(encodeURI(csize));
			window.location = basePath+"cloth/QueryBycSizeServlet.do?csize="
					+ urlcsize;
		}else {
		window.location = basePath+"cloth/QueryAllClothServlet.do";
					
		}
	}
	function goto1(strURL) {
		document.forms[0].action = strURL;
		document.forms[0].submit();
	}
	function del(id) {
		if (confirm("您确定删除该条记录？")) {
			var str = "/clothing/DeleteClothServlet?cid=" + id;

			window.location.href = str;

		}
	}

	function doAdd() {
		document.forms[0].action = "system/CLOTHING1002.jsp";
		document.forms[0].submit();
	}
</SCRIPT>

<BODY BACKGROUND="../image/bg.gif">
	<FORM NAME="idFrmMain" ID="idmig0101" METHOD="POST" ACTION=""
		ONSUBMIT="return false">

		<table border=0 cellspacing=0 cellpadding=2 width="100%"
			bgcolor="gray">
			<tr>
				<td class="headerbar61">货号查询</td>
				<td class="headerbar63" width="50%" colspan="1"><p
						align="right">
						<input type=submit value=" 查 询 " onClick="JavaScript:doQuery();">
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

				<td class="textbar81" width="15%">货号</td>
				<td class="textbar01" width="35%"><input type="text" id="cid"
					name="hh" value="" style="width:210px "></td>
				<td class="textbar81" width="15%">品名</td>
				<td class="textbar01" width="35%"><input type="text" id="cname"
					name="hh" value="" style="width:210px "></td>
			</tr>
			<tr>
				<td width="15%" class="textbar81">色号</td>
				<td class="textbar01" width="35%"><select name="" id="ccolor"
					style="width:210px ">
						<option value="" selected="selected">请选择</option>
						<option value="大红色">大红色</option>
						<option value="浅红色">浅红色</option>
						<option value="紫红色">紫红色</option>
						<option value="纯白色">纯白色</option>
						<option value="米白色">米白色</option>
						<option value="深蓝色">深蓝色</option>
						<option value="淡蓝色">淡蓝色</option>
						<option value="黑色">黑色</option>
						<option value="棕色">棕色</option>
				</select></td>

				<td width="15%" class="textbar81">尺码</td>
				<td class="textbar01" width="35%"><select name="" id="csize"
					style="width:210px ">
						<option value="" selected="selected">请选择</option>
						<option value="150">150</option>
						<option value="155">155</option>
						<option value="160">160</option>
						<option value="165">165</option>
						<option value="170">170</option>
						<option value="175">175</option>
						<option value="180">180</option>
						<option value="185">185</option>
						<option value="190">190</option>
				</select></td>
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
				<td class="headerbar61" width="50%" colspan="1">货号明细</td>
				<td class="headerbar63" width="50%" colspan="1"><p
						align="right">
						<input type=submit value=" 新 增 " onClick="JavaScript:doAdd();">
					</p></td>
			</tr>
		</table>
		<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="0" width="100%" id="table1" cellspacing="0"
			cellpadding="0" bgcolor="gray">
			<tr>
				<td width="100%" colspan="1">
					<table border="0" cellspacing="1" cellpadding="2" width="100%">
						<tr>
							<td width="5%" class="headerbar82">序号</td>
							<td width="5%" class="headerbar82">货号</td>
							<td width="10%" class="headerbar82">色号</td>
							<td width="10%" class="headerbar82">尺码</td>
							<td width="10%" class="headerbar82">品名</td>
							<td width="10%" class="headerbar82">库存</td>
							<td width="10%" class="headerbar82">出厂价</td>
							<td width="10%" class="headerbar82">零售价</td>
							<td class="headerbar82">操作</td>
						</tr>



						<c:forEach items="${allCloth}" var="item" varStatus="status">
							<tr id="foreach">
								<td class="gridbar11" align="center">${status.count}</td>
								<td class="gridbar11" align="center"><a
									href="/clothing/QueryClothServlet?cid=${item.cid}">${item.cid}</a></td>
								<td class="gridbar11" align="center">${item.ccolor}</td>
								<td class="gridbar11" align="center">${item.csize}</td>
								<td class="gridbar11" align="center">${item.cname}</td>
								<td class="gridbar11" align="center">${item.cnumber}</td>
								<td class="gridbar11" align="center">${item.cfacprice}</td>
								<td class="gridbar11" align="center">${item.cretprice}</td>
								<td class="gridbar11" align="center"><img
									src="${pageContext.request.contextPath }/image/del.gif"
									align="bottom" border="0" alt="删除"
									onClick="javascript:del('${item.cid}')" style="cursor:hand" /></td>
							</tr>
						</c:forEach>
					</table>

				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellpadding="1" cellspacing="2">
			<tr>
				<td colspan="2" align="right" height="20" nowrap class="textbar3">
					&nbsp; 共4条 &nbsp; 第1/1页 &nbsp; <a href="#" style="cursor:hand">首页</a>&nbsp;
					<a style="cursor:hand" href="#">上一页</a>&nbsp; <a
					style="cursor:hand" href="#">下一页</a>&nbsp; <a style="cursor:hand"
					href="#">尾页</a>&nbsp; &nbsp;
				</td>
			</tr>
		</table>

		</td>
		</tr>
		</table>
	</FORM>
</BODY>
</html>

