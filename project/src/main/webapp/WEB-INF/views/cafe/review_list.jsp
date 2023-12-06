<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap JS 및 jQuery 추가 -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.9/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>이름</th>
				<th>해시태그</th>
				<th>내용</th>
				<th>별점</th>
			</tr>
		</thead>
		
		<!-- 리뷰가 없을 때 -->
		<c:if test="${empty reviewList }">
		<tbody>
			<tr>
				<td colspan="4"> 리뷰를 등록해주세요 !</td>
			</tr>
		</tbody>
		</c:if>
		
		<!-- 리뷰가 있을 때 -->
		<c:if test="${!empty reviewList }">
		<tbody>
			<%-- <c:set var="no1" value="${no }"></c:set> --%>
			<c:forEach var="review" items="${reviewList}">
				<tr>
					<td>${review['MEMBER_ID'] }</td>
					<td>${review['HASH_NAME']}</td>
					<td>${review['REVIEW_CONTENT'] }</td>
					<td>${review['CAFE_STAR'] }</td>
				</tr>
			</c:forEach>
		</tbody>
		</c:if>
	</table>

	<!-- 페이징 버튼 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
		<c:if test="${rp.startPage > rp.pagePerBlk }">
			<li class="page-item"><a class="page-link" href="Detail?pageNum=${rp.startPage-1 }"aria-label="Previous">
			<span aria-hidden="true">&laquo;</span></a>
			</li>
		</c:if>
		
		<c:forEach var="i" begin="${rp.startPage }" end="${rp.endPage }">
			<li <c:if test="${rp.currentPage == i }"> class="page-item active"</c:if> >
			<a class="page-link" href="Detail?pageNum=${i }">${i }</a></li>
		</c:forEach>
			
		<c:if test="${rp.endPage < rp.totalPage }">	
			<li class="page-item"><a class="page-link" href="Detail?pageNum=${rp.endPage+1}" aria-label="Next">
			<span aria-hidden="true">&raquo;</span></a>
			</li>
		</c:if>
		</ul>
	</nav>
	
</body>
</html>