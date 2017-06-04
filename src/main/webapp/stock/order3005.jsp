<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<head>
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=gb2312">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>入库单详细</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/cjpm.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/page.js"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
</head>

<SCRIPT LANGUAGE="javaScript">
<!--
function save()
{
	alert("保存成功！");
}
function update(){
	idFrmMain.action="${pageContext.request.contextPath }/AddStockoutitemServlet";
	idFrmMain.submit();
	alert("保存成功！");
}
function back()
{
	history.back();
}
 function check(){//动态加载货品的库存量
var id = "cid";
var soid = "soid";
var value = $("#" + id).val();//获取输入框内容
var value1 = $("#" + soid).val();//获取输入框内容
$.ajax({
		url:"/clothing/CheckClothServletUI",//要请求的servlet
		data:{cid:value,soid:value1},//给服务器的参数
		type:"POST",
		dataType:"json",
		async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		cache:false,
		error: function(msg) { alert("error"); },
		success:function(result) {
			$("#"+"cnumber").attr("value",result);
		}          
	});				
}
 
-->
</SCRIPT>
<BODY BACKGROUND="${pageContext.request.contextPath }/image/bg.gif">
<FORM NAME="idFrmMain" ID="idmig0102" METHOD="POST"  ACTION="">
	<input type="hidden" id="soid" name="soid" value="${soid }">
<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="2"  bgcolor="gray">
	<tr>
  	<td class="headerbar61" width="15%" colspan="1">出库单详细</td>
    <td class="headerbar63" width="85%" colspan="1">
      <input type="button" name="save70302002" value=" 保 存 " onclick="javascript:update()">&nbsp;
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
    	<select id="cid" name="cid" style="width:210px " onchange="check()"> 
               <option value="" selected="selected">请选择</option> 
                <option value="1">1</option> 
                <option value="2">2</option>  
                <option value="3">3</option>
              </select></td>
  </tr>
	<tr>
  	<td class="textbar81" width="15%" colspan="1">色号</td>
    <td class="textbar01" width="85%" colspan="1"><select name="ccolor" style="width:210px "> 
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
  </tr>          
  <tr>
  	<td class="textbar81" width="15%" colspan="1">尺码</td>
    <td class="textbar01" width="85%" colspan="1"><select name="csize" style="width:210px "> 
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
  
  <tr>
  	<td class="textbar81" width="15%" colspan="1">库存数量</td>
    <td class="textbar01" width="85%" colspan="1"><input  id="cnumber" name="cnumber" value=""  style="width:210px;" onfocus=this.blur() ></td>
  </tr>
            
	<tr>
  	<td class="textbar81" width="15%" colspan="1">数量</td>
    <td class="textbar01" width="85%" colspan="1"><input  name="sonumber" value="" style="width:210px;"></td>
  </tr>      
</table>${message }

<table border=0 cellspacing=0 cellpadding=0 width="100%" height=5>
	<tr>
		<td></td>
	</tr>
</table>
</FORM>
</BODY>
</html>




