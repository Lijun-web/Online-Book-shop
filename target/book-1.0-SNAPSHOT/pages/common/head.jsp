<%--
  Created by IntelliJ IDEA.
  User: Lijun
  Date: 2020/12/12
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
    + "://"
    + request.getServerName()
    + ":"
    + request.getServerPort()
    + request.getContextPath()
    + "/";
    pageContext.setAttribute("basePath", basePath);
%>

<!--	写base标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">
<!--	相对路径对应到工程下的webapp目录-->
<link type="text/css" rel="stylesheet" href="static/css/style.css" >
<script type="text/javascript" src="static/script/jquery-1.7.2.js"></script>
