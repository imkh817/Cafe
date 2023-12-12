<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장소 등록 수정</title>

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
						action="${pageContext.request.contextPath}/recommendUpdate"
						method="post">
						<input type="hidden" value="${board.member_id}" name="member_id">
						<input type="hidden" value="${page}" name="page"> <input
							type="hidden" value="${rec_no}" name="rec_no">



						<div class="form-group">
							<label for="placeName">장소명</label> <input type="text"
								class="form-control" id="rec_name" placeholder="장소명을 입력하세요"
								name="rec_name" value="${board.rec_name}" required>
						</div>
						<div class="form-group">
							<label for="placeAddress">전화번호</label> <input type="text"
								class="form-control" id="rec_number" placeholder="전화번호를 입력하세요"
								name="rec_number" pattern="[0-9]*" inputmode="numeric"
								value="${board.rec_number}" required>

						</div>

						<div class="form-group">
							<label for="inputZip">주소</label>
							<div class="input-group">
								<input type="text" id="rec_address" class="form-control"
									name="rec_address" readonly onClick="post_search()" value="${board.rec_address }">
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary"
										onclick="openDaumPostcode()">검색</button>
								</div>
							</div>
						</div>
					

						<div class="form-group">
							<div class="form-group">
								<label for="mondayOpeningTime">영업 시간</label> <input type="text"
									class="form-control d-inline w-auto" id="rec_time1"
									name="rec_time1" placeholder="시작 시간 (HH:MM)"
									value="${board.rec_time1}" required> <span
									class="d-inline">부터</span> <input type="text"
									class="form-control d-inline w-auto" id="rec_time2"
									name="rec_time2" placeholder="마감 시 (HH:MM)"
									value="${board.rec_time2}" required> <span
									class="d-inline">까지</span>
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
							<textarea class="form-control" id="rec_content" rows="5"
								placeholder="장소 설명을 입력하세요" name="rec_content" required>${board.rec_content}</textarea>
						</div>

						<div class="form-group">
							<label for="placeImage">이미지 업로드</label> <input type="file"
								class="form-control-file" id="placeImage" name="rec_image1"
								required>
						</div>
						<input type="submit" class="btn btn-primary" value="글 수정">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

