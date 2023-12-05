<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.17.0/font/bootstrap-icons.css">

</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-12 text-center map-title" style="margin-bottom: 20px;">원하는 카테고리를 골라보세요</div>
		</div>
		<div class="row">
			<c:forEach items="${list}" var="item">
				<div class="col-md-4 mb-4" style="transition: transform 0.3s ease-in-out;">
					<div class="card" style="border-radius: 15px; overflow: hidden; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
						<div class="card-body" style="padding: 20px; background-color: #ffffff; color: #495057; text-align: center;">
							<h5 class="card-title" style="font-size: 1.5rem; color: #495057; margin-bottom: 10px;">${item.category_name }</h5>
							<a href="list?category=${item.category_name }" class="btn btn-primary" style="background-color: #007bff; color: #fff; padding: 10px 20px;">구경하기</a>
						</div>
					</div>
				</div>
			</c:forEach>

			<div class="col-sm-4 mb-5 ml-auto">
				<div class="card" style="border: none;">
					<div class="card-body" style="background-color: #ffffff;">
						<a href="clientRecommend"><h5 class="card-title" align="center">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
</svg>
<span style="margin-left: 5px;">카페 홍보하고 싶은 사람 드루와</span>

						</h5>
						</a>
					</div>
				</div>
			</div>



		</div>
	</div>
</body>
</html>
