<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <div class="container mt-4">
        <div class="row">
            <!-- sidebar -->
            <div class="col-md-2">
                <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
            </div>

            <!-- 목록페이지 -->
            <div class="col-md-10">
                <div class="row">
                	<!-- forEach에 변수 받아서 알아서 돌리세요 ^.^ -->
                    <c:forEach begin="1" end="9" varStatus="cardIndex">
                        <div class="col-sm-4 mb-5">
                            <div class="card" style="width: 18rem;">
                                <img src="images/cafe.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a href="content.jsp">Card title</a>
                                    </h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        An card
                                    </li>
                                    <li class="list-group-item">
                                        Second Card
                                    </li>
                                    <li class="list-group-item">
                                        <span style="font-size: 24px; color: gold;">
                                            <c:set var="cafe_star" value="3.8" />
                                            <c:set var="num2" value="${num%1}" />
                                            <c:set var="num3" value="${num/1}" />
                                            <c:forEach begin="1" end="${num3}" var="star">
                                                <i class="fas fa-star"></i>
                                            </c:forEach>
                                            <c:if test="${num2>0}">
                                                <i class="fas fa-star-half-alt"></i>
                                            </c:if>
                                            <span style="color: black; margin-left: 10px; font-size: 16px">별점 ${num}</span>
                                        </span>
                                    </li>
                                </ul>
                                <div class="card-body">
                                    <button class="btn btn-primary" style="margin-left: 30px; vertical-align: middle;" onClick="location.href='detail'">지금 바로 확인하기</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
