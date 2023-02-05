<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/01/16
  Time: 11:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
    .div-flex {
        display: flex;
    }

    #hidden {
        margin-right: 30px;
    }

    .marginB {
        margin-bottom: 20px;
    }
</style>
<script>
    let no = "";
    let name = "";
    let inter = 0;
    let datta = {};

    function to_ajax() {
        const formData = new FormData();
        formData.append("no", $("#no").val())
        formData.append("name", $("#name").val())
        formData.append("inter", $("#inter").val())
        formData.append("file", $("#file")[0].files[0])
        console.log(formData);
        $.ajax({
            type: 'POST',
            url: "<%=request.getContextPath() %>/ajax/api",
            contentType: false,
            processData: false,
            data: formData,
            success: function (data) {
                const element = document.getElementById('hidden2');
                const path = '<img src="' + data.file + '" alt="no_img"/>';
                datta = data;
                console.log("hihi");
                console.log(datta);
                datta.no = "hoi"; //이런식으로 원하는 값만 수정 가능하다.
                console.log("byebye");
                console.log(datta);
                if(data.no !== undefined) {
                    element.innerHTML +=
                        '<div>ajax</div>' +
                        '<div>' + data.no + '</div>' +
                        '<div>' + data.name + '</div>' +
                        '<div>' + data.inter + '<br/></div>' +
                        '<div class="marginB">' + path + '<br/></div>'
                }
            }
        })

    }

    window.onpopstate = function () {
        history.go(0)
    };

    const changeNo = event => {
        no = event.value;
    }
    const changeName = event => {
        name = event.value;
    }
    const changeInter = event => {
        inter = event.value;
    }
    const clickButton = () => {
        $("#test").load("${pageContext.request.contextPath}/card");
        history.pushState(null, null, "?card=" + "1")
    }

</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <ul class="div-flex">
        <li>
            <form action="<%=request.getContextPath() %>/ajax/ajaxRoute" method="post" enctype="multipart/form-data">
                <input type="text" name="no" placeholder="no"/>
                <input type="text" name="name" placeholder="name"/>
                <input type="text" name="inter" placeholder="inter"/>
                <input type="file" name="file"/>
                <button>입력</button>
            </form>
        </li>
        <li>
<%--            <input onkeyup="changeNo(this)" type="text" placeholder="no"/>--%>
<%--            <input onkeyup="changeName(this)" type="text" placeholder="name"/>--%>
<%--            <input onkeyup="changeInter(this)"  type="text" placeholder="inter"/>--%>
<%--            <input onclick="" type="file"/>--%>
<%--            <button onclick="to_ajax()">입력</button>--%>
            <form id="ajaxform" action="<%=request.getContextPath() %>/ajax/api" method="post" enctype="multipart/form-data">
                <input type="text" name="no" id="no" placeholder="no"/>
                <input type="text" name="name" id="name" placeholder="name"/>
                <input type="text" name="inter" id="inter" placeholder="inter"/>
                <input type="file" name="file" id="file"/>
                <input type="button" onclick="to_ajax()" value="전송"/>
            </form>
        </li>
    </ul>
    <div class="div-flex">
        <c:if test="${ajaxResponse != null}">
            <div id="hidden">
                <div class="marginB">modelAndView</div>
                <div id="hNo">${ajaxResponse.name}</div>
                <div id="hName">${ajaxResponse.no}</div>
                <div id="hInter">${ajaxResponse.inter}</div>
                <img src="${ajaxResponse.file}" alt="33"/>
            </div>
        </c:if>
        <div id="hidden2">
            <div class="marginB">AJAX</div>
        </div>
    </div>
    <c:if test="${param.card == null}">
        <div id="test" onclick="clickButton()">
            눌러
        </div>
    </c:if>
    ${param.card}
    <c:if test="${param.card != null}">
        <div id="test">
            <script>
                clickButton();
            </script>
        </div>
    </c:if>
</div>
</body>
</html>
