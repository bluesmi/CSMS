<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title> </title>
<link rel="stylesheet" href="<%=basePath%>css/cjpm.css">
<script type="text/javascript" src="<%=basePath%>js/cjcalendar.js"></script>
<script language="javascript" src="<%=basePath%>js/page.js"></script>
</head>
<script language="javascript">

</script>
<SCRIPT LANGUAGE="javaScript">


function save()
{

    document.getElementById("idFrmMain").submit();
    alert("仓库修改成功！");
}

function back()
{
	history.back();
}

</SCRIPT>
<BODY BACKGROUND="<%=basePath%>image/bg.gif">
<FORM NAME="idFrmMain" ID="idFrmMain" METHOD="POST"  ACTION="" ONSUBMIT="return false"> 
<table border="0" width="100%">
    <tr>
    	<td width="100%" colspan="0" rowspan="0" align="center" valign="center">
      	<table border="0" width="100%" id="table1" cellspacing="0"  cellpadding="2"  bgcolor="gray">
        	<tr>
          	<td class="headerbar61" width="50%" colspan="1">仓库详细</td>
            <td class="headerbar63" width="50%" colspan="1">
            	<input type="button" name="save70302002" onclick="javascript:save()" value=" 保 存 ">
              <input type="button" name="save70302002" onclick="javascript:back()" value=" 返 回 ">&nbsp;              
            </td>
          </tr>
        </table>
      </td>
    </tr>

    <tr>
    	<td width="100%" colspan="0" rowspan="0" align="center" valign="center">
      	<table border="0" width="100%" id="table1" cellspacing="1"  cellpadding="2"  bgcolor="gray">
        <tr>
          	<td class="textbar81" width="15%" colspan="1">仓库编号</td>
            <td class="textbar01" width="85%" colspan="1">
            	<input type="text" value="${warehouse.wid }" size="15" name="wid" readonly="readonly">
            </td>
          </tr>
        	
         <tr>        	          
		<td class="textbar81" width="15%">仓库名称</td>
		<td class="textbar01" width="85%">
			<input type="text" name="wname" value="${warehouse.wname }" size="15">						
		</td>         		
         </tr>   

         <tr>        	          
		<td class="textbar81" width="15%" >联系人</td>
		<td class="textbar01" width="85%">
 			<input type="text" value="${warehouse.wuser }" size="15" name="wuser">								
		</td>         		
         </tr>  

	            <tr>        	          
		<td class="textbar81" width="15%" >联系电话</td>
		<td class="textbar01" width="85%">
 			<input type="text" value="${warehouse.wphone }" size="15" name="wphone">								
		</td>         		
         </tr>  
         
             <tr>        	          
		<td class="textbar81" width="15%"  >仓储量</td>
		<td class="textbar01" width="85%">
 			<input type="text" value="${warehouse.wnumber }" size="15" name="wnumber">								
		</td>         		
         </tr>       	   	
        </table>
				<table border=0 cellspacing=0 cellpadding=0 width="100%" height=5>
					<tr>
						<td></td>
					</tr>
				</table>
      </td>
    </tr>
</table>
</FORM>
</BODY>
</html>



