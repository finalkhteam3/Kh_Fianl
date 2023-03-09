<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/02/08
  Time: 6:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/resources/script/test.js"></script>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/feather/feather.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resources/skydashTemp/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/skydashTemp/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/skydashTemp/images/favicon.png"/>
<style>
    ul, li {
        list-style: none;
    }

    .color-tl-wrap {
        background-color: #7cead1;
        width: 100%;
        min-width: 300px;
        height: 200px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .color-tl {
        position: relative;
        background-color: #00ff80;
        width: 98%;
        height: 160px;
    }

    .color-tt-wrap {
        display: flex;
        background-color: #0d3057;
        min-height: 1000px;
        overflow: auto;
        white-space: nowrap;
    }

    .color-tt {
        background-color: grey;
        margin: 10px;
    }
    .color-tt-in{
        background-color: grey;
        min-height: 900px;
        width: 260px;
    }
    .w-box {
        height: 24px;
    }

    .b-box {
        height: 57px;
    }

    .e-box {
        position: absolute;
        bottom: 0;
    }

    .flex-box {
        display: flex;
    }

    .spb {
        justify-content: space-between;
    }

    .aib {
        align-items: flex-end;
    }

    .margin-l-s li {
        margin-left: 5px;
        color: #44546F;
    }

    .boxt {
        width: 95%;
        height: 90px;
        background-color: whitesmoke;
        margin: 10px auto;
    }
    .boxt-wrap {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 98%;
        height: 90px;
        background-color: whitesmoke;
        margin-bottom: 10px;

    }

    .margin-l-b {

    }
    
 
</style>
<body>
<script>
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
     	  	$('#project2').html(html);
        }
    }
})


    var progressList = [];
    var issueList = [];
    
    function to_ajax() {
    	var projectNo = $("#projectNo").text(); 
        $.ajax({
            type: 'GET',
//            url: "/board/api1",
            url: "<%=request.getContextPath()%>/work/"+projectNo+"/issue/api",
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
                if (data !== undefined) {
                    console.log("hi")
                    progressList = data.progressList;
                    issueList = data.issueList;
                    make_view();
                }
            }
        })
    }
    $(to_ajax);
    function make_view(){
        const element = document.getElementsByClassName('color-tt-wrap')[0];
        $(element).empty();
        if (progressList !== undefined) {
            progressList.sort((a, b) => a.rank - b.rank);
            progressList.forEach((delta) => {
                element.innerHTML +=
                    '<div class="color-tt" >' +
                    '<div class="flex-box">'+
                    `<div style="text-align: center">\${delta.name}</div>` +
                    // '<div>' + JSON.stringify(delta) + '</div>' +
                    '<div>' + delta.progress + '</div>' +
                    '<button onclick="make_issue_button(this.parentElement.nextSibling)">' + '이슈 만들기' + '</button>'+
                    '</div>'+
                    '<div class="color-tt-in" id = "progressName::'+delta.name+'" data-index="' + delta.progress +
                    '" ondragover="dragOver(event)" ondrop="drop(event)" data-rank="' + delta.rank +'" ></div>' +
                    // '<div>' + delta.no + '<br/></div>' +
                    '</div>'
            })
        }
        if (issueList !== undefined) {
            console.log(issueList);
            issueList.forEach((delta) => {
                const element = document.getElementsByClassName('color-tt-wrap')[0].children;
                for (let i = 0; i < element.length; i++) {
                    if (parseInt(element[i].children[1].dataset.index) === delta.progress) {
                        console.log(delta.progress);
                        console.log("일치")
                        const ele = document.getElementsByClassName('color-tt-in')[element[i].children[1].dataset.rank - 1];
                        ele.innerHTML +=
                            '<div class="progress-stat">'+
                            '<div id="'+"issueRank::"+delta.no+'" class="boxt" data-no="'+delta.no+'" data-index="'+(i+1)+'" '+
                            ' onclick="click_issue(this);"	ondrop="drop_issue(event)" draggable="true" ondragstart="dragStart(event)" > ' +
                            '<div>' + delta.name + '</div>' +
                            '<div>' + delta.progress + '</div>' +
                            // '<div>' + delta.no + '<br/></div>' +
                            '</div>'+
                            '</div>'
                    }
                }
            })
        }
    }
    <%--function createIssue() {--%>
    <%--    console.log($("#frmCreate").serialize());--%>
    <%--    var projectno = $("#project").val();--%>
    <%--    $.ajax({--%>
    <%--        type: 'POST',--%>
    <%--        url: "<%=request.getContextPath()%>/work/"+projectno+"/issue/api",--%>
    <%--        data: $("#frmCreate").serialize(),--%>
    <%--        //contentType: false,--%>
    <%--        success: function (data) {--%>
    <%--            console.log(data);--%>
    <%--            console.log("이슈만들기 성공");--%>
    <%--            modalOff();--%>
    <%--            location.reload();--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>
    function createIssue(e){
        //const projectNo = "KHF3";
        var projectNo = $("#projectNo").text(); 
        console.log(projectNo);
        console.log(e);
       
        $.ajax({
            type: 'POST',
            url: "/work/"+projectNo+"/issue/api",
            // contentType: false,
            processData: false,
            datatype: 'json',
            contentType: "application/json",
            data: e,
            success: function (data) {
                console.log(data);
                console.log(progressList);
                console.log(issueList);
                make_view();
            }
        });
    }


    
    function click_issue(targetEle){
        console.log(targetEle.id);
        console.log("모달 띄우기");
        console.log(targetEle.dataset.no);
        detail_issue(targetEle.dataset.no);
        // 모달 띄우기
    }

    function check_console(){
        console.log(progressList);
        console.log("실행")
        progressList[0].name = "그래";
        make_view();
    }
    function dragStart(e){
        console.log(e.target.id);
        e.dataTransfer.setDragImage(e.target, 0, 0);
        e.dataTransfer.setData('targetId',e.target.id);
    }
    function dragOver(e){
        e.preventDefault();
    }
    function drop(e){
        const targetId = e.dataTransfer.getData('targetId');
        e.preventDefault();
        const selectIssue = document.getElementById(targetId);
        const selectProgress = e.target.dataset.index;
        if(selectProgress !== undefined) {
            issueList[parseInt(selectIssue.dataset.no) - 1].progress = parseInt(selectProgress);
            console.log(issueList);
        }
        // document.getElementById(targetId).dataset.index = e.target.dataset.index;
        // e.target.appendChild(document.getElementById(targetId));
        make_view();
    }
    function drop_issue(e){
        console.log(e);
        make_view();
    }
    function check_issue_button(){
        const alreadyMake = document.getElementById("make_issue");
        if(alreadyMake !== null){
            console.log(alreadyMake.parentElement);
            $(alreadyMake.parentElement).remove();
            document.removeEventListener("keydown", handlerKeydown);
        }
    }
    function handlerKeydown(event){
    	console.log("keydown");
    	const alreadyMake = document.getElementById("make_issue");
        if(alreadyMake !== null){
        	console.log("alreadyMake esc");
            if (event.keyCode === 27 || event.which === 27) {
                check_issue_button();
            }
        }
    }
    function make_issue_button(e){
        check_issue_button();
        e.innerHTML +=
            '<div class="boxt">'+
            '<input type="text" id="make_issue"/>'+
            '</div>'
        const issue = document.getElementById("make_issue");
            
        issue.addEventListener("keyup", function (event){
            if (event.keyCode === 13) {
                make_issue(issue.value, e.dataset.index);
            }
        });
        document.addEventListener("keydown", handlerKeydown);
    }
    function make_issue(e, f){
        console.log("asdf");
        console.log(f);
        // const formData = new FormData();
        // formData.append("value", "2");
        // formData.append("maker", "tuu523");
        // formData.append("name", e);
        // formData.append("progress", f);
        const param = {value: 2, name: e, progress: parseInt(f), maker: "tuu523"};
        const pushParam = JSON.stringify(param);
        issueList.push(param);
        createIssue(pushParam);
    }
	function changeProject2() {
		var projectno = $("#project2").val();
    	$('#projectNo').text(projectno);
		console.log(projectno);
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
		            	if(delta.no == projectno){
		            		html +=
				                  '<option value="'+ delta.no +'" selected>'+delta.name+'</option>';
		            	}else {
		            		html +=
				                  '<option value="'+ delta.no +'">'+delta.name+'</option>';
		            	}
		            	
		            })
		     	  	$('#project2').html(html);
		        }
		    }
		})
		to_ajax();
	}
	
	$.ajax({
        type: 'GET',
        url: "<%=request.getContextPath()%>/work/projectno/member/api",
        contentType: false,
        success: function (data) {
            console.log(data);     
            if(data !== undefined){
            html = '<option value="">멤버</option>';
        	data.forEach((delta) => {
        		html +=
        			'<option value="'+ delta.id +'">'+delta.name+'('+delta.email+')</option>';
        	})
        	$('#member').html(html);
        }
        
        }  
    })
	function memberList(){
		var projectno = $("#project").val();
		$.ajax({
	        type: 'GET',
	        url: "<%=request.getContextPath()%>/work/projectno/member/api",
	        contentType: false,
	        success: function (data) {
	            console.log(data);     
	            if(data !== undefined){
	            html = '<option value="">멤버</option>';
	        	data.forEach((delta) => {
	        		html +=
	        			'<option value="'+ delta.id +'">'+delta.name+'('+delta.email+')</option>';
	        	})
	        	$('#member').html(html);
	        }
	        
	        }  
	    })
	}
</script>

<div class="color-tl-wrap">
    <div class="color-tl">
        <div class="w-box">
            <ul class="flex-box margin-l-s">
                <li>프로젝트</li>
                <li>/</li>
                <li id="projectNo">KHF3</li>
            </ul>
        </div>
        <div class="b-box">
            <ul class="flex-box spb">
                <li><h3>KH3 보드</h3></li>
                <li>아이콘 아이콘 아이콘</li>
            </ul>
            <div>
				<label for="project2">프로젝트</label>
				<div class="dropdown">
					<select id="project2" name="project2" onchange="changeProject2();">
					</select>
				</div>
			</div>
        </div>
        <div class="b-box flex-box e-box aib">
            <ul class="flex-box">
                <li style="display: flex; align-items: flex-end"><h3>KH3 보드</h3></li>
                <li onclick="check_console()">아이콘 아이콘 아이콘</li>
            </ul>
        </div>
    </div>
</div>
<div>
				<label for="member">멤버</label>
				<div class="dropdown">
					<select id="member" name="member" onchange="memberList();">
					</select>
				</div>
			</div>
<div class="color-tt-wrap">
</div>

</body>
</html>