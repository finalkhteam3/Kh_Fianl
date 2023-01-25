<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/component/header.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/component/nav.jsp"/>
<h1>
	테스트용 페이지입니다.
</h1>

<P>  The time on the server is ${serverTime}. </P>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/component/footer.jsp"/>
</body>
</html>
