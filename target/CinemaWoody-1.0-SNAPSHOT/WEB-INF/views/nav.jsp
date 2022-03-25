<%--
  Created by IntelliJ IDEA.
  User: seungkyu
  Date: 2022/03/16
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="loginOutLink" value="${sessionScope.dto.mid==null ? '/member/login' : '/member/logout'}"/>
<c:set var="loginOut" value="${sessionScope.dto.mid==null ? '로그인' : '로그아웃'}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: #e3f2fd;">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <%--<li class="nav-item active">
                    <a class="nav-link" href="<c:url value='/'/>">CINEMA WOODY <span class="sr-only">(current)</span></a>
                </li>--%>
                <li class="nav-item active">
                    <c:choose>
                        <c:when test="${not empty sessionScope.dto.mid}">
                            <div class="nav-link">${sessionScope.dto.mid}님 환영합니다.</div>
                        </c:when>
                    </c:choose>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='${loginOutLink}'/>">${loginOut}</a>
                </li>
                <c:if test="${empty sessionScope.dto.mid}">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/member/insert'/>">회원가입</a>
                </li>
                </c:if>
                <c:if test="${not empty sessionScope.dto.mid}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/member/update/${sessionScope.dto.mid}'/>">회원정보수정</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.dto.role == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='#'/>">회원 목록</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.dto.role == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='#'/>">영화 등록</a>
                    </li>
                </c:if>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                        예매
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">예매하기</a>
                        <a class="dropdown-item" href="#">상영시간표</a>
                        <%--<div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>--%>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/board/list'/>">공지사항</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>

</body>
</html>
