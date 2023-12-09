<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="/js/member.js"></script>
</head>
<%@ include file="../include/header.jsp"%>
<body
	style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px;">
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<%@ include file="../include/sidebar.jsp"%>
			</div>
			<div class="col-md-10">
				<div class="mt-5"
					style="width: 50%; margin: 0 auto; background-color: #fff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: 30px;">
					<form action="member_delete_ok" id="f">

						<input type="hidden" name="member_id" value="${member.member_id }">
						<div class="form-group">
							<label for="passwd">이름</label> <input type="text"
								class="form-control" id="member_name" name="member_name"
								placeholder="이름을 입력하세요." required
								style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; margin-top: 5px; font-size: 16px;"><br>
						</div>

						<div class="form-group">
							<label for="inputEmail">이메일</label>
							<div class="input-group">
								<input type="text" id="member_email" class="form-control"
									style="border-radius: 4px 0 0 4px;" name="member_email"
									required>
								<div class="input-group-prepend">
									<span class="input-group-text"
										style="border-radius: 0 4px 4px 0;">@</span>
								</div>

								<input type="text" class="form-control"
									style="border-radius: 4px 0 0 4px;" name="member_domain"
									id="member_domain" readonly> <select
									class="custom-select form-control"
									style="border-radius: 0 4px 4px 0;" name="mail_list"
									id="mail_list" onChange="domain_list()">
									<option value="">=이메일선택=</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="0">직접입력</option>
									<!-- 추가적인 도메인은 여기에 추가할 수 있습니다 -->
								</select>
							</div>
						</div>
						<!-- ... (기존 코드) ... -->
						<br> <input type="submit" value="회원 탈퇴"
							style="padding: 10px 20px; background-color: #ff3333; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-top: 15px;">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
