<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/frame.css">
<script type="text/jscript" language="JavaScript" src="${pageContext.request.contextPath }/js/qq_hidemenu.js"></script>
</head>
<SCRIPT language=JavaScript>
function  Content(){
parent.main.location="main.htm"
}
function gotos(surl){
	document.idFrmMain.action = surl;
	document.idFrmMain.target = "main";
	document.idFrmMain.submit();
}
</SCRIPT>
<body   nLoad="widgets.ToggleWidget(hideTop1);widgets.ToggleWidget(hideTop2);widgets.ToggleWidget(hideTop3)"> 
<FORM NAME="idFrmMain" ID="idFrmMain" METHOD="POST"  ACTION="" ONSUBMIT="return false"> 
  <table width="180" height="100%"  border="0" cellpadding="0" cellspacing="0"> 
    <tr> 
      <td valign="top" class="left"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0"> 
          <tr> 
            <td  height="9"></td> 
          </tr> 
          <tr> 
            <td > <table width="100%" cellspacing="0" cellpadding="0" border="0"> 
                <tr> 
                  <td  class="left1"> <a id="exp52" title="折叠" href="javascript:widgets.ToggleWidget(hideTop1);" ><img id="exp5" alt="折叠" src="../image/qq_minimize.gif"  border="0"></a> &nbsp;&nbsp;&nbsp;&nbsp;<a id="exp51" title="折叠" href="javascript:widgets.ToggleWidget(hideTop1);">系统管理</a></td> 
                </tr> 
              </table></td> 
          </tr> 
          <tr> 
            <td class="left2" > <div id="hideTop1"  img="exp5" openAlt="折叠" closedAlt="展开"> 
                <table width="100%"  border="0" cellspacing="1" cellpadding="0"> 
                  
                  <tr> 
                    <td><div align="right"><img src="${pageContext.request.contextPath }/image/dot1.gif" width="13" height="16"></div></td> 
                    <td><a href="${pageContext.request.contextPath }/ListUserServlet" target="main">用户管理</a></td> 
                  </tr> 
				  <tr> 
                    <td><div align="right"><img src="${pageContext.request.contextPath }/image/dot1.gif" width="13" height="16"></div></td> 
                    <td><a href="${pageContext.request.contextPath }/QueryAllClothServlet" target="main">货号</a></td> 
                  </tr>                 
				   <tr> 
                    <td><div align="right"><img src="${pageContext.request.contextPath }/image/dot1.gif" width="13" height="16"></div></td> 
                    <td><a href="${pageContext.request.contextPath }/ListWarehouseServlet" target="main">仓库</a></td> 
                  </tr>  
                  <tr> 
                    <td colspan="2"  height="10"></td> 
                  </tr> 
                </table> 
              </div></td> 
          </tr> 
		  
		  
		  <!--需要修改4个id和两个div的id--> 
          <tr> 
            <td height="8"></td> 
          </tr> 
         
          <tr> 
            <td height="8"></t d> 
          </tr> 
          <tr> 
            <td>&nbsp;</td> 
          </tr> 
        </table></td> 
    </tr> 
  </table> 
</form> 
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
<!--

//-->
</SCRIPT>


