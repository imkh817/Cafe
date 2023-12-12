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
                    <form action="member_delete_ok">
                        
                         <input type="hidden" name="member_id" value="${member.member_id }">
                        <div class="form-group">
                            <label for="passwd">비밀번호</label>
                            <input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요." style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; margin-top: 5px; font-size: 16px;">
                        </div>
                        <input type="submit" value="회원 탈퇴" style="padding: 10px 20px; background-color: #ff3333; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-top: 15px;">
                    </form>
                    <br>
            <div>
            	<input type="button" class="btn btn-outline-info" value="소셜 로그인 회원은 정보수정에서 비밀번호를 설정해주세요 :)" onClick="location.href='member_update'" >
            </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
