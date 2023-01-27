<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SmartEditor2 Test</title>
<script	src="<%=request.getContextPath()%>/resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
</head>
<body>
	<h4>SmartEditor2 Test</h4>
	 <form action="<%=request.getContextPath()%>/smarteditor2/se2board" method="post"	enctype="multipart/form-data" id="frm">
	 	
		<textarea class="form-control" name="content" id="content" style="width: 100%; height: 300px;"></textarea>
			
			<!-- 필드명과 동일하게 하면 오류남. 필드의 자료형이 MultipartFile이 아니므로-->
			<!-- file:<input type="file" name="report"> -->
			
		<button id="savebutton">글 등록</button>
	</form>

	<script type="text/javascript">
		
	/* document.domain = "main.co.kr"; */
	$(function(){
		
		window.addEventListener('message', function(e) {
			  console.log(e.data); // { hello: 'parent' }
			  var item = localStorage.getItem('dummy');
			  console.log(item); // zerocho
			  document.getElementById('iframe').contentWindow.postMessage(item, '*');
			});
		
		var oEditors = [];
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content",
			sSkinURI : "<%=request.getContextPath()%>/resources/smarteditor2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
		
		$("#savebutton").click(function(){
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[]);
			$("#frm").submit();
		})
	})
	</script>

</body>
</html>