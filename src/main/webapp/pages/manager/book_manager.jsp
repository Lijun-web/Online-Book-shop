<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Büchern managen</title>
	<%--	静态 包含base标签，css样式，jQuery文件--%>
	<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript">

		$(function (){
			//给删除的a标签绑定单击事件，用于删除的确认提示操作
			$("a.deleteClass").click(function (){
				/**
				 * confirm是确认提示框函数
				 * 参数是提示内容
				 * 两个按钮，确认和取消
				 * 返回true代表点击确认，否则代表点击取消
				 */
				return confirm("Möchten Sie das Buch "+$(this).parent().parent().find("td:first").text()+"löschen？")

			});
		});

	</script>
</head>
<body>
	
	<div id="header">
		<a href="index.jsp">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</a>
		<span class="wel_word">Bücher managen System</span>
		<%--			静态包含manager管理模块的菜单--%>
		<%@include file="/pages/common/manager_menu.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>Name</td>
				<td>Preis</td>
				<td>Autor</td>
				<td>verkaufte Stückzahl</td>
				<td>Vorrat</td>
				<td colspan="2">Handel</td>
			</tr>

			<c:forEach items="${requestScope.page.items}" var="book">

				<tr>
					<td>${book.name}</td>
					<td>${book.price}</td>
					<td>${book.author}</td>
					<td>${book.sales}</td>
					<td>${book.stock}</td>
					<td><a href="manager/bookServlet?action=getBook&id=${book.id}&pageNo=${requestScope.page.pageNo}">edieren</a></td>
					<td><a class="deleteClass" href="manager/bookServlet?action=delete&id=${book.id}&pageNo=${requestScope.page.pageNo}">löschen</a></td>
				</tr>
			</c:forEach>


			


			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="pages/manager/book_edit.jsp?pageNo=${requestScope.page.pageTotal}">Buch hinzufügen</a></td>
			</tr>	
		</table>

		<%--静态包含分页条--%>
		<%@include file="/pages/common/page_nav.jsp"%>

	</div>


	<%--	静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>