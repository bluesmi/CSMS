<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<head>
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=gb2312">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>用户详细</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/cjpm.css">							
</head>

<SCRIPT LANGUAGE="javaScript">
<!--
function save()
{
	alert("保存成功！");
}

function back()
{
	history.back();
}
  function updateuser(){
	idmig0102.action="${pageContext.request.contextPath }/UpdateUserServlet";
	idmig0102.submit();
	alert("用户修改成功！");
}
-->
</SCRIPT>
<BODY BACKGROUND="${pageContext.request.contextPath }/image/bg.gif">
<FORM NAME="idFrmMain" ID="idmig0102" METHOD="POST"  ACTION=""> 
<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="2"  bgcolor="gray">
	<tr>
  	<td class="headerbar61" width="15%" colspan="1">用户详细</td>
    <td class="headerbar63" width="85%" colspan="1">
      <input type="button" name="save70302002" value=" 保 存 " onclick="JavaScript:updateuser()">&nbsp;
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
	<input type="hidden" name="uid" value="${user.uid }" />
	<tr>
  	<td class="textbar81" width="15%" colspan="1">用户登录号</td>
    <td class="textbar01" width="85%" colspan="1"><input name="loginName" value="${user.loginName }" size="20"></td>
  </tr>          
  <tr>
  	<td class="textbar81" width="15%" colspan="1">用户姓名</td>
    <td class="textbar01" width="85%" colspan="1"><input name="realName" value="${user.realName }" size="20"></td>
  </tr>          
	<tr>
  	<td class="textbar81" width="15%" colspan="1">用户密码</td>
    <td class="textbar01" width="85%" colspan="1"><input type="password" name="password" value="${user.password }" size="20"></td>
  </tr>      
	<tr>
  	<td class="textbar81" width="15%" colspan="1">电话号码</td>
    <td class="textbar01" width="85%" colspan="1"><input name="phone" value="${user.phone }" size="20">
     </td>
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




