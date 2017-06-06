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
<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="content-script-type" CONTENT="text/JavaScript">
<META HTTP-EQUIV="content-style-type" CONTENT="text/css">
<title>用户管理</title>
<link rel="stylesheet" href="<%=basePath%>css/cjpm.css">
</head>

<SCRIPT LANGUAGE="javaScript">

function gotos()
{
	document.forms[0].action="<%=basePath%>/system/adduser.jsp";
	document.forms[0].submit();
}
 
 function dodelete(uid){
	 		var b = window.confirm("您确认删除吗?");
	 		if(b){
	 				window.location.href = "<%=basePath%>user/DeleteUserServlet.do?uid=" + uid;
	 				alert("删除成功");
	 			}
	 			
 		} 

</SCRIPT>

<BODY BACKGROUND="<%=basePath%>image/bg.gif">
<FORM NAME="mig0101" ID="idmig0101" method="post"  action="<%=basePath%>user/QueryUserServlet.do">
          <table border=0 cellspacing=0 cellpadding=2 width="100%" bgcolor="gray">
			<tr>
				<td class="headerbar61">用户明细查询</td>
				<td class="headerbar61"><p align="right"><input type=submit value=" 查 询 " ></p></td>
			</tr>
  </table>
			
			<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
			<tr>
				<td></td>
			</tr>
			</table>
		  <table border=0 cellspacing=1 cellpadding=2 width="100%" bgcolor="gray">
			<tr>
				<td class="textbar81" width="15%">用户姓名</td>
				<td class="textbar01" width="35%">
					<input type="text" name="realName" size="20" value="${realName }">
				</td>
				<td class="textbar81" width="15%">用户登录号</td>
				<td class="textbar01" width="35%"><input type="text" name="loginName" size="20" value="${loginName }"></td>
			</tr>
			
			</table>
<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
	<tr>
		<td></td>
	</tr>
</table>
		    <table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="2"  bgcolor="gray">
                <tr>
                    <td class="headerbar61" width="50%" colspan="1">用户明细表</td>
                    <td class="headerbar63" width="50%" colspan="1">
                   <input type="button" name="add" tabindex="1" onClick="javascript:gotos()" value=" 新 增 "></td>
                </tr>
            </table>

<table border=0 cellspacing=0 cellpadding=2 width="100%" height="5">
	<tr>
		<td></td>
	</tr>
</table>

      	<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="0"  bgcolor="gray">
        	<tr>
          	<td  width="100%" colspan="1">
          		<table  border="0" cellspacing="1" cellpadding="2" width="100%">
								<tr>
									<td  width="5%" class="headerbar82">序号</td>
									<td  width="35%" class="headerbar82">用户登录号</td>
									<td  width="35%" class="headerbar82">用户姓名</td>
									<td   class="headerbar82">操作</td>
								</tr>
								
								<c:forEach  items="${list }" var="u" varStatus="s">
								<tr>
									<td  class="gridbar11" align="center">${s.count}</td>
									<td  class="gridbar11" align="center"><a href="<%=basePath%>user/UpdateUserServletUI.do?uid=${u.uid } ">${u.loginName }</a></td>
									<td  class="gridbar11" align="center"><a href="<%=basePath%>user/UpdateUserServletUI.do?uid=${u.uid }">${u.realName }</a></td>
									<td  class="gridbar11" align="center">
										<a href = "#"><img src="user/image/del.gif" align="bottom" border="0" alt="删除" onClick="javascript:dodelete('${u.uid }')" /></a>									</td>
								</tr>
								</c:forEach>
								
								<c:forEach  items="${list1 }" var="u1" varStatus="s1">
								<tr>
									<td  class="gridbar11" align="center">${s1.count }</td>
									<td  class="gridbar11" align="center"><a href="<%=basePath%>user/UpdateUserServletUI.do?uid=${u1.uid } ">${u1.loginName }</a></td>
									<td  class="gridbar11" align="center"><a href="<%=basePath%>user/UpdateUserServletUI.do?uid=${u1.uid }">${u1.realName }</a></td>
									<td  class="gridbar11" align="center">
										<a href = "#"><img src="<%=basePath%>image/del.gif" align="bottom" border="0" alt="删除" onClick="javascript:dodelete('${u1.uid }')" /></a>									</td>
								</tr>
								</c:forEach>
								
			  </table>
			  </td>
					</tr>
				</table>


				<table width="100%" border="0" cellpadding="1" cellspacing="2" >
        	<tr>
          	<td colspan="2" align="right" height="20"  nowrap class="textbar3" >
							&nbsp; 共3条 &nbsp; 第1/1页 &nbsp;      				<a  href="#" style="cursor:hand">首页</a>&nbsp; 
      				<a   style="cursor:hand" href="#">上一页</a>&nbsp;
      				<a  style="cursor:hand" href="#">下一页</a>&nbsp; 
      				<a   style="cursor:hand" href="#">尾页</a>&nbsp; 
							&nbsp;
						</td>
          </tr>
        </table>
</FORM>
</BODY>
</html>

