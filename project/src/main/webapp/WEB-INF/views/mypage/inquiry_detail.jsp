<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세페이지</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>

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

	function doImgPop(img, width, height) {
        img1 = new Image();
        img1.src = img;
        imgControll(img, width, height);
    }

    function imgControll(img, width, height) {
        if ((img1.width != 0) && (img1.height != 0)) {
            viewImage(img, width, height);
        } else {
            controller = "imgControll('upload/ + " + img + "', " + width + ", " + height + ")";
            intervalID = setTimeout(controller, 20);
        }
    }

    function viewImage(img, width, height) {
        W = 1000;  // 이미지의 너비를 원하는 크기로 설정
        H = 1000; // 이미지의 높이를 원하는 크기로 설정
        O = "width=" + W + ",height=" + H + ",scrollbars=yes";
        imgWin = window.open("", "", O);
        imgWin.document.write("<!DOCTYPE html><html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head></html>");
        imgWin.document.write("<body topmargin=0 leftmargin=0>");
        imgWin.document.write("<img src=" + img + " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.' width=" + W + " height=" + H + ">");
        imgWin.document.close();
    }
	
</script>

<!-- 사진 크기 조절 -->
<style>
#preview {
	max-width: 10rem;
	max-height: 10rem;
	margin-top: 10px;
}
</style>

</head>
<%@ include file="../include/header.jsp"%>
<body
	style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px;">
	<div class="container">
		<form action="inquiry_update" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="inquiry_no" value="${inquiry.inquiry_no }">
			<div class="row">
				<div class="col-md-2">
					<%@ include file="../include/sidebar.jsp"%>
				</div>
				<div class="col-md-10">
					<div class="ask_container mt-5">

						<c:forEach var="list" items="${inquiryDetailList}">

							<!-- 답변 여부가 Y일 때 -->
							<c:if test="${list['RESPONSE_STATE'] eq 'Y' }">

								<!-- 회원의 문의 작성 -->
								<div class="form-group">
									<h3>1:1 문의 상세페이지</h3>
									<br> <label for="inquiryTitle">제목</label> <input
										type="text" class="form-control" id="inquiry_title"
										name="inquiry_title" placeholder="회원이 쓴 문의 제목"
										value="${list['INQUIRY_TITLE'] }" readonly="readonly">
								</div>
								<div class="form-group">
									<label for="inquiryContent">내용</label>
									<textarea class="form-control" id="inquiry_content" rows="5"
										name="inquiry_content" placeholder="회원이 쓴 문의 내용"
										readonly="readonly" style="resize: none;">${list['INQUIRY_CONTENT'] }</textarea>
								</div>

								<div class="form-group">

									<!-- 이미지 미리보기 -->
									<c:if test="${!empty list['INQUIRY_IMAGE'] }">

										<img id="preview"
											src="<%=request.getContextPath() %>/upload/${list['INQUIRY_IMAGE'] }"
											width="295px" height="295px" title="클릭하시면 원본크기로 보실 수 있습니다."
											style="cursor: pointer;"
											onclick="doImgPop('upload/${list['INQUIRY_IMAGE']}','1000px','1000px')" />
									</c:if>
								</div>

								<!-- 관리자의 답변 -->
								<div class="form-group">
									<br>
									<h3>1:1 문의 답변</h3>
									<br> <label for="responseTitle">제목</label> <input
										type="text" class="form-control" id="response_title"
										name="response_title" placeholder="답변 제목 출력"
										value="${list['RESPONSE_TITLE'] }" readonly="readonly">
								</div>
								<div class="form-group">
									<label for="responseContent">내용</label>
									<textarea class="form-control" id="response_content" rows="5"
										name="response_content" placeholder="답변 내용 출력"
										readonly="readonly" style="resize: none;">${list['RESPONSE_CONTENT'] }</textarea>
								</div>

							</c:if>
							<!-- 답변 여부가 Y일 때 end -->

							<!-- 답변 여부가 N일 때 -->
							<c:if test="${list['RESPONSE_STATE'] eq 'N' }">

								<div class="form-group">
									<h3>1:1 문의 상세페이지</h3>
									<br> <label for="inquiryTitle">제목 (30자 제한)</label> <input
										type="text" class="form-control" id="inquiry_title"
										name="inquiry_title" placeholder="회원이 쓴 문의 제목" maxlength="30"
										value="${list['INQUIRY_TITLE'] }">
								</div>
								<div class="form-group">
									<label for="inquiryContent">내용 (200자 제한)</label>
									<textarea class="form-control" id="inquiry_content" rows="5"
										name="inquiry_content" placeholder="회원이 쓴 문의 내용"
										maxlength="200">${list['INQUIRY_CONTENT'] }</textarea>
								</div>
								<div class="form-group">

									<!-- 이미지 미리보기 -->
									<c:if test="${!empty list['INQUIRY_IMAGE'] }">

										<input type="file" id="imageUpload" name="imageUpload"
											class="form-control-file" onchange="previewImage(this)"
											accept="image/*" style="margin-bottom: 5px">
										<img id="preview"
											src="<%=request.getContextPath() %>/upload/${list['INQUIRY_IMAGE'] }"
											width="295px" height="295px" title="클릭하시면 원본크기로 보실 수 있습니다."
											style="cursor: pointer;"
											onclick="doImgPop('upload/${list['INQUIRY_IMAGE']}','1000px','1000px')" />
									</c:if>
									<c:if test="${empty list['INQUIRY_IMAGE'] }">
										<div class="form-group">
											<label for="imageUpload">이미지 업로드</label> <input type="file"
												class="form-control-file" id="imageUpload"
												name="imageUpload" onchange="previewImage(this)"
												accept="image/*"> <img id="preview" src="#"
												alt="미리보기">
										</div>
									</c:if>
								</div>

								<!-- 수정, 삭제 버튼 -->
								<div style="margin-bottom: 2rem">
									<input type="submit" class="btn btn-primary" value="수정">
									<input type="button" class="btn btn-danger" value="삭제"
										onclick="location.href='inquiry_delete?inquiry_no=${list['INQUIRY_NO'] }&pageNum=${pageNum}'">
								</div>

								<h3>답변이 없습니다.</h3>

							</c:if>
							<!-- 답변 여부가 N일 때 end -->

							<!-- 목록 버튼 -->
							<div style="text-align: right;">
								<input type="button" class="btn btn-primary" value="목록"
									onclick="location.href='inquiry?member_id=${list['MEMBER_ID'] }&pageNum=${pageNum}'">
							</div>

						</c:forEach>

					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>