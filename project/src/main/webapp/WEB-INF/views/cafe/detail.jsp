<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<style>
.btn input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	outline: none;
	border: none;
	padding: 0; /* 내부 간격 제거 */
	font-size: inherit; /* 글자 크기를 상속받아 버튼 크기 조정 */
}

.btn input[type="radio"]::before {
	content: none;
}

.kakaobtn {
  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  border: 2px solid #2196F3;
  color: #2196F3;
  background-color: #fff;
  border-radius: 5px;
  transition: background-color 0.3s, color 0.3s;
}

.kakaobtn:hover {
  background-color: #2196F3;
  color: #fff;
}
</style>


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장 이름</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="css/style.css">

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script type="text/javascript">

$(document).ready(function(){
	$('#review_list').load('ReviewList?cafe_no=${cafe_no}&pageNum=${pageNum}');
});


</script>

	<script src="js/review.js"></script>
</head>

<body class="detail-body">

	<%-- 제이쿼리 불러와야해서 위쪽에서 include 해야합니다
	<%@ include file="/WEB-INF/views/include/header.jsp"%> --%>
	
	<div class="container mt-4">
		<div class="row">
			<!-- 제목 -->
			<div class="col-12 text-center map-title">스타벅스</div>
			
		</div>
	</div>

	<div class="container">
		<div class="section-container">
			<div class="section">
			
			<c:forEach var="cafelist" items="${cafelist }">
			<input type="hidden" id="cafe_address" value=" ${cafelist.cafe_address}">
				<h2 class="section-title">스타벅스</h2>
				<p class="card-text">전화번호: 02-1234-5678</p>
				<p class="card-text">영업시간: 09:00 AM - 10:00 PM</p>
				<p class="card-text">위치: ${cafelist.cafe_address}</p>
				<h2 class="section-title">메뉴</h2>
				<p class="card-text">아이스 아메리카노 02-1234-5678</p>
				<p class="card-text">카라멜 마끼야또</p>
				<p class="card-text">유자허니차</p>
			</c:forEach>
				<h2 class="section-title">
					찜 <i id="heartIcon" class="far fa-heart" style="cursor: pointer;"></i>
					<input type="hidden" name="like_state" value="0">
				</h2>
			</div>
			<div class="section">
				<!-- 영업 시간 -->
				<h2 class="section-title">#해시태그</h2>
				<!-- 알아서 받아오세용 -->
				<c:forEach var="hashtag" begin="1" end="4">
					<p class="card-text">직원들이 친절해요!!</p>
					<div class="progress" role="progressbar"
						aria-label="Animated striped example" aria-valuenow="75"
						aria-valuemin="0" aria-valuemax="100">
						<div
							class="progress-bar progress-bar-striped progress-bar-animated"
							style="width: <%=65%>%"></div>
						<!-- 수치 입력, 게이지로 나옴 -->
					</div>
					<br>
				</c:forEach>
				<div class="text-start mt-3">

					<!-- 별점 -->
					<!-- 컨트롤러에서 넘어오는 값을 num 대신 넣어주면 됨 -->
					<span style="font-size: 24px; color: gold;"> 
					<c:set var="num" value="3.8"></c:set> 
					<c:set var="num2" value="${num%1 }"></c:set> 
					<c:set var="num3" value="${num/1}"></c:set>
						<c:forEach begin="1" end="${num3}" var="star">
							<i class="fas fa-star"></i>
						</c:forEach> <c:if test="${num2>0 }">
							<i class="fas fa-star-half-alt"></i>
						</c:if> <span style="color: black; margin-left: 10px; font-size: 20px">${num}</span>
					</span>
				</div>
				<br>
			</div>
		</div>

		<div class="section-container">
			<div class="section image-section">
				<!-- 사진 -->
				<h2 class="section-title">사진</h2>
				<img src="images/cafe.jpeg" class="img-thumbnail" alt="..."
					style="width: 100%; height: auto;">
			</div>
			<div class="section map-section">
				<!-- 지도 -->
				<h2 class="section-title">지도</h2>
				<div id="kakao-map"></div>
				<br>
				<!-- <button class="kakaobtn">길찾기 바로가기</button> -->
			</div>
		</div>

		<div class="section review-section">
			<!-- 리뷰 -->
			<h2 class="section-title">리뷰</h2>

			<div class="d-flex justify-content-end mb-3">
				<!-- "글 작성" 버튼을 리뷰 섹션 맨 오른쪽에 배치 -->
				<button id="openModalButton" class="btn btn-primary" onClick="#">리뷰 작성</button>
			</div>

			<!-- 리뷰 목록 -->
			<div id="review_list"></div>

			<!-- 리뷰 작성 모달창 -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="staticBackdropLabel">리뷰 작성</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>

						<div class="modal-body">
							<form action="ReviewInsert" method="post">
								<input type="hidden" name="cafe_no" value="${cafe_no }">
								<img src="images/pin.png" style="width: 1em; font-family: 'Tahoma', sans-serif; font-size: 20px;">
								<span
									style="font-family: 'Tahoma', sans-serif; font-size: 20px;">카페에
									어울리는 하나의 해시태그를 골라주세요</span>

								<!-- 해시태그 목록 출력 -->
								<div class="btn-group-toggle" data-toggle="buttons">
									<c:forEach var="hashtag" items="${tag}">
										<!-- 각 해시태그를 순회하며 라디오 버튼 생성 -->
										<div class="col-4" style="max-width: 600px;">
											<label class="btn btn-outline-secondary"> <input
												type="radio" name="hash_no" value="${hashtag.hash_no}" />
												${hashtag.hash_name}
											</label>
										</div>
									</c:forEach>
								</div>

								<div class="mb-3">
									<label for="reviewAge" class="form-label"> <i class="fas fa-star"></i>별점</label> 
									<select class="form-select" name="cafe_star" id="cafe_star" required>
										<option value="">별점 선택</option>
										<option value="1">1점</option>
										<option value="2">2점</option>
										<option value="3">3점</option>
										<option value="4">4점</option>
										<option value="5">5점</option>
									</select>
								</div>
								<div class="mb-3">
									<label for="reviewCity" class="form-label">내용</label>
									<textarea class="form-control" id="review_content"
										name="review_content" rows="5" maxlength="300" placeholder="100자 이내로 입력하세요." required></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">리뷰 작성</button>
								</div>
							</form>
						</div><!-- end class="modal-body" -->
					</div>
				</div>
			</div>
		</div>

		<!-- 글작성버튼 누르면 모달나오는 스크립트 코드 -->
		<c:set var="id" value="${id}"></c:set>
		<script>
			  document.addEventListener('DOMContentLoaded', function () {
			    var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), {
			      backdrop: 'static',
			      keyboard: false
			    });
			    
			    document.getElementById('openModalButton').addEventListener('click', function () {
			      var id = "<c:out value='${id}'/>";
			      
			      if(!id || id === "null" || id === "undefined"){
			        alert("로그인해주세요.");
			      } else {
			        myModal.show();
			      }
			    });
			  });
			</script>


	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 찜 하트 -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
    	var heartIcon = document.getElementById('heartIcon');
    	var heartValue = document.querySelector('input[name="heart"]');

    	heartIcon.addEventListener('click', function() {
        heartIcon.classList.toggle('far');
        heartIcon.classList.toggle('fas');
        heartIcon.classList.toggle('text-danger');

        // Update the hidden field value
        if (heartIcon.classList.contains('fas')) {
            heartValue.value = '1'; // Set heart value to 1 when filled
            
        } else {
            heartValue.value = '0'; // Set heart value to 0 when outline
        }
        
        location.href = 'heart_result?heart=' + heartValue.value;
			});
		});

