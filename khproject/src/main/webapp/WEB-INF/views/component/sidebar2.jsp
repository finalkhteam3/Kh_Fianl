<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>

	window.onpopstate = function () {
		history.go(0);
	};

	const clickLink = (path, str) => {
		const check = document.getElementById("main");
		<%--location.href = "${pageContext.request.contextPath}"+path+str;--%>
		$(check).load("${pageContext.request.contextPath}"+path+str);
		history.pushState(null, null, "?page=" + str)
		// location.reload();

	}

</script>
	<nav class="sidebar sidebar-offcanvas" id="sidebar">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link" onclick="clickLink('/',`ajax`)">
					<i class="icon-grid menu-icon"></i> <span class="menu-title">프로젝트명</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
									onclick="clickLink('/',`admin`)" aria-expanded="false" aria-controls="ui-basic">
					<i class="icon-layout menu-icon"></i> <span class="menu-title">로드맵</span>
					<i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="ui-basic">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><a class="nav-link"
							href="pages/ui-features/buttons.html">Buttons</a></li>
						<li class="nav-item"><a class="nav-link"
							href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
						<li class="nav-item"><a class="nav-link"
							href="pages/ui-features/typography.html">Typography</a></li>
					</ul>
				</div></li>
			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
									onclick="clickLink('/', `board`)" aria-expanded="false"
				aria-controls="form-elements"> <i class="icon-columns menu-icon"></i>
					<span class="menu-title">보드</span> <i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="form-elements">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><a class="nav-link"
							href="pages/forms/basic_elements.html">Basic Elements</a></li>
					</ul>
				</div></li>
			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
									onclick="clickLink('/work/',`project`)" aria-expanded="false" aria-controls="charts"> <i
					class="icon-bar-graph menu-icon"></i> <span class="menu-title">프로젝트
						페이지</span> <i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="charts">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><a class="nav-link"
							href="pages/charts/chartjs.html">ChartJs</a></li>
					</ul>
				</div></li>
			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
				href="#tables" aria-expanded="false" aria-controls="tables"> <i
					class="icon-grid-2 menu-icon"></i> <span class="menu-title">프로젝트
						설정</span> <i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="tables">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><a class="nav-link"
							href="pages/tables/basic-table.html">Basic table</a></li>
					</ul>
				</div></li>
			<!-- 
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false"
                       aria-controls="icons">
                        <i class="icon-contract menu-icon"></i>
                        <span class="menu-title">Icons</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="icons">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="pages/icons/mdi.html">Mdi icons</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                        <i class="icon-head menu-icon"></i>
                        <span class="menu-title">User Pages</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="auth">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                            <li class="nav-item"><a class="nav-link" href="pages/samples/register.html"> Register </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false"
                       aria-controls="error">
                        <i class="icon-ban menu-icon"></i>
                        <span class="menu-title">Error pages</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="error">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                            <li class="nav-item"><a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pages/documentation/documentation.html">
                        <i class="icon-paper menu-icon"></i>
                        <span class="menu-title">Documentation</span>
                    </a>
                </li>
             -->
		</ul>
	</nav>
</html>