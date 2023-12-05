<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<style>
  .scroll-container {
    overflow-x: auto;
    white-space: nowrap;
  }

  .row-container {
    display: flex;
  }

  .coffee-btn {
    /* 원하는 스타일링 추가 */
    margin-right: 15px; /* 각 버튼 사이의 간격 조절 */
    font-size: 14px; /* 원하는 폰트 크기 설정 */
    padding: 5px 10px; /* 원하는 안쪽 여백 설정 */
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

<!-- 리뷰작성 해시태그 스크립트 코드 -->
<!-- 버튼 누르면 노란색으로 변경되고, 값들을 hidden의 totalValue의 저장 -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    const buttons = document.querySelectorAll('.coffee-btn');
    const form = document.querySelector('form[action="hashtag_result"]');
    const totalValueInput = document.querySelector('input[name="totalValue"]');
    const myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), {
        backdrop: 'static',
        keyboard: false
    });

    buttons.forEach(btn => {
        btn.addEventListener('click', function() {
            this.classList.toggle('selected');
        });
    });

    myModal._element.addEventListener('hidden.bs.modal', function () {
        buttons.forEach(btn => {
            btn.classList.remove('selected');
        });
    });

    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevents default form submission

        // Get the selected button values and concatenate into a single string
        const selectedValues = Array.from(document.querySelectorAll('.coffee-btn.selected'))
            .map(btn => btn.value)
            .join(','); // Comma-separated values

        // Update the hidden input with the concatenated values
        totalValueInput.value = selectedValues;

        // You can submit the form or perform additional actions here
        form.submit();
    });
});

</script>


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
				<h2 class="section-title">스타벅스</h2>
				<p class="card-text">전화번호: 02-1234-5678</p>
				<p class="card-text">영업시간: 09:00 AM - 10:00 PM</p>
				<p class="card-text">위치: 서울특별시 강남구 신사동 123-456</p>
				<h2 class="section-title">메뉴</h2>
				<p class="card-text">아이스 아메리카노 02-1234-5678</p>
				<p class="card-text">카라멜 마끼야또</p>
				<p class="card-text">유자허니차</p>
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
					<span style="font-size: 24px; color: gold;"> <c:set
							var="num" value="3.8"></c:set> <c:set var="num2"
							value="${num%1 }"></c:set> <c:set var="num3" value="${num/1}"></c:set>
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
			</div>
		</div>

		<div class="section review-section">
			<!-- 리뷰 -->
			<h2 class="section-title">리뷰</h2>

			<div class="d-flex justify-content-end mb-3">
				<!-- "글 작성" 버튼을 리뷰 섹션 맨 오른쪽에 배치 -->

				<button id="openModalButton" class="btn btn-primary" onClick="#">글
					작성</button>
			</div>
			
			<!-- 리뷰 목록 -->
			<form action="#">
				<table class="table table-bordered table-striped">

					<thead>
						<tr>
							<th>#</th>
							<th>이름</th>
							<th>나이</th>
							<th>도시</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" begin="1" end="4">
							<tr>
								<td>1</td>
								<td>John Doe</td>
								<td>25</td>
								<td>New York</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>

			<!-- 페이징 버튼 -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
				</ul>
			</nav>

			<!-- 모달 -->
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
							<!-- 리뷰 작성 폼 -->
							<form action="hashtag_result" method="post">
								<input type="hidden"> <img src="images/pin.png"
									style="width: 1em; font-family: 'Tahoma', sans-serif; font-size: 20px;">
								<span
									style="font-family: 'Tahoma', sans-serif; font-size: 20px;">카페에
									어울리는 해시태그를 골라주세요</span> <input type="hidden" name="totalValue">

								<!-- 가로 스크롤 -->
								<div class="scroll-container" style="max-width: 600px;">
									<!-- 원하는 최대 너비 설정 -->
									<div class="row-container">
										<div style="display: inline-block;">
											<input type="button" name="tag1" class="coffee-btn"
												value="커피가 맛있어요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag2" class="coffee-btn"
												value="분위기가 좋아요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag3" class="coffee-btn"
												value="직원들이 친절해요">
										</div>
									</div>

									<div class="row-container">
										<div style="display: inline-block;">
											<input type="button" name="tag4" class="coffee-btn"
												value="디저트가 맛있어요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag5" class="coffee-btn"
												value="주차하기 좋아요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag5" class="coffee-btn"
												value="주차하기 좋아요">
										</div>
									</div>

									<div class="row-container">
										<div style="display: inline-block;">
											<input type="button" name="tag1" class="coffee-btn"
												value="커피가 맛있어요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag2" class="coffee-btn"
												value="분위기가 좋아요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag3" class="coffee-btn"
												value="직원들이 친절해요">
										</div>
									</div>

									<div class="row-container">
										<div style="display: inline-block;">
											<input type="button" name="tag1" class="coffee-btn"
												value="커피가 맛있어요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag2" class="coffee-btn"
												value="분위기가 좋아요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag3" class="coffee-btn"
												value="직원들이 친절해요">
										</div>
									</div>

									<div class="row-container">
										<div style="display: inline-block;">
											<input type="button" name="tag1" class="coffee-btn"
												value="커피가 맛있어요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag2" class="coffee-btn"
												value="분위기가 좋아요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag3" class="coffee-btn"
												value="직원들이 친절해요">
										</div>
									</div>

									<div class="row-container">
										<div style="display: inline-block;">
											<input type="button" name="tag1" class="coffee-btn"
												value="커피가 맛있어요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag2" class="coffee-btn"
												value="분위기가 좋아요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag3" class="coffee-btn"
												value="직원들이 친절해요">
										</div>
									</div>

									<div class="row-container">
										<div style="display: inline-block;">
											<input type="button" name="tag1" class="coffee-btn"
												value="커피가 맛있어요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag2" class="coffee-btn"
												value="분위기가 좋아요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag3" class="coffee-btn"
												value="직원들이 친절해요">
										</div>
									</div>

									<div class="row-container">
										<div style="display: inline-block;">
											<input type="button" name="tag1" class="coffee-btn"
												value="커피가 맛있어요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag2" class="coffee-btn"
												value="분위기가 좋아요">
										</div>
										<div style="display: inline-block;">
											<input type="button" name="tag3" class="coffee-btn"
												value="직원들이 친절해요">
										</div>
									</div>
								</div>
						</div>

						<div class="mb-3">
									<label for="reviewAge" class="form-label"><i
										class="fas fa-star"></i>별점</label> <select class="form-select"
										name="starRating" id="starRating" required>
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
									<textarea class="form-control" id="reviewCity"
										name="review_content" rows="5" required></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">리뷰 작성</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>

			<!-- 글작성버튼 누르면 모달나오는 스크립트 코드 -->
			<!-- 임시 아이디 -->
			<!-- id값이 없으면 리뷰작성 불가 로그인해주세요 alert창 뜨게 함 -->
			<c:set var="id" value="a"></c:set>
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
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37889ee25b1504a04dd9fe6a107f4654"></script>
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
