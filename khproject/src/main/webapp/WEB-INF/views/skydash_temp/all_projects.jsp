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
					tr += "<td>" + "별표" +  "</td><td>" + '<a href="/work/'+ projectList[i].no +'"><img src="/resources/skydashTemp/images/icon_project1.svg" class="icon_style">' + projectList[i].name + "</a></td><td>"
							+ projectList[i].no + "</td><td>"+ projectList[i].info + "</td><td>"
							+ projectList[i].adminName + "</td><td>" + '<a href="/jira/update.do?no='+ projectList[i].no +'"><input type="button" value="설정" ></a><a href="/jira/delete.do?no='
							+ projectList[i].no +'"><input type="button" value="삭제" ></a>' + "</td></tr>";
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
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<%@ include file="/WEB-INF/views/component/header3.jsp"%>
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
									<%-- <button ><a href="${pageContext.request.contextPath}/jira/cptest">프로젝트 만들기</a></button> --%>
									<input class="navbar2_create project_create" type="button" value="프로젝트 만들기" onclick="location.href='/jira/insert.do'">
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
							
							<%-- <br><hr>
							<h3>프로젝트 목록</h3>
							<table border = "1">
								<colgroup>
									<col width = "50">
									<col width = "200">
									<col width = "100">
									<col width = "300">
									<col width = "100">
								</colgroup>
								<tr>
									<th>★</th>
									<th>이름</th>
									<th>키</th>
									<th>소개</th>
									<th>리드</th>
									<th>...</th>
									<th>...</th>
								</tr>
								<c:forEach items="${list }" var="dto">
									<tr>
										<td>★</td>
										<td><a href="${pageContext.request.contextPath}/work/${dto.no}">${dto.iconPath}${dto.name}</a></td>
										<td>${dto.no}</td>
										<td>${dto.info}</td>
										<td>~~리드~~</td>
										<td><input type="button" value="설정" onclick="location.href='/jira/update.do?no=${dto.no}'"></td>
										<td><input type="button" value="삭제" onclick="location.href='/jira/delete.do?no=${dto.no}'"></td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="7" align="right">
										<input type="button" value="프로젝트 만들기" onclick="location.href='/jira/insert.do'">
									</td>
								</tr>
							</table> --%>

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