<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dodam dodam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- <script type="text/javascript"> $.noConflict(); </script> -->

</head>
<script>

//상세페이지
function readBoard(no) {
	console.log("상세페이지 보기 : " + no);
	location.href = '/board/notice/readBoard?no=' + no;
}

function missingBoard(no){
	console.log("찾아요 보기 :" + no);
	location.href = '/board/missing/viewBoard?no=' + no;
}

// 슬라이더 테스트



</script>
<style>


table{
	display : inline-block;
	position : relative;
	
}

img{
  vertical-align:top;
}

a.relative{
	position: relative;
	left:600px;
	bottom: 465px;
}

h2.move{
	position: relative;
	left:600px;
	bottom: 480px;
}

</style>
<body>
	<div class="container" style="font-family: 'Gowun Dodum', sans-serif;">
	<h2>공지사항</h2>
		<c:choose>
			<c:when test="${noticeBoard != null }">
				<table class="table table-hover" style=" width:600px; height:400px;">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
						
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${noticeBoard}" begin="0" end="8">
							<tr onclick="readBoard(${board.no});">
								<td>${board.no }</td>
								<td>${board.title }</td>								
								<td>${board.writedate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table><br/>
			</c:when>
		</c:choose>
			<h2 class="move" style="font-family: 'Jua', sans-serif;">전시회 둘러보기</h2>
				<c:forEach var="event" items="${list}" begin="0" end="1">
				<a href="/board/event/view?no=${event.no}" class="relative">
				
      			<img src="${event.thumbimg }" class="relative"style="width: 250px; height:350px">
      			</a>
				</c:forEach>
				
	</div>
	
	
	
	
<!-- 	listBoard -->
<!-- 	boardminiList -->
	
</body>
</html>