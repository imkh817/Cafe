<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- sidebar.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sidebar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="d-flex" id="wrapper">
    <div class="bg-light border-end" id="sidebar-wrapper" style="width: 250px;">
        <div class="p-3 text-primary">
            마이페이지
        </div>
        <hr>
        <div>
            <a href="dibs" style="text-decoration: none;" class="p-3 text-primary d-block" style="text-decoration: none;">찜 목록</a>
            <a href="myReview" style="text-decoration: none;" class="p-3 text-primary d-block" style="text-decoration: none;">내 리뷰</a>
            <a href="memberupdate" style="text-decoration: none;" class="p-3 text-primary d-block" style="text-decoration: none;">정보 수정</a>
            <a href="quit" style="text-decoration: none;" class="p-3 text-primary d-block" style="text-decoration: none;">회원 탈퇴</a>
            <a href="inquiry" style="text-decoration: none;" class="p-3 text-primary d-block" style="text-decoration: none;">1:1 문의</a>
            <a href="newPlace" style="text-decoration: none;" class="p-3 text-primary d-block" style="text-decoration: none;">장소 등록</a>
            <a href="manage" style="text-decoration: none;" class="p-3 text-primary d-block" style="text-decoration: none;">회원 관리</a>
            <a href="adminInquiry" style="text-decoration: none;" class="p-3 text-primary d-block" style="text-decoration: none;">관리자 1:1 문의</a>
        </div>
    </div>
</div>

</body>
</html>
