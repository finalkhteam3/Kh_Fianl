<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<body>
<%@ include file="/WEB-INF/views/component/header2.jsp"%>
	<h2>프로젝트 만들기</h2>
	<h4>프로젝트 설정에서 언제든지 이러한 사항을 변경할 수 있습니다.</h4>
	<form action="${pageContext.request.contextPath}/jira/projects" method="post">
		<table border="1">

			<tr>
				<th>이름*</th>
				<td><input type="text" name="name" id="name" placeholder="팀 이름"></td>
			</tr>
			<tr>
				<th>키*</th>
				<td><input type="text" name="no" id="no" placeholder="프로젝트 식별 접두사"></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><input type="text" name="info" id="info" placeholder="프로젝트를 소개해 주세요."></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="text" name="iconPath" id="iconPath" placeholder="프로젝트 이미지"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="프로젝트 만들기"> 
				<input type="button" value="취소"  onclick="location.href='${pageContext.request.contextPath}/jira/projects'">
			</tr>
		</table>
	</form>

</body>
</html>