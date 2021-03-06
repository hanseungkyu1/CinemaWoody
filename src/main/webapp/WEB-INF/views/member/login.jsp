<%--
  Created by IntelliJ IDEA.
  User: seungkyu
  Date: 2022/03/21
  Time: 7:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page session="false" %>
<html>
<head>
    <title>로그인 화면</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        ul,
        li {
            list-style: none;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        .loginform input {
            display: block;
        }
        .loginform {
            display: flex;
            flex-direction: column;
            width: 450px;
            margin: 150px auto 0;
            padding: 20px 30px 30px;
            background: white;
            /*color: white;*/
            font-size: 14px;
            box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7), -1px -1px 5px rgba(0, 0, 0, 0.7);
            border-radius: 10px;
        }
        .loginform h1 {
            margin-bottom: 20px;
            text-transform: uppercase;
            text-align: center;
        }
        .loginform form input {
            width: 100%;
            height: 50px;
            padding: 10px;
            outline: black;
            border: black 1px solid;
            border-radius: 10px;
        }
        .loginform form input[type="password"] {
            margin: 15px 0;
        }
        .loginform form input::placeholder {
            color: black;
        }
        .loginform form input[type="submit"] {
            position: relative;
            margin-bottom: 5px;
            background: white;
            font-weight: bold;
            /*color: white;*/
            font-size: 16px;
            cursor: pointer;
            border: 2px solid;
            border-radius: 20px;
            transition: 0.3s;
        }
        .loginform form input[type="submit"]:hover {
            background: #ffc731;
            color: white;
        }
        .loginform form label {
            display: flex;
            margin-bottom: 15px;
        }
        .loginform form label .idsave {
            display: block;
            width: 20px;
            height: 20px;
            margin-right: 5px;
            background: white;
            cursor: pointer;
            border: solid black 1px;
            border-radius: 5px;
        }
        .loginform form label .text {
            cursor: pointer;
        }
        .loginform form label .idsave-checked {
            display: none;
            text-align: center;
            font-size: 15px;
            color: black;
        }
        .loginform form #checkbox:checked ~ label .idsave-checked {
            display: block;
        }
        .loginform .hidden {
            display: none;
        }
        .loginform .forgot {
            display: flex;
            justify-content: space-between;
            text-transform: capitalize;
            font-size: 16px;
        }
        .loginform .forgot a:hover {
            text-decoration-line: underline;
        }
    </style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<jsp:include page="../nav.jsp"/>

<div class="loginform">
    <h1>로그인 화면</h1>
    <form action="<c:url value='/member/login'/>" method="post" onsubmit="return formCheck(this)">
        <input type="text" name="mid" id="mid" value="${cookie.mid.value}" placeholder="ID" autofocus>
        <input type="password" name="pwd" id="pwd" placeholder="Password">
        <input type="checkbox" name="rememberId" id="checkbox" ${empty cookie.mid.value ? "" : "checked"} class="hidden">
        <label for="checkbox">
                <span class="idsave">
                    <span class="idsave-checked">
                        <i class="fas fa-check"></i>
                    </span>
                </span>
            <span class="text">아이디 저장</span>
        </label>
        <div id="msg" style="color: red; margin-bottom: 15px;">
            <c:if test="${not empty param.msg}">
                <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
            </c:if>
        </div>
        <input type="submit" value="LOGIN">
        <input type="hidden" name="toUrl" value="${param.toUrl}">
    </form>
    <div class="forgot">
        <a href="<c:url value='/member/insert'/>">회원가입</a>
        <a href="#">비밀번호 찾기</a>
    </div>
</div>

<script>

    function formCheck(frm) {
        var mid = document.getElementById("mid").value;

        if (mid == '') {
            alert("ID를 입력해주세요.");
            $('#mid').focus();

            return false;
        }

        var pwd = document.getElementById("pwd").value;

        if (pwd == '') {
            alert("Password를 입력해주세요.");
            $('#pwd').focus();

            return false;
        }

        return true;
    }

</script>

<jsp:include page="../footer.jsp"/>

</body>
</html>
