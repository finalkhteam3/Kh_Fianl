<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/01/20
  Time: 3:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form action="${pageContext.request.contextPath}/login" method="post">
    <input type="text" name="id" placeholder="아이디">
    <input type="password" name="password" placeholder="비번">
    <button>전송</button>
  </form>
</body>
</html>
