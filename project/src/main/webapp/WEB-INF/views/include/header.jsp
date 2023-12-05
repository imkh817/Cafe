<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
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
				<li class="nav-item ml-auto"><a href="mainlist"
					class="navbar-brand"> <img
						src="<%=request.getContextPath()%>/images/home.png"
						alt="Left Button" style="width: 60px; height: 60px; margin: 10px;">
				</a></li>
			</ul>
		</div>

		<!-- 임시 아이디 -->
		<div class="ml-auto">
			<!-- 로그인 버튼 -->
			<button type="button" class="btn btn-primary"
				onClick="location.href='join'">회원가입</button>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#loginModal">로그인</button>
			<button class="btn btn-primary">로그아웃</button>
			<button class="btn btn-primary" onClick="location.href='dibs'">마이페이지</button>


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
				<form action="main">
					<!-- 로그인 버튼 눌렀을때 이동할 url적는 칸 -->
					<div class="modal-body">
						<h2 class="text-center mb-4">로그인</h2>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="아이디" name="member_id">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호" name="member_pw">
						</div>

						<button class="btn btn-block" style="background-color: #FFEB00; color: black; border: none; padding: 10px 20px; border-radius: 5px;">카카오로 로그인</button>
						
						<button class="btn btn-block" style="background-color: #1EC800; color: white; border: none; padding: 10px 20px; border-radius: 5px;">네이버로 로그인</button>

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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.9/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>