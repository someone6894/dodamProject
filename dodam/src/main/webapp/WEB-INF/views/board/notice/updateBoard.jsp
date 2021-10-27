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
	
	<!-- 서머노트 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<script>
$(document).ready(function() {
	  $('#summernote').summernote();
	});


$(document).ready(function() {
    $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
});

</script>

<body>
	<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
	%>

	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		<form action="/board/notice/update" method="post">

			<div class="form-group">
				<label for="no">글번호:</label> <input type="text" class="form-control"
					id="no" name="no" value="${board.no }" readonly>
			</div>

			<div class="w3-row">
				<div class="w3-col w3-container w3-gray" style="width: 150px">
					<label for="title">제목</label>
				</div>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="title" name="title"
					value="${board.title }">
			</div>

			<div class="form-group">
				<label for="writer">작성자 :</label> <input type="text"
					class="form-control" id="writer" name="writer"
					value="${board.writer}" readonly>
			</div>

			<div class="form-group">
				<label for="contents">내용 :</label>
					<input type="text" class="form-control" id="contents" name="contents"
					value="${board.contents }">
				

			</div>

			<button type="submit" class="btn btn-success">수정</button>
			<button type="reset" class="btn btn-warning" onclick="location.href='/board/notice/listAll'">취소</button>

		</form>

	</div>
</body>
</html>