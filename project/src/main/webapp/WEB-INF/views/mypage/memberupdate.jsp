<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 수정</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<%@ include file="../include/header.jsp"%>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px;">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <%@ include file="../include/sidebar.jsp" %>
            </div>
            <div class="col-md-10">
                <div class="ask_container mt-5">
                    <h2>회원 수정</h2>
                    <form>
                        <div class="form-group">
                            <label for="userID">아이디</label>
                            <input type="text" class="form-control" id="userID" name="member_id" placeholder="아이디를 입력하세요">
                        </div>
                        <div class="form-group">
                            <label for="userName">이름</label>
                            <input type="text" class="form-control" id="userName" name="member_name" placeholder="이름을 입력하세요">
                        </div>
                        <div class="form-group">
                        	<!-- 알아서 @스플릿 해서 쓰세요^.^ -->
                            <label for="userEmail">이메일</label>
                            <input type="email" class="form-control" id="userEmail" name="member_email" placeholder="이메일을 입력하세요">
                        </div>
                        <div class="form-group">
                        	<!-- 알아서 -스플릿해서 붙여서 쓰세요 -->
                            <label for="userPhone">연락처</label>
                            <input type="text" class="form-control" id="userPhone"  name="member_phone" placeholder="연락처를 입력하세요">
                        </div>
                        <button type="submit" class="btn btn-primary">수정 완료</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
