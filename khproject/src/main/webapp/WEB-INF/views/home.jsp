<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<html>
<head>
    <title>Home</title>
</head>
<script>
    const error = (str) => {
        if(str === '300')
            alert("정상적으로 접근 해주세요(url 직접입력 불가)");
    }
</script>
<body>
<c:if test="${param.error != null}">
    <script>
        error(`${param.error}`);
    </script>
</c:if>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/component/header.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/component/nav.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/component/main.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/component/footer.jsp"/>
</body>
</html>
