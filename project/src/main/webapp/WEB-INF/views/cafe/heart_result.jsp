<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Heart Value</title>
</head>
<body>
    <% 
        String heartValue = request.getParameter("heart"); // heart라는 이름으로 전송된 값을 가져옵니다.
    %>

    <h1>Heart Value: <%= heartValue %></h1> <!-- 받아온 값을 출력합니다. -->
</body>
</html>
