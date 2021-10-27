<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dodam dodam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- <script type="text/javascript"> $.noConflict(); </script> -->

</head>
<script>

//상세페이지
function readBoard(no) {
	console.log("상세페이지 보기 : " + no);
	location.href = '/board/notice/readBoard?no=' + no;
}

// 슬라이더 테스트



</script>
<style>


  
</style>
<body>
	<div class="container">
	<h1>공지사항</h1>
		<c:choose>
			<c:when test="${noticeBoard != null }">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
						
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${noticeBoard}" begin="0" end="10">
							<tr onclick="readBoard(${board.no});">
								<td>${board.no }</td>
								<td>${board.title }</td>								
								<td>${board.writedate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
		</c:choose>

	</div> 
	
	
	
	
<!-- 	listBoard -->
<!-- 	boardminiList -->
	
</body>
</html>