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
<form class="qna" action="<c:url value='/board/insert'/>" method="post">
    <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" name="title">
    </div>
    <div class="form-group">
        <label for="mid">작성자</label>
        <input type="text" class="form-control" id="mid" name="mid" value="${sessionScope.dto.mname}" readonly>
    </div>
    <div class="form-group">
        <label for="content">내용</label>
        <textarea class="form-control" id="content" rows="10" name="content">
        </textarea>
    </div>
    <button type="submit" class="btn-sm btn-secondary">작성 완료</button>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
