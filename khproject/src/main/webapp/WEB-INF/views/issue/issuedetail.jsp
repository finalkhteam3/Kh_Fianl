<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
	<div id="root">
		<button type="button" id="modal_open_btn" style="display: none">모달창열기</button>
		<div id="modal_issue">
			<div class="modal_content">
				<div class="issuedetail">
				<div id="left">
					<p class=projectNo>issue</p>
					<h2 class=name>title</h2>
					<button id=btn_1>첨부</button>
					<button id=btn_2>하위 이슈 추가</button>
					<button id=btn_3>이슈 연결</button>
					<p>설명</p>
					 <input type="text" value="설명 추가하기..." id=commenta onclick="frm()">
					 <div id="frm" style="display: none"> 
						<form action="<%=request.getContextPath()%>/ckboard" method="post"
							enctype="multipart/form-data" id="frm">
							<textarea name="ckContent" id="ckContent" class="question-answer" placeholder="dfg"></textarea>
							<button id="savebutton"
								style="border: none; background-color: #0052CC; color: white; border-radius: 3px">저장</button>
						</form> 
							<button id="cancelButton"
								style="border: none; border-radius: 3px; background-color: white;">취소</button>
					 </div>
					<br> <br>
					<p>활동</p>
					표시:
				<!-- 	<button id=btn_4 style="width: 50px">모두</button> -->
					<button id=btn_4 style="width: 50px">댓글</button>
					<!-- <button id=btn_4 style="width: 50px">기록</button> -->
					<br>
					<br>
						<div>
						<input type="text" value="댓글 추가..."
						id="commenta"	onclick="frm()" style="width: 600px; height: 40px;">
					</div>
					<div id="frm" style="display: none">
				<form action="<%=request.getContextPath()%>/ckboard" method="post"	enctype="multipart/form-data" id="frm">
						<textarea name="ckContent" id="ckContent" class="question-answer" placeholder="asd"></textarea>
						<button id="savebutton" style="border: none; background-color: #0052CC; color: white; border-radius: 3px" >저장</button>
						</form>
						<button id="cancelButton" style="border: none; border-radius: 3px; background-color: white;" >취소</button>			
					</div>
				</div>

				<div id="right">
					<br>
					<button type="button" id="modal_close_btn">X</button>
					<br> <br>
					<div>
						<div class="dropdown">
							<button onclick="myFunction()" class="dropbtn">해야 할 일</button>
							<div id="myDropdown" class="dropdown-content">
								<a href="#">공지</a> <a href="#">기한 못 맞출 것 같은 이슈</a> <a href="#">진행</a>
								<a href="#">완료됨</a> <a href="#">워크플로 보기</a>
							</div>
						</div>
						<br>
						<div>
							<button
								style="width: 380px; height: 48px; text-align: left; background-color: white; border-color: gray;">세부
								정보</button>
						</div>
						<div id="block">
							<br>
							<div>
								<span>보고자</span> <span class="maker">todo</span>
							</div>
							<br>
							<div>
								<span>담당자</span> <span class="pic">할당되지않음</span>
							</div>
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
			</div>
		
<script>
var issueNo1 = "";
const projectNo = window.location.pathname.split("/")[2];

function detail_issue(issueNo){
	issueNo1 = issueNo;
	console.log("issueNo1 "+issueNo1);
	//var projectNo = $("#projectNo").text(); 
	$.ajax({
        type: 'GET',
        url: "<%=request.getContextPath()%>/work/"+projectNo+"/"+issueNo+"/issue/api",
       // data: {"value": 2},
        contentType: false,
        processData: false,
        success: function (data) {
        	console.log(data); 
            console.log(data.pic);   
            $("#modal_issue .projectNo").html(data.projectNo);
            $("#modal_issue .pic").html(data.pic);
            $("#modal_issue .maker").html(data.maker);
            $("#modal_issue .name").html(data.name);
            document.getElementById("modal_issue").style.display="block";
            
        }
    })
}

</script>
	<script>
    document.getElementById("modal_open_btn").onclick = function() {
        document.getElementById("modal_issue").style.display="block";
    }
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal_issue").style.display="none";
    }   
    document.getElementById("cancelButton").onclick = function() {
    	 document.getElementById("frm").style.display="none";
        document.getElementById("commenta").style.display="block";
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

<script>
$('.question-answer').each(function(i,item){
    console.log(item);
   var sPlaceholderText = $(item).attr('placeholder');
    var editor2 = CKEDITOR.replace('question-answer'+i,{
        height: 300,
        editorplaceholder : sPlaceholderText,
    });
})
</script>
	
<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
console.log("여기 언제 들어옴? issueNo1 "+issueNo1);
issueNo1 = '1';
			CKEDITOR.replace('ckContent',
 			{
				filebrowserUploadUrl:'<%=request.getContextPath()%>/work/'+projectNo+"/"+issueNo1+'/file/ckeditor/api',
 				height:100,
 				width:600,
 				toolbarGroups : [
 					{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
 					{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
 					{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
 					{ name: 'forms', groups: [ 'forms' ] },
 					'/',
 					{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
 					{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
 					{ name: 'links', groups: [ 'links' ] },
 					{ name: 'insert', groups: [ 'insert' ] },
 					'/',
 					{ name: 'styles', groups: [ 'styles' ] },
 					{ name: 'colors', groups: [ 'colors' ] },
 					{ name: 'tools', groups: [ 'tools' ] },
 					{ name: 'others', groups: [ 'others' ] },
 					{ name: 'about', groups: [ 'about' ] },
 	            ],

 	            removeButtons : 'Source,Save,Print,Templates,Cut,Copy,Paste,PasteText,PasteFromWord,Redo,Undo,Find,Replace,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,HiddenField,Subscript,Superscript,CopyFormatting,RemoveFormat,Indent,Outdent,Blockquote,CreateDiv,BidiLtr,BidiRtl,Language,Unlink,Anchor,Flash,HorizontalRule,PageBreak,Iframe,Maximize,ShowBlocks,About,NewPage,Preview,ImageButton,ExportPdf',

			});
			
		</script>
		<script>
		function frm(){
		      if($('#frm').css('display') == 'none'){
		      $('#frm').show();
		      $('#commenta').hide();
		    }else{
		      $('#frm').hide();
		    }
		    }
		</script>
		</div>
	</div>







