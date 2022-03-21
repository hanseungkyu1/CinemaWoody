<%--
  Created by IntelliJ IDEA.
  User: seungkyu
  Date: 2022/03/16
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>회원가입 화면</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .sign_form{
            width: 700px;
            display: inline-block;
        }
        label{
            text-align: left;
        }
    </style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<jsp:include page="../nav.jsp"/>
<div class="container" style="margin: auto; text-align: center;">
<form class="sign_form" action="<c:url value="/member/insert"/>" method="post" onsubmit="return formCheck(this)">
    <div class="title" style="text-align: center; margin-top: 50px; margin-bottom: 50px;">
        <h3>간편 회원가입 화면</h3>
    </div>
    <div class="form-group row">
        <label for="mid" class="col-sm-2 col-form-label">아이디</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="mid" name="mid" placeholder="아이디를 입력해주세요.">
        </div>
        <button id="midCheck" class="btn-sm btn-dark">아이디 중복 검사</button>
    </div>
    <div class="form-group row">
        <label for="msg" class="col-sm-2 col-form-label"></label>
        <div class="col-sm-10">
            <div id="msg" style="color: red; text-align: left">

            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="mname" class="col-sm-2 col-form-label">이름</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="mname" name="mname" placeholder="한글 또는 영문으로 입력해주세요.">
        </div>
    </div>
    <div class="form-group row">
        <label for="email" class="col-sm-2 col-form-label">이메일 주소</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="email" name="email" placeholder="이메일주소를 입력해주세요.">
        </div>
    </div>
    <%--<div class="form-group row">
        <label for="certification_number" class="col-sm-2 col-form-label">인증번호</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="certification_number" name="certification_number" placeholder="인증번호를 입력해주세요.">
        </div>
    </div>--%>
    <div class="form-group row">
        <label for="pwd1" class="col-sm-2 col-form-label">비밀번호</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="pwd1" name="pwd1" placeholder="비밀번호를 입력해주세요.">
        </div>
    </div>
    <div class="form-group row">
        <label for="pwd1" class="col-sm-2 col-form-label"></label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="pwd2" name="pwd2" placeholder="입력하신 비밀번호를 다시 한번 입력해주세요.">
        </div>
    </div>
    <div class="form-group row">
        <label for="pwdCheck" class="col-sm-2 col-form-label"></label>
        <div class="col-sm-10">
            <div id="pwdCheck" style="color: red; text-align: left">

            </div>
        </div>
    </div>
    <%-- 나중에 폰번호 phone1, phone2, phone3으로 바꾸기 dto도 바꾸기 --%>
    <div class="form-group row">
        <label for="phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대폰 번호를 입력해주세요.(-생략)">
        </div>
    </div>
    <div class="form-group row">
        <label for="birth" class="col-sm-2 col-form-label">생년월일</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일을 입력해주세요.(YYMMDD)">
        </div>
    </div>
    <%--<fieldset class="form-group row">
        <legend class="col-form-label col-sm-2 float-sm-left pt-0">Radios</legend>
        <div class="col-sm-10">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                <label class="form-check-label" for="gridRadios1">
                    First radio
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                <label class="form-check-label" for="gridRadios2">
                    Second radio
                </label>
            </div>
            <div class="form-check disabled">
                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3" disabled>
                <label class="form-check-label" for="gridRadios3">
                    Third disabled radio
                </label>
            </div>
        </div>
    </fieldset>
    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck1">
                <label class="form-check-label" for="gridCheck1">
                    Example checkbox
                </label>
            </div>
        </div>
    </div>--%>
    <div class="form-group">
        <div class="col-sm-10" id="sign_button" style="margin: auto">
            <button type="submit" class="btn btn-primary" style="display: inline-block">회원가입</button>
        </div>
    </div>
</form>
</div>

<script>
    var mid = document.getElementById("mid").value;
    $('#mid').focus();

    $(document).ready(function () {
        $('#midCheck').click(function (e) {
            e.preventDefault();

            var mid = $("[name = 'mid']").val();

            $.ajax({
                type: 'post',
                url: '/CinemaWoody/member/midCheck',
                data: {
                    'mid': mid
                },
                dataType: 'text',
                success: function (result) {
                    alert(result);
                }
            });
        });
    });

    function formCheck(frm) {
        var mid = document.getElementById("mid").value;
        $('#mid').focus();

        var msg = '';

        if (frm.mid.value.length < 5) {
            setMessage('ID의 길이는 5글자 이상이어야 합니다.', frm.mid);
            return false;
        }

        if (mid == '') {
            // alert("아이디를 입력해주세요.");
            $('#mid').focus();

            return false;
        }

        var mname = document.getElementById("mname").value;
        $('#mname').focus();

        if (mname == '') {
            // alert("이름을 입력해주세요.");
            $('#mname').focus();

            return false;
        }

        var email = document.getElementById("email").value;
        $('#email').focus();

        if (email == '') {
            // alert("이메일을 입력해주세요.");
            $('#email').focus();

            return false;
        }

        var pwd1 = document.getElementById("pwd1").value;
        $('#pwd1').focus();

        if (pwd1 == '') {
            // alert("비밀번호를 입력해주세요.");
            $('#pwd1').focus();

            return false;
        }

        var pwd2 = document.getElementById("pwd2").value;
        $('#pwd2').focus();

        if (pwd2 == '') {
            // alert("비밀번호를 입력해주세요.");
            $('#pwd2').focus();

            return false;
        }

        var phone = document.getElementById("phone").value;
        $('#phone').focus();

        if (phone == '') {
            // alert("휴대폰 번호를 입력해주세요.");
            $('#phone').focus();

            return false;
        }

        var birth = document.getElementById("birth").value;
        $('#birth').focus();

        if (birth == '') {
            // alert("생년월일을 입력해주세요.");
            $('#birth').focus();

            return false;
        }

        var pwd1 = document.getElementById("pwd1").value;
        var pwd2 = document.getElementById("pwd2").value;

        if (pwd1 != pwd2) {
            document.getElementById("pwdCheck").innerText = "비밀번호가 일치하지 않습니다. 입력하신 비밀번호를 다시 한번 확인해주세요.";

            return false;
        }

        return true;

    }

    function setMessage(msg, element) {
        document.getElementById("msg").innerHTML = `<div class="fa fa-exclamation-circle"> ${'${msg}'}</div>`;

        if (element) {
            element.select();
        }
    }
</script>

</body>
</html>
