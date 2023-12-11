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
function check(){
	 if($.trim($("#cafe_name").val())==""){
		 alert("카페 이름을 입력하세요!");
		 $("#cafe_name").val("").focus();
		 return false;
	 }
	 if($.trim($("#cafe_number").val())==""){
		 alert("카페 전화번호를 입력하세요!");
		 $("#cafe_number").val("").focus();
		 return false;
	 }
	 if($.trim($("#cafe_address").val())==""){
		 alert("카페 주소를 입력하세요!");
		 $("#cafe_address").val("").focus();
		 return false;
	 }
	 if($.trim($("#cafe_time1").val())==""){
		 alert("영업시간을 모두 입력하세요!");
		 $("#cafe_time1").val("").focus();
		 return false;
	 }
	 if($.trim($("#cafe_time2").val())==""){
		 alert("영업시간을 모두 입력하세요!");
		 $("#cafe_time2").val("").focus();
		 return false;
	 }
	 if($.trim($("#cafe_menu1").val())==""){
		 alert("메뉴를 모두 입력하세요!");
		 $("#cafe_menu1").val("").focus();
		 return false;
	 }
	 if($.trim($("#cafe_menu2").val())==""){
		 alert("메뉴를 모두 입력하세요!");
		 $("#cafe_menu1").val("").focus();
		 return false;
	 }
	 if($.trim($("#cafe_menu3").val())==""){
		 alert("메뉴를 모두 입력하세요!");
		 $("#cafe_menu1").val("").focus();
		 return false;
	 }
	 if($.trim($("#cafe_comment").val())==""){
		 alert("카페 소개를 입력하세요!");
		 $("#cafe_comment").val("").focus();
		 return false;
	 }
}
</script>

<!-- Daum address API -->
<script>
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('cafe_address').value = data.address;
			}
		}).open();
	}
</script>


<script>
    function goBack() {
        window.history.back();
    }
</script>


<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<%@ include file="../include/header.jsp"%>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px;">
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<%@ include file="../include/sidebar.jsp"%>
			</div>
			<div class="col-md-10">
				<div class="ask_container mt-5">
					<h2>장소 등록</h2>
					<form enctype="multipart/form-data" action="newPlace_ok" method="post" onsubmit="return check()">
						<div class="form-group">
							<label for="placeCategory">카테고리 설정</label> 
							<!-- 반복문 시작 -->
							<select class="form-control" id="category_no" name="category_no">
								<c:forEach var="c" items="${category}">
									<option value="${c.category_no}">${c.category_name }</option>
								</c:forEach>
							</select> 
							
						</div>
						
						<div class="form-group">
							<label for="placeName">장소명</label> <input type="text"
								class="form-control" id="cafe_name" name="cafe_name" placeholder="장소명을 입력하세요">
						</div>
						
						<div class="form-group">
							<label for="placeAddress">전화번호</label> <input type="text"
								class="form-control" id="cafe_number" name="cafe_number" placeholder="전화번호를 입력하세요">
						</div>

						<div class="form-group">
							<label for="placeAddress">주소</label>
							<div class="input-group">
								<input type="text" id="cafe_address" class="form-control"
									name="cafe_address" readonly placeholder="주소를 입력하세요" onClick="openDaumPostcode()">
								
								<div class="input-group-append">
									<input type="button" class="btn btn-secondary"
										onclick="openDaumPostcode()" value="검색"/>
								</div>
							</div>
							<br>



							<div class="form-group">

								<label for="mondayOpeningTime">영업 시간</label> <input type="text"
									class="form-control d-inline w-auto" id="cafe_time1"
									name="cafe_time1" placeholder="ex)09:00"> <span
									class="d-inline">부터</span> <input type="text"
									class="form-control d-inline w-auto" id="cafe_time2"
									name="cafe_time2" placeholder="ex)18:00"> <span
									class="d-inline">까지</span> <span class="d-inline">까지</span>
							</div>

							<c:forEach var="i" begin="1" end="3">
								<div class="form-group d-flex align-items-center">
									<label for="recommendedMenu">추천 메뉴${i }</label> <input
										type="text" class="form-control d-inline w-auto mx-2"
										id="cafe_menu${i}" placeholder="메뉴명을 입력하세요"
										name="cafe_menu${i}">
								</div>
							</c:forEach>

							<div class="form-group">
								<label for="placeDescription">설명</label>
								<textarea class="form-control" id="cafe_comment" rows="5"
									placeholder="장소 설명을 입력하세요" name="cafe_comment"></textarea>
							</div>
							<div class="form-group">
								<label for="placeImage">이미지 업로드</label> <input type="file"
									class="form-control-file" id="cafe_image" name="cafe_image1">
								<input type="submit" value="등록" class="btn btn-primary" /> <input
									type="button" value="취소" class="btn btn-primary"
									onclick="goBack()" />
							</div>
							<!-- <button type="submit" class="btn btn-primary">등록</button> -->
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
