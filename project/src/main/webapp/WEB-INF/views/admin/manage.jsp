<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	
</head>
	
<%@ include file="../include/header.jsp"%>
<body
	style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px;">
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<%@ include file="../include/sidebar.jsp"%>
			</div>
			<div class="col-md-10">
				<!-- 알아서 forEach써서 돌리세요~ -->
				<div class="mt-5" style="width: 100%; margin: 0 auto;">
					<h2>회원 관리</h2>
					<table class="table mt-3">
						<thead class="thead-dark">
							<tr>
								<th scope="col">아이디</th>
								<th scope="col">이름</th>
								<th scope="col">이메일</th>
								<th scope="col">연락처</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td>${list['MEMBER_ID']}</td>
									<td>${list['MEMBER_NAME']}</td>
									<td>${list['MEMBER_EMAIL']}@${list['MEMBER_DOMAIN']}</td>
									<td>${list['MEMBER_PHONE1']}-${list['MEMBER_PHONE2']}-${list['MEMBER_PHONE3']}</td>
									<td><button type="button" class="btn btn-danger"
											onClick="delete1('${list['MEMBER_ID']}')">삭제</button></td>
<%-- 											onClick="delete1(${list['MEMBER_ID']})">삭제</button></td> --%>
								</tr>
							</c:forEach>
							<!-- 여러 회원 정보를 위와 같이 추가할 수 있습니다 -->
						</tbody>
					</table>
				</div>
			</div>
	
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>
			function delete1(member_id){
				alert(member_id);
				$.ajax({
					url : 'deleteMemberManage',
					type : 'POST',
					data : {'member_id' : member_id},
					success : function(data){
						if(data == 1){
							location.href='manage';
						}else{
							alert('회원삭제 실패');
							history.go(-1);
						}
					}
				});
			}
			</script>
</html>
