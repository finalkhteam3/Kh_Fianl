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
			<label for="project">프로젝트</label>
			<div class="dropdown">
				<select id="project" name="project" onchange="changeProject();">
					<!-- ajax로 채움 -->
				</select>
			</div>
		</div>

		<div>
			<label for="issue">이슈 유형</label>
			<div class="dropdown">
				<select id="issue" name="issue">
					<option value="2">작업</option>
				</select>
			</div>
		</div>
		<hr>

		<div>
			<label for="progress">상태</label>
			<div class="dropdown">
				<select id="progress" name="progress">
					<!-- ajax로 채움 -->
				</select>
			</div>
		</div>
		<hr>
		<div>
			<label for="summary">요약</label>
			<div class="dropdown">
				<input type="text" id="summary" name="summary">
			</div>
		</div>
		<div>
			<label for="description">설명</label>
			<div class="dropdown">
				<textarea id="description" name="description"></textarea>
			</div>
		</div>
		<div>
			<label for="maker">보고자</label>
			<div class="dropdown">
				<select id="maker" name="maker">
					<option value="내아이디">내아이디</option>
				</select>
			</div>
		</div>
		<div>
			<label for="pic">담당자</label>
			<div class="dropdown">
				<select id="pic" name="pic">
					<!-- ajax채움 -->
				</select>
			</div>
		</div>
		<hr>

		<div>
			<label for="file">첨부파일</label>
			<div class="dropdown">
			<input type="file" id="file" name="file">
			</div>
		</div>
		
		<div>
			<label for="issue">연결된 이슈</label>
			<div class="dropdown">
				<select id="issue" name="issue">
					<!-- ajax채움 -->
				</select>
			</div>
		</div>
		

	<div>

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
                if(data !== undefined){
                html += '<option value="">이슈</option>';
                	data.issueList.forEach((delta) => {
                		html +=
                			'<option value="'+ delta.no +'">'+delta.name+'</option>';
                	})
                }
                $('#issue').html(html);
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