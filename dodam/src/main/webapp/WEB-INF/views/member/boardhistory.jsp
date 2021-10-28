<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../../resources/assets/missing/assets/img/brand/favicon.png" type="image/png">
<title>마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel = "stylesheet" href = "css/bootstrap.css">
</head>
<script>
	
</script>
<style>
table {
	width: 500px;
	border: 1px solid ;
	border-collapse: collapse;
}

table td, table th {
	font-size: 12px;
	border: 1px solid;
	padding: 3px;
}

table th {
    background-color: #bbdefb;
	text-align: center;
}

table .td1 {
	width: 4px;
	text-align: center;
}

table .td2 {
	width: 1px;
	text-align: center;
}

table .td3 {
	width: 100px;
	text-align: center;
}

table .td4 {
	width: 1px;
	text-align: center;
}
</style>
<body>

	<jsp:include page="../template.jsp"></jsp:include>
	<div class="container">
		<br />
		<h2>${loginSession.userid }님의게시판 작성 내역</h2>

		<br /> <br />

		<table class="table table-hover">
			<thead>
				<tr>
					<th>제목</th>
					<th>아이디</th>
					<th>내용</th>
					<th>작성 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardhistory }">
					<tr>
						<td class="td1">${board.title }</td>
						<td class="td2">${board.writer }</td>
						<td class="td3">${board.content }</td>
						<td class="td4">${board.postdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<br />
		<a href = "/member/mypage" class = "btn btn-default">뒤로가기</a>
	</div>
</body>
</html>