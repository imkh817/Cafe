<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 있는 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<%@ include file="../include/header.jsp" %>
<body class="recomendBody">

<div class="container text-center">
 <div class="d-flex align-items-center flex-column">
    <div>
        <img src="images/good.png" class="small-img" width="100" height="100" style="margin-right: 10px;">
        <h1 class="text-center mb-4">사장님 홍보 게시판</h1>
    </div>
    <div style="margin-left: auto; margin-top: 10px;">
        <a href="recommendWrite">
        <input type="button" value="글작성" style="padding: 10px 20px; border-radius: 5px; background-color: #337ab7; color: #fff; border: none;">
        </a>
    </div>
</div>


    <!-- forEach 알아서 뽑으세요 게시물 목록 -->
    <div class="post-list">
        <ul class="list-group">
        <c:forEach var="list" begin="1" end="5">
            <li class="list-group-item">
                <a href="detail?cate=recommend"><h3 style="text-align: left;">게시물 제목 1</h3></a>
                <p style="text-align: left;">작성자: 홍길동</p>
                <p style="text-align: left;">조회수 : 10</p>
            </li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
