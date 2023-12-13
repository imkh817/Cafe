<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 답변</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<script>
    function doImgPop(img, width, height) {
        img1 = new Image();
        img1.src = img;
        imgControll(img, width, height);
    }

    function imgControll(img, width, height) {
        if ((img1.width != 0) && (img1.height != 0)) {
            viewImage(img, width, height);
        } else {
            controller = "imgControll('" + img + "', " + width + ", " + height + ")";
            intervalID = setTimeout(controller, 20);
        }
    }

    function viewImage(img, width, height) {
        W = 1000;  // 이미지의 너비를 원하는 크기로 설정
        H = 1000; // 이미지의 높이를 원하는 크기로 설정
        O = "width=" + W + ",height=" + H + ",scrollbars=yes";
        imgWin = window.open("", "", O);
        imgWin.document.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
        imgWin.document.write("<body topmargin=0 leftmargin=0>");
        imgWin.document.write("<img src=" + img + " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.' width=" + W + " height=" + H + ">");
        imgWin.document.close();
    }
</script>


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
					<div class="form-group">
						<h3>1:1문의 내용</h3>
						<br> <br> <label for="inquiryTitle">제목</label> <input
							type="text" class="form-control" id="inquiryTitle"
							name="inquiry_title" value="${inquiry.inquiry_title }" readonly>
					</div>
					<div class="form-group">
						<label for="inquiryContent">내용</label>
						<textarea class="form-control" id="inquiryContent" rows="5"
							name="inquiry_content" placeholder="회원이 쓴 문의 출력" readonly>${inquiry.inquiry_content }</textarea>
					</div>
					<div class="form-group">
					<div>
					<label for="inquiryContentFile">문의내용 첨부파일(이미지 클릭시 확대창 열림)</label>
					</div>
					<div>
						<img src="upload/${inquiry.inquiry_image}" width="295px" height="295px"
							title="클릭하시면 원본크기로 보실 수 있습니다." style="cursor: pointer;"
							onclick="doImgPop('upload/${inquiry.inquiry_image}','1000px','1000px')"  />
					</div>
					</div>
				</div>

				<br> <br>
				<c:if test="${response != null }">
					<form action="writeResponse?inquiry_no=${inquiry.inquiry_no }"
						method="post">
						<h3>1:1문의 답변</h3>

						<div class="ask_container mt-5">
							<div class="form-group">
								<input type="hidden" name="inquiry_no"
									value="${inquiry.inquiry_no }"> <label
									for="inquiryResponseTitle"></label> <input type="text"
									class="form-control" id="inquiryResponseTitle"
									name="response_title" value="${response.response_title }">
							</div>
							<div class="form-group">
								<label for="inquiryResponseContent">내용</label>
								<textarea class="form-control" id="inquiryResponseContent"
									rows="5" name="response_content" placeholder="문의답변 내용을 입력하세요">${response.response_content }</textarea>
							</div>
							<button type="submit" class="btn btn-primary">답변하기</button>
						</div>
					</form>
				</c:if>
				<c:if test="${response == null }">
					<form action="writeResponse?inquiry_no=${inquiry.inquiry_no }"
						method="post">
						<h3>1:1문의 답변</h3>

						<div class="ask_container mt-5">
							<div class="form-group">
								<input type="hidden" name="inquiry_no"
									value="${inquiry.inquiry_no }"> <label
									for="inquiryResponseTitle">제목</label> <input type="text"
									class="form-control" id="inquiryResponseTitle"
									name="response_title" placeholder="제목을 입력하세요">
							</div>
							<div class="form-group">
								<label for="inquiryResponseContent">내용</label>
								<textarea class="form-control" id="inquiryResponseContent"
									rows="5" name="response_content" placeholder="문의답변 내용을 입력하세요"></textarea>
							</div>
							<button type="submit" class="btn btn-primary">답변하기</button>
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</div>
	
</body>
</html>
