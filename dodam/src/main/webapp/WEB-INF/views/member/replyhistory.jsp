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
</head>
<script>

</script>
<body>

	<jsp:include page="../template.jsp"></jsp:include>
	<div class="container">
		<br />
		<h2>${loginSession.userid }님의 댓글 작성 내역</h2>

		<br />
		<br />

		<table class="table table-striped">
			<thead>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>작성 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reply" items="${replyerhistory }">
					<tr>
						<td class = "td1">${reply.replyer }</td>
						<td class = "td2">${reply.contents }</td>
						<td class = "td3">${reply.registerdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<br />
		<a href = "/member/mypage" class = "btn btn-default">뒤로가기</a>
	</div>
</body>
</html>