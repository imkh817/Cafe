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

.table th:first-child {
	width: 25%; /* 이름 칼럼의 너비를 25%로 조절 */
}
</style>
<script>
        // 댓글 버튼 클릭 시 호출되는 함수
        function toggleTextInput() {
            var textInputDiv = document.getElementById("textInputDiv");
            var uploadButton = document.getElementById("uploadButton");

            // 현재 상태에 따라 텍스트 입력 부분과 버튼을 토글
            if (textInputDiv.style.display === "none") {
                textInputDiv.style.display = "block";
                uploadButton.innerText = "취소"; // "취소"로 변경
            } else {
                textInputDiv.style.display = "none";
                uploadButton.innerText = "업로드"; // "업로드"로 변경
            }
        }
    </script>
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
            url: "/project/recommendDelete",
            data: { "rec_no": rec_no },
            success: function (response) {
                if (response === "Y") {  
                    alert("글 삭제가 되었습니다.");
                    location.href = "/project/recommendList";
                } else {
                    alert("삭제에 실패했습니다.");
                    location.href = "/project/recommendList";
                }
            },
            error: function () {
                alert("로그인 후 이용해주세요.");
            }
            
           
        });
    }
}

</script>


	<div class="container mt-4">
		<div class="row">

			<!-- 제목 -->
			<!-- 제목 -->
			<div class="col-12 text-center map-title" style="font-weight: bold;">${recommend.rec_name}</div>


			<div class="col-12 d-flex justify-content-end">

				<div style="display: inline-block; margin-right: 10px;">
					<input type="button" class="btn btn-primary"
						onclick="location.href='recommendUpdateForm?rec_no=${rec_no}&page=${page.currentPage}'"
						value="글수정">
				</div>

				<div style="display: inline-block;">
					<input type="button" class="btn btn-primary"
						onclick="deleterecommend(${rec_no})" value="글삭제">
				</div>


			</div>

		</div>
	</div>

	<div class="container">
		<div class="section-container">
			<div class="section">
				<div class="d-flex justify-content-center">
					<h2 class="section-title">${recommend.rec_name}</h2>
				</div>
				<p class="card-text">연락처: ${recommend.rec_number}</p>
				<p class="card-text">영업시간: ${recommend.rec_time1} AM -
					${recommend.rec_time2} PM</p>
				<p class="card-text">위치: ${recommend.rec_address}</p>

				<h2 class="section-title text-center">메뉴</h2>
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
				<img src="upload/${recommend.rec_image}" class="img-thumbnail"
					alt="..." style="width: 100%; height: auto;">
			</div>
			<div class="section map-section">
				<div class="d-flex justify-content-center">
					<h2 class="section-title">지도</h2>
				</div>
				<div id="kakao-map"></div>
			</div>
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
									<span>${list['REPLY_CONTENT']}</span> <span>
										<button id="openModalButton2" class="btn btn-primary"
											onClick="*">댓글 달기</button>
										<button class="btn btn-primary"
											onclick="changeHrefAndNavigate()">삭제</button>
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

	    function changeHrefAndNavigate() {
            // URL 변경
            window.location.href = 'deleteReply';
        }
           
          
         </script>
	</div>

	<!-- </div> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37889ee25b1504a04dd9fe6a107f4654"></script>
	<!-- 찜 하트 -->

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