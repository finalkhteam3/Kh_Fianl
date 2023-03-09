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
					<input type="text" value="설명 추가하기..." data-comment="warp-frm1"
						onclick="frm(this)" class="comment">
					<div id="warp-frm1" style="display: none" class="warp-frm">
						<form id="frm1" class="frm">
							<textarea name="ckContent" id="question-answer0"
								class="question-answer" placeholder="내용을 입력하세요"></textarea>
							<button class="savebutton" type="button"
								onclick="saveHandler(this)"
								style="border: none; background-color: #0052CC; color: white; border-radius: 3px">저장</button>
							<button class="cancelButton" type="reset"
								onclick="resetHandler(this)"
								style="border: none; border-radius: 3px; background-color: white;">취소</button>
						</form>
					</div>
					<br> <br>
					<p>활동</p>
					표시:
					<!-- 	<button id=btn_4 style="width: 50px">모두</button> -->
					<button id=btn_4 style="width: 50px">댓글</button>
					<!-- <button id=btn_4 style="width: 50px">기록</button> -->
					<br> <br>
					<div>
						<input type="text" value="댓글 추가..." data-comment="warp-frm2"
							onclick="frm(this)" class="comment"
							style="width: 600px; height: 40px;">
					</div>
					<div id="warp-frm2" style="display: none" class="warp-frm">
						<form id="frm2" class="frm">
							<textarea name="content" id="question-answer1"
								class="question-answer" placeholder="내용을 입력하세요"></textarea>
							<button class="savebutton" type="button"
								onclick="saveCommentHandler(this)"
								style="border: none; background-color: #0052CC; color: white; border-radius: 3px">저장</button>
							<button class="cancelButton" type="reset"
								onclick="resetHandler(this)"
								style="border: none; border-radius: 3px; background-color: white;">취소</button>
						</form>
					</div>
					<div class="wrap comments">
					여기 여러댓글
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
let issueNo1 = "";
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
            
            
            
            //CKEditor 세팅
            $('.question-answer').each(function(i,item){
                console.log(item);
                var sPlaceholderText = $(item).attr('placeholder');
                var editor2 = CKEDITOR.replace('question-answer'+i,{
                	filebrowserUploadUrl:'<%=request.getContextPath()%>/work/'+projectNo+"/"+issueNo1+'/file/ckeditor/api',
                    height: 100,
                	width:600,
                    editorplaceholder : sPlaceholderText,
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

                }); // replace
            });  // each
        } // success
    }); // ajax
    
    $.ajax({
        type: 'GET',
        url: "<%=request.getContextPath()%>/work/"+projectNo+"/"+issueNo+"/comment/api",
        contentType: false,
        processData: false,    
        success: function (data) {
        	console.log(data); 
        	if (data !== undefined) {                             
                make_view_comments(data);
            }
        	 
        } // success
    }); // ajax
    
} // funcction detail_issue

function make_view_comments(comments){
	var htmlVar = '';
	comments.forEach((delta) => {
		htmlVar+='<div style ="border:1px solid black;">';
		htmlVar+='<div>';
		htmlVar+='<p>'+delta.maker+'</p>';
		htmlVar+='</div>';
		htmlVar+='<div>';
		htmlVar+='<div" class="comment" style="width:300px; height: 40px;">'+delta.content+'</div>';
		htmlVar+='</div>';
		htmlVar+='</div>';

		
	});
	$(".wrap.comments").html(htmlVar);
}
</script>
	<script>
    document.getElementById("modal_open_btn").onclick = function() {
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

	

		<script>
		function frm(elem){
			$(".comment").show();
			$(elem).hide();
			var comment ='#'+$(elem).data("comment");
			console.log(comment);
			$(".warp-frm").hide();
			$(comment).show();
		}
		
		function resetHandler(elem){
			$(".comment").show();
			$(elem).parents(".warp-frm").hide();
		}
		
	<%--  function saveHandler(elem){
			$.ajax({
				url:"<%=request.getContextPath()%>/work/"+projectNo+"/"+issueNo1+"/issue/api"
				,type:"post"
				,data: {content: CKEDITOR.instances['question-answer0'].getData()}
				,success: function(result){
					
				}
			,error: function(result){
				
			}
				
				
			});
			
			
			
			$(".comment").show();
			$(elem).parents(".warp-frm").hide(); --%>
		
		 function saveCommentHandler(elem){
			 var commentObj =  {content: CKEDITOR.instances['question-answer1'].getData()};
				$.ajax({
					url:"<%=request.getContextPath()%>/work/"+projectNo+"/"+issueNo1+"/comment/api",
					type:"post",
					contentType: "application/json",
					data: JSON.stringify(commentObj),
					success: function(result){
						console.log(result);
					}
				,error: function(result){
					
				}
					
					
				});
				
				
				
				$(".comment").show();
				$(elem).parents(".warp-frm").hide();
			} 
		</script>
		</div>
	</div>







