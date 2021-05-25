<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bestellungen managen</title>
	<%--	静态 包含base标签，css样式，jQuery文件--%>
	<%@include file="/pages/common/head.jsp"%>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="../../static/img/logo.gif" >
			<span class="wel_word">Bestellungen Managesystem</span>
		<%--			静态包含manager管理模块的菜单--%>
		<%@include file="/pages/common/manager_menu.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>Datum</td>
				<td>Summe</td>
				<td>Benutzernummer</td>
				<td>Zustand</td>
				<td>Details</td>
				
			</tr>

			<c:if test="${empty requestScope.ordersM}">
				<%--				如果订单为空--%>
				<tr>
					<td colspan="5"><a href="index.jsp">Sie haben noch keine Bestellungen von Kunden, klicken, um zur Startseite zu kommen</a> </td>
				</tr>
			</c:if>
			<c:if test="${not empty requestScope.ordersM}">
				<%--				如果订单不为空，则遍历显示订单--%>
				<c:forEach items="${requestScope.ordersM}" var="order">
					<tr>
						<td>${order.createTime}</td>
						<td>${order.price}</td>
						<td>${order.userId}</td>
						<td>${order.status}</td>
						<td><a class="deleteItem" href="orderServlet?action=showDetailsM&orderId=${order.orderId}">Details</a></td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
	</div>


	<%--	静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>