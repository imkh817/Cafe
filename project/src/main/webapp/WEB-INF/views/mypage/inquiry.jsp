<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
#preview {
	max-width: 10rem;
	max-height: 10rem;
	margin-top: 10px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
	// 이미지 미리보기
	function previewImage(input) {
		var preview = document.getElementById('preview');
		var file = input.files[0];
		var reader = new FileReader();

		reader.onloadend = function() {
			preview.src = reader.result;
		};

		if (file) {
			reader.readAsDataURL(file);
		} else {
			preview.src = "";
		}
	}

	// 문의 수정 Ajax 처리
	$(document).ready(function() {
		function updateInquiry(inquiryNo) {
			$.ajax({
				url : "/inquiry_update",
				type : "GET",
				data : {
					inquiry_no : inquiryNo
				},
				success : function(inquiry) {
					console.log("Inquiry received:", inquiry);
					$("#inquiry_title").val(inquiry.inquiry_title);
					$("#inquiry_content").val(inquiry.inquiry_content);
				},
				error : function(error) {
					console.log("Error: " + error);
				}
			});
		}
	});
</script>

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
					<form action="inquiry_submit" method="post"
						enctype="multipart/form-data">
						<div class="form-group">

							<!-- 문의폼 -->
							<h1>1:1문의</h1>
							<br> <br> <label for="inquiry_title">제목 (30자 제한)</label> <input
								type="text" class="form-control" id="inquiry_title"
								name="inquiry_title" placeholder="제목을 30자까지만 입력하세요" maxlength="30">
						</div>
						<div class="form-group">
							<label for="inquiry_content">내용 (200자 제한)</label>
							<textarea class="form-control" id="inquiry_content" rows="5"
								name="inquiry_content" placeholder="내용을 200자까지만 입력하세요" maxlength="200"></textarea>
						</div>
						<div class="form-group">
							<label for="imageUpload">이미지 업로드</label> <input type="file"
								class="form-control-file" id="imageUpload" name="imageUpload"
								onchange="previewImage(this)" accept="image/*"> <img
								id="preview"
								src="<%=request.getContextPath() %>/upload/${inquiry_image}"
								alt="미리보기">
						</div>
						<input type="submit" class="btn btn-primary" value="문의하기">
					</form>
				</div>

				<!-- 문의목록 표시 -->
				<table class="table mt-4">
					<thead class="thead-dark">
						<tr>
							<th scope="col">제목</th>
							<th scope="col">내용</th>
							<th scope="col">날짜</th>
							<th scope="col">답변 여부</th>
						</tr>
					</thead>
					<tbody>
						<!-- 문의 데이터가 있을 경우 아래 행을 추가하여 데이터를 표시 -->
						<c:forEach var="inquiry" items="${inquiryList }"
							begin="${inquiry.startRow }" end="${inquiry.endRow }">
							<tr>
								<!-- **제목** 글자수 10 이상 자르고 ... 표시 -->
								<c:choose>
									<c:when test="${fn:length(inquiry.inquiry_title) <= 10}">
										<td><a
											href="inquiry_detail?inquiry_no=${inquiry.inquiry_no}">${inquiry.inquiry_title}</a></td>
									</c:when>

									<c:otherwise>
										<td><a
											href="inquiry_detail?inquiry_no=${inquiry.inquiry_no}">${fn:substring(inquiry.inquiry_title, 0, 10)}...</a></td>
									</c:otherwise>
								</c:choose>

								<!-- **내용** 글자수 10 이상 자르고 ... 표시 -->
								<c:choose>
									<c:when test="${fn:length(inquiry.inquiry_content) <= 10}">
										<td>${inquiry.inquiry_content}</td>
									</c:when>
									<c:otherwise>
										<td>${fn:substring(inquiry.inquiry_content, 0, 10)}...</td>
									</c:otherwise>
								</c:choose>
								<td>${inquiry.inquiry_reg}</td>

								<!-- **답변 여부** -->
								<c:choose>
									<c:when test="${inquiry.response_state == 'Y'}">
										<td>답변 완료</td>
									</c:when>

									<c:when test="${inquiry.response_state == 'N'}">
										<td>답변 대기</td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				<c:if test="${!empty inquiryList}">
					<!-- 페이징 버튼 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link"
								href="inquiry?member_id=${inquiry.member_id }&pageNum=${pp.startPage }"
								aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							<c:forEach var="i" begin="${pp.startPage }"
								end="${pp.totalPage }">
								<li class="page-item"><a class="page-link"
									href="inquiry?member_id=${inquiry.member_id }&pageNum=${i}">${i}</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link"
								href="inquiry?member_id=${inquiry.member_id }&pageNum=${pp.totalPage }"
								aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
				</c:if>
				
				<c:if test="${empty inquiryList}">
					<h3>문의가 없어요!</h3>
				</c:if>


			</div>
		</div>
	</div>
</body>
</html>
