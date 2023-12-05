<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 자체 회원 가입 -->
<c:if test="${result == 1}">
	<script>
		alert("등록되지 않는 회원 입니다.");
		history.go(-1);
	</script>
</c:if>   

<c:if test="${result == 2}">
	<script>
		alert("회원정보가 틀렸습니다.");
		history.go(-1);
	</script>
</c:if>  

<c:if test="${result == 4}">
	<script>
		alert("${name}님 환영합니다!");
		location.href="main";
	</script>
</c:if>  

<!-- 소셜회원 가입 -->
<c:if test="${result == 3}">
	<script>
		alert("로그인 실패!");
		history.go(-1);
	</script>
</c:if>  
 
