<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/issuedetail.css">
</head>
<body>

	<div class="issuedetail">
	<div id="left">
	<p>	issue </p>
	<h2>title</h2>
	<button id= btn_1>첨부</button>
	<button id= btn_2>하위 이슈 추가</button>
	<button id= btn_3>이슈 연결</button>
	<p>설명</p>
	<input type="text" value="설명 추가하기..." id=text>
	<br>
	<br>
	<p>활동</p>
	표시:
	<button id= btn_4>모두</button>
	<button id= btn_4>댓글</button>
	<button id= btn_4>기록</button>
	<br>
	<br>
	<input type="text" value="댓글 추가..." style="width: 600px; height: 40px;">
	</div>	
	
	<div id="right">
	<br>
	<button id= btn_5>X</button>
	<br>
	<br>
	<div>
	<button>해야 할 일</button>
	</div>
	<br>
	<div>
	<button style="width:380px; height: 48px; text-align: left; background-color: white; border-color: gray;" >세부 정보</button>
	</div>
	<div id="block">
	<p>보고자</p>
	<p>담당자</p>
	<p>Automation</p>
	</div>
	<div>
	<button style="width:380px; height: 48px; text-align: left; background-color: white; border-color: gray;" >더 많은  필드</button>
	</div>
	<div id="afs">
	<br>
	<p>만들기</p>
	<p>업데이트 됨</p>
	</div>
	</div>
	
		

	
	


</body>
</html>