<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>내 작업 - Jira</title>
<link href="/resources/skydashTemp/images/logo_mini.png"
	rel="shortcut icon" type="image/x-icon">
<!-- plugins:css -->
<!--<link rel="stylesheet" href="/vendors/feather/feather.css">
<link rel="stylesheet" href="/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="/vendors/css/vendor.bundle.base.css"> -->
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- <link rel="stylesheet"
	href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/skydashTemp/js/select.dataTables.min.css"> -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="/resources/skydashTemp/css/vertical-layout-light/style.css">
<!-- endinject -->
</head>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
a:hover{
	text-decoration: none;
}
.body_wrap {
	margin: 0;
	padding: 60px 0 0;
}

.body_wrap2 {
	margin: 0 40px;
	padding: 0;
	display: block;
	position: relative;
	height: 100%;
}

#my_work {
	margin: 24px 0 16px;
	padding: 0;
	display: block;
}

#rc1 {
	display: block;
	padding: 24px 0 0;
	margin: 0 -40px 32px;
	display: block;
	background-color: #FAFBFC;
}

#rc2 {
	overflow-x: auto;
	margin: 0;
	padding: 0;
	display: block;
}

.recent_project_bg {
	display: inline-flex;
	white-space: nowrap;
	padding: 14px 48px 14px 28px;
	height: 168px;
}

.rc3 {
	display: flex;
	width: 220px;
	height: 140px;
	padding-top: 16px;
	flex-direction: column;
	background-color: white;
	border-top: none;
	border-right: none;
	border-bottom: none;
	border-left: 20px solid #B3D4FF;
	border-radius: 3px;
	box-sizing: border-box;
	box-shadow: var(--ds-shadow-raised,0 1px 1px rgba(9,30,66,0.25), 0 0 1px rgba(9,30,66,0.31)); 
	transition: box-shadow 0.3s ease-in-out 0s, border-color 0.6s ease-in 0s;
	margin: 0 0 0 12px;
}

#all_projects {
	/* float: right; */
	text-decoration: underline;
}

