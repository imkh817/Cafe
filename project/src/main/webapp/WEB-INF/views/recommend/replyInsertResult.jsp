<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 1}">
 	<script>
 	alert("댓글 작성 성공!");
 	location.href="recommendDetail?rec_no=${reply.rec_no}";
 	</script>
</c:if>

<c:if test="${result != 1}">
 	<script>
 	alert("댓글 작성 실패");
 	history.go(-1);
 	</script>
</c:if>