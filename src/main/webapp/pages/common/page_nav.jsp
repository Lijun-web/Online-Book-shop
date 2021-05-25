<%--
  Created by IntelliJ IDEA.
  User: Lijun
  Date: 2021/1/5
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="page_nav">
    <c:if test="${requestScope.page.pageNo > 1}">

        <a href="${requestScope.page.url}&pageNo=1">erste Seite</a>
        <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}">letzte Seite</a>
    </c:if>

    <%--			页码输出的开始--%>
    <c:choose>
        <%--				情况1：总页码数小于等于5，页码范围是1到总页码数--%>
        <c:when test="${requestScope.page.pageTotal <= 5}">
            <c:set var="begin" value="1"/>
            <c:set var="end" value="${requestScope.page.pageTotal}"/>
        </c:when>
        <%--				情况2：总页码数大于5--%>
        <c:when test="${requestScope.page.pageTotal > 5}">
            <c:choose>
                <%--						小情况1：当前页码为1，2，3，页码显示范围为1到5--%>
                <c:when test="${requestScope.page.pageNo <= 3}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="5"/>
                </c:when>
                <%--						小情况2：当前页码为最后3个，页码范围是（总页码数-4）到总页码数--%>
                <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotal-3}">
                    <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                    <c:set var="end" value="${requestScope.page.pageTotal}"/>
                </c:when>
                <%--						小情况3：当前页码为中间，页码范围是（当前页码-2）到（当前页码+2）--%>
                <c:otherwise>
                    <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                    <c:set var="end" value="${requestScope.page.pageNo+2}"/>
                </c:otherwise>
            </c:choose>
        </c:when>
    </c:choose>
    <c:forEach begin="${begin}" end="${end}" var="i">
        <c:if test="${i == requestScope.page.pageNo}">
            【${i}】
        </c:if>
        <c:if test="${i != requestScope.page.pageNo}">

            <a href="${requestScope.page.url}&pageNo=${i}">${i}</a>
        </c:if>
    </c:forEach>
    <%--			页码输出的结束--%>

    <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
        <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}">nächste Seite</a>
        <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageTotal}">letzte Seite</a>

    </c:if>
    insgesamt ${requestScope.page.pageTotal} Seiten，${requestScope.page.pageTotalCount} Einträge
    zur<input name="pn" id="pn_input"/>Seite
    <input id="searchPageBtn" type="button" value="sichern">

    <script type="text/javascript">
        $(function () {
            $("#searchPageBtn").click(function () {

                var pageNo = $("#pn_input").val();
                var pageTotal = ${requestScope.page.pageTotal};
                if(1<=pageNo<=pageTotal){

                    // javaScript语言提供了一个location地址栏对象
                    // 它有一个属性叫href，可以获取浏览器地址栏中的地址
                    // href属性可读可写
                    location.href = "${pageScope.basePath}${requestScope.page.url}&pageNo=" + pageNo;
                }


            });
        });
    </script>
</div>
