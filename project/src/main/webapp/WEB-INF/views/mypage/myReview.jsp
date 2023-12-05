<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 리뷰</title>
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
            	<!-- 리뷰컬럼에서 list받아와서 쓰세요^.^ -->
                <div class="mt-5" style="width: 80%; margin: 0 auto; background-color: #fff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: 30px;">
                    <h2>내 리뷰</h2>
                    <table class="table mt-3">
                        <thead>
                            <tr>
                                <th scope="col">리뷰 제목</th>
                                <th scope="col">내용</th>
                                <th scope="col">날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>리뷰 제목</td>
                                <td>리뷰 내용</td>
                                <td>날짜</td>
                            </tr>
                            <!-- 필요에 따라 여러 행을 추가할 수 있습니다 -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
