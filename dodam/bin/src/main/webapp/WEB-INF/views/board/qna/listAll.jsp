<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script>
	function readBoard(no) {
		location.href='/board/readBoard?no=' + no;
	}
</script>
<style>
#cate {
	color: gray;
}
</style>
<body>
	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		<c:choose>
			<c:when test="${listBoard != null }">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>글내용</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${listBoard }">
							<tr onclick="readBoard(${board.no});">
								<td>${board.no }</td>
								<td>${board.title }</td>
								<td>${board.writer }</td>
								<td>${board.contents }</td>
								<td>${board.regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
		</c:choose>

		<div style="float: right">
			<button type="button" class="btn btn-success"
				onclick="location.href='/board/register';">글 등록</button>
		</div>


<!-- 글검색 기능 +요인 -->
<!-- 		<form action="listAll" method="get"> -->
<!-- 			<select id="searchType" name="searchType"> -->
<!-- 				<option value="title">제목</option> -->
<!-- 				<option value="writer">작성자</option> -->
<!-- 				<option value="content">내용</option> -->
<!-- 			</select> <input type="text" placeholder="검색어를 입력하세요..." name="searchWord" -->
<!-- 				id="searchWord" /> <input type="submit" id="goSearch" value="검색" /> -->
<!-- 		</form> -->
<!-- 글검색 기능 +요인 끝 -->



<!-- 		<div style="margin-top: 15px; clear: right;"> -->

<!-- 페이징 할 거 -->
<!-- 			<ul class="pagination"> -->
<%-- 				<c:if test="${param.pageNo > 1 }"> --%>
<!-- 					<li><a -->
<%-- 						href="/board/listAll?pageNo=1&searchType=${param.searchType}&searchWord=${param.searchWord}">&lt;&lt;</a></li> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${param.pageNo > 1 }"> --%>
<!-- 					<li><a -->
<%-- 						href="/board/listAll?pageNo=${param.pageNo - 1}&searchType=${param.searchType}&searchWord=${param.searchWord}">&lt;</a> --%>
<%-- 				</c:if> --%>

<%-- 				<c:forEach var="i" begin="${pagingInfo.startPageNoOfBlock }" --%>
<%-- 					end="${pagingInfo.endPageNoOfBlock }" step="1"> --%>
<!-- 					<li><a -->
<%-- 						href="/board/listAll?pageNo=${i }&searchType=${param.searchType}&searchWord=${param.searchWord}">${i }</a></li> --%>
<%-- 				</c:forEach> --%>
<%-- 				<c:if test="${param.pageNo < pagingInfo.totalPage }"> --%>
<!-- 					<li><a -->
<%-- 						href="/board/listAll?pageNo=${param.pageNo + 1 }&searchType=${param.searchType}&searchWord=${param.searchWord}">&gt;</a></li> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${param.pageNo < pagingInfo.totalPage }"> --%>
<!-- 					<li><a -->
<%-- 						href="/board/listAll?pageNo=${pagingInfo.totalPage }&searchType=${param.searchType}&searchWord=${param.searchWord}">&gt;&gt;</a></li> --%>
<%-- 				</c:if> --%>
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 주석처리 페이징 끝 -->

	</div>
</body>
</html>