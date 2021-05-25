<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bestellungsdetail</title>
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
    <img class="logo_img" alt="" src="../../static/img/logo.gif" >
    <span class="wel_word">Bestellungsdetail</span>
    <%--			静态包含登录成功之后的菜单--%>
    <%@include file="/pages/common/login_success_menu.jsp"%>
</div>

<div id="main">

    <table>

        <tr>
            <td>Name</td>
            <td>Menge</td>
            <td>Preis</td>
            <td>Summe</td>
            <td>Bestellungsnummer</td>
            <td colspan="3">Handel</td>
        </tr>

            <c:forEach items="${requestScope.orderItems}" var="orderItem">
                <tr>
                    <td>${orderItem.name}</td>
                    <td>${orderItem.count}</td>
                    <td>${orderItem.price}</td>
                    <td>${orderItem.totalPrice}</td>
                    <td>${orderItem.orderId}</td>
                    <td><a class="umtausch" href="pages/error/announce.jsp">umtauschen</a></td>
                    <td><a class="back" href="pages/error/announce.jsp">zurückgeben</a></td>
                    <td><a class="back" href="pages/error/announce.jsp">stonieren</a></td>
                </tr>
            </c:forEach>

    </table>


</div>


<%--	静态包含页脚内容--%>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
