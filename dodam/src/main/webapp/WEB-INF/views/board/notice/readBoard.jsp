<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>자세히 보기</title>
</head>
<body>
	<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
	%>

	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">

		<div class="form-group">
			<label for="no">글번호:</label> <input type="text" class="form-control"
				id="no" name="no" value="${board.no }" readonly>
			<div>
				<span id='readcount'>조회수 : <span class="badge">${board.viewcount }</span></span>
			</div>


		</div>

		<div class="w3-row">
			<div class="w3-col w3-container w3-gray" style="width: 150px">
				<label for="title">제목</label>
			</div>
			<div class="w3-rest w3-container">
				<p>공지사항</p>
			</div>
		</div>
		<div class="form-group">
			 <input type="text"
				class="form-control" id="title" name="title"
				value="${board.title }" readonly>
		</div>

		<div class="form-group">
			<label for="writer">작성자 :</label> <input type="text"
				class="form-control" id="writer" name="writer"
				value="${board.writer}" readonly>
		</div>

		<div class="form-group">
			<label for="content">내용 :</label>
			<div>${board.contents }</div>

		</div>



		<button type="button" class="btn btn-success" onclick="location.href='/board/notice/updateBoard?no=${board.no }'">수정</button>
		<button type="button" class="btn btn-warning" onclick= "location.href='/board/notice/delete?no=${board.no }'">삭제</button>
		<button type="button" class="btn btn-info"
			onclick="location.href='/board/notice/listAll?pageNo=1'">목록으로</button>
	</div>

</body>
</html>