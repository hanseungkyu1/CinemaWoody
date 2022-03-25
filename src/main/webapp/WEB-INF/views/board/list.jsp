<%--
  Created by IntelliJ IDEA.
  User: seungkyu
  Date: 2022/03/25
  Time: 7:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>고객센터</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .table {
            margin-top: 100px;
        }
        tr {
            text-align: center;
        }
        #atag:link {
            color: black;
            text-decoration: none;
        }
        #atag:visited {
            color: black;
            text-decoration: none;
        }
        #atag:hover {
            color: black;
            text-decoration: none;
        }
    </style>
</head>
<body>

<jsp:include page="../header.jsp"/>
<jsp:include page="../nav.jsp"/>

<div class="container">
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col" class="col-lg-1">번호</th>
        <th scope="col" class="col-lg-4">제목</th>
        <th scope="col" class="col-lg-2">등록일</th>
        <th scope="col" class="col-lg-1">조회수</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pt.list}" var="dto">
        <tr>
            <th scope="row">${dto.bno}</th>
            <td><a id="atag" href="<c:url value='/board/read/${dto.bno}/${curPage}'/>">${dto.title}</a></td>
            <td>${dto.regDate.substring(0, 10)}</td>
            <td>${dto.viewCnt}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
    <c:if test="${sessionScope.dto.role == 1}">
        <a href="<c:url value='/board/insertui'/>" type="button">
            <button type="button" class="btn btn-sm btn-secondary float-right">글쓰기</button>
        </a>
    </c:if>
</div>

<jsp:include page="../page.jsp"/>
<jsp:include page="../footer.jsp"/>

</body>
</html>
