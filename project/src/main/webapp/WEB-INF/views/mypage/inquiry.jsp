<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>1:1 문의</title>
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
                    <form action="#">
                        <div class="form-group">
                        	<h1>1:1문의</h1>
                        	<br><br>
                            <label for="inquiryTitle">제목</label>
                            <input type="text" class="form-control" id="inquiryTitle" name="inquiry_title" placeholder="제목을 입력하세요">
                        </div>
                        <div class="form-group">
                            <label for="inquiryContent">내용</label>
                            <textarea class="form-control" id="inquiryContent" rows="5" name="inquiry_content" placeholder="내용을 입력하세요"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">문의하기</button>
                    </form>
                </div>
                <!-- 답변 알아서 list받아와서 forEach돌리세요~ -->
                <table class="table mt-5">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" >제목</th>
                            <th scope="col">내용</th>
                            <th scope="col">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 데이터가 있을 경우 아래 행을 추가하여 데이터를 표시 -->
                        <tr>
                            <td><a href="inquiry_response">샘플 1:1 문의 제목</a></td>
                            <td>샘플 1:1 문의 내용</td>
                            <td>샘플 날짜</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
