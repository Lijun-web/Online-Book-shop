<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Anmeldungsseite</title>
	<%--	静态 包含base标签，css样式，jQuery文件--%>
	<%@include file="/pages/common/head.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
</style>
</head>
<body>
		<div id="header">
				<img class="logo_img" alt="" src="static/img/logo.gif" >

<%--			静态包含登录成功之后的菜单--%>
				<%@include file="/pages/common/login_success_menu.jsp"%>
		</div>
		
		<div id="main">
		
			<h1>herzlichen Willkommen! <a href="index.jsp">zur Startseite</a></h1>
	
		</div>


		<%--	静态包含页脚内容--%>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>