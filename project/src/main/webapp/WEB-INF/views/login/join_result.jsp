<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result==1 }">
	<script>
		alert("회원가입을 축하합니다.");
		location.href="main";
	</script>
</c:if>

<c:if test="${result!=1 }">
	<script>
		alert("회원가입 실패");
		history.go(-1);
	</script>
</c:if>