<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자랑하기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script>
	
</script>
<body>

	<jsp:include page="../template.jsp"></jsp:include>
	<div class="container">
		<br />
		<h2>${loginSession.userid }님의 포인트 적립 내역</h2>

		<br />
		<br />

		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>적립 시간</th>
					<th>적립 포인트</th>
					<th>적립 활동</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="point" items="${pointlist }">
					<tr>
						<td>${point.userid }</td>
						<td>${point.dowhen }</td>
						<td>${point.howmuch }</td>
						<td>${point.why }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<br />
		<button onclick="location.href='/member/mypage'">뒤로가기</button>
	</div>
</body>
</html>