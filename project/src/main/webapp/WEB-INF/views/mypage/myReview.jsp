<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내 리뷰</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<%@ include file="../include/header.jsp"%>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px;">
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<%@ include file="../include/sidebar.jsp"%>
			</div>
			<div class="col-md-10">
				<!-- 리뷰컬럼에서 list받아와서 쓰세요^.^ -->
				<div class="mt-5" style="width: 100%; margin: 0 auto; background-color: #fff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: 30px;">
					<h2>내 리뷰</h2>
					<table class="table mt-3">
						<thead>

							<tr align="center">
								<th scope="col">카페 이름</th>
								<th scope="col">카페 위치</th>
								<th scope="col">내용</th>
								<th scope="col">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${reviewPagingList }">
								<tr align="center">
									<td>${list['CAFE_NAME'] }</td>
									<td>${list['CAFE_ADDRESS']}</td>
									<td>${list['REVIEW_CONTENT']}</td>
									<td>${list['REVIEW_REG']}
										<!-- 아이디는 세션에서 갖고와도 된다. -->
										<button class="btn btn-danger float-end" onclick="location.href='deleteReview?review_no=${list['REVIEW_NO']}&page=${page.currentPage}'">삭제</button>
									</td>
								</tr>
							</c:forEach>
							<!-- 필요에 따라 여러 행을 추가할 수 있습니다 -->
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:if test="${page.startPage > page.pagePerBlk }">
								<li class="page-item">
									<a class="page-link" href="myReview?page=${page.startPage-1 }&id=${id}">Previous</a>
								</li>
							</c:if>
							<c:forEach begin="${page.startPage }" end="${page.endPage }" var="pageNum">
								<li class="page-item">
									<a class="page-link" href="myReview?page=${pageNum }&id=${id}">${pageNum }</a>
								</li>
							</c:forEach>

							<c:if test="${page.endPage < page.totalPage}">
								<li class="page-item">
									<a class="page-link" href="myReview?page=${page.endPage+1 }&id=${id}">Next</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
