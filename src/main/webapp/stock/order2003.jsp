<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String sid = request.getParameter("sid");
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

	jQuery(document).ready(function () {
        var location = (window.location + '').split('/');
        var basePath = location[0] + '//' + location[2] + '/' + location[3] + '/';
        var url = basePath+"cloth/AjaxQueryAllclothServlet.do";
        $.ajax(url,{
            type:"get",
            dataType:"json",
            success:function (data) {
				console.log(data);
				var $cid = $("#cid");
				$cid.html("");
				var str = '<option value="" selected="selected">请选择</option>';
				var strColor = '<option value="" selected="selected">请选择</option>'
				for(var i = 0; i< data.length;i++){
				    str += '<option value="'+data[i].cid+'">'+data[i].cid+'</option>';
				}
				$cid.append(str);
            }
		});
        $("#cid").change(function () {
			var url = basePath+"cloth/AjaxQueryclothServlet.do";
            $.ajax(url,{
                type:"get",
                dataType:"json",
				data:{
                    "cid":$("#cid").val()
				},
                success:function (data) {
                    console.log(data);
                    var $ccolor = $("#ccolor");
                    var $csize = $("#csize");
                    $csize.html("");
                    $ccolor.html("");

                    var str = '<option value="" selected="selected">请选择</option>'
                    var strColor =str+ '<option value="'+data.ccolor+'">'+data.ccolor+'</option>';
					var strSize = str +'<option value="'+data.csize+'">'+data.csize+'</option>'
                    $ccolor.append(strColor);
                    $csize.append(strSize);
                }
            });
        });
    });
	function save() {
		$("#idmig0102").submit();
	}



	function back() {
		history.back();
	}
</SCRIPT>
<BODY BACKGROUND="../image/bg.gif">
<FORM NAME="idFrmMain" ID="idmig0102" METHOD="post"  ACTION="<%=basePath%>stockIn/AddStockinOrderItemServlet.do" >
	<input type="text" name="sid" style="display: none;visibility: hidden" value="<%=sid%>">
	<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="2"  bgcolor="gray">
		<tr>
			<td class="headerbar61" width="15%" colspan="1">入库单详细</td>
			<td class="headerbar63" width="85%" colspan="1">
				<input type="button" name="save70302002" onClick="javascript:save()" value=" 保 存 ">&nbsp;
				<input type="button" name="back70302003" onClick="javascript:back()" value=" 返 回 ">
			</td>
		</tr>
	</table>

	<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
		<tr>
			<td></td>
		</tr>
	</table>

	<table border="0" width="100%" id="table1" cellspacing="1"  cellpadding="2"  bgcolor="gray">
		<tr>
			<td class="textbar81" width="15%" colspan="1">货号</td>
			<td class="textbar01" width="85%" colspan="1">
				<select id="cid" name="cid" style="width:210px ">
					<option value="" selected="selected">请选择</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="textbar81" width="15%" colspan="1">色号</td>
			<td class="textbar01" width="85%" colspan="1">
				<select id="ccolor" name="" style="width:210px ">
				<option value="" selected="selected">请选择</option>
			</select></td>
		</tr>
		<tr>
			<td class="textbar81" width="15%" colspan="1">尺码</td>
			<td class="textbar01" width="85%" colspan="1"><select id="csize" name="" style="width:210px ">
				<option value="" selected="selected">请选择</option>
			</select></td>
		</tr>
		<tr>
			<td class="textbar81" width="15%" colspan="1">数量</td>
			<td class="textbar01" width="85%" colspan="1"><input  name="sinumber" value="200" style="width:210px;"></td>
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




