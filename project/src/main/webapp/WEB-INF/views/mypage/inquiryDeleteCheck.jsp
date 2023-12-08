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
	<!-- 문의가 오라클에서 삭제되면 1을 리턴함 -->
	<c:choose>
		<c:when test="${deleteResult == 1}">
			<script>
				alert("삭제 완료");
				location.href = "inquiry?member_id=${inquiry.member_id}&pageNum=${pageNum}";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("삭제 실패");
				history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>