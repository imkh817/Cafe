<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천페이지 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/style.css">


</head>
<%@ include file="../include/header.jsp"%>
<body class="recomendBody">

	<div class="container text-center">
		<div class="d-flex align-items-center flex-column">
			<div>
				<img src="images/good.png" class="small-img" width="100"
					height="100" style="margin-right: 10px;"><br>
				<br>
				<h1 class="text-center mb-4">사장님 홍보 게시판</h1>
			</div>
			
			<c:if test="${id ne null}">
			<div style="margin-left: auto; margin-top: 10px;">
				<a href="recommendWrite"> <input type="button" value="글 작성"
					style="padding: 10px 20px; border-radius: 5px; background-color: #337ab7; color: #fff; border: none;">
				</a>
			</div>
			</c:if>
		</div>

	
		<div class="post-list">
			<ul class="list-group">
				<c:forEach var="list" items="${list}">
					<li class="list-group-item"><a href="recommendDetail?rec_no=${list['REC_NO']}">
					<h3 style="text-align: left;">제목 : ${list['REC_NAME']}</h3></a>
						
						<p style="text-align: left;">조회수 : ${list['REC_READCOUNT']}</p></li>
				</c:forEach>
			</ul>
		<!-- 페이징 버튼 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${page.startPage > page.pagePerBlk }">
					<li class="page-item"><a class="page-link"
						href="recommendList?page=${page.startPage-1 }">Previous</a></li>
				</c:if>
				<c:forEach begin="${page.startPage }" end="${page.endPage }"
					var="pageNum">
					<li class="page-item"><a class="page-link"
						href="recommendList?page=${pageNum}">${pageNum }</a></li>
				</c:forEach>

				<c:if test="${page.endPage < page.totalPage}">
					<li class="page-item"><a class="page-link"
						href="recommendList?page=${page.startPage-1 }">Next</a></li>
				</c:if>
			</ul>
		</nav>
		</div>
	</div>
</body>
</html>
