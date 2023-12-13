<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script>
		alert("이메일로 임시 비밀번호가 전송되었습니다.");
		location.href="main";
	</script>
</c:if>

<c:if test="${result == 2}">
	<script>
		alert("올바른 회원정보를 입력해주세요.");
		history.go(-1);
	</script>
</c:if>