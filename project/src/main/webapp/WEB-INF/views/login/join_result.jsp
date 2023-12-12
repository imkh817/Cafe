<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 자체 회원가입 -->
<c:if test="${result==1 }">
	<script>
		alert("회원가입을 축하합니다.");
		location.href="main";
	</script>
</c:if>

<!-- 자체 회원가입 실패 -->
<c:if test="${result==0 }">
	<script>
		alert("회원가입 실패");
		history.go(-1);
	</script>
</c:if>

<!-- 네이버 로그인 신규회원 -->
<c:if test="${naverResult==1 }">
	<script>
		alert("${name} 님 회원가입을 축하합니다.");
		location.href="main";
	</script>
</c:if>

<!-- 네이버 로그인 기존회원 -->
<c:if test="${naverResult == 0 }">
	<script>
	alert("${name} 님 환영합니다!")	
	location.href="main";
	</script>
</c:if>

<!-- 카카오 로그인 신규회원 -->
<c:if test="${kakaoResult==1 }">
	<script>
		alert("${name} 님 회원가입을 축하합니다.");
		location.href="main";
	</script>
</c:if>

<!-- 카카오 로그인 기존회원 -->
<c:if test="${kakaoResult == 0}">
	<script>
	alert("${name} 님 환영합니다!")	
	location.href="main";
	</script>
</c:if>
<!-- 카카오 로그인 기존회원 -->
<c:if test="${kakaoResult==2 }">
	<script>
	alert("이미 가입된 회원입니다.")	
	location.href="main";
	</script>
</c:if>