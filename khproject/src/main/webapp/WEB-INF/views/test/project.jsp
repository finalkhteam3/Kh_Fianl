<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/02/08
  Time: 1:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
    #hihi {
        width: 400px;
        height: 100px;
        background-color: grey;
        margin-bottom: 20px;
    }
    #hi{
        width: 1000px;
        height: 1000px;
        background-color: #00feff;
        margin: 100px auto;
    }
</style>
<script>
    $(function to_ajax() {
        $.ajax({
            type: 'GET',
            url: "<%=request.getContextPath() %>/work/api/project",
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data[0]);
                const element = document.getElementById('hi');
                if (data !== undefined) {
                    data.forEach((delta) => {
                        element.innerHTML +=
                            '<div id="hihi">'+
                            '<div>ajax</div>' +
                            '<div>' + JSON.stringify(delta) + '</div>' +
                            '<div>' + delta.name + '</div>' +
                            '<div>' + delta.no + '<br/></div>' +
                            '</div>'

                    })
                }
            }
        })
    })

</script>
<body>
<div id="hi">

</div>
</body>
</html>
