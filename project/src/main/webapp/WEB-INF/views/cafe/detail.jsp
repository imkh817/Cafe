<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<!-- /detail 에서 보낸것 : page,cafe_no, -->
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
</style>

<%String id = (String)session.getAttribute("id"); %>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장 이름</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>


<script type="text/javascript">

$(document).ready(function(){
   
   $('#review_list').load('ReviewList?cafe_no=${cafe_no}&page=${page}');
})



</script>

   <script src="js/review.js"></script>
</head>

<body class="detail-body">
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
   <div class="container mt-4">
      <div class="row">
         <!-- 제목 -->
         <div class="col-12 text-center map-title">스타벅스</div>
      </div>
   </div>

   <div class="container">
      <div class="section-container">
         <div class="section">
            <h2 class="section-title">${cafe.cafe_name }</h2>
            <p class="card-text">연락처 : ${cafe.cafe_number }</p>
            <p class="card-text">영업시간: ${cafe.cafe_time1 } AM - ${cafe.cafe_time2 } PM</p>
            <p class="card-text">위치: ${cafe.cafe_address }</p>
            <h2 class="section-title">메뉴</h2>
            <p class="card-text">추천메뉴 : ${cafe.cafe_menu1 }</p>
            <p class="card-text">추천메뉴 : ${cafe.cafe_menu2 }</p>
            <p class="card-text">추천메뉴 : ${cafe.cafe_menu3 }</p>
            <h2 class="section-title">
              					찜 <i id="heartIcon" class="far fa-heart" style="cursor: pointer;"></i>
					<input type="hidden" name="like_state" value="${liked }"> 
			
			
 					<button type="button" class="btn btn-primary"
						onClick="location.href='modifyPlace?cafe_no=${cafe.cafe_no}'">수정</button>
				</h2>
         </div>
         
			<!-- 해시태그 -->
			<div class="section">
				<h2 class="section-title">#해시태그</h2>
				<c:forEach var="hashAvg" items="${hashAvg}">
					<p class="card-text">${hashAvg['HASH_NAME']}</p>
					<div class="progress" role="progressbar"
						aria-label="Animated striped example" aria-valuenow="75"
						aria-valuemin="0" aria-valuemax="100">
						<script>
           				 var totalHashCount = parseInt('${hashAvg['TOTAL_HASH_COUNT']}');
           				 var hashCount = parseInt('${hashAvg['HASH_COUNT']}');
           				 var percentage = (hashCount/totalHashCount)*100;

          				 document.write('<div class="progress-bar progress-bar-striped progress-bar-animated" style="width: ' + percentage + '%"></div>');
       					 </script>
					</div>
					<br>
				</c:forEach>
				
				
				<c:if test="${cafe_star != 0}">
					<div class="text-start mt-3">
						<!-- 별점 -->
						<!-- 컨트롤러에서 넘어오는 값을 num 대신 넣어주면 됨 -->
						<span style="font-size: 24px; color: gold;"> <c:set
								var="num2" value="${cafe_star%1 }" /> <c:set var="num3"
								value="${cafe_star/1}" /> <c:forEach begin="1" end="${num3}"
								var="star">
								<i class="fas fa-star"></i>
							</c:forEach> <c:if test="${num2>=0.5 }">
								<i class="fas fa-star-half-alt"></i>
							</c:if> <span style="color: black; margin-left: 10px; font-size: 20px">${cafe_star}</span>
						</span>

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
				</c:if>
				<br>
			</div>
		</div>

      <div class="section-container">
         <div class="section image-section">
            <!-- 사진 -->
            <h2 class="section-title">사진</h2>
            <img src="upload/${cafe.cafe_image }" class="img-thumbnail" alt="..."
               style="width: 100%; height: auto;">
         </div>
         <div class="section map-section">
            <!-- 지도 -->
            <h2 class="section-title">지도</h2>
            <div id="kakao-map"></div>
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
         <div id="review_list">
         
         </div>
        

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
                     <form id="reviewSubmit" action="ReviewInsert?cafe_no=${cafe_no }&page=${page}" method="post">
                        <input type="hidden" name="member_id" value="test2">
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
                              name="review_content" rows="5" required></textarea>
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
      <!-- 임시 아이디 -->
      <!-- id값이 없으면 리뷰작성 불가 로그인해주세요 alert창 뜨게 함 -->
      <c:set var="id" value="${id }"></c:set>
      <script>
           document.addEventListener('DOMContentLoaded', function () {
             var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), {
               backdrop: 'static',
               keyboard: false
             });
             
             document.getElementById('openModalButton').addEventListener('click', function () {
               var id = "<c:out value='${id}'/>";
               
               if(!id || id === "null" || id === "undefined"){
                 alert("로그인 후 이용해주세요.");
               } else {
                 myModal.show();
               }
             });
           });
         </script>


   </div>
   <!-- </div> -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37889ee25b1504a04dd9fe6a107f4654"></script>
      
      
 <!-- 찜 하트 -->
	<script>
document.addEventListener('DOMContentLoaded', function() {
    var heartIcon = document.getElementById('heartIcon');
    // name 값이 like_state인 첫번 째 input을 구해옴
    var heartValue = document.querySelector('input[name="like_state"]');
    alert("heartValue.value 값은 " + heartValue.value + " 입니다.");
    alert("cafe_no 값은 " + ${cafe.cafe_no} + " 입니다.");
    
    if (heartValue.value == '1') {
        heartIcon.classList.add('fas', 'text-danger');
    } else {
        heartIcon.classList.add('far');
    }

    heartIcon.addEventListener('click', function() {
        alert("찜 버튼 클릭");
        var id = "<c:out value='${id}'/>";	
        alert("ID 값은 " + id + " 입니다.");
        alert("cafe_no 값은 " + ${cafe.cafe_no} + " 입니다.");
        if (!id || id === "null" || id === "undefined") {
            alert("로그인 후 이용해주세요.");
        } else {
        	// 클래스를 모두 제거
            heartIcon.classList.remove('far', 'fas', 'text-danger');
            
            if (heartValue.value == '1') {
                heartValue.value = '0'; 
                heartIcon.classList.add('far');
            } else {
                heartValue.value = '1'; 
                heartIcon.classList.add('fas', 'text-danger');
            }
        
            // 서버에 하트 클릭 이벤트를 전달하는 Ajax 요청
            $.ajax({
                type: "POST",
                url: "heartClick",
                data: { cafe_no: '<c:out value="${cafe.cafe_no}" />', like_state: heartValue.value },
                success: function(response) {
                }
            });
        }
    });
});

</script>






   <!-- 카카오 맵 -->
   <script>
      var container = document.getElementById('kakao-map');
      var options = {
         center : new kakao.maps.LatLng(37.5665, 126.9780),
         level : 3
      };
      var map = new kakao.maps.Map(container, options);
   </script>

</body>

</html>