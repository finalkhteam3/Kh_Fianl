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
<style>
  #table-wrap{
    width: 800px;
    height: 1000px;
    background-color: #f5f5f5;
    margin: 50px auto 50px auto;
    display: flex;
    justify-content: center;
  }

  #table-wrap ul{
    list-style: none;
    padding-left: 0;
  }

  #table-wrap .table{
    margin: 50px 0 50px 0;
  }

  #table-wrap .table .empty-box{
    height: 30px;
  }

  #table-wrap .table > ul{
    margin-top: 30px;
  }

  #table-wrap .button-wrapper {
    display: flex;
    justify-content: center;
  }

  .inputBox-big{
    margin-top: 5px;
    width: 460px;
    height: 45px;
  }
</style>
<body>
  <form action="${pageContext.request.contextPath}/login" method="post"
        id="table-wrap">
    <ul class="table">
      <li>아이디</li>
      <li>
        <input type="text" name="id" placeholder="아이디" class="inputBox-big">
      </li>
      <li>패스워드</li>
      <li>
        <input type="password" name="password" placeholder="비번" class="inputBox-big">
      </li>
      <li>
        <button>전송</button>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/join">회원가입</a>
      </li>
    </ul>
  </form>
</body>
</html>