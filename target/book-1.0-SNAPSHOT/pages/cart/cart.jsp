<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Warenkorb</title>
	<%--	静态 包含base标签，css样式，jQuery文件--%>
	<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function (){
			//给删除按钮绑定单击事件
			$("a.deleteItem").click(function (){
				return confirm("Möchten Sie " + $(this).parent().parent().find("td:first").text() + " löschen？")

			});

			$("#clearCart").click(function (){
				return confirm("Möchten Sie Ihren Warenkorb leeren？")
			});
			//给输入框绑定onchange事件
			$(".updateCount").change(function (){
				//获取商品名称
				var name = $(this).parent().parent().find("td:first").text();
				//获取商品数量
				var count = this.value;
				//获取商品id
				var id = $(this).attr("bookId");

				if(confirm(" Möchten Sie die Anzahl von " + name + " zu " + count + " wechseln？")){

					location.href = "${pageScope.basePath}cartServlet?action=updateCount&count="+count+"&id="+id;

				} else {
					this.value = this.defaultValue;
				}

			});
		});
	</script>
</head>
<body>
	
	<div id="header">
		<a href = "index.jsp">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</a>
		<span class="wel_word">Warenkorb</span>
		<div>
			<%--		如果用户还没有登录，则显示登录和注册菜单--%>
			<c:if test="${empty sessionScope.user}">

				<a href="pages/user/login.jsp">anmelden</a> |
				<a href="pages/user/regist.jsp">registieren</a> &nbsp;&nbsp;

			</c:if>
			<c:if test="${not empty sessionScope.user}">
				<span><span class="um_span">${sessionScope.user.username}</span>herzlichen Willkommen!</span>
				<a href="orderServlet?action=showOrders">meine Bestellungen</a> |
				<a href="userServlet?action=logout">abmelden</a> |
			</c:if>
			<a href="pages/cart/cart.jsp">Warenkorb</a> |
			<a href="pages/manager/manager.jsp">managen</a>
		</div>
	</div>
	
	<div id="main">
	
		<table>
			<tr>
				<td>Name</td>
				<td>Menge</td>
				<td>Preis</td>
				<td>Summe</td>
				<td>Handel</td>
			</tr>

			<c:if test="${empty sessionScope.cart.items}">
<%--				如果购物车为空--%>
				<tr>
					<td colspan="5"><a href="index.jsp">Ihr Warenkorb ist noch leer, klicken, um zur Startseite zu kommen</a> </td>
				</tr>
			</c:if>
			<c:if test="${not empty sessionScope.cart.items}">
<%--				如果购物车不为空，则遍历显示商品--%>
				<c:forEach items="${sessionScope.cart.items}" var="entry">
					<tr>
						<td>${entry.value.name}</td>
						<td>
							<input class="updateCount" style="width: 50px;"
								   bookId="${entry.value.id}"
								   type="text" value="${entry.value.count}">
						</td>
						<td>${entry.value.price}</td>
						<td>${entry.value.totalPrice}</td>
						<td><a class="deleteItem" href="cartServlet?action=deleteItem&id=${entry.value.id}">löschen</a></td>
					</tr>
				</c:forEach>
			</c:if>

			
		</table>

		<c:if test="${not empty sessionScope.cart.items}">
			<div class="cart_info">
				<span class="cart_span">insgesamt<span class="b_count">${sessionScope.cart.totalCount}</span>Stück Artikel im Warenkorb</span>
				<span class="cart_span">Summe<span class="b_price">${sessionScope.cart.totalPrice}</span>Euro</span>
				<span class="cart_span"><a id="clearCart" href="cartServlet?action=clear">Warenkorb leeren</a></span>
				<span class="cart_span"><a href="orderServlet?action=createOrder">Bezahlen</a></span>
			</div>
		</c:if>
	
	</div>


	<%--	静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>