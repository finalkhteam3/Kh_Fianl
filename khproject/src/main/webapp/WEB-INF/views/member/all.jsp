<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/01/19
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<body>
<h3>all</h3>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.username" var="uId"/>
    <div>안녕하세요. ${uId}</div>
</sec:authorize>
<%--안녕히가세요.${uId}--%>
<%--1${userId}--%>
<c:choose>
    <c:when test="${userId != null}">
        id: ${userId}
    </c:when>
    <c:otherwise>
        로그인 해주세요.
        <script>
            alert("로그인해주세요.")
        </script>
    </c:otherwise>
</c:choose>
<c:out value="${userId}">로그인하면 아이디명이 보임</c:out>
<c:if test="${userId != null}">
    <form action="${pageContext.request.contextPath}/logout" method="post">
        <button>로그아웃</button>
    </form>
</c:if>
<jsp:include page=".././component/footer.jsp"/>
</body>
