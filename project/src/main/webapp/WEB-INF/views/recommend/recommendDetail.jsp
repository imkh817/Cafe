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

.table th:first-child {
	width: 25%; /* 이름 칼럼의 너비를 25%로 조절 */
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
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="js/review.js"></script>
</head>


<body class="detail-body">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


<script>
function deleterecommend(rec_no) {
    console.log("deleterecommend");
    var confirmDelete = confirm("진짜 삭제하시겠습니까?");
    console.log("confirmDelete : " + confirmDelete);
    
    if (confirmDelete) {
        $.ajax({
            type: "POST",
            url: "recommendDelete",
            data: {"rec_no": rec_no },
            success: function (response) {
                if (response === "Y") {  
                    alert("글 삭제가 되었습니다.");
                    location.href = "recommendList";
                } else {
                    alert("삭제에 실패했습니다.");
                    location.href = "recommendList";
                }
            },
            error: function () {
                alert("로그인 후 이용해주세요.");
            }
            
           
        });
    }
}

// 댓글 삭제 
function deleteReply(rec_no, id, reply_no) {
    $.ajax({
        type: 'POST', // HTTP POST 메서드 사용
        url: 'deleteReply', // url
        data: {'rec_no':rec_no,'member_id':id,'reply_no':reply_no}, // url로 넘겨줄 값
        
        success: function (result) { // data는 위의 요청이 성공되면 받는 return값
            // 성공적으로 삭제되었을 때의 동작
            if(result == 1){
            alert('댓글 삭제 성공!');
            location.href="recommendDetail?rec_no=${rec_no}";
            }else{
            alert('댓글 삭제에 실패했습니다.');
            history.go(-1);
            }
            
        },
        error: function (error) {
            // 삭제 실패 시의 동작
        }
    });
}

</script>


	<div class="container mt-4">
		<div class="row">


			<div class="col-12 text-center map-title" style="font-weight: bold;">${recommend.rec_name}</div>


			<div class="col-12 d-flex justify-content-end">

				<c:if test="${id == recommend.member_id}">
					<div style="display: inline-block; margin-right: 10px;">
						<input type="button" class="btn btn-primary"
							onclick="location.href='recommendUpdateForm?rec_no=${rec_no}&page=${page.currentPage}'"
							value="글수정">
					</div>
				</c:if>

				<c:if test="${id == recommend.member_id || id == 'master'}">
					<div style="display: inline-block;">
						<input type="button" class="btn btn-primary"
							onclick="deleterecommend(${rec_no})" value="글삭제">
					</div>
				</c:if>

			</div>

		</div>
	</div>

	<div class="container">
		<div class="section-container">
			<div class="section">
				<input type="hidden" id="cafe_address"
					value=" ${recommend.rec_address}">
				<div class="d-flex ">
					<h2 class="section-title">${recommend.rec_name}</h2>
				</div>
				<p class="card-text">연락처: ${recommend.rec_number}</p>
				<p class="card-text">영업시간: ${recommend.rec_time1} AM -
					${recommend.rec_time2} PM</p>
				<p class="card-text">위치: ${recommend.rec_address}</p>

				<h2 class="section-title">메뉴</h2>
				<p class="card-text">${recommend.rec_menu1}</p>
				<p class="card-text">${recommend.rec_menu2}</p>
				<p class="card-text">${recommend.rec_menu3}</p>
			</div>
			<div class="section">
				<div class="d-flex justify-content-center">
					<h2 class="section-title">카페소개</h2>
				</div>
				<p class="card-text">${content}</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="section-container">
			<div class="section image-section">
				<div class="d-flex justify-content-center">
					<h2 class="section-title">사진</h2>
				</div>
				<img src="upload/${recommend.rec_image}" class="card-img-top"
					alt="..." style="object-fit: cover; height: 400px;">
			</div>
			<div class="section map-section">
				<div class="d-flex justify-content-center">
					<h2 class="section-title">지도</h2>
				</div>
				<div id="kakao-map"></div>
				<br>
				<button class="kakaobtn" id="kakaobtn" style="display: none;">길찾기
					바로가기</button>
			</div>
		</div>

		<div class="section review-section">
			<!-- 리뷰 -->
			<h2 class="section-title">댓글</h2>


			<div class="d-flex justify-content-end mb-3">
				<!-- "글 작성" 버튼을 리뷰 섹션 맨 오른쪽에 배치 -->
				<button id="openModalButton" class="btn btn-primary" onClick="*">댓글
					작성</button>
			</div>

			<!-- 리뷰 목록 -->

			<div id="review_list">
				<table class="table table-bordered table-striped">
					<!-- reviewController에서 reviewList부분에서 받은 것들: review객체, 페이징처리된 list, page객체 -->
					<thead>
						<tr>
							<th>이름</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}">
							<tr>
								<td>${list['MEMBER_NICKNAME']}</td>
								<td>
									<div
										style="display: flex; justify-content: space-between; align-items: center;">
										<span>${list['REPLY_CONTENT']}</span> 
										<span> 
											<c:if
												test="${id eq list['MEMBER_ID']}">
												<button class="btn btn-primary" id="deleteButton" onClick="deleteReply('${rec_no}','${id}','${list['REPLY_NO']}')"
													>삭제</button>
											</c:if>
										</span>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<!-- 페이징 버튼 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${page.startPage > page.pagePerBlk }">
							<li class="page-item"><a class="page-link"
								href="recommendDetail?rec_no=${rec_no }&page=${page.startPage-1 }">Previous</a></li>
						</c:if>
						<c:forEach begin="${page.startPage }" end="${page.endPage }"
							var="pageNum">
							<li class="page-item"><a class="page-link"
								href="recommendDetail?rec_no=${rec_no }&page=${pageNum}">${pageNum }</a></li>
						</c:forEach>

						<c:if test="${page.endPage < page.totalPage}">
							<li class="page-item"><a class="page-link"
								href="recommendDetail?rec_no=${rec_no }&page=${page.startPage-1 }">Next</a></li>
						</c:if>
					</ul>
				</nav>
			</div>


			<!-- 리뷰 작성 모달창 -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="staticBackdropLabel">댓글 작성</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>

						<div class="modal-body">
							<form action="recommendReplyWrite" method="post">
								<input type="hidden" name="member_id" value="${id}"> <input
									type="hidden" name="rec_no" value="${rec_no}">

								<div class="mb-3">
									<label for="reviewCity" class="form-label">내용</label>
									<textarea class="form-control" id="reply_content"
										name="reply_content" rows="5" required></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">댓글 작성</button>
								</div>
							</form>
						</div>
						<!-- end class="modal-body" -->
					</div>
				</div>
			</div>


			<!-- 대댓글 작성 모달창 -->


		</div>
	</div>

	<!-- 글작성버튼 누르면 모달나오는 스크립트 코드 -->
	<!-- 임시 아이디 -->
	<!-- id값이 없으면 리뷰작성 불가 로그인해주세요 alert창 뜨게 함 -->
	<c:set var="id" value="${id }"></c:set>
	<script>
	    var myModal; // 전역 변수로 myModal 선언

	    $(function () {
	        myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), {
	            backdrop: 'static',
	            keyboard: false
	        });

	        // 여러 개의 modal 버튼에 대해 이벤트 핸들러 등록
	        $('[id^=openModalButton2]').on('click', function () {
	            var id = "<c:out value='${id}'/>";

	            if (!id || id === "null" || id === "undefined") {
	                alert("로그인 후 이용해주세요.");
	            } else {
	                myModal.show();
	            }
	        });
	    });

	    document.addEventListener('DOMContentLoaded', function () {
	        document.getElementById('openModalButton').addEventListener('click', function () {
	            var id = "<c:out value='${id}'/>";

	            if (!id || id === "null" || id === "undefined") {
	                alert("로그인 후 이용해주세요.");
	            } else {
	                myModal.show();
	            }
	        });
	    });
	    
           
         </script>


	<!-- </div> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
				
				// 지도가 생성되면 길찾기 버튼 나타나게
	            var kakaobtn = document.getElementById("kakaobtn");
	            kakaobtn.style.display = "block";
	            
	            // 클릭 이벤트에 URL 이동 추가
	               kakaobtn.addEventListener("click", function() {
	                   // 클릭 시 카카오 지도 길찾기 링크로 이동
	                   var linkUrl = "https://map.kakao.com/link/to/" + cafe_address + "," + result[0].y + "," + result[0].x;
	                   window.open(linkUrl, '_blank');
	               });
		    }else{
		    	console.log("카카오 API 호출 실패")
		    }
		};

		geocoder.addressSearch(cafe_address, callback);
		
	</script>


</body>

</html>