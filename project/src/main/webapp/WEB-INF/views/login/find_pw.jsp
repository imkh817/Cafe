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
  <form style="max-width: 400px; margin: auto;">
    <h2>비밀번호 찾기</h2>
    <div class="form-group" style="margin-bottom: 10px;">
      <label for="userId">회원 아이디</label>
      <input type="text" id="userId" name="member_id" class="form-control" style="margin-bottom: 10px;" required>
    </div>
    <div class="form-group" id="emailGroup" style="margin-bottom: 10px;">
    <!-- 알아서 @ 스플릿해서 하세요 ^^ -->
      <label for="inputEmail">가입 시 등록한 이메일</label>
      <input type="email" id="inputEmail" class="form-control" style="margin-bottom: 10px;" required>
    </div>
    <button type="button" class="btn btn-primary" onclick="sendVerificationCode()">인증코드 발송</button>
    <div class="form-group" id="verificationGroup" style="display: none; margin-top: 15px;">
      <br>
      <label for="verificationCode">인증코드</label>
      <input type="text" id="verificationCode" class="form-control" style="margin-bottom: 10px;" name="auth_code" required>
      <button type="button" class="btn btn-secondary" onclick="verifyCode()">인증 확인</button>
    </div>
  </form>
</div>

<!-- 부트스트랩 JavaScript 및 jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
  function sendVerificationCode() {
    document.getElementById('emailGroup').style.display = 'none';
    document.getElementById('verificationGroup').style.display = 'block';
  }
  
  function verifyCode() {
    // 여기에 인증 코드 확인하는 로직을 추가하면됨
    // 예를 들어 인증코드가 맞으면 location.href 이런식으로 보내면 됨
    alert('인증 코드 확인 완료!');
  }
</script>

</body>
</html>
