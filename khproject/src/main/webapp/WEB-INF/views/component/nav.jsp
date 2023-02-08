<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/01/25
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>

    window.onpopstate = function () {
        history.go(0);
    };

    const clickLink = (str) => {
        $("#main").load("${pageContext.request.contextPath}/"+str);
        history.pushState(null, null, "?page=" + str)
    }

</script>
<style>
    ul{
        display: flex;
    }
    li{
        margin-left: 20px;
    }
</style>
<nav>
    <ul>
        <li onclick="clickLink(`all`)">all</li>
        <li onclick="clickLink(`index_skydash`)">skydash</li>
        <li onclick="clickLink(`member`)">member</li>
        <li onclick="clickLink(`admin`)">admin</li>
        <li onclick="clickLink(`ajax`)">ajax</li>
        <li onclick="clickLink(`board`)">board</li>
    </ul>
</nav>
