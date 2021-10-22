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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
%>

	<jsp:include page="../../template.jsp"></jsp:include>	
	<div class="container">

		<div class="form-group">
			<label for="no">글번호:</label> <input type="text"
				class="form-control" id="no" name="no"
				value="${notice.no }" readonly>
			<div>
				<span id='readcount'>조회수 : <span class="badge">${notice.viewcount }</span></span>
			</div>

			
		</div>
		<div class="form-group">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" name="title"
				value="${notice.title }" readonly>
		</div>

		<div class="form-group">
			<label for="writer">작성자 :</label> <input type="text"
				class="form-control" id="writer" name="writer"
				value="${notice.writer}" readonly>
		</div>

		<div class="form-group">
			<label for="content">내용 :</label>
			<div>${notice.contents }</div>
			
			<c:choose>
				<c:when test="${notice.image == '' }">
				</c:when>
				<c:when test="${notice.image != null }">
					<img src="../resources/${board.image }" /> 
				</c:when>
				<c:when test="${notice.notimage != null }">
					<a href='../resources/${board.notimage }'>${board.notimage }</a>
				</c:when>
				
			</c:choose>
			
		</div>
	
	

		<button type="button" class="btn btn-success">수정</button>
		<button type="button" class="btn btn-warning">삭제</button>
		<button type="button" class="btn btn-info"
			onclick="location.href='/board/notice/listAll?pageNo=1'">목록으로</button>	
	</div>

</body>
</html>