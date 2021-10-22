<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>

<body>
	<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
	%>

	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		<h2>글 쓰기 페이지</h2>
		<form action="/board/createBoard" method="post" >
			<div class="form-group">
				<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" name="title">
			</div>

			<div class="form-group">
				<label for="writer">작성자 :</label> <input type="text"
					class="form-control" id="writer" name="writer" value="${member.userid }" readonly><span
					id="writerError" class="error"></span>
			</div>

			<div class="form-group">
				<label for="content">내용 :</label>
				<textarea rows="20" cols="150" id="content" name="content"></textarea>

			</div>
		
	
			<button type="submit" class="btn btn-success">저장</button>
			<button type="reset" class="btn btn-warning">취소</button>
		</form>
		
	</div>

</body>
</html>