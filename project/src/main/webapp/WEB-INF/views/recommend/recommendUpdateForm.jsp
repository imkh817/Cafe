<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장소 등록</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<%@ include file="../include/header.jsp"%>
<body
	style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px;">
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<div class="ask_container mt-5">

					<h2>장소 등록</h2>
					<form enctype="multipart/form-data"
						action="${pageContext.request.contextPath}/recommendUpdate"
						method="post">
						<input type="hidden" value="${board.member_id}" name="member_id">
						<input type="hidden" value="${page}" name="page"> <input
							type="hidden" value="${rec_no}" name="rec_no">



						<div class="form-group">
							<label for="placeName">장소명</label> <input type="text"
								class="form-control" id="placeName" placeholder="장소명을 입력하세요"
								name="rec_name">
						</div>
						<div class="form-group">
							<label for="placeAddress">전화번호</label> <input type="text"
								class="form-control" id="phoneNumber" placeholder="전화번호를 입력하세요"
								name="rec_number" pattern="[0-9]*" inputmode="numeric">

						</div>
						<div class="form-group">
							<label for="placeAddress">주소</label> <input type="text"
								class="form-control" id="placeAddress" placeholder="주소를 입력하세요"
								name="rec_address">
						</div>
						<div class="form-group">
							<div class="form-group">
								<label for="mondayOpeningTime">영업 시간</label> <select
									class="form-control d-inline w-auto" id="OpeningTime"
									name="rec_time1">
									<option>시작 시간</option>
									<option value="09:00">09:00</option>
									<option value="10:00">10:00</option>
									<option value="11:00">11:00</option>
									<option value="12:00">12:00</option>
									<option value="13:00">13:00</option>
									<option value="14:00">14:00</option>
									<option value="15:00">15:00</option>
									<option value="16:00">16:00</option>
								</select> <span class="d-inline">부터</span> <select
									class="form-control d-inline w-auto" id="ClosingTime"
									name="rec_time2">
									<option>마감 시간</option>
									<option value="17:00">17:00</option>
									<option value="18:00">18:00</option>
									<option value="19:00">19:00</option>
									<option value="20:00">20:00</option>
									<option value="21:00">21:00</option>
									<option value="22:00">22:00</option>
									<option value="23:00">23:00</option>
									<option value="24:00">24:00</option>
								</select> <span class="d-inline">까지</span>
							</div>
						</div>
						<c:forEach var="i" begin="1" end="3">
							<div class="form-group d-flex align-items-center">
								<label for="recommendedMenu">추천 메뉴${i }</label> <input
									type="text" class="form-control d-inline w-auto mx-2"
									id="recommendedMenu" placeholder="메뉴명을 입력하세요"
									name="rec_menu${i}">
							</div>
						</c:forEach>

						<div class="form-group">
							<label for="placeDescription">설명</label>
							<textarea class="form-control" id="placeDescription" rows="5"
								placeholder="장소 설명을 입력하세요" name="rec_content"></textarea>
						</div>
						<div class="form-group">
							<label for="placeImage">이미지 업로드</label> <input type="file"
								class="form-control-file" id="placeImage" name="rec_image1">
						</div>
						<input type="submit" class="btn btn-primary" value="글 수정">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

