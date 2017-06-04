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
<title>入库单详细</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/cjpm.css">
<script type="text/javascript"
	src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/page.js"></script>
</head>

<SCRIPT LANGUAGE="javaScript">
	function save() {
		$("#idmig0102").attr({
			"action" : "/clothing/AddStockinOrderItemServlet"
		});
		document.getElementById("idmig0102").submit();
		alert("新增成功！");
	}

	$(document).ready(
			function() {
				var i = 1;

				$.get("/clothing/AjaxQueryAllclothServlet", function(dom) {
					var jsondate = eval(dom) ;
					var length;
					$.get("/clothing/AjaxQueryAllclothSize", function(date) {
						length = date;
						for (var i = 0; i < length; i++) {	
						var arr=jsondate[i];
							$("#cid").append(
									"<option value="+arr.cid+" >" + arr.cid+ "</option>");
						}
					});

				});
				
			});
function update1() {
			
			$.get("/clothing/AjaxQueryAllclothServlet", function(dom) {
			var i=$("#cid ").get(0).selectedIndex;//获取索引值
			var jsondate = eval(dom);	
			$("#ccolor").attr("value",jsondate[i].ccolor);
			$("#csize").attr("value",jsondate[i].csize);;
			});
	}
	function back() {
		history.back();
	}
</SCRIPT>
<BODY BACKGROUND="../image/bg.gif">
	<FORM NAME="idFrmMain" ID="idmig0102" METHOD="POST" ACTION=""
		ONSUBMIT="return false">
		<table border="0" width="100%" id="table1" cellspacing="0"
			cellpadding="2" bgcolor="gray">
			<tr>
				<td class="headerbar61" width="15%" colspan="1">入库单详细</td>
				<td class="headerbar63" width="85%" colspan="1"><input
					type="button" name="save70302002" onClick="javascript:save()"
					value=" 保 存 ">&nbsp; <input type="button"
					name="back70302003" onClick="javascript:back()" value=" 返 回 ">
				</td>
			</tr>
		</table>

		<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
			<tr>
				<td></td>
			</tr>
		</table>

		<table border="0" width="100%" id="table1" cellspacing="1"
			cellpadding="2" bgcolor="gray">
			<input name="sid" type="hidden"
				value="<%out.print(request.getParameter("sid"));%>"
				style="width:210px;">
			<tr>
				<td class="textbar81" width="15%" colspan="1">货号</td>
				<td class="textbar01" width="85%" colspan="1"><select
					name="cid" style="width:210px " id="cid"  onchange="update1()">
						<!-- <option value="1" selected="selected">请点击更新商品货号</option>
						<option value="2" onclick="update1()">更新</option> -->
						<%--  <c:forEach items="${allCloth}" var="item" varStatus="status">
               
                      <option value="${item.cid}">${item.cid}</option>  
                      --%>

						<!-- <option value="1">大红色</option> 
                <option value="2">浅红色</option> 
                <option value="3">紫红色</option> 
				<option value="4">纯白色</option> 
                <option value="5">米白色</option> 
				<option value="6">深蓝色</option> 
                <option value="7">淡蓝色</option> 
				<option value="8">黑色</option> 
                <option value="9">棕色</option> -->
						<%--  </c:forEach> --%>
				</select> <!-- <input name="cid" value=""  style="width:210px;"> --></td>
			</tr>
			<tr>
				<td class="textbar81" width="15%" colspan="1">色号</td>
				<td class="textbar01" width="85%" colspan="1"><input
					name="ccolor" id="ccolor" onfocus=this.blur()  value="" style="width:210px;"></td>
			</tr>
			<tr>
				<td class="textbar81" width="15%" colspan="1">尺码</td>
				<td class="textbar01" width="85%" colspan="1"><input
					name="csize" id="csize" onfocus=this.blur()  value="" style="width:210px;"></td>
			</tr>
			<tr>
				<td class="textbar81" width="15%" colspan="1">数量</td>
				<td class="textbar01" width="85%" colspan="1"><input
					name="sinumber" value="" style="width:210px;"></td>
			</tr>

		</table>

		<table border=0 cellspacing=0 cellpadding=0 width="100%" height=5>
			<tr>
				<td></td>
			</tr>
		</table>
	</FORM>
</BODY>


</html>




