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
    <title>영화 목록</title>
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
            <th scope="col" class="col-lg-2">등록일</th>
            <th scope="col" class="col-lg-1">영화 제목</th>
            <th scope="col" class="col-lg-1">감독</th>
            <th scope="col" class="col-lg-1">배우</th>
            <th scope="col" class="col-lg-1">장르</th>
            <th scope="col" class="col-lg-1">러닝타임</th>
            <th scope="col" class="col-lg-1">개봉일</th>
            <th scope="col" class="col-lg-1">영화등급</th>
            <th scope="col" class="col-lg-2"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pt.list}" var="dto">
            <tr>
                <th style="vertical-align: middle" scope="row">${dto.mNo}</th>
                <td style="vertical-align: middle">${dto.regDate.substring(0, 10)}</td>
                <td style="vertical-align: middle"><a id="atag" href="<c:url value='/admin/readMovie/${dto.mNo}/${curPage}'/>">${dto.mTitle}</a></td>
                <td style="vertical-align: middle">${dto.director}</td>
                <td style="vertical-align: middle">${dto.actor}</td>
                <td style="vertical-align: middle">${dto.category}</td>
                <td style="vertical-align: middle">${dto.runningTime}</td>
                <td style="vertical-align: middle">${dto.openDate}</td>
                <td style="vertical-align: middle">${dto.grade}</td>
                <td style="vertical-align: middle">
                    <a href="<c:url value='#'/>" type="button">
                        <button type="button" class="btn btn-sm btn-secondary float-right">수정</button>
                    </a>
                    <a href="<c:url value='#'/>" type="button">
                        <button type="button" class="btn btn-sm btn-secondary float-right">삭제</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${sessionScope.dto.role == 1}">
        <a href="<c:url value='/admin/insertMovieUi'/>" type="button">
            <button type="button" class="btn btn-sm btn-secondary float-right">영화 등록</button>
        </a>
    </c:if>
</div>

<jsp:include page="../adminMoviePage.jsp"/>
<jsp:include page="../footer.jsp"/>

</body>
</html>
