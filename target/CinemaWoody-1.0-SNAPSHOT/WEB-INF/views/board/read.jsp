<%--
  Created by IntelliJ IDEA.
  User: seungkyu
  Date: 2022/03/26
  Time: 2:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .table {
            margin-top: 100px;
        }
        td {
            font-weight: normal;
            font-size: 14px;
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
            <th scope="col" class="col-lg">${dto.title}</th>
        </tr>
        <tr>
            <th scope="col" class="col-lg">등록일 | ${dto.regDate.substring(0, 10)} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 | ${dto.viewCnt}</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <div style="word-break: break-all">
                    ${dto.content}
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <%-- 수정, 삭제, 목록 되돌아가기 구현 --%>
    <%--<c:if test="${sessionScope.dto.role == 1}">
        <a href="<c:url value='/board/insertui'/>" type="button">
            <button type="button" class="btn btn-sm btn-secondary float-right">수정</button>
        </a>
    </c:if>--%>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
