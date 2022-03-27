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
    <title>공지사항 수정</title>
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
<form class="qna" action="<c:url value='/board/update/${dto.bno}/${curPage}'/>" method="post">
    <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" name="title" value="${dto.title}">
    </div>
    <div class="form-group">
        <label for="mid">작성자</label>
        <input type="text" class="form-control" id="mid" name="mid" value="${sessionScope.dto.mname}" readonly>
    </div>
    <div class="form-group">
        <label for="content">내용</label>
        <textarea class="form-control" id="content" rows="10" name="content">
            <c:out value="${dto.content}"/>
        </textarea>
    </div>
    <button type="submit" class="btn-sm btn-secondary">수정 완료</button>
</form>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
