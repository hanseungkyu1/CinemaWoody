<%--
  Created by IntelliJ IDEA.
  User: seungkyu
  Date: 2022/03/25
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>글 쓰기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .qna {
            margin-top: 100px;
        }
    </style>
</head>
<body>

<jsp:include page="../header.jsp"/>
<jsp:include page="../nav.jsp"/>

<div class="container">
    <form class="qna" action="<c:url value='/admin/insertMovie'/>" method="post">
        <div class="form-group">
            <label for="mTitle">영화 제목</label>
            <input type="text" class="form-control" id="mTitle" name="mTitle">
        </div>
        <div class="form-group">
            <label for="director">감독</label>
            <input type="text" class="form-control" id="director" name="director">
        </div>
        <div class="form-group">
            <label for="actor">배우</label>
            <input type="text" class="form-control" id="actor" name="actor">
        </div>
        <div class="form-group">
            <label for="category">장르</label>
            <input type="text" class="form-control" id="category" name="category">
        </div>
        <div class="form-group">
            <label for="runningTime">러닝타임</label>
            <input type="text" class="form-control" id="runningTime" name="runningTime">
        </div>
        <div class="form-group">
            <label for="openDate">개봉일</label>
            <input type="text" class="form-control" id="openDate" name="openDate">
        </div>
        <div class="form-group">
            <label for="grade">영화등급</label>
            <input type="text" class="form-control" id="grade" name="grade">
        </div>
        <div class="form-group">
            <label for="introduction">소개</label>
            <textarea class="form-control" id="introduction" rows="10" name="introduction"></textarea>
        </div>
        <%-- 수정, 삭제 버튼 --%>
        <button type="submit" class="btn-sm btn-secondary">작성 완료</button>
    </form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
