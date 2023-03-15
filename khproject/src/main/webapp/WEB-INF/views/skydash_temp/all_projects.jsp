<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>프로젝트 - Jira</title>
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
<style>
.icon_style {
	height: 24px;
	width: 24px;
}

.jira-frontend {
	background: white;
	margin: 0;
	padding: 0;
	display: block;
	height: 100vh;
}

.body_wrap {
	margin: 0;
	padding: 70px 0 0;
	display: flex;
	height: 100%;
	width: 100%;
}

.body_wrap2 {
	width: 100%;
	margin: 0px;
	padding: 0px 40px;
	height: 100%;
}

.ap1 {
	margin: 0px;
	padding: 0px;
}
.ap2{
	margin: 24px 0px 16px;
	padding: 0;
	display: block;
}
.ap3{
	display: flex;
    align-items: flex-start;
    flex-wrap: nowrap;
    margin: 0;
    padding: 0;
}
.ap4{
	margin: 0;
    padding: 0;
	min-width: 0px;
    max-width: 100%;
    margin-bottom: 8px;
    flex: 1 1 auto;
}
.ap5{
	margin-top: 0;
}
.ap6{
	margin: 0;
    padding: 0;
	max-width: 100%;
    margin-bottom: 8px;
    margin-left: auto;
    padding-left: 32px;
    flex: 0 0 auto;
    white-space: nowrap;
}
.ap7{
	margin: 0;
    padding: 0;
}
.ap8{
	align-items: baseline;
    box-sizing: border-box;
    display: inline-flex;
    font-size: inherit;
    font-style: normal;
    font-family: inherit;
    font-weight: 500;
    max-width: 100%;
    position: relative;
    text-align: center;
    white-space: nowrap;
    cursor: pointer;
    height: 2.28571em;
    line-height: 2.28571em;
    vertical-align: middle;
    width: auto;
    justify-content: center;
	padding: 0px 10px;
	background: #0052CC;
	border-width: 0px;
	border-radius: 3px;
	color: white;
	text-decoration: none;
}
.ap9{
	margin: 0;
    padding: 0;
	margin-top: 16px;
	display: block;
}
.ap10{
	margin: 0;
    padding: 0;
	position: relative;
    display: flex;
    margin-bottom: 16px;
}
.ap11{
	margin: 0;
    padding: 0;
	margin-right: 16px;
	display: flex;
}
.ap12{
	border-radius: 3.01px;
	padding: 4px 6px;
    height: 2em;
    box-sizing: border-box;
    font-size: 14px;
    width: 100%;
    line-height: 1.42857;
    border-color: #CED4DA;
}
.input-group-text{
	height: 28px;
	border-radius: 3px;
	margin: 0 5px;
}
.ap13{
	margin: 0;
    padding: 0;
    display: block;
    position: relative;
}
.ap14{
	margin: 0;
	width: 100%;
    border-collapse: separate;
    border-spacing: 0px;
    table-layout: fixed;
    border-bottom: 2px solid #DFE1E6;
    box-sizing: border-box;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
    $(function show_project() {
        $.ajax({
            type: 'GET',
            url: "<%=request.getContextPath()%>/work/project/api",
							success : function(data) {
								console.log(data)
								var projectList = data;
								var tr = "<thead class=ap15><tr>" + '<td><img src="/resources/skydashTemp/images/star2.svg" class="icon_style"></td>'
										+ "<td>이름</td>" + "<td>키</td>"
										+ "<td>유형</td>" + "<td>리드</td>"
										+ "<td>관리</td>" + "</tr>";
								+"</thead>";
								$
										.each(
												projectList,
												function(i) {
													tr += "<td>"
															+ '<img src="/resources/skydashTemp/images/star.svg" class="icon_style">'
															+ "</td><td>"
															+ '<a href="/work/'+ projectList[i].no +'">'+'<img src="/resources/skydashTemp/images/icon_project1.svg" class="icon_style">'
															+ projectList[i].name
															+ "</a></td><td>"
															+ projectList[i].no
															+ "</td><td>"
															+ projectList[i].info
															+ "</td><td>"
															+ projectList[i].adminName
															+ "</td><td>"
															+ '<a href="/jira/update.do?no='
															+ projectList[i].no
															+ '"><input type="button" value="프로젝트 설정" ></a><a href="/jira/delete.do?no='
															+ projectList[i].no
															+ '"><input type="button" value="휴지통으로 이동" ></a>'
															+ "</td></tr>";
												});
								$("#projectList").append(tr);
							}
						})
			})
	/* 
	'<a href="/work/'+delta.no+'">보드<br/></a>' +
	<input type="button" value="설정" onclick="location.href='/jira/update.do?no=${dto.no}'"> 
	<input type="button" value="삭제" onclick="location.href='/jira/delete.do?no=${dto.no}'">
	 */
</script>
<body>
	<div class="jira-frontend">
		<!-- partial:partials/_navbar.html -->
		<div class="body_wrap">
			<%@ include file="/WEB-INF/views/component/header3.jsp"%>
			<div class="body_wrap2">
				<!-- partial -->
				<div class="ap1">

					<div class="ap2">
						<div class="ap3">
							<div class="ap4">
								<h3 class="ap5">프로젝트</h3>
							</div>
							<div class="ap6">
								<div class="ap7">
									<input class="ap8" type="button"
									value="프로젝트 만들기" onclick="location.href='/jira/insert.do'">
								</div>
							</div>
						</div>
						<div class="ap9">
							<div class="ap10">
								<div class="ap11" id="navbar-search-icon">
									<input type="text" class="ap12" id="navbar-search-input" aria-label="search" aria-describedby="search">
									<span class="input-group-text" id="search"> 
									<i class="icon-search"></i>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="ap13">
						<table class="ap14" id="projectList"></table>
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
</body>
</html>