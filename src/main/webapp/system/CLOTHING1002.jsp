<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<head>
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>品牌修改</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/cjpm.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cjcalendar.js"></script>
<script language="javascript" src="${pageContext.request.contextPath }/js/page.js"></script>
    <script type="text/javascript"
            src="<c:url value='<%=basePath%>jquery/jquery-1.5.1.js'/>"></script>
    <script language="javascript">
        var CalendarWebControl = new atCalendarControl();

        function save()
        {

            $("#idFrmMain").attr({"action":"/clothing/AddClothServlet"})
            document.getElementById("idFrmMain").submit();

            alert("新增成功！");

        }
        function update()
        {
            alert("进入更新");
            $("#idFrmMain").attr({"action":"/clothing/UpdateClothServlet"})
            document.getElementById("idFrmMain").submit();
            alert("修改成功！");

        }

        function back()
        {
            history.back();
        }

    </script>
</head>

<BODY BACKGROUND="../image/bg.gif"> 
<FORM NAME="idFrmMain" ID="idFrmMain" METHOD="POST"  ACTION="" ONSUBMIT="return false"> 
  <table border="0" width="100%"> 
    <tr> 
      <td width="100%" colspan="0" rowspan="0" align="center" valign="center">
          <table border="0" width="100%" id="table" cellspacing="0"  cellpadding="2"  bgcolor="gray">
          <tr> 
            <td class="headerbar61" width="50%">货号详细</td> 
            <td class="headerbar63" width="50%"> <input type="button" name="save70302002"  onClick="javascript:save()" value="新增确认 "> 
               
&nbsp; <input type="button" name="save70302002" onClick="javascript:back()" value=" 返 回 "></td> 
          </tr> 
        </table></td> 
    </tr> 
    <tr> 
      <td width="100%" colspan="0" rowspan="0" align="center" valign="center"> <table border="0" width="100%" id="table1" cellspacing="1"  cellpadding="2"  bgcolor="gray"> 
          <tr> 
           <td class="textbar81" width="15%">货号</td> 
            <td class="textbar01" width="35%"> <input type="text" name="cid" value="自动编号..." readonly="readonly" size="15" style="width:210px " > </td>  
			 <td class="textbar81" width="15%">品名</td> 
            <td class="textbar01" width="35%"> <input type="text" name="cname" value="${oneCloth.cname }" size="15" style="width:210px "> </td> 
          </tr> 
          <tr> 
            <td width="15%" class="textbar81">色号</td> 
            <td class="textbar01" width="35%"> <select name="ccolor" style="width:210px "> 
               <option value="" <c:if test="">selected</c:if> >请选择</option> 
                <option <c:if test="${oneCloth.ccolor=='大红色' }">selected</c:if> value="大红色">大红色</option> 
                <option <c:if test="${oneCloth.ccolor=='浅红色' }">selected</c:if> value="浅红色">浅红色</option> 
                <option <c:if test="${oneCloth.ccolor=='紫红色' }">selected</c:if> value="紫红色" >紫红色</option> 
				<option <c:if test="${oneCloth.ccolor=='纯白色' }">selected</c:if> value="纯白色" >纯白色</option> 
                <option <c:if test="${oneCloth.ccolor=='米白色' }">selected</c:if> value="米白色" >米白色</option> 
				<option <c:if test="${oneCloth.ccolor=='深蓝色' }">selected</c:if> value="深蓝色" >深蓝色</option> 
                <option <c:if test="${oneCloth.ccolor=='淡蓝色' }">selected</c:if> value="淡蓝色" >淡蓝色</option> 
				<option <c:if test="${oneCloth.ccolor=='黑色' }">selected</c:if> value="黑色"  >黑色</option> 
                <option <c:if test="${oneCloth.ccolor=='棕色' }">selected</c:if> value="棕色"  >棕色</option> 
              </select></td> 
         
            <td width="15%" class="textbar81">尺码</td> 
            <td class="textbar01" width="35%"> <select name="csize" style="width:210px "> 
               <option value="" <c:if test="">selected</c:if> >请选择</option> 
                <option <c:if test="${oneCloth.csize=='150' }">selected</c:if> value="150">150</option> 
                <option <c:if test="${oneCloth.csize=='155' }">selected</c:if> value="155">155</option> 
                <option <c:if test="${oneCloth.csize=='160' }">selected</c:if> value="160">160</option> 
				<option <c:if test="${oneCloth.csize=='165' }">selected</c:if> value="165">165</option> 
                <option <c:if test="${oneCloth.csize=='170' }">selected</c:if> value="170">170</option> 
				<option <c:if test="${oneCloth.csize=='175' }">selected</c:if> value="175">175</option> 
                <option <c:if test="${oneCloth.csize=='180' }">selected</c:if> value="180">180</option> 
				<option <c:if test="${oneCloth.csize=='185' }">selected</c:if> value="185">185</option> 
                <option <c:if test="${oneCloth.csize=='190' }">selected</c:if> value="190">190</option> 
              </select> </td>            
          </tr> 
		   <tr> 
            <td width="15%" class="textbar81">库存</td> 
            <td class="textbar01" width="35%"> <input type="text" value="${oneCloth.cnumber}" name="cnumber" size="15" style="width:210px "> </td> 
            <td class="textbar81" width="15%">图片</td> 
            <td class="textbar01" width="35%"> <input type="text" value="${oneCloth.cimage}" name="cimage" size="15" style="width:210px "> </td> 
          </tr> 
          <tr> 
            <td width="15%" class="textbar81">出厂价</td> 
            <td class="textbar01" width="35%"> <input type="text" value="${oneCloth.cfacprice}" name= "cfacprice" size="15" style="width:210px "> </td> 
            <td class="textbar81" width="15%">零售价</td> 
            <td class="textbar01" width="35%"> <input type="text" value="${oneCloth.cretprice}" name ="cretprice" size="15" style="width:210px "> </td> 
          </tr> 
          
 
        </table> 
        <table border=0 cellspacing=0 cellpadding=0 width="100%" height=5> 
          <tr> 
            <td></td> 
          </tr> 
        </table></td> 
    </tr> 
  </table> 
</FORM> 
</BODY>
</html>


