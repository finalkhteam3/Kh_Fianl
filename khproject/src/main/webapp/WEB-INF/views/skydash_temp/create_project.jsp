<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/skydashTemp/images/logo_mini.png"
	rel="shortcut icon" type="image/x-icon">
</head>
<style>
.jira-frontend {
	background: white;
	margin: 0;
	padding: 0;
	display: block;
	height: 100vh;
}

.body_wrap {
	margin: 0;
	padding: 70px 0 0;
	display: flex;
	height: 100%;
	width: 100%;
}

.body_wrap2 {
	width: 100%;
	margin: 0px;
	padding: 0px;
	height: 100%;
}

.ap1 {
	position: relative;
	padding: 0px 40px;
	display: block; -
	-ds-column-span: auto;
	min-width: calc(( 99.9999%/ var(- -ds-columns-num))- var(- -ds-grid-spacing));
	margin: 0 calc(var(- -ds-grid-spacing)/2);
	-webkit-box-flex: 1;
	flex: 1 0 auto;
	overflow-wrap: break-word;
	max-width: calc(100% - var(- -ds-grid-spacing));
}

.ap2_0 { -
	-ds-columns-num: 12;
	display: block;
	padding: 0;
	min-width: calc(( 99.9999%/ var(- -ds-columns-num))- var(- -ds-grid-spacing));
	margin: 0 calc(var(- -ds-grid-spacing)/2);
	-webkit-box-flex: 1;
	flex: 1 0 auto;
	overflow-wrap: break-word;
	max-width: calc(100% - var(- -ds-grid-spacing)); -
	-ds-column-span: auto;
}

.ap2 {
	display: flex;
	margin: 0px auto;
	padding: 0 calc(var(- -ds-grid-spacing)/2);
	position: relative;
	align-items: flex-start;
	flex-wrap: wrap;
	max-width: calc(var(- -ds-columns-num)* 80px); -
	-ds-columns-num: 12; -
	-ds-grid-spacing: 16px;
}

.ap3 {
	margin: 0;
	padding: 0;
	margin-top: 24px;
	margin-bottom: -16px;
	margin-left: -4px;
	min-height: 16px;
	display: block;
	width: 100%;
}

