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
			<div class="col-md-2">
				<%@ include file="../include/sidebar.jsp"%>
			</div>
			<div class="col-md-10">
				<div class="ask_container mt-5">
					<h2>장소 등록</h2>
					<form enctype="multipart/form-data">
						<div class="form-group">
							<label for="placeCategory">카테고리 설정</label> <select
								class="form-control" id="placeCategory" name="category_name">
								<option value="restaurant">음식점</option>
								<option value="cafe">카페</option>
								<option value="park">공원</option>
								<!-- 다른 카테고리도 추가 -->
							</select>
						</div>
						<div class="form-group">
							<label for="placeName">장소명</label> <input type="text"
								class="form-control" id="placeName" name="cafe_name" placeholder="장소명을 입력하세요">
						</div>
						<div class="form-group">
							<label for="placeAddress">전화번호</label> <input type="text"
								class="form-control" id="phoneNumber" name="cafe_number" placeholder="전화번호를 입력하세요">
						</div>
						<div class="form-group">
							<label for="placeAddress">주소</label> <input type="text"
								class="form-control" id="placeAddress" name="cafe_address" placeholder="주소를 입력하세요">
						</div>
						<div class="form-group">
							<div class="form-group">
							<!-- 알아서 시간 합치시면 됩니다! -->
								<label for="mondayOpeningTime">영업 시간</label> <select
									class="form-control d-inline w-auto" id="OpeningTime" name="cafe_time1">
									<option value="09:00">09:00</option>
									<option value="10:00">10:00</option>
								</select> <span class="d-inline">부터</span> <select
									class="form-control d-inline w-auto" id="ClosingTime" name="cafe_time2">
									<option value="17:00">17:00</option>
									<option value="18:00">18:00</option>
								</select> <span class="d-inline">까지</span>
							</div>
						</div>
						<c:forEach var="i" begin="1" end="3">
							<div class="form-group d-flex align-items-center">
								<label for="recommendedMenu">추천 메뉴${i }</label> <input
									type="text" class="form-control d-inline w-auto mx-2"
									id="recommendedMenu" placeholder="메뉴명을 입력하세요" name="cafe_menu${i}">
							</div>
						</c:forEach>

						<div class="form-group">
							<label for="placeDescription">설명</label>
							<textarea class="form-control" id="placeDescription" rows="5"
								placeholder="장소 설명을 입력하세요" name=cafe_content"></textarea>
						</div>
						<div class="form-group">
							<label for="placeImage">이미지 업로드</label> <input type="file"
								class="form-control-file" id="placeImage" name="cafe_image">
						</div>
						<button type="submit" class="btn btn-primary">등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
