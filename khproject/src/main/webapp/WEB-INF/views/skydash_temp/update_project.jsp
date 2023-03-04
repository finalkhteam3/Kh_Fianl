<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>프로젝트 설정</h2>
	<h4>프로젝트 / ${dto.name}</h4>
	<form action="pjupdate.do" method="post">
	<input type="hidden" name="no" value="${dto.no }">
		<table border="1">

			<tr>
				<th>이미지</th>
				<td><input type="text" name="iconPath" id="iconPath" value=${dto.iconPath }></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name" placeholder="팀 이름" value=${dto.name }></td>
			</tr>
			<tr>
				<th>키</th>
				<td>${dto.no }</td>
				<!-- <td><input type="text" name="no" id="no" placeholder="프로젝트 식별 접두사"></td> -->
			</tr>
			<tr>
				<th>설명</th>
				<td><input type="text" name="info" id="info" placeholder="프로젝트를 소개해 주세요." value=${dto.info }></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="완료"> 
					<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/jira/projects'">
			</tr>
		</table>
	</form>
</body>
</html>