#recent_projects {
	justify-content: space-between;
	display: flex;
	justify-content: space-between;
	padding: 0 48px 0 40px;
}
.icon{
	border-radius: 3px;
	overflow: hidden;
	border: 0;
	margin: 0;
	padding: 0;
}
.icon_span{
	display: inline-flex;
	text-align: left;
}
.icon_a{
	text-align: left;
	width: 100%;
	margin-bottom: 12px;
	margin-left: -12px;
	display: flex;
	-webkit-box-align: center;
    align-items: center;
    text-decoration: none;
}
.p0{
	display: inline-block;
    vertical-align: top;
    flex: 1 1 0%;
    margin: 0;
    margin-left: 8px;
    margin-right: 4px;
    overflow: hidden;
    padding: 0;
    text-align: left;
}
.p1{
	font-size: 1em;
    font-style: inherit;
    letter-spacing: -0.003em;
    color: var(--ds-text,#172B4D);
    white-space: nowrap;
    font-weight: 600;
    line-height: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    margin: 0px;
    padding: 0;
    height: 16px;
}
.p2{
	font-size: 11px;
    color: var(--ds-text,#172B4D);
    letter-spacing: -0.08px;
    margin: 0px;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    text-transform: none;
    font-weight: normal;
    line-height: 14px;
    padding: 0;
}
.iss0{
	flex: 1 1 0%;
	margin: 0;
    padding: 0;
    display: block;
    white-space: nowrap;
    color: rgb(107,119,140);
}
.iss00{
	display: flex;
    margin: 0;
    padding: 0;
    padding-left: 16px;
    padding-right: 12px;
    margin-bottom: 2px;
}
.iss000{
	margin: 12px 0 0 0;
	margin-top: 0;
	line-height: 1.33333;
	font-weight: var(--ds-font-weight-semibold,600);
	color: var(--ds-text-subtlest,#6B778C);
	padding: 0;
    padding-left: 4px;
    padding-bottom: 4px;
    font-size: 11px;
    display: block;
}
.iss1{
	margin: 0;
    padding: 0;
	display: flex;
    padding-left: 16px;
    padding-right: 12px;
    margin-bottom: 2px;
}
.iss2{
	flex: 1 1 0%;
    display: flex;
    max-width: 100%;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    border-radius: 3px;
    font-size: 11px;
    text-decoration: none !important;
    color: #172B4D;
    padding: 4px 0px 4px 4px;
}
.tab0{
	display: flex;
    max-width: 100%;
    min-height: 0%;
    flex-basis: 100%;
    flex-direction: column;
    -webkit-box-flex: 1;
    margin: 0;
    padding: 0;
}
.tab {
	overflow: hidden;
	border: 1px #0052CC;
	background-color: #FFFFFF;
	border-bottom: 2px solid #EBECF0;
	display: flex;
    margin: 0px;
    padding: 0px;
    position: relative;
    font-weight: 500;
}

.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	transition: 0.3s;
}

.tab button:hover {
	color: #0052CC
}

.tab button.active {
	color: #0052cc;
	/* background-color: white; */
}

.tabcontent {
	height: 100vh;
	display: none;
	background-color: #FFFFFF;
	/* border: 1px solid #ccc; */
	border-top: none;
	display: flex;
    padding: 0px 8px;
}

.tabcontent hover {
	display: none;
	padding: 6px 12px;
	background-color: #F5F6F8;
	text-decoration: none;
	/* border: 1px solid #ccc; */
}
.tablinks{
	cursor: pointer;
    line-height: 1.8;
    margin: 0px;
    padding: 2px 8px;
    position: relative;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    display: block;
}
.tc1{
	margin: 0;
    padding: 0;
	display: flex;
    flex-direction: column;
    width: 100%;
    margin-top: 8px;
}
.tc2{
	color: var(--ds-text-subtlest,#6B778C) !important;
    margin: 8px 0 0 0;
    padding: 0;
    font-size: 0.75em;
    font-weight: bold;
}
.yw00{
	margin-top: 2px;
    flex: 1 1 0%;
    padding: 2px;
    display: flex;
    flex-direction: row;
    -webkit-box-pack: start;
    justify-content: flex-start;
    -webkit-box-align: center;
    align-items: center;
    border-radius: 3px;
    text-decoration: none;
    color: var(--ds-link,#172B4D);
}
.yw0{
	height: 24px;
    width: 24px;
    display: inline-block; 
    margin: 0;
    padding: 0;
}
.yw1{
	height: 24px;
    width: 24px;
    border-radius: 3px;
    display: inline-block;;
}
.yw2{
	flex: 6 1 0%;
	display: flex;
    flex-direction: column;
    -webkit-box-pack: start;
    justify-content: flex-start;
    margin: 0px 8px;
    width: 150px;
}
.yw3{
	color: var(--ds-text,var(--ds-text,#172B4D));
    font-weight: var(--ds-font-weight-semibold,600);
    letter-spacing: -0.003em;
    -webkit-box-flex: 1;
    flex-grow: 1;
    font-size: 14px;
    line-height: 20px;
    margin: 0px;
    display: inline-block;
}
.yw4{
	-webkit-box-flex: 1;
    flex-grow: 1;
    margin: 0px;
    font-size: 11px;
    color: var(--ds-text-subtlest,#6B778C);
    line-height: 14px;
}
.yw5{
	flex: 1 1 0%;
    margin: 0px;
    color: var(--ds-text-subtlest,#6B778C);
    min-width: 8em;
    font-size: 11px;
    padding-right: 16px;
    display: inline-block;
}
.yw7{
	height: 32px;
    width: 32px;
    -webkit-box-align: stretch;
    align-items: stretch;
    background-color: var(--ds-surface-overlay, #FFFFFF);
    border-radius: 50%;
    box-sizing: content-box;
    cursor: inherit;
    display: flex;
    flex-direction: column;
    -webkit-box-pack: center;
    justify-content: center;
    outline: none;
    overflow: hidden;
    transform: translateZ(0px);
    transition: transform 200ms ease 0s, opacity 200ms ease 0s;
    box-shadow: 0 0 0 2px var(--ds-surface-overlay, #FFFFFF);
    border: none;
    margin: 2px;
    padding: var(--ds-scale-0, 0px);
    font-size: inherit;
    font-family: inherit;
    position: relative;
    z-index: 5;
}
.yw8{
	display: flex;
    width: 100%;
    height: 100%;
    flex: 1 1 100%;
    border: 0;
    margin: 0;
    padding: 0;
}
.ul1{
	margin-top: 0;
	display: flex;
	margin-right: 8px;
    line-height: 1;
    list-style-type: none !important;
    padding: var(--ds-scale-0, 0px);
}
.li1{
	margin-right: -8px;
	display: list-item;
    text-align: -webkit-match-parent;
    line-height: 1;
    list-style-type: none;
}
.li2{
	margin-right: -8px;
	display: list-item;
    text-align: -webkit-match-parent;
}
</style>
<script>
    $(function show_project() {
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
                            '<div class="rc3">' +
                            '<a class="icon_a" href="/work/'+delta.no+'"><span class="icon_span"><img class="icon" src="/resources/skydashTemp/images/icon_project1.svg" width="24px" height="24px"></span>' +
                            /* '<div>' + delta.iconPath + '<br/></div>' + */
                            '<div class="p0"><p class="p1">' + delta.name + '</p>' +
                            '<p class="p2">' + delta.info + '</p></div></a>' +
                            '<div class="iss0"><div class="iss00"><p class="iss000">빠른 연결</p></div>' +
                            '<div class="iss1"><a class="iss2" href="#">내 미해결 이슈</a></div>' +
                            '<div class="iss1"><a class="iss2" href="#">완료된 이슈</a></div></div>' +
                            /* '<a href="/work/'+delta.no+'">보드<br/></a>' + */
                            /* '<div><button class="btn btn-sm btn-light bg-white dropdown-toggle" type="button" id="dropdownMenuDate2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">보드</button><div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuDate2"><a class="dropdown-item" href="#">보드명1</a><a class="dropdown-item" href="#">보드명2</a></div></div>' + */
                            '</div>'

                    })
                }
            }
        })
    })

    
</script>

<body>
	<div id="jira-frontend">
		<div>
			<div>
				<%@ include file="/WEB-INF/views/component/header3.jsp"%>
				<div>
					<div class="body_wrap">
						<div class="body_wrap2">
							<div style="height: 100vh;">
								<div id="my_work">
									<h3>내 작업</h3>
								</div>
								<section id="rc1">
									<div id="recent_projects">
										<h5>최근 프로젝트</h5>
										<a id="all_projects"
											href="${pageContext.request.contextPath}/jira/projects">모든
											프로젝트 보기</a>
									</div>
									<div id="rc2">
										<section class="recent_project_bg"></section>
									</div>
								</section>

								<div class="tab0">
									<div class="tab">
										<button class="tablinks" id="tab_default"
											onclick="openTab(event, 'tab_1')">작업 항목</button>
										<button class="tablinks" onclick="openTab(event, 'tab_2')">확인함</button>
										<button class="tablinks" onclick="openTab(event, 'tab_3')">나에게
											할당됨</button>
										<button class="tablinks" onclick="openTab(event, 'tab_4')">별표
											표시됨</button>
									</div>

									<div id="tab_1" class="tabcontent">
										<div class="tc1">
										<h6 class="tc2">오늘</h6>
										<div class="tab_1"></div>
										</div>
									</div>

									<div id="tab_2" class="tabcontent">
										<div class="tc1">
										<h6 class="tc2">오늘</h6>
										<div class="tab_2"></div>
										</div>
									</div>

									<div id="tab_3" class="tabcontent">
										<div class="tc1">
										<h6 class="tc2">진행</h6>
										<div class="tab_3 tab_3_1"></div>
										<h6 class="tc2">해야 할 일</h6>
										<div class="tab_3 tab_3_2"></div>
										</div>
									</div>

									<div id="tab_4" class="tabcontent">
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
	</div>
	<script>
	function to_tab(num) {
	    $.ajax({
	        type: 'GET',
	        url: "<%=request.getContextPath()%>/work/issue/api",
	        contentType: false,
	        processData: false,
	        success: function (data) {
	            console.log(data);
	            var ctabName = ".tab_"+num;
	            var tabName = "tab_"+num;
	            var html = "";
	            $(ctabName).empty();
	            if (data !== undefined) {
	                data.forEach((delta) => {
	                    html +=
	                        '<div style="width:100%; display:block;" class="'+tabName+'" >' + 
	                        '<a class="yw00"><div class="yw0"><img class="yw1" src="/resources/skydashTemp/images/icon_issue1.svg"></div>' +
	                        /* '<div>' + JSON.stringify(delta) + '<br/></div>' + */
	                        '<span class="yw2"><span class="yw3">' + delta.name + '</span>' +
	                        /* '<span>' + delta.no + '</span>' +
	                        '<span>' + delta.value + '</span>' + */
	                        /* '<span>' + delta.maker + '</span>' +
	                        '<span>' + delta.pic + '</span>' + */
	                        '<span class="yw4">' + delta.projectNo + '</span></span>' +
	                        '<span class="yw5">Updated</span>'+
	                        '<div class="yw6"><ul class="ul1"><li class="li1"><span class="yw7"><img class="yw8" src="/resources/skydashTemp/images/faces/user_face.png"></span></li><li class="li2"><span class="yw7"><img class="yw8" src="/resources/skydashTemp/images/faces/user_face.png"></span></li></ul></div></a></div>'
	
	                })
	                $(ctabName).html(html);
	            }
	        }
	    })
	}

	function openTab(evt, tabName) {
	    var i, tabcontent, tablinks;
	    $(".tabcontent").css("display", "none");
		$(".tablinks").removeClass("active");
		
		tabName = "#"+tabName;
		$(tabName).css("display", "block");
		$(evt.target).addClass("active");
		$(".tablinks").each(function(idx){
			if($(this).hasClass("active")){
				to_tab(idx+1);
			}
		});
	
	}
    /* function openTab(evt, tabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
            if(i=0)
            	to_ajax1(i);
            if(i=1)
            	to_ajax2(i);
            if(i=2)
            	to_ajax3(i);
            if(i=3)
            	to_ajax4(i);
            if(i=4)
            	to_ajax5(i);

        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    } */

    $(document).ready(function () {
        /* $("#tab_default").css("color","#0052cc"); */
        $("#tab_default").click();
    });
</script>
</body>

</html>

