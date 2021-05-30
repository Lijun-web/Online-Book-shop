<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Büchern edieren</title>
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
	
	input {
		text-align: center;
	}
</style>
</head>
<body>
		<div id="header">
			<a href="index.jsp">
				<img class="logo_img" alt="" src="static/img/logo.gif" >
			</a>
			<span class="wel_word">Bücher edieren</span>

<%--			静态包含manager管理模块的菜单--%>
			<%@include file="/pages/common/manager_menu.jsp"%>
		</div>
		
		<div id="main">
			<form action="manager/bookServlet", method="get">
				<input type="hidden" name="pageNo" value="${param.pageNo}">
				<input type="hidden" name="action" value="${empty requestScope.book ? "add" : "update"}"/>
				<input type="hidden" name="id" value="${requestScope.book.id}"/>
				<table>
					<tr>
						<td>Name</td>
						<td>Preis</td>
						<td>Autor</td>
						<td>verkauft Stückzahl</td>
						<td>Vorrat</td>
						<td colspan="2">Handel</td>
					</tr>		
					<tr>
						<td><input name="name" type="text" value="${requestScope.book.name}"/></td>
						<td><input name="price" type="text" value="${requestScope.book.price}"/></td>
						<td><input name="author" type="text" value="${requestScope.book.author}"/></td>
						<td><input name="sales" type="text" value="${requestScope.book.sales}"/></td>
						<td><input name="stock" type="text" value="${requestScope.book.stock}"/></td>
						<td><input type="submit" value="abschicken"/></td>
					</tr>	
				</table>
			</form>
			
	
		</div>


		<%--	静态包含页脚内容--%>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>