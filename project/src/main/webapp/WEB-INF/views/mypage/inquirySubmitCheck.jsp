<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 문의가 오라클에 삽입되면 1을 리턴함 -->
	<c:choose>
		<c:when test="${result == 1}">
			<script>
				alert("문의 완료");
				location.href = "inquiry?member_id=${member_id}&pageNum=${pageNum}";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("문의 실패");
				history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>