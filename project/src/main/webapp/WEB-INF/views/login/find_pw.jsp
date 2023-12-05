<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>비밀번호 찾기</title>
  <!-- 부트스트랩 CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container mt-5">
  <form style="max-width: 400px; margin: auto;" action="sendVerificationCode">
    <h2>비밀번호 찾기</h2><br>
    <div class="form-group" style="margin-bottom: 10px;">
      <label for="userId">회원 아이디</label>
      <input type="text" id="userId" name="member_id" class="form-control" style="margin-bottom: 10px;" required>
    </div>
    <div class="form-group" id="emailGroup" style="margin-bottom: 10px;">
    <!-- 알아서 @ 스플릿해서 하세요 ^^ -->
      <label for="inputEmail">가입 시 등록한 이메일</label>
      <input type="email" id="inputEmail" class="form-control" name="totalEmail" style="margin-bottom: 10px;" required>
    </div><br>
    <input type="submit" value="임시 비밀번호 발송" class="btn btn-primary">
  </form>
</div>

<!-- 부트스트랩 JavaScript 및 jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
