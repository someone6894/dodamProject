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
		<h2>Dodam Dodam 회원 등급 기준</h2>

		<br /> <br />

		<table class="table table-hover">
			<thead>
				<tr>
					<th>등급</th>
					<th>점수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="point" items="${membergrade }">
				<c:choose>
				<c:when test="${point.memberpoint2 != 0 }">
					<tr>
						<td><img src = "../../resources/images/lcj/${point.grade }.PNG"></td>
						<td>${point.memberpoint }  ~  ${point.memberpoint2 }</td>
					</tr>
					</c:when>
					<c:otherwise>
						<td><img src = "../../resources/images/lcj/${point.grade }.PNG"></td>
						<td>${point.memberpoint }  ~</td>
					</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>

		<br />
		
		<button onclick="location.href='/member/mypage'">뒤로가기</button>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>