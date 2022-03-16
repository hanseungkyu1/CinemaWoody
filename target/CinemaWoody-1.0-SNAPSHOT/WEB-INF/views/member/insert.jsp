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
</head>
<body>
<jsp:include page="../header.jsp"/>
<jsp:include page="../nav.jsp"/>
<div class="container">
<form action="<c:url value="/member/insert"/>" method="post" onsubmit="return formCheck(this)">
    <div class="title"><h3>간편 회원가입 화면</h3></div>
    <div class="form-group row">
        <label for="mid" class="col-sm-2 col-form-label">아이디</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="mid" name="mid" placeholder="아이디를 입력해주세요.">
        </div>
    </div>
    <div id="msg" class="msg"> </div>
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
    <%-- 나중에 폰번호 phone1, phone2, phone3으로 바꾸기 dto도 바꾸기 --%>
    <div class="form-group row">
        <label for="phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="phone" name="phone">
        </div>
    </div>
    <div class="form-group row">
        <label for="birth" class="col-sm-2 col-form-label">생년월일</label>
        <div class="col-sm-10">
            <input type="date" class="form-control" id="birth" name="birth">
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
    <div class="form-group row">
        <div class="col-sm-10">
            <button type="submit" class="btn btn-primary">회원가입</button>
        </div>
    </div>
</form>
</div>

<script>
    function formCheck(frm) {
        var msg = '';

        if (frm.id.value.length < 5) {
            setMessage('ID의 길이는 5글자 이상이어야 합니다.', frm.id);
            return false;
        }
    }

    function setMessage(msg, element) {
        document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;

        if (element) {
            element.select();
        }
    }
</script>

</body>
</html>
