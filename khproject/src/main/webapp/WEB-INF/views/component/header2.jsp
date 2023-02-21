<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

.navbar2 {
	overflow: hidden;
	background-color: #FFFFFF;
	float: left;
}

.navbar2 a {
	float: left;
	display: inline-block;
	font-size: 16px;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: black;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

.navbar2 a:hover, .dropdown:hover .dropbtn {
	color: #0052CC;
	background-color: #E1EDFF;
}

.dropdown-content {
	position: absolute;
	background-color: #FFFFFF;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #F0F0F0;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.navbar2_create {
	color: white;
	border: none;
	background-color: #0052CC;
	border-radius: 3px;
}

.navbar2_create:hover {
	background-color: #1963D1;
}
</style>

<body>
	<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<div
			class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
			<a class="navbar-brand brand-logo mr-5" href="/jira/your-work"><img
				src="/resources/skydashTemp/images/logo.png" class="mr-2" alt="logo" /></a>
			<a class="navbar-brand brand-logo-mini" href="/jira/your-work"><img
				src="/resources/skydashTemp/images/logo_mini.png" alt="logo" /></a>
		</div>
		<div
			class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
			<div class="navbar2">
				<div class="dropdown">
					<button class="dropbtn" onclick="dropbtn()">
						내 작업 <i class="fa fa-caret-down"></i>
					</button>
					<div style="display: none;" class="dropdown-content" id="dropdown-content">
						<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
							3</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" onclick="dropbtn()">
						프로젝트 <i class="fa fa-caret-down"></i>
					</button>
					<div style="display: none;" class="dropdown-content" id="dropdown-content">
						<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
							3</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn" onclick="dropbtn()">
						사용자 <i class="fa fa-caret-down"></i>
					</button>
					<div style="display: none;" class="dropdown-content" id="dropdown-content">
						<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
							3</a>
					</div>
				</div>
				<div>
					<button class="navbar2_create">만들기</button>
				</div>

			</div>
			<ul class="navbar-nav mr-lg-2">
				<li class="nav-item nav-search d-none d-lg-block">
					<div class="input-group">
						<div class="input-group-prepend hover-cursor"
							id="navbar-search-icon">
							<span class="input-group-text" id="search"> <i
								class="icon-search"></i>
							</span>
						</div>
						<input type="text" class="form-control" id="navbar-search-input"
							placeholder="Search now" aria-label="search"
							aria-describedby="search">
					</div>
				</li>


			</ul>
			<ul class="navbar-nav navbar-nav-right">
				<li class="nav-item dropdown"><a
					class="nav-link count-indicator dropdown-toggle"
					id="notificationDropdown" href="#" data-toggle="dropdown"> <i
						class="icon-bell mx-0"></i> <span class="count"></span>
				</a>
					<div
						class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
						aria-labelledby="notificationDropdown">
						<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
						<a class="dropdown-item preview-item">
							<div class="preview-thumbnail">
								<div class="preview-icon bg-success">
									<i class="ti-info-alt mx-0"></i>
								</div>
							</div>
							<div class="preview-item-content">
								<h6 class="preview-subject font-weight-normal">Application
									Error</h6>
								<p class="font-weight-light small-text mb-0 text-muted">
									Just now</p>
							</div>
						</a> <a class="dropdown-item preview-item">
							<div class="preview-thumbnail">
								<div class="preview-icon bg-warning">
									<i class="ti-settings mx-0"></i>
								</div>
							</div>
							<div class="preview-item-content">
								<h6 class="preview-subject font-weight-normal">Settings</h6>
								<p class="font-weight-light small-text mb-0 text-muted">
									Private message</p>
							</div>
						</a> <a class="dropdown-item preview-item">
							<div class="preview-thumbnail">
								<div class="preview-icon bg-info">
									<i class="ti-user mx-0"></i>
								</div>
							</div>
							<div class="preview-item-content">
								<h6 class="preview-subject font-weight-normal">New user
									registration</h6>
								<p class="font-weight-light small-text mb-0 text-muted">2
									days ago</p>
							</div>
						</a>
					</div></li>
				<li class="nav-item nav-profile dropdown"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
					id="profileDropdown"> <img
						src="/resources/skydashTemp/images/faces/user_face.png"
						alt="profile" />
				</a>
					<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
						aria-labelledby="profileDropdown">
						<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
							Settings
						</a> <a class="dropdown-item"> <i
							class="ti-power-off text-primary"></i> Logout
						</a>
					</div></li>
				<li class="nav-item nav-settings d-none d-lg-flex"><a
					class="nav-link" href="#"> <i class="icon-ellipsis"></i>
				</a></li>
			</ul>
			<button
				class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
				type="button" data-toggle="offcanvas">
				<span class="icon-menu"></span>
			</button>
		</div>
	</nav>
	<script>
		function dropbtn() {
			let click = document.getElementById("dropdown-content");
			if (click.style.display === "none") {
				click.style.display = "block";

			} else {
				click.style.display = "none";

			}
		}
	</script>
</body>
</html>