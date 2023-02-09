<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/02/08
  Time: 6:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/feather/feather.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resources/skydashTemp/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/skydashTemp/images/favicon.png"/>
<style>
    ul, li {
        list-style: none;
    }

    .color-tl-wrap {
        background-color: #7cead1;
        width: 100%;
        min-width: 300px;
        height: 200px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .color-tl {
        position: relative;
        background-color: #00ff80;
        width: 98%;
        height: 160px;
    }

    .color-tt-wrap {
        display: flex;
        background-color: #0d3057;
        min-height: 1000px;
        overflow: auto;
        white-space: nowrap;
    }

    .color-tt {
        background-color: grey;
        min-height: 900px;
        width: 260px;
        margin: 10px;
    }

    .w-box {
        height: 24px;
    }

    .b-box {
        height: 57px;
    }

    .e-box {
        position: absolute;
        bottom: 0;
    }

    .flex-box {
        display: flex;
    }

    .spb {
        justify-content: space-between;
    }

    .aib {
        align-items: flex-end;
    }

    .margin-l-s li {
        margin-left: 5px;
        color: #44546F;
    }
    .boxt{
        width: 95%;
        height: 50px;
        color: whitesmoke;
    }
    .margin-l-b {

    }
</style>
<script>
    $(function to_ajax() {
        $.ajax({
            type: 'GET',
            url: "<%=request.getContextPath() %>/board/api1",
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
                const element = document.getElementsByClassName('color-tt-wrap')[0];
                if (data.progressList !== undefined) {
                    data.progressList.forEach((delta) => {
                        element.innerHTML +=
                            '<div class="color-tt" id="+delta.name+">' +
                            `<div style="text-align: center">\${delta.name}</div>` +
                            // '<div>' + JSON.stringify(delta) + '</div>' +
                            // '<div>' + delta.name + '</div>' +
                            // '<div>' + delta.no + '<br/></div>' +
                            '</div>'
                    })
                }
                if (data.issueList !== undefined) {
                    data.issueList.forEach((delta) => {
                        const ele = document.getElementsByClassName('color-tt')[delta.progress-1];
                        ele.innerHTML +=
                            '<div class="boxt">' +
                            '<div>' + delta.name + '</div>' +
                            // '<div>' + delta.name + '</div>' +
                            // '<div>' + delta.no + '<br/></div>' +
                            '</div>'
                    })
                }
            }
        })
    })

</script>
<body>

<div class="color-tl-wrap">
    <div class="color-tl">
        <div class="w-box">
            <ul class="flex-box margin-l-s">
                <li>프로젝트</li>
                <li>/</li>
                <li id="projectNo">samp</li>
            </ul>
        </div>
        <div class="b-box">
            <ul class="flex-box spb">
                <li><h3>KH3 보드</h3></li>
                <li>아이콘 아이콘 아이콘</li>
            </ul>
        </div>
        <div class="b-box flex-box e-box aib">
            <ul class="flex-box">
                <li style="display: flex; align-items: flex-end"><h3>KH3 보드</h3></li>
                <li>아이콘 아이콘 아이콘</li>
            </ul>
        </div>
    </div>
</div>
<div class="color-tt-wrap">
</div>

</body>
</html>
