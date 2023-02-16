<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
var logList = [];
$(function log_test() {
    $.ajax({
        type: 'GET',
        url: "/log/api1",
        contentType: false,
        processData: false,
        success: function (data) {
            console.log(data);
            
            if (data !== undefined) {
                console.log("log_test")
                logList = data.logList;
                const element = document.getElementsByClassName('log_test1')[0];
                $(element).empty();
                if (logList !== undefined) {
                	logList.forEach((delta) => {
                    element.innerHTML +=
                        '<div class="tab_style">' +
                        '<div>' + delta.projectNo + '<br/></div>' +
                        '<div>' + delta.state + '<br/></div>' +
                        '<div>' + delta.issueName + '<br/></div>' +
                        '<div>' + delta.executor + '<br/></div>' +
                        '</div>'

                })
            	}
            }
        }
    })
})
</script>
<body>
	log.jsp 페이지 입니다.
	<div class="log_test1"></div>
</body>
</html>