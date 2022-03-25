<%--
  Created by IntelliJ IDEA.
  User: seungkyu
  Date: 2022/03/26
  Time: 12:58 AM
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
        .page {
            margin-top: 10px;
            text-align: center;
        }
        .pageNav {
            display: inline-block;
            border: none;
        }
        a:link {
            color: black;
        }
        a:hover {
            color: black;
        }
        a:visited {
            color: black;
        }
        .my.pagination > .active > a,
        .my.pagination > .active > span,
        .my.pagination > .active > a:hover,
        .my.pagination > .active > span:hover,
        .my.pagination > .active > a:focus,
        .my.pagination > .active > span:focus {
            background: gray;
        }
    </style>
</head>
<body>

<div class="page container">
<nav aria-label="Page navigation example" class="pageNav">
    <ul class="pagination my">
        <%-- << --%>
        <li class="page-item">
            <a class="page-link border-white" href="<c:url value='/board/list/${pt.curPage > 1 ? pt.curPage - 1 : 1}'/>" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>

        <%-- page --%>
        <c:forEach begin="${pt.beginPageNum}" end="${pt.endPageNum}" var="i">
        <li class="page-item ${i == pt.curPage ? 'active' : ''}">
            <a class="page-link border-white" href="<c:url value='/board/list/${i}'/>">${i}</a>
        </li>
        </c:forEach>
        <li class="page-item">
            <a class="page-link border-white" href="<c:url value='/board/list/${pt.curPage < pt.totalPage ? pt.curPage + 1 : pt.totalPage}'/>" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>
</div>

</body>
</html>
