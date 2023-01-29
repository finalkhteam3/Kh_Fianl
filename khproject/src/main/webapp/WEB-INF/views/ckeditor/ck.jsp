<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ckeditor test</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<h3>ckeditor test</h3>

<form action="<%=request.getContextPath()%>/ckboard" method="post"	enctype="multipart/form-data" id="frm">
		Title:<input type="text" name="boardTitle" id="boardTitle"> 
		<br> 
		Writer:<input type="text" name="boardWriter" id="boardWriter"> 
		<br> 
		Content:
		<textarea name="ckeditor" id="ckeditor"></textarea>
		<button id="savebutton">글등록</button>
	</form>




<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
			CKEDITOR.replace('ckeditor',
			{filebrowserUploadUrl:'imageUpload.do'
			});
		</script>

<%-- 	$(function(){
	CKEDITOR.replace('ckeditor',{
		filebrowserUploadUrl : '<%=request.getContextPath()%>/ckeditor/fileupload.do'
	});
});  --%>
	
</script>
</body>
</html>