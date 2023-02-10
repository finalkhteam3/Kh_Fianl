<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Modal</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: gray;
	border: 1px solid rgba(0, 0, 0, 0);
	/* display: none; */
}

#modal .modal-window {
	background: white;
	backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 800px;
	height: 900px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 40px 0;
	margin: auto;
	border: solid black 2px;
	/* overflow-x: hidden;
    overflow-y: scroll;
    scroll-snap-type: y mandatory; */
}

#modal .title {
	padding-left: 10px;
	display: inline;
	color: black;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	color: black;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	color: black;
}

/* .summary {
    background-color: transparent;
    border: 0px;
    box-sizing: border-box;
    color: inherit;
    cursor: inherit;
    font-size: 14px;
    min-width: 0px;
    outline: none;
    width: 100%;
    line-height: 1.42857;

} */
.right-tab {
	float: right;
}

.caret {
	display: inline-block;
	border: 4px solid transparent;
	border-top: 4px dashed;
}

.dropdown {
	position: relative;
}

.dropdown-toggle {
	cursor: pointer;
}

.dropdown-menu {
	list-style-type: none;
	position: absolute;
	z-index: 1000;
	top: 100%;
	left: 0;
	min-width: 160px;
	padding: 5px 0;
	margin: 2px 0 0;
	display: none;
	background: #fff;
	border: 1px solid rgba(0, 0, 0, .15);
	border-radius: 4px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
}

.open>.dropdown-menu {
	display: block;
}

.dropdown-menu>li>a {
	display: block;
	color: black;
	padding: 3px 20px;
	line-height: 1.5;
	text-decoration: none;
}

.dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover {
	background: #f5f5f5;
}
</style>


</head>

<body>
	<div id="container">
		<h2>f5</h2>
	</div>


	<div id="modal" class="modal-overlay">
		<div class="modal-window"
			style="overflow: auto; width: 800px; height: 600px;">
			<div class="title">
				<h2>이슈만들기</h2>
			</div>
			<div class="close-area">X</div>
			<div>
				<label for="project">프로젝트</label> <br> <span class="dropdown">
					<select id="project" name="project">
						<option value="">프로젝트</option>

						<c:forEach var="result" items="${projectList}">
							<option value="${result.project}">${result.project}</option>
						</c:forEach>


				</select>
				</span> <br> <label for="">이슈 유형</label> <br> <span
					class="dropdown"> <select id="issue" name="issue">
						<option value="">이슈</option>

						<c:forEach var="result" items="${issueList}">
							<option value="${result.issue}">${result.issue}</option>
						</c:forEach>


				</select>
				</span>
				<p>자세히 알아보기</p>
				</span>
				<hr>

				<label for="">상태</label> <br> <span class="dropdown">
					<button class="dropdown-toggle">
						상태 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">상태1</a></li>
						<li><a href="#">상태2</a></li>

					</ul>
					<p>이슈 초기 상태</p>
				</span> <label for="">요약</label> <br> <input type="text"> <br>
				<br> <label for="">설명</label> <br> <input type="textarae">
				<br> <label for="">보고자</label> <br>
				<button>보고자</button>
				<br> <label for="">담당자</label> <br>
				<button>담당자</button>
				<br> <span class="">나에게 할당</span> <br> <label for="">레이블</label>
				<br>
				<button>레이블</button>
				<br> <label for="">첨부파일</label> <br> <input type="file">
				<br> <label for="">연결된 이슈</label> <br>
				<button>연결</button>
				<br>
				<button>연결</button>
				<br> <label for="">Flagged</label> <br>
				<button>flag</button>
				<p>allow</p>
			</div>

			<div>
				<input type="checkbox" id="" name=""> <label for="">다른이슈만들기</label>
				<button class="right-tab" type="button" tabindex="0">
					<span class="">만들기</span>
				</button>
				<button class="right-tab" type="button" tabindex="0">
					<span class="">취소</span>
				</button>

			</div>

		</div>
	</div>

	<script>

        const modal = document.getElementById("modal")
        function modalOn() {
            modal.style.display = "flex"
        }
        function isModalOn() {
            return modal.style.display === "flex"
        }
        function modalOff() {
            modal.style.display = "none"
        }

        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modalOff();
        })
        $(".dropdown-toggle").click(function (event) {
            event.stopPropagation();
            var parent = $(this).parent(".dropdown");
            $('.dropdown').not(parent).removeClass("open");
            parent.toggleClass("open");
        });
        $(window).click(function () {
            $(".dropdown").removeClass("open");
        });
    </script>

</body>

</html>