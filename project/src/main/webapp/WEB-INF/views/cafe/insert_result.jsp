<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<body>
    <c:if test="${result > 0 }">
    <script type="text/javascript">
    	alert("리뷰작성에 성공하였습니다.");
    	location.href="detail?cafe_no=${cafe_no}";
    </script>
    </c:if>
    
    <c:if test="${result <= 0 }">
    <script type="text/javascript">
    	alert("리뷰 등록 실패");
    	history.go(-1);
    </script>
    </c:if>
    
</body>
</html>
