<%--
  Created by IntelliJ IDEA.
  User: Lijun
  Date: 2020/12/12
  Time: 01:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div>
    <span><span class="um_span">${sessionScope.user.username}</span> herzlichen Willkommen bei unserer Online Buchhandlung!</span>
    <a href="orderServlet?action=showOrders">meine Bestellungen</a> |
    <a href="userServlet?action=logout">abmelden</a>&nbsp;&nbsp;
    <a href="index.jsp">zurück zur Startseite</a>
</div>

