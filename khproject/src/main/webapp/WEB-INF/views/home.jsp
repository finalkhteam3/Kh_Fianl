<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<html>
<head>
    <title>Home</title>
</head>
<link rel="stylesheet" href="/resources/skydashTemp/vendors/feather/feather.css">
<link rel="stylesheet"
      href="/resources/skydashTemp/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
      href="/resources/skydashTemp/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
      href="/resources/skydashTemp/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
      href="/resources/skydashTemp/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
      href="/resources/skydashTemp/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
      href="/resources/skydashTemp/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/resources/skydashTemp/images/logo_mini.png"/>
<link rel="stylesheet" href="/resources/css/issuecreate.css"/>
<link rel="stylesheet" href="/resources/css/issuedetail.css"/>
<script>
    const error = (str) => {
        if (str === '300')
            alert("정상적으로 접근 해주세요(url 직접입력 불가)");
    }
</script>
<body>
${projectNo}
<c:if test="${param.error != null}">
    <script>
        error(`${param.error}`);
        location.href = "./";
    </script>
</c:if>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper">
        <jsp:include page="/WEB-INF/views/component/header3.jsp"/>
        <jsp:include page="/WEB-INF/views/component/sidebar2.jsp"/>
        <div class="main-panel">
            <div class="content-wrapper">
                <jsp:include page="/WEB-INF/views/component/main.jsp"/>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/component/footer.jsp"/>
        <jsp:include page="/WEB-INF/views/issue/issuecreate.jsp"/>
         <jsp:include page="/WEB-INF/views/issue/issuedetail.jsp"/>
    </div>

</div>
</body>
</html>
