<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<%@ include file="../include/header.jsp"%>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px;">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <%@ include file="../include/sidebar.jsp" %>
            </div>
            <div class="col-md-10">
                <div class="mt-5" style="width: 50%; margin: 0 auto; background-color: #fff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: 30px;">
                    <form>
                        <div class="form-group">
                            <label for="userId">아이디</label>
                            <input type="text" class="form-control" id="userId" name="member_id" placeholder="아이디를 입력하세요" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; margin-top: 5px; font-size: 16px;">
                        </div>
                        <div class="form-group">
                            <label for="email">이메일</label>
                            <input type="email" class="form-control" id="email" name="member_email" placeholder="이메일을 입력하세요" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; margin-top: 5px; font-size: 16px;">
                        </div>
                        <input type="submit" value="회원 탈퇴" style="padding: 10px 20px; background-color: #ff3333; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-top: 15px;">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
