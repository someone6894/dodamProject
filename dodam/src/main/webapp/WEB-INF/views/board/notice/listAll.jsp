<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도담도담 공지사항</title>
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
		location.href='/board/notice/readBoard?no=' + no;
	}
</script>
<style>
.header_container {
	margin-top: 50px;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
	font-weight: 600;
	background-color: ffffcc;
}

.table_title {
	text-align: center;
	align-items: center;
}

</style>

<body>

	<jsp:include page="../../template.jsp"></jsp:include>

	<!-- 상단 디자인 -->

	<div class="header_container"
		style="font-weight: bold; border: 1px solid1blue; width: 50%; margin: 0 auto;">
		<h3>공지사항 게시판</h3>
		<div></div>
		<p>누군가의 가족이자, 누군가의 집사인 우리들을 위한 공지사항 및 관리 팁 들이 있는 게시판입니다.</p>

	</div>


	<!--  -->


	<div class="container">
		<c:choose>
			<c:when test="${listBoard != null }">
				<table class="table table-hover">
					<thead class="table_title">
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${listBoard }">
							<tr onclick="readBoard(${notice.no});">
								<td>${notice.no }</td>
								<td>${notice.title }</td>
								<td>${notice.writer }</td>
								<td>${notice.writedate }</td>
								<td>${notice.viewcount }</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${loginSession != admin123 }">
				<div style="float: right">
					<button type="button" class="btn btn-success"
						onclick="location.href='/board/notice/createBoard';">글 등록</button>
				</div>

			</c:when>

		</c:choose>


		<div style="margin-top: 15px; clear: right;">
			<ul class="pagination">
				<c:if test="${param.pageNo > 1 }">
					<li><a
						href="/board/notice/listAll?pageNo=1&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&lt;&lt;</a></li>
				</c:if>
				<c:if test="${param.pageNo > 1 }">
					<li><a
						href="/board/notice/listAll?pageNo=${param.pageNo - 1}&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&lt;</a>
				</c:if>

				<c:forEach var="i" begin="${pagingInfo.startPageNoOfBlock }"
					end="${pagingInfo.endPageNoOfBlock }" step="1">
					<li><a
						href="/board/notice/listAll?pageNo=${i }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">${i }</a></li>
				</c:forEach>
				<c:if test="${param.pageNo < pagingInfo.totalPage }">
					<li><a
						href="/board/notice/listAll?pageNo=${param.pageNo + 1 }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&gt;</a></li>
				</c:if>
				<c:if test="${param.pageNo < pagingInfo.totalPage }">
					<li><a
						href="/board/notice/listAll?pageNo=${pagingInfo.totalPage }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&gt;&gt;</a></li>
				</c:if>
			</ul>
		</div>

	</div>

	<jsp:include page="../../footer.jsp"></jsp:include>

</body>
</html>