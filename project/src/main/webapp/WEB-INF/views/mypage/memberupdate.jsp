<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 수정</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	
<script src="/js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						document.getElementById('member_post').value = data.zonecode;
						document.getElementById('member_address1').value = data.address;
					}
				}).open();
	}
</script>
</head>
<%@ include file="../include/header.jsp"%>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px;">
    <div class="container d-flex">
        <div class="col-md-2">
            <%@ include file="../include/sidebar.jsp" %>
        </div>
        <div class="col-md-10">
            <div class="container mt-5">
                <form action="member_update_ok" method="post" name="f"
                    style="max-width: 550px; margin: auto; border: 1px solid #ced4da; padding: 20px; border-radius: 5px;">
                    <h2>정보 수정</h2>
            <input type="hidden" name="member_id" value="${member.member_id }">
                
			<div class="form-group">
				<label for="inputPassword">비밀번호</label> <input type="password"
					id="pw" class="form-control" name="member_pw" value="${member.member_pw}" required>
			</div>
			<div class="form-group">
				<label for="inputName">이름</label> <input type="text" id="name"
					class="form-control" name="member_name" value="${member.member_name }" required>
			</div>
			<div class="form-group">
				<label for="inputName">닉네임</label> 
				<div class="input-group">
				<input type="text" id="nickname" class="form-control" name="member_nickname" value="${member.member_nickname }" required>
					<div class="input-group-append">
						<button type="button" class="btn btn-secondary" onClick="nickname_check()">닉네임 중복체크</button>
					</div>
				</div>	
			</div>

			<div class="form-group">
				<label for="inputEmail">이메일</label>
				<div class="input-group">
					<input type="text" id="member_email" class="form-control"
						style="border-radius: 4px 0 0 4px;" name="member_email" value="${member.member_email}" required>
					<div class="input-group-prepend">
						<span class="input-group-text" style="border-radius: 0 4px 4px 0;">@</span>
					</div>
					
					<input type="text"  class="form-control"
						style="border-radius: 4px 0 0 4px;" name="member_domain" id="member_domain" value="${member.member_domain}" readonly>
						
					<select class="custom-select form-control"
						style="border-radius: 0 4px 4px 0;" name="mail_list" id="mail_list"
						onChange="domain_list()">
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


			<div class="form-group">
				<label for="jumin">전화번호</label>
				<div class="input-group">
					<input type="text" id="phone1" class="form-control"
						style="border-radius: 4px 0 0 4px;" name="member_phone1" value="${member.member_phone1}" required>
					<div class="input-group-prepend">
						<span class="input-group-text" style="border-radius: 0 4px 4px 0;">-</span>
					</div>
					<input type="text" id="phone2" class="form-control"
						style="border-radius: 4px 0 0 4px;" name="member_phone2" value="${member.member_phone2}" required>
					<div class="input-group-prepend">
						<span class="input-group-text" style="border-radius: 0 4px 4px 0;">-</span>
					</div>
					<input type="text" id="phone3" class="form-control"
						style="border-radius: 4px 0 0 4px;" name="member_phone3" value="${member.member_phone3}" required>
				</div>
			</div>
			<div class="form-group">
				<label for="inputZip">우편번호</label>
				<div class="input-group">
					<input type="text" id="member_post" class="form-control"
						name="member_post" value="${member.member_post}" readonly onClick="post_search()">
					<div class="input-group-append">
						<button type="button" class="btn btn-secondary"
							onclick="openDaumPostcode()">우편번호 찾기</button>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress">주소</label> <input type="text"
					id="member_address1" class="form-control" name="member_address1"
					value="${member.member_address1}" required>
			</div>
			<div class="form-group">
				<label for="inputAddress2">상세 주소</label> <input type="text"
					id="address2" class="form-control" name="member_address2" value="${member.member_address2}" required>
			</div>

			<button type="submit" class="btn btn-primary">수정</button>

                </form>
            </div>
        </div>
    </div>
    
    <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</body>
</html>
