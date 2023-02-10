<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>내 작업 - Jira</title>
    <link href="/resources/skydashTemp/images/logo_mini.png"
          rel="shortcut icon" type="image/x-icon">
    <!-- plugins:css -->
    <link rel="stylesheet" href="/vendors/feather/feather.css">
    <link rel="stylesheet" href="/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet"
          href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/skydashTemp/js/select.dataTables.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet"
          href="/resources/skydashTemp/css/vertical-layout-light/style.css">
    <!-- endinject -->
</head>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
    .row-height {
        height: 600px;
    }

    .row-width {
        width: 300px;
        margin-right: 30px;
    }

    .main-panel {
        width: 100%;
    }

    .recent_project_bg {
        width: 100%;
        height: 300px;
        background-color: #FAFBFC;
        margin-bottom: 100px auto;
    }

    .recent_project {
        width: 230px;
        height: 250px;
        background-color: white;
        margin: 20px;
        float: left;
    }

    body {
        font-family: Arial;
    }

    .tab {
        overflow: hidden;
        border: 1px #0052CC;
        background-color: #FFFFFF;
        border-bottom: 1px solid black;
    }

    .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        transition: 0.3s;
        font-size: 17px;
    }

    .tab button:hover {
        color: #0052CC
    }

    .tab button.active {
        color: #0052cc;
        /* background-color: white; */
    }

    /* .tablinks.active {
        color: red;
        border-bottom: 1px red;
    } */
    .tabcontent {
        height: 500px;
        display: none;
        padding: 6px 12px;
        background-color: #FFFFFF;
        /* border: 1px solid #ccc; */
        border-top: none;
    }

    .tabcontent hover {
        display: none;
        padding: 6px 12px;
        background-color: #F5F6F8;
        /* border: 1px solid #ccc; */
    }

    .tab_1_1 {
        float: left;
    }
</style>
<script>
    $(function to_ajax() {
        $.ajax({
            type: 'GET',
            url: "<%=request.getContextPath()%>/work/project/api",
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data)
                const element = document.getElementsByClassName('recent_project_bg')[0];
                if (data !== undefined) {
                    data.forEach((delta) => {
                        element.innerHTML +=
                            '<div class="recent_project">' +
                            '<div>' + delta.iconPath + '<br/></div>' +
                            '<div>' + delta.name + '<br/></div>' +
                            '<div>' + delta.info + '<br/></div>' +
                            '<div>빠른 연결<br/></div>' +
                            '<a href="#">내 미해결 이슈	(n)<br/></a>' +
                            '<a href="#">완료된 이슈<br/></a>' +
                            '<a href="#">보드<br/></a>' +
                            /* '<div><button class="btn btn-sm btn-light bg-white dropdown-toggle" type="button" id="dropdownMenuDate2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">보드</button><div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuDate2"><a class="dropdown-item" href="#">보드명1</a><a class="dropdown-item" href="#">보드명2</a></div></div>' + */
                            '</div>'

                    })
                }
            }
        })
    })

    function to_ajax1(num) {
        $.ajax({
            type: 'GET',
            url: "<%=request.getContextPath()%>/work/issue/api",
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
                const element = document.getElementsByClassName('tabcontent')[num];
                if (data !== undefined) {
                    data.forEach((delta) => {
                        element.innerHTML +=
                            '<div class="tab_1_1">' +
                            '<div><p>아이콘</p>' +
                            /* '<div>' + JSON.stringify(delta) + '<br/></div>' + */
                            '<div>' + delta.no + '<br/></div>' +
                            '<div>' + delta.value + '<br/></div>' +
                            '<div>' + delta.name + '<br/></div>' +
                            '<div>' + delta.projectNo + '<br/></div>' +
                            '</div>'

                    })
                }
            }
        })
    }

</script>

<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <%@ include file="/WEB-INF/views/component/header2.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12 grid-margin">
                        <div class="row">
                            <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                <h3 class="font-weight-bold">내 작업</h3>
                                <h6 class="font-weight-normal mb-0">최근 프로젝트</h6>
                                <h6 class="font-weight-normal mb-0">
                                    <a href="#">모든 프로젝트 보기</a>
                                </h6>

                                <div class="recent_project_bg"></div>

                                <div class="tab">
                                    <button class="tablinks" id="tab_default"
                                            onclick="openTab(event, 'tab_1')">작업 항목
                                    </button>
                                    <button class="tablinks" onclick="openTab(event, 'tab_2')">확인함</button>
                                    <button class="tablinks" onclick="openTab(event, 'tab_3')">나에게
                                        할당됨(n)
                                    </button>
                                    <button class="tablinks" onclick="openTab(event, 'tab_4')">별표
                                        표시됨
                                    </button>
                                </div>

                                <div id="tab_1" class="tabcontent">
                                    <div>작업항목 ~지난주~</div>
                                    <div class="tab_1_1"></div>
                                </div>

                                <div id="tab_2" class="tabcontent">
                                    <div>확인함 ~지난주~</div>
                                    <div class="tab_2"></div>
                                </div>

                                <div id="tab_3" class="tabcontent">
                                    <div>진행</div>
                                    <div class="tab_3_1"></div>
                                    <div>해야 할 일</div>
                                    <div class="tab_3_2"></div>
                                </div>

                                <div id="tab_4" class="tabcontent">
                                    <div>별표 표시 목록</div>
                                    <div class="tab_4"></div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- plugins:js -->
<script src="/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="/vendors/chart.js/Chart.min.js"></script>
<script src="/vendors/datatables.net/jquery.dataTables.js"></script>
<script src="/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="/resources/skydashTemp/js/dataTables.select.min.js"></script>

<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="/resources/skydashTemp/js/off-canvas.js"></script>
<script src="/resources/skydashTemp/js/hoverable-collapse.js"></script>
<script src="/resources/skydashTemp/js/template.js"></script>
<script src="/resources/skydashTemp/js/settings.js"></script>
<script src="/resources/skydashTemp/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="/resources/skydashTemp/js/dashboard.js"></script>
<script src="/resources/skydashTemp/js/Chart.roundedBarCharts.js"></script>
<!-- End custom js for this page-->
<script>
    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
            to_ajax1(i);

        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    $(document).ready(function () {
        $("#tab_default").click();
    });
</script>
</body>

</html>

