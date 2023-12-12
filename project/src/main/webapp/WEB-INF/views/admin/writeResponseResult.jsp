<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:if test="${result == 1 }">
	<script>
		alert("답변 작성 완료");
		location.href="adminInquiry";
	</script>
</c:if>

<c:if test="${result == 0 }">
	<script>
		alert("답변 작성 실패");
		history.go(-1);
	</script>
</c:if>

<c:if test="${check == 1 }">
	<script>
		alert("답변 수정 성공");
		location.href="adminInquiry";
	</script>
</c:if>