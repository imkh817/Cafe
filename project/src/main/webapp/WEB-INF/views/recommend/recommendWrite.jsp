<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장소 등록</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script>
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('rec_address').value = data.address;
			}
		}).open();
	}
</script>

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
						action="${pageContext.request.contextPath}/fileupload"
						method="post" onSubmit="check()">
						<input type="hidden" value="${board.member_id}" name="member_id">

						<div class="form-group">
							<label for="placeName">장소명</label> <input type="text"
								class="form-control" id="placeName" placeholder="장소명을 입력하세요"
								name="rec_name" required>
						</div>
						<div class="form-group">
							<label for="placeAddress">전화번호</label> <input type="text"
								class="form-control" id="phoneNumber" placeholder="전화번호를 입력하세요"
								name="rec_number" pattern="[0-9]*" inputmode="numeric" required>
						</div>
						<div class="form-group">
							<label for="inputZip">주소 찾기</label>
							<div class="input-group">
								<input type="text" id="rec_address" class="form-control"
									name="rec_address" readonly onclick="openDaumPostcode()">
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary"
										onclick="openDaumPostcode()">검색</button>
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							<div class="form-group">
								<label for="mondayOpeningTime">영업 시간</label> <input type="text"
									class="form-control d-inline w-auto" id="OpeningTime"
									name="rec_time1" placeholder="시작 시간 (HH:MM)"> <span
									class="d-inline" required>부터</span> <input type="text"
									class="form-control d-inline w-auto" id="ClosingTime"
									name="rec_time2" placeholder="마감 시간 (HH:MM)"> <span
									class="d-inline" required>까지</span>
							</div>
						</div>

						<div class="form-group d-flex align-items-center">추천 메뉴1 :
							<input type="text" class="form-control d-inline w-auto mx-2"
								id="rec_menu1" name="rec_menu1" value="${board.rec_menu1}"
								required>
						</div>

						<div class="form-group d-flex align-items-center">추천 메뉴2 :
							<input type="text" class="form-control d-inline w-auto mx-2"
								id="rec_menu2" name="rec_menu2" value="${board.rec_menu2}"
								required>
						</div>

						<div class="form-group d-flex align-items-center">추천 메뉴3 :
							<input type="text" class="form-control d-inline w-auto mx-2"
								id="rec_menu3" name="rec_menu3" value="${board.rec_menu3}"
								required>
						</div>



						<div class="form-group">
							<label for="placeDescription">설명</label>
							<textarea class="form-control" id="placeDescription" rows="5"
								placeholder="장소 설명을 입력하세요" name="rec_content" required></textarea>
						</div>
						<div class="form-group">
							<label for="placeImage">이미지 업로드</label> <input type="file"
								class="form-control-file" id="placeImage" name="rec_image1"
								required>
						</div>
						<button type="submit" class="btn btn-primary">등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
