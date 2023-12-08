<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
	<script src="./js/member.js"></script>
</head>
<body class="bodyNav">
	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item ml-auto"><a href="main"
					class="navbar-brand"> <img
						src="<%=request.getContextPath()%>/images/home.png"
						alt="Left Button" style="width: 60px; height: 60px; margin: 10px;">
				</a></li>
			</ul>
		</div>
		<!-- 임시 아이디 -->
		<div class="ml-auto">
			<!-- 로그인 버튼 -->
			<c:if test="${id == null}">
			<button type="button" class="btn btn-primary"
				onClick="location.href='join'">회원가입</button>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#loginModal">로그인</button>
			</c:if>
			<c:if test="${id != null }">
			<button class="btn btn-primary" onClick="location.href='member_logout'">로그아웃</button>
			<button class="btn btn-primary" onClick="location.href='dibs'">마이페이지</button>
			</c:if>
		</div>
	</nav>

	<!-- 로그인 모달 코드 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="staticBackdropLabel" aria-hidden="true"
		data-bs-backdrop="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- 로그인을 눌렀을 때 화면에 보이는 모달창 -->
				<form action="member_login_ok" method="post" onSubmit="return check()">
					<!-- 로그인 버튼 눌렀을때 이동할 url적는 칸 -->
					<div class="modal-body">
						<h2 class="text-center mb-4">로그인</h2>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="아이디" id="member_id" name="member_id">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호" id="member_pw" name="member_pw">
						</div>
						
						<!-- 소셜 로그인 버튼 -->
						<div style="text-align: center ">
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=bdffe1412686d86c80754e7a2a386569&redirect_uri=http://localhost/project/callback2&response_type=code" style="margin-right: 30px;">
							<img width="70" src="images/kakaoLoginButton.png" />
						</a>
						
						<a href="login">
							<img width="70" src="images/naverLoginButton.png" />
						</a></div><br>

						<div class="password-reset">
							<a href="find_id">아이디 찾기</a> | <a href="find_pw">비밀번호 찾기</a>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">로그인</button>
						<!-- 로그인 버튼 누르면 위에 적은 url로 이동 -->
					</div>
				</form>
			</div>
			
			
		</div>
	</div>

	<!-- Bootstrap JS 및 jQuery 추가 -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.9/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>