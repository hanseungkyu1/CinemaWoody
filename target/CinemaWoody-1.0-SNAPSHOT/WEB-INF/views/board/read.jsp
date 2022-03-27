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
    <title>공지사항</title>
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
            <th scope="col" class="col-lg">등록일 : ${dto.regDate.substring(0, 10)} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  수정일 : ${dto.updateDate.substring(0, 10)} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 : ${dto.viewCnt}</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <div style="word-break: break-all; height: 400px;">
                    <pre><c:out value="${dto.content}"/></pre>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <c:if test="${sessionScope.dto.role == 1}">
        <a href="<c:url value='/board/update/${dto.bno}/${curPage}'/>" type="button" class="float-right">
            <button type="button" class="btn btn-sm btn-secondary float-right" style="margin-left: 5px">수정</button>
        </a>
        <a href="<c:url value='/board/delete/${dto.bno}/${curPage}'/>" type="button" class="float-right">
            <button type="button" class="btn btn-sm btn-secondary float-right" style="margin-left: 5px">삭제</button>
        </a>
        <a href="<c:url value='/board/list/${curPage}'/>" type="button" class="float-right">
            <button type="button" class="btn btn-sm btn-secondary float-right" style="margin-left: 5px">목록</button>
        </a>
    </c:if>
</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>
