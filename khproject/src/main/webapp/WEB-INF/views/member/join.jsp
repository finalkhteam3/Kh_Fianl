<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/01/21
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/join" method="post">
    <input type="text" name="id" placeholder="아이디">
    <input type="password" name="password" placeholder="비번">
    <input type="text" name="name" placeholder="이름">
    <input type="text" name="email" placeholder="이메일">
    <button>전송</button>
</form>
</body>
</html>
