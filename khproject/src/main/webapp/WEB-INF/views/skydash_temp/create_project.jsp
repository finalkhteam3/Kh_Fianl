<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- project 만들기 모달 -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window"
			style="overflow: auto; width: 800px; height: 600px;">

			<form id="frmCreate" class="center" method="post">
				<div class="title">
					<h2>프로젝트 만들기</h2>
					<h4>프로젝트 설정에서 언제든지 이러한 사항을 변경할 수 있습니다.</h4>
				</div>
				<div class="close-area">X</div>

				<div>
					<label for="name">이름*</label>
					<div class="dropdown">
						<input type="text" id="name" name="name" placeholder="팀 이름">
					</div>
				</div>
				<div>
					<label for="key">키*<br>이 프로젝트의 작업을 식별할 수 있도록 프로젝트의 이슈
						키를 나타내는 접두사를 선택합니다.
					</label>
					<div class="dropdown">
						<input type="text" id="key" name="key">
					</div>
				</div>
				<div>
					<label for="info">설명</label>
					<div class="dropdown">
						<input type="text" id="info" name="info" placeholder="프로젝트 소개">
					</div>
				</div>

			</form>

			<div>

				<button onclick="createproject();" class="right-tab" type="submit"
					tabindex="0">
					<span class="">프로젝트 만들기</span>
				</button>
				<button class="right-tab" type="button" tabindex="0">
					<span class="">취소</span>
				</button>

			</div>

		</div>
	</div>

	<script>
	function createproject() {
	
		
		var frmObj = {
				name : $("#name").val(),
				key : $("#key").val(),
				info : $("#info").val(),
		};

		console.log(JSON.stringify(frmObj));
		var projectno = $("#key").val();
		$.ajax({
            type: 'POST',
            url: "<%=request.getContextPath()%>/work/"+projectno+"/issue/api",
            data: JSON.stringify(frmObj),
            contentType: "application/json",
            //contentType: false,
            success: function (data) {
                console.log(data);     
                console.log("프로젝트 만들기 성공");    
                modalOff();
                location.reload();
            }
        })	
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
        
    </script>
</body>
</html>