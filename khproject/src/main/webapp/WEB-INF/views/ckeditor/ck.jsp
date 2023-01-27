<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ckeditor test</title>
<script src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
</head>
<body>
<h3>ckeditor test</h3>

	<textarea name="ckeditor" id="ckeditor"></textarea>


<script type="text/javascript">
	var ckeditor_config = {
	      resize_enaleb : false,
	      enterMode : CKEDITOR.ENTER_BR,
	      shiftEnterMode : CKEDITOR.ENTER_P
	      /* , */
	      /* filebrowserUploadUrl : "이미지 업로드 처리를 하는 controller명" */
	      };
	
	CKEDITOR.replace("ckeditor",ckeditor_config);
</script>
</body>
</html>