<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- issue 만들기 모달 -->
<div id="modal" class="modal-overlay">
	<div class="modal-window"
		style="overflow: auto; width: 800px; height: 600px;">
		<div class="title">
			<h2>이슈만들기</h2>
		</div>
		<div class="close-area">X</div>
		<div>
			<label for="project">프로젝트</label> <br> <span class="dropdown">
				<select id="project" name="project" onchange="changeProject();">
					<!-- <option value="">프로젝트</option> -->


					<%-- <option value="${result.project}">${result.project}</option> --%>



			</select>
			</span> <br> <label for="">이슈 유형</label> <br> <span
				class="dropdown"> <select id="issue" name="issue">
					<option value="">이슈</option>


					<option value="${result.issue}">${result.issue}</option>



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
	function changeProject() {
		var projectno = $("#project").val();
		console.log(projectno);
		$.ajax({
            type: 'GET',
            url: "<%=request.getContextPath()%>/work/"+projectno+"/issue/api",
            contentType: false,
            data: {keyword:null},
            success: function (data) {
                console.log(data);                
                           
            }
        })
	}

        const modal = document.getElementById("modal")
        function modalOn() {
        	$.ajax({
                type: 'GET',
                url: "<%=request.getContextPath()%>/work/project/api",
                contentType: false,
                processData: false,
                success: function (data) {
                    console.log(data);                
                    html = '<option value="">프로젝트</option>';
                    if (data !== undefined) {
                        data.forEach((delta) => {
                        	html +=
                              '<option value="'+ delta.no +'">'+delta.name+'</option>';
                        })
                    }
                    $('#project').html(html);
           			modal.style.display = "flex"
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