<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div id="root">
		<button type="button" id="modal_opne_btn">모달 창 열기</button>
		<div id="modal_issue">
			<div class="modal_content">
				<div class="issuedetail">
					<div id="left">
						<p>issue</p>
						<h2>title</h2>
						<button id=btn_1>첨부</button>
						<button id=btn_2>하위 이슈 추가</button>
						<button id=btn_3>이슈 연결</button>
						<p>설명</p>
						<input type="text" value="설명 추가하기..." id=text> <br> <br>
						<p>활동</p>
						표시:
						<button id=btn_4>모두</button>
						<button id=btn_4>댓글</button>
						<button id=btn_4>기록</button>
						<br><br> <input type="text" value="댓글 추가..."
							style="width: 600px; height: 40px;">
					</div>

					<div id="right">
						<br>
						<button type="button" id="modal_close_btn">X</button>
						<br> <br>
						<div>
							<div class="dropdown">
								<button onclick="myFunction()" class="dropbtn">해야 할 일</button>
								<div id="myDropdown" class="dropdown-content">
									<a href="#">공지</a> <a href="#">기한 못 맞출 것 같은 이슈</a> <a href="#">진행</a> <a href="#">완료됨</a> <a href="#">워크플로 보기</a>
								</div>
							</div>
							<br>
							<div>
								<button
									style="width: 380px; height: 48px; text-align: left; background-color: white; border-color: gray;">세부
									정보</button>
							</div>
							<div id="block">
								<p>보고자</p>
								<p>담당자</p>
								<p>Automation</p>
							</div>
							<div>
								<button
									style="width: 380px; height: 48px; text-align: left; background-color: white; border-color: gray;">더
									많은 필드</button>
							</div>
							<div id="afs">
								<br>
								<p>만들기</p>
								<p>업데이트 됨</p>
							</div>
						</div>
					</div>
			</div>
			
			<script>
    document.getElementById("modal_opne_btn").onclick = function() {
        document.getElementById("modal_issue").style.display="block";
    }
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal_issue").style.display="none";
    }   
    </script>
    <script>
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }
    window.onclick = function(event) {
    	  if (!event.target.matches('.dropbtn')) {

    	    var dropdowns = document.getElementsByClassName("dropdown-content");
    	    var i;
    	    for (i = 0; i < dropdowns.length; i++) {
    	      var openDropdown = dropdowns[i];
    	      if (openDropdown.classList.contains('show')) {
    	        openDropdown.classList.remove('show');
    	      }
    	    }
    	  }
    	}
</script>
		</div>
	</div>







