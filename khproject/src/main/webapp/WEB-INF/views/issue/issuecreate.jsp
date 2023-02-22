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

		<form id="frmCreate">
			<div>
				<label for="project">프로젝트</label>
				<div class="dropdown">
					<select id="project" name="project" onchange="changeProject();">
						<!-- ajax로 채움 -->
					</select>
				</div>
			</div>

			<div>
				<label for="value">이슈 유형</label>
				<div class="dropdown">
					<select id="value" name="value">
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
				<label for="name">요약</label>
				<div class="dropdown">
					<input type="text" id="name" name="name">
				</div>
			</div>
			<div>
				<label for="content">설명</label>
				<div class="dropdown">
					<textarea id="content" name="content"></textarea>
				</div>
			</div>
			<!-- <div>
			<label for="maker">보고자</label>
			<div class="dropdown">
				<select id="maker" name="maker">
					<option value="내아이디">내아이디</option>
				</select>
			</div>
		</div> -->
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
				<label for="anceNo">연결된 이슈</label>
				<div class="dropdown">
					<select id="anceNo" name="anceNo">
						<!-- ajax채움 -->
					</select>
				</div>
			</div>
		</form>

		<div>

			<button onclick="createIssue2();" class="right-tab" type="button"
				tabindex="0">
				<span class="">만들기</span>
			</button>
			<button class="right-tab" type="button" tabindex="0">
				<span class="">취소</span>
			</button>

		</div>

	</div>
</div>

<script>
	function createIssue2() {
	
		
		var frmObj = {
			project : $("#project").val(),
			value : $("#value").val(),
			progress : $("#progress").val(),
			name : $("#content").val(),
			pic : $("#pic").val(),
			anceNo : $("#anceNo").val(),
		};

		console.log(JSON.stringify(frmObj));
		var projectno = $("#project").val();
		$.ajax({
            type: 'POST',
            url: "<%=request.getContextPath()%>/work/"+projectno+"/issue/api",
            data: JSON.stringify(frmObj),
            contentType: "application/json",
            //contentType: false,
            success: function (data) {
                console.log(data);     
                console.log("이슈만들기 성공");    
                modalOff();
                location.reload();
            }
        })	
	}
	
	function changeProject() {
		var projectno = $("#project").val();
    	$('#projectNo').text(projectno);
		console.log(projectno);
		$.ajax({
            type: 'GET',
            url: "<%=request.getContextPath()%>/work/"+projectno+"/issue/api",
            contentType: false,
            data: {keyword:null},
            success: function (data) {
                console.log(data);                
                if(data !== undefined){
               		html = '<option value="">이슈</option>';
                	data.issueList.forEach((delta) => {
                		html +=
                			'<option value="'+ delta.no +'">'+delta.name+'</option>';
                	})
                	$('#anceNo').html(html);
                	
                	html = '<option value="">상태</option>';
                	data.progressList.forEach((delta) => {
                		html +=
                			'<option value="'+ delta.progress +'">'+delta.name+'</option>';
                	})
                	$('#progress').html(html);

                }
            }
            
        })
        $.ajax({
            type: 'GET',
            url: "<%=request.getContextPath()%>/work/"+projectno+"/member/api",
            contentType: false,
            success: function (data) {
                console.log(data);     
                html = '<option value="">담당자</option>';
            	data.forEach((delta) => {
            		html +=
            			'<option value="'+ delta.id +'">'+delta.name+'('+delta.email+')</option>';
            	})
            	$('#pic').html(html);
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
                    if (data !== undefined) {
       	         	 	html = '<option value="">프로젝트</option>';
                        data.forEach((delta) => {
                        	html +=
                              '<option value="'+ delta.no +'">'+delta.name+'</option>';
                        })
                 	  	$('#project').html(html);
                    }
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