.ap4 {
	color: var(- -ds-text-lowEmphasis, #6B778C);
	display: block;
	flex-wrap: wrap;
	margin: 0px;
	padding: 0px margin-top: 0;
}

.ap5 {
	display: flex;
	flex-direction: row;
	height: 1.71429em;
	line-height: 1.71429em;
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	max-width: 100%;
}

.ap6 {
	min-height: 560px;
	display: block;
	margin: 0;
	padding: 0;
	width:100%;
}

.ap7 {
	display: block;
	padding: 0;
	margin: 22px 0px 16px;
}

.ap8 {
	min-width: 0px;
	max-width: 100%;
	margin-bottom: 8px;
	flex: 1 1 auto;
	display: block;
}

.ap9 {
	margin: 0;
	font-size: 1.71429em;
	color: #172B4D;
}
.ap10{
	margin: 0;
    padding: 0;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
}
.ap11{
	margin: 0;
    padding: 0;
    display: inline-flex;
}
.ap12{
	
}
.ap13{
	
}
.ap14{
	margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    -webkit-box-pack: center;
    justify-content: center;
    padding-bottom: 4px;
}
.ap15{
	padding: 0;
	border: 0;
	border-radius: 3px;
    width: 128px;
    height: 128px;
    margin: 0px auto;
}
.ap16{
	margin: 0;
	display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    padding: 12px 0px 4px;
}
.ap17{
	-webkit-box-align: baseline;
    align-items: baseline;
    box-sizing: border-box;
    display: inline-flex;
    font-size: inherit;
    font-style: normal;
    font-family: inherit;
    font-weight: 500;
    max-width: 100%;
    position: relative;
    text-align: center;
    white-space: nowrap;
    cursor: pointer;
    height: 2.28571em;
    line-height: 2.28571em;
    vertical-align: middle;
    width: auto;
    -webkit-box-pack: center;
    justify-content: center;
    color: var(--ds-text, #42526E) !important;
    border-width: 0px;
    border-radius: 3px;
    text-decoration: none;
    transition: background 0.1s ease-out 0s, box-shadow 0.15s cubic-bezier(0.47, 0.03, 0.49, 1.38) 0s;
    background: var(--ds-background-neutral, rgba(9, 30, 66, 0.04));
    padding: 0px 10px;
}
.ap18{
	color: #42526E;
	opacity: 1;
    transition: opacity 0.3s ease 0s;
    margin: 0px 2px;
    -webkit-box-flex: 1;
    flex-grow: 1;
    flex-shrink: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.ap19{
	display: block;
	margin: 0;
    padding: 0;
	margin-top: 8px;
}
.ap20{
	font-size: 0.857143em;
    font-style: inherit;
    line-height: 1.33333;
    color: var(--ds-text-subtlest, var(--ds-text-subtlest, #6B778C));
    font-weight: var(--ds-font-weight-semibold, 600);
    display: inline-block;
    margin-top: 0px;
    margin-bottom: 4px;
}
.ap21{
	margin: 0;
    padding: 0;
    -webkit-box-align: center;
    align-items: center;
    background-color: var(--ds-background-input, #FAFBFC);
    border-color: var(--ds-border-input, #DFE1E6);
    color: var(--ds-text, #091E42);
    cursor: text;
    border-radius: 3px;
    border-width: 2px;
    border-style: solid;
    box-sizing: border-box;
    display: flex;
    flex: 1 1 100%;
    font-size: 14px;
    -webkit-box-pack: justify;
    justify-content: space-between;
    max-width: 100%;
    overflow: hidden;
    transition: background-color 0.2s ease-in-out 0s, border-color 0.2s ease-in-out 0s;
    overflow-wrap: break-word;
    vertical-align: top;
    pointer-events: auto;
    width: 352px;
    height: 39px;
}
.ap22{
	background-color: transparent;
    border: 0px;
    box-sizing: border-box;
    color: inherit;
    cursor: inherit;
    font-size: 14px;
    min-width: 0px;
    outline: none;
    width: 100%;
    line-height: 1.42857;
    outline: 0;
    border-bottom-right-radius: 3.01px;
    padding: 8px 6px;
    height: 2.57em;
}
.face{
	margin: 0;
    padding: 0;
    border: 0;
	display: flex;
    width: 100%;
    height: 100%;
    flex: 1 1 100%;
}
.face0{
	height: 24px;
    width: 24px;
    -webkit-box-align: stretch;
    align-items: stretch;
    background-color: transparent;
    border-radius: 50%;
    box-sizing: content-box;
    cursor: inherit;
    display: flex;
    flex-direction: column;
    -webkit-box-pack: center;
    justify-content: center;
    outline: none;
    overflow: hidden;
    position: static;
    transform: translateZ(0px);
    transition: transform 200ms ease 0s, opacity 200ms ease 0s;
    box-shadow: transparent 0px 0px 0px 2px;
    border: none;
    margin: 2px;
    padding: var(--ds-scale-0, 0px);
}
.ap23{
	overflow: hidden;
    min-width: 100px;
    -webkit-box-align: center;
    align-items: center;
    background-color: transparent;
    border-radius: 3px;
    box-sizing: border-box;
    color: inherit;
    display: flex;
    font-size: inherit;
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    outline: none;
    margin: var(--ds-scale-0, 0px);
    text-align: left;
    text-decoration: none;
    width: 100%;
    border: none !important;
    padding: 0px !important;
}
.ap24{
	line-height: 1.4;
	display: inline-block;
    margin: var(--ds-scale-0, 0px);
    color: var(--ds-text, #091E42);
    overflow-x: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    margin: 0 5px;
}
.ap25{
	display: flex;
	justify-content: center;
	margin: 30px 0;
}
.ap26{
	-webkit-box-align: baseline;
    align-items: baseline;
    box-sizing: border-box;
    display: inline-flex;
    font-size: inherit;
    font-style: normal;
    font-family: inherit;
    font-weight: 500;
    max-width: 100%;
    position: relative;
    text-align: center;
    white-space: nowrap;
    cursor: pointer;
    height: 2.28571em;
    line-height: 2.28571em;
    vertical-align: middle;
    width: auto;
    -webkit-box-pack: center;
    justify-content: center;
    color: var(--ds-text-inverse, #FFFFFF) !important;
    border-width: 0px;
    border-radius: 3px;
    text-decoration: none;
    transition: background 0.1s ease-out 0s, box-shadow 0.15s cubic-bezier(0.47, 0.03, 0.49, 1.38) 0s;
    background: var(--ds-background-brand-bold, #0052CC);
    padding: 0px 10px;
    margin: 0 4px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<body>
	<div class="jira-frontend">
		<!-- partial:partials/_navbar.html -->
		<div class="body_wrap">
			<%@ include file="/WEB-INF/views/component/header3.jsp"%>
			<div class="body_wrap2">
				<!-- partial -->
				<div class="ap1">
					<div class="ap2_0">
						<div class="ap2">
							<div class="ap6">
								<div class="ap7">
									<div class="ap8">
										<h2 class="ap9">프로젝트 만들기</h2>
									</div>
								</div>
								<div class="ap10">
									<div class="ap11">
										<form class="ap12"  action="${pageContext.request.contextPath}/jira/projects" method="post">
											<div class="ap13">
												<div class="ap14">
													<img class="ap15" src="/resources/skydashTemp/images/icon_project1.svg">
												</div>
												<div class="ap16">
													<button class="ap17">
														<span class="ap18">
															아이콘 변경
														</span>
													</button>
												</div>
											</div>
												<div class="ap19"><tr>
													<div class="ap20"><th>이름</th></div>
													<div class="ap21"><td><input class="ap22" type="text" name="name" id="name" placeholder="팀 이름" required></td></div>
												</tr></div>
												<div class="ap19"><tr>
													<div class="ap20"><th>키</th></div>
													<div class="ap21"><td><input class="ap22" type="text" name="no" id="no" placeholder="프로젝트 식별 접두사" required></td></div>
												</tr></div>
												<div class="ap19"><tr>
													<div class="ap20"><th>설명</th></div>
													<div class="ap21"><td><input class="ap22" type="text" name="info" id="info" placeholder="프로젝트를 소개해 주세요."></td></div>
												</tr></div>
												<div style="display:none;"><tr>
												<th>이미지</th>
												<td><input type="text" name="iconPath" id="iconPath" placeholder="프로젝트 이미지" value="a"></td>
												</tr></div>
												<div class="ap25"><tr>
													<td colspan="2" align="center">
													<input class="ap26" type="submit" value="프로젝트 만들기"> 
													<input class="ap26" type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/jira/projects'">
												</tr></div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>