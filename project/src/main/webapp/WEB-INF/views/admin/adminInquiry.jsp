<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>1:1 문의 목록 </title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
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
				<h1>1:1문의 목록</h1>
				<table class="table mt-5">
					<thead class="thead-dark">
						<tr>
							<th scope="col">제목</th>
							<th scope="col">내용</th>
							<th scope="col">날짜</th>
							<th scope="col">답변여부</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${list != null }">
						<!-- 데이터가 있을 경우 아래 행을 추가하여 데이터를 표시 -->
						<c:forEach var="list" items="${list}">
						<tr>
							<c:choose>
							<c:when test="${fn:length(list.inquiry_title)<6 }">	
							<td><a href="adminInquiry_response?inquiry_no=${list.inquiry_no}">${list.inquiry_title}</a></td>
							</c:when>
							<c:otherwise>
							<td><a href="adminInquiry_response?inquiry_no=${list.inquiry_no}">${fn:substring(list.inquiry_title,0,6)}...</a></td>
							</c:otherwise>
							</c:choose>
							<c:choose>
							<c:when test="${fn:length(list.inquiry_content) < 11}">
							<td>${list.inquiry_content }</td>
							</c:when>
							<c:otherwise>
							<td>${fn:substring(list.inquiry_content,0,11)}...</td>
							</c:otherwise>
							</c:choose>
							<td>${list.inquiry_reg }</td>
							<td>${list.response_state }</td>
							
						</tr>
						</c:forEach>
						</c:if>
						<c:if test="${list == null }">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:if>
						
						
					</tbody>
				</table>
					<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page.startPage > page.pagePerBlk }">
				<li class="page-item"><a class="page-link" href="adminInquiry?page=${page.startPage-1 }">Previous</a>
				</li>
			</c:if>
			<c:forEach begin="${page.startPage }" end="${page.endPage }" var="pageNum">
				<li class="page-item"><a class="page-link"
					href="adminInquiry?page=${pageNum }">${pageNum }</a></li>
			</c:forEach>
			
			<c:if test="${page.endPage < page.totalPage}">
			<li class="page-item"><a class="page-link" href="adminInquiry?page=${page.endPage+1 }">Next</a></li>
			</c:if>
		</ul>
	</nav>
			</div>
		</div>
	</div>
</body>
</html>
