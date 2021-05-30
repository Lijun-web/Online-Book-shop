<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meine Bestellungen</title>
	<%--	静态 包含base标签，css样式，jQuery文件--%>
	<%@include file="/pages/common/head.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>
	
	<div id="header">
		<a href="index.jsp">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</a>
		<span class="wel_word">meine Bestellungen</span>
		<%--			静态包含登录成功之后的菜单--%>
		<%@include file="/pages/common/login_success_menu.jsp"%>
	</div>
	
	<div id="main">
		
		<table>

			<tr>
				<td>Datum</td>
				<td>Summe</td>
				<td>Zustand</td>
				<td>Details</td>
			</tr>



			<c:if test="${empty requestScope.orders}">
				<%--				如果订单为空--%>
				<tr>
					<td colspan="5"><a href="index.jsp">Sie haben noch keine Bestellungen, klicken, um zur Startseite zu kommen</a> </td>
				</tr>
			</c:if>
			<c:if test="${not empty requestScope.orders}">
				<%--				如果订单不为空，则遍历显示订单--%>
				<c:forEach items="${requestScope.orders}" var="order">
					<tr>
						<td>${order.createTime}</td>
						<td>${order.price}</td>
						<td>${order.status}</td>
						<td><a class="deleteItem" href="orderServlet?action=showDetails&orderId=${order.orderId}">Details</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
	
	</div>


	<%--	静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>