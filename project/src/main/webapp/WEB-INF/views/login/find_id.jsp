<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디찾기</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 해당 CSS 파일이 존재하는지 확인 -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/nanum-brush-script@1.1.0/css/nanumbrushscript.css">

<!-- header -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<style>
body {
   font-family: 'Arial', sans-serif;
   background-color: #f8f9fa;
}

.container-fluid {
   border: 1px solid #ced4da;
   border-radius: 0.25rem;
   padding: 1rem;
}

.email {
   display: flex;
   align-items: center;
   width: 35rem;
}

.email-label {
   flex: 1;
   margin-right: 5px;
   margin-top: 2rem;
}

.check-label {
   flex: 1;
   margin-right: 5px;
   margin-top: 2rem;
}

.email .form-control {
   flex: 2;
   margin-right: 5px;
}

.form-select {
   width: 8rem; /* 변경된 부분 */
}

.nav-pills .nav-item+.nav-item {
   border-top: 1px solid #e0e0e0;
}

.row {
   display: flex;
   justify-content: center;
}

.col-md-6 {
   flex: 0 0 50%;
   position: relative;
}

.find_form {
   display: flex; /* 추가된 부분 */
   justify-content: center; /* 추가된 부분 */
}

.find_check {
   width: 5rem;
   margin-top: 1rem;
}

.form-group {
   margin-bottom: 1rem;
}

.form-group.row {
   width: 50rem;
   margin-bottom: 1rem;
}

.vertical-line {
   border-left: 1px solid #e0e0e0;
   height: 100%;
   position: absolute;
   top: 0;
   right: 0;
   bottom: 0;
   margin-right: 1rem;
}

#find_nameIn {
   width: 10rem;
}

#find_checkIn {
   width: 10rem;
}

.form-group.row button[type="submit"] {
   margin-right: 1rem;
}

.find_form form .form-group.row button[type="submit"]:not(:last-child) {
   margin-right: 1rem;
}
</style>
</head>
<body class="findBody">
   <div class="container-fluid">
      <div class="row">
         <!-- 아이디 찾기 폼 -->
         <div class="find_form col-md-6">
            <form method="post" action="quitComp"
               style="margin: 2rem; margin-top: 1rem;">
               <div class="form-group row">
                  <!-- 성명 라벨과 입력 필드 -->
                  <label for="find_name" class="col-sm-2 col-form-label">성명</label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="name" name="member_name"
                        style="width: 10rem;">
                  </div>
               </div>
               <div class="form-group row">
                  <!-- 이메일 라벨과 입력 필드 -->
                  <label for="find_email" class="col-sm-2 col-form-label">이메일</label>
                  <div class="col-sm-10">
                     <!-- 이메일 입력과 도메인 선택 -->
                     <div class="form-group email">
                        <input type="text" class="form-control" id="info_email" name="member_email"
                           placeholder="이메일을 입력하세요">@<input type="text"
                           class="form-control" id="info_domain" placeholder="도메인을 입력하세요">
                        <select class="form-select" aria-label="이메일 도메인 선택" name="member_domain">
                           <option value="" selected>직접 입력</option>
                           <option value="naver.com">네이버</option>
                           <option value="google.com">구글</option>
                           <option value="nate.com">네이트</option>
                           <option value="kakao.com">카카오</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div>
                  <!-- Button trigger modal -->
                  <button type="submit" class="btn btn-primary">아이디 찾기</button>
               </div>
            </form>

         </div>
      </div>
   </div>
</body>
</html>