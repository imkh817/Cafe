<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>
    <!-- 부트스트랩 사용 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .result-box {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .result-message {
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 20px;
        }

        .result-username {
            font-size: 24px;
            color: #28a745;
            margin-bottom: 30px;
        }

        .back-link {
            display: block;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="result-box">
    <c:if test="${result == -1 }">
    	<script>
    	alert("올바른 회원 정보를 입력해주십시오.");
    	history.go(-1);
    	</script>
    </c:if>
        <div class="result-message">아이디 찾기 결과</div>
        <div class="result-username">회원님의 아이디는 <span id="username">${id}</span> 입니다.</div>
        <a href="main" class="back-link">홈으로 돌아가기</a>
    </div>
</div>

</body>
</html>
