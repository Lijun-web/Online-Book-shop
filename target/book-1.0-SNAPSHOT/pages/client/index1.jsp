<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Startseite</title>

	<%-- 静态包含 base标签、css样式、jQuery文件 --%>
	<%@ include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function (){
			//给加入购物车按钮绑定单击事件
			$("button.addToCart").click(function (){
				var bookId = $(this).attr("bookId");
				<%--location.href = "${pageScope.basePath}cartServlet?action=addItem&id=" + bookId;--%>
				$.getJSON("${pageScope.basePath}cartServlet","action=ajaxAddItem&id=" + bookId, function(data){
					$("#cartTotalCount").text("Es gibt "+data.totalCount+" Stück Artikel in Ihrem Warenkorb");
					$("#cartLastName").text("Sie haben gerade <" +data.lastName+ "> in den Warenkorb hinzugefügt");

				})


			});

		});
	</script>


</head>
<body>

<div id="header">
	<a href = "index.jsp">
		<img class="logo_img" alt="" src="static/img/logo.gif" >
	</a>
	<span class="wel_word">Online Buchhandlung</span>
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
		<a href="pages/manager/manager.jsp" id="managen">managen</a>
	</div>
</div>

<div id="main">
	<div id="book">
		<div class="book_cond">
			<form action="client/bookServlet" method="get">
				<input type="hidden" name="action" value="pageByPrice">
				Preis：<input id="min" type="text" name="min" value="${param.min}"> Euro -
				<input id="max" type="text" name="max" value="${param.max}"> Euro
				<input type="submit" value="Search" />
			</form>
		</div>
		<div style="text-align: center">
			<c:if test="${empty sessionScope.cart.items}">
<%--				购物车为空的情况--%>
				<span id="cartTotalCount"></span>
				<div>
					<span style="color: red" id="cartLastName">Ihr Warenkorb ist noch leer!</span>
				</div>
			</c:if>
			<c:if test="${not empty sessionScope.cart.items}">
				<%--				购物车不为空的情况--%>
				<span id="cartTotalCount">Es gibt ${sessionScope.cart.totalCount}  Stück Artikel in Ihrem Warenkorb</span>
				<div>
					<span style="color: red" id="cartLastName">Sie haben gerade &lt;${sessionScope.lastName}&gt; in Warenkorb reingelegt</span>
				</div>
			</c:if>

		</div>

		<c:forEach items="${requestScope.page.items}" var="book">
		<div class="b_list">
			<div class="img_div">
				<img class="book_img" alt="" src="${book.imgPath}" />
			</div>
			<div class="book_info">
				<div class="book_name">
					<span class="sp1">Name:</span>
					<span class="sp2">${book.name}</span>
				</div>
				<div class="book_author">
					<span class="sp1">Autor:</span>
					<span class="sp2">${book.author}</span>
				</div>
				<div class="book_price">
					<span class="sp1">Preis:</span>
					<span class="sp2">￥${book.price}</span>
				</div>
				<div class="book_sales">
					<span class="sp1">verkaufte Stückzhal:</span>
					<span class="sp2">${book.sales}</span>
				</div>
				<div class="book_amount">
					<span class="sp1">Vorrat:</span>
					<span class="sp2">${book.stock}</span>
				</div>
				<div class="book_add">
					<button bookId="${book.id}" class="addToCart">in Warenkorb hinzufügen</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>

<%--静态包含分页条--%>
	<%@include file="/pages/common/page_nav.jsp"%>

</div>

<%--静态包含页脚内容--%>
<%@include file="/pages/common/footer.jsp"%>

</body>
</html>