<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/01/25
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
    const MainUrlList = ['all', 'index_skydash', 'member', 'admin', 'ajax', 'board']
    const WorkUrlList = ['project']
    const go = (str) => {
        if (MainUrlList.includes(str))
            $("#main").load(`/\${str}`);
        else if (WorkUrlList.includes(str))
            $("#main").load(`/work/\${str}`);
        else
            $("#main").load("/all");
    }
</script>
<body>
<c:if test="${param.page == null}">
    <div id="main">
        <h3>홈페이지입니다.</h3>
    </div>
</c:if>
<c:if test="${param.page != null}">
    <div id="main">
        <script>
            go(`${param.page}`)
        </script>
    </div>
</c:if>
</body>