</script>





	<!-- 카카오 맵 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc616f3f60dc0ec7cd19b89f1c6dc69a&libraries=services,clusterer,drawing"></script>
	<script>
		var cafe_address = document.getElementById('cafe_address').value;
		console.log(cafe_address);

		var container = document.getElementById('kakao-map');
		
		// geocoder라이브러리 : 주소 정보에 해당하는 좌표값을 요청
		var geocoder = new kakao.maps.services.Geocoder();
		
		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        console.log(result);
		        
		    	var options = { // 지도를 생성할 때 필요한 기본 옵션
		    			center : new kakao.maps.LatLng(result[0].y, result[0].x), // center -> 지도를 생성하는데 반드시 필요함
		    			level : 3
		    		};
		    		
		    	// 지도 생성
		    	var map = new kakao.maps.Map(container, options);
		        
		     	// 마커가 표시될 위치 
				var markerPosition  = new kakao.maps.LatLng(result[0].y, result[0].x); 
				
				// 마커 생성
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정
				marker.setMap(map);
				
				// 길찾기 버튼 클릭
				/* click()
				https://map.kakao.com/link/to/cafe_address,result[0].y, result[0].x */
		    }else{
		    	console.log("카카오 API 호출 실패")
		    }
		};

		geocoder.addressSearch(cafe_address, callback);
		
	
		
		
		
	</script>

</body>

</html>
