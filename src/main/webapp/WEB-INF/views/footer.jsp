<%--
  Created by IntelliJ IDEA.
  User: seungkyu
  Date: 2022/03/25
  Time: 12:43 AM
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
        .footer {
            width: 100%;
            z-index: 1;
            bottom: 0;
            position: relative;
        }
    </style>
</head>
<body>

<footer class="footer">
<div style="text-align: left; margin-bottom: 2px; margin-top: 50px;">
    <div class="container">
        <%--<a style="text-decoration: none; color: black" href="<c:url value='/'/>">--%>
            <h3 style="font-family: 'Lobster', cursive; color: gray; margin-bottom: 5px;">CINEMA WOODY</h3>
            <p style="color: gray; font-size: 12px;">
                서울특별시 관악구 신림로 | 고객센터 1234-1234<br>
                대표이사 한승규 | 사업자등록번호 123-12-12345 | 통신판매업신고번호 제1234호 | 개인정보 보호 최고 책임자 한승규<br>
                COPYRIGHT© CINEMA WOODY ALL RIGHT RESERVED.
            </p>
        <%--</a>--%>
    </div>
</div>
</footer>

</body>
</html>
