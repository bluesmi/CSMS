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
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=gb2312">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>入库单详细</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/cjpm.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/page.js"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
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
                var $cnumber = $("#cnumber");
                $csize.html("");
                $ccolor.html("");

                var str = '<option value="" selected="selected">请选择</option>'
                var strColor =str+ '<option value="'+data.ccolor+'">'+data.ccolor+'</option>';
                var strSize = str +'<option value="'+data.csize+'">'+data.csize+'</option>'
                $ccolor.append(strColor);
                $csize.append(strSize);
                $cnumber.val(data.cnumber);
            }
        });
    });
});

function addstockoutitems() {
    var $sonumber = $("#sonumber").val();
    var $cnumber = $("#cnumber").val();
    var check = parseInt($cnumber)-parseInt($sonumber);
    if(check >= 0){
        $("#idmig0102").submit();
    }else {
        alert("库存不够，请修改数量");
    }
}
</SCRIPT>
<BODY BACKGROUND="${pageContext.request.contextPath }/image/bg.gif">
<FORM NAME="idFrmMain" ID="idmig0102" METHOD="get"  ACTION="<%=basePath%>stockoutitems//AddStockoutitemServlet.do">
	<input type="hidden" id="soid" name="soid" value="${soid }">
<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="2"  bgcolor="gray">
	<tr>
  	<td class="headerbar61" width="15%" colspan="1">出库单详细</td>
    <td class="headerbar63" width="85%" colspan="1">
      <input type="button" name="save70302002" value=" 保 存 " onclick="javascript:addstockoutitems()">&nbsp;
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
    	<select id="cid" name="cid" style="width:210px " >
               <option value="" selected="selected">请选择</option>
              </select></td>
  </tr>
	<tr>
  	<td class="textbar81" width="15%" colspan="1">色号</td>
    <td class="textbar01" width="85%" colspan="1"><select name="ccolor" id="ccolor" style="width:210px ">
               <option value="" selected="selected">请选择</option>
              </select></td>
  </tr>          
  <tr>
  	<td class="textbar81" width="15%" colspan="1">尺码</td>
    <td class="textbar01" width="85%" colspan="1"><select name="csize" id="csize" style="width:210px ">
               <option value="" selected="selected">请选择</option> 

              </select></td>
  </tr>
  
  <tr>
  	<td class="textbar81" width="15%" colspan="1">库存数量</td>
    <td class="textbar01" width="85%" colspan="1"><input  id="cnumber" name="cnumber" value=""  style="width:210px;" onfocus=this.blur() ></td>
  </tr>
            
	<tr>
  	<td class="textbar81" width="15%" colspan="1">数量</td>
    <td class="textbar01" width="85%" colspan="1"><input id="sonumber" name="sonumber" value="" style="width:210px;"></td>
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




