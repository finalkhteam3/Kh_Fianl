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
table {
	border: 1px solid black;
	border-collapse: collapse;
	margin-top: 10px;
}

td {
	border: 1px solid black;
	padding: 3px 5px;
	text-aligh: center;
}
.icon_style{
	height: 24px;
	width: 24px;
}
/* .all_projects {
	width: 100%;
	background-color: #FAFBFC;
	margin-bottom: 100px auto;
}
.all_projects_list {
	width: 100%;
	height: 70px;
	background-color: white;
	margin: 5px;
	float: left;
} */
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
				var tr = "<thead>" + "<tr>"
				+ "<td>★</td>"
				+ "<td>이름</td>" + "<td>키</td>" + "<td>유형</td>"
				+ "<td>리드</td>"
				+ "<td>(더보기)</td>" 
				+ "</tr>";
				+"</thead>";
				$.each(projectList, function(i) {
					tr += "<td>" + "별표" +  "</td><td>" + '<img src="/resources/skydashTemp/images/icon_project1.svg" class="icon_style">' + projectList[i].name + "</td><td>"
							+ projectList[i].no + "</td><td>"+ projectList[i].info + "</td><td>"
							+ "리드 이름" + "</td><td>" + '<img src="/resources/skydashTemp/images/meatball_menu.png" class="icon_style">' + "</td></tr>";
				});
				$("#projectList").append(tr);
			}
		})
	})
</script>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<%@ include file="/WEB-INF/views/component/header2.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">

			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-12 grid-margin">
							<div class="row">
								<div class="col-12 col-xl-8 mb-4 mb-xl-0">
									<h3 class="font-weight-bold">프로젝트</h3>
								</div>
								<div>
									<button class="navbar2_create">프로젝트 만들기</button>
								</div>
								<div>
									<div class="input-group-prepend hover-cursor"
										id="navbar-search-icon">
										<span class="input-group-text" id="search"> <i
											class="icon-search"></i>
										</span>
									</div>
									<input type="text" class="form-control"
										id="navbar-search-input" aria-label="search"
										aria-describedby="search">
								</div>
							</div>

							<div id="projectList"></div>
							<!-- <div class="all_projects"></div> -->

							<!-- <table>
								<thead>
									<tr>
										<th></th>
									</tr>
								</thead>
								<tbody class="all_projects">
									동적 데이터 생성
								</tbody>
							</table> -->


							<%--<table width=100% border=1px>
								<tr>
									<th>★</th>
									<th>이름</th>
									<th>키</th>
									<th>유형</th>
									<th>리드</th>
									<th>(공백)</th>
								</tr>
								 <c:forEach items="${members}" var="member">
									<tr>
										<td>${param.}</td>
										<td>${member.pwd}</td>
										<td>${member.name}</td>
										<td>${member.email}</td>
										<td>${member.joinDate}</td>
									</tr>
								</c:forEach> 
								</table>--%>
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
</body>
</html>