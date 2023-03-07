<%--
  Created by IntelliJ IDEA.
  User: twkim
  Date: 2023/01/21
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
    .text-bigger{
        font-family: Arial unicode MS,sans-serif;
        font-size: 20px;
    }
    .text-center{
        text-align: center;
    }
    .text-middle{
        font-family: Arial unicode MS,sans-serif;
        font-size: medium;
    }
    .text-title{
        font-family: Arial unicode MS,sans-serif;
        font-size: 32px;
        font-weight: 400;
        margin-bottom: 50px;
    }
    .text-big{
        font-family: Arial unicode MS,sans-serif;
        margin-bottom: 5px;
        line-height: 150%;
        font-size: larger;
    }
    .inputBox-big{
        margin-top: 5px;
        width: 460px;
        height: 45px;
    }
    #table-wrap{
        width: 800px;
        height: 1000px;
        background-color: #f5f5f5;
        margin: 50px auto 50px auto;
        display: flex;
        justify-content: center;
    }

    #table-wrap ul{
        list-style: none;
        padding-left: 0;
    }

    #table-wrap .table{
        margin: 50px 0 50px 0;
    }

    #table-wrap .table .empty-box{
        height: 30px;
    }

    #table-wrap .table > ul{
        margin-top: 30px;
    }

    #table-wrap .button-wrapper {
        display: flex;
        justify-content: center;
    }
</style>
<head>
    <title>Title</title>
</head>
<script>

    const checkIdDuplicate = (id) => {
        const regExp = /^[a-z]+[a-z0-9]{4,19}$/g;
        let isTrue = false;
        if(regExp.test(id) !== false) {
            const checkData = {"id": id}
            $.ajax({
                type: 'GET',
                url: "<%=request.getContextPath()%>/checkId/api",
                async: false,
                data: checkData,
                contentType: "application/json; charset:UTF-8",
                success: function (data) {
                    if (data === "ACCEPTED")
                        document.getElementById("id-msg").innerText = "중복된 아이디입니다.";
                    else if (data === "OK") {
                        document.getElementById("id-msg").innerText = "사용 가능한 아이디입니다.";
                        isTrue = true;
                        console.log(isTrue + "as");
                    } else
                        document.getElementById("id-msg").innerText = "사용할 수 없는 아이디입니다.";
                }
            })
        }
        console.log(isTrue + "df");
        return isTrue;
    }

    const join = (e) => {
        console.log(e);
        const request = new FormData();
        request.append("id", document.getElementById('id').value)
        request.append("password", document.getElementById("password").value)
        request.append("name", document.getElementById("name").value)
        request.append("email", document.getElementById("email").value)
        console.log(request)
        console.log(request.get("password"))

        if(checkIdDuplicate(request.get("id")) && checkPw(request.get("password"))){
            console.log(request+"2")
            $.ajax({
                type: 'POST',
                url: "<%=request.getContextPath()%>/join/api",
                contentType: false,
                processData: false,
                data: request,
                success: function (data) {
                    if(data === "OK")
                        location.href = "<%=request.getContextPath()%>/login"
                    else
                        alert("회원가입 실패")
                }
            })
        }
    }
    const changePass = (pwd) => {
        const regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
        const password = document.getElementById("password");
        const pwdCheck = document.getElementById("pwd-msg");

        if(password.value === "")
            pwdCheck.innerText = "비밀번호를 입력해주세요."
        else if(!regExp.test(password.value)){
            pwdCheck.innerText = "비밀번호를 확인해 주세요(8~16자, 영문, 숫자, 특수문자 포함).";
        }
        else if(password.value === pwd.target.value)
            pwdCheck.innerText = "사용 가능한 비밀번호 입니다.";
        else
            pwdCheck.innerText = "동일하지 않습니다. 다시 확인 해주세요."
    }

    const checkPw = (pwd) => {
        let isTrue = false;
        if(pwd === document.getElementById("passwordCheck").value) {
            const regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
            return regExp.test(pwd)
        }
        return Boolean(isTrue);
    }

    const changeId = (event) => {
        const id = event.target.value;
        if(id.length < 5)
            document.getElementById("id-msg").innerText = "ID는 5글자 이상이여야 합니다. 현재 " + id.length;
        else
            checkIdDuplicate(id);
    }


</script>
<body>
<form id="table-wrap" onsubmit="return false">
    <ul class="table">
        <li class="text-bigger">아이디</li>
        <li>
            <input type="text" id="id" name="id" class="inputBox-big text-big" onkeyup="changeId(event)">
        </li>
        <li id="id-msg">5글자 이상이여야 합니다</li>
        <li class="empty-box"></li>
        <li class="text-bigger">패스워드</li>
        <li>
            <input type="password" id="password" class="inputBox-big text-big" name="password" onkeyup="changePass(event)">
        </li>
        <li class="empty-box"></li>
        <li class="text-bigger">패스워드 확인</li>
        <li>
            <input type="password" id="passwordCheck" class="inputBox-big text-big" name="passwordCheck"  onkeyup="changePass(event)">
        </li>
        <li id="pwd-msg"> 패스워드 확인 </li>
        <li class="empty-box"></li>
        <li class="text-bigger">이름</li>
        <li>
            <input type="text" id="name" name="name" class="inputBox-big text-big" placeholder="이름">
        </li>
        <li class="empty-box"></li>
        <li class="text-bigger">이메일</li>
        <li>
            <input type="text" id="email" name="email" class="inputBox-big text-big" placeholder="이메일">
        </li>
        <li class="empty-box"></li>
        <li>
            <button id="submit" type="button" onclick="join(event)">전송</button>
        </li>
    </ul>
</form>
</body>
</html>
