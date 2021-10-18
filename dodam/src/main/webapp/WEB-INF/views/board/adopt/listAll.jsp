<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<title>Dodam Dodam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<script>

	// 상세페이지
	function readBoard(no) {
		console.log("상세페이지 보기 : " + no);
		location.href = '/board/adopt/readBoard?no=' + no;
	}



</script>
<style>
.container {
	width: 100px;
}

.slider img{margin:0 auto;}
</style>
<body>
	
	<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
	%>

  
  	
	<jsp:include page="../../template.jsp"></jsp:include>
	<jsp:include page="adoptboardmini.jsp"></jsp:include>
<%-- 	<jsp:include page="../../adoptboardmini.jsp"></jsp:include> --%>
	
	<div class="container">
<!-- 		<h2 style="text-align: center;">분양 게시판</h2> -->
		<br>
		<div style="float: right">
			<button type="button" class="btn btn-default" data-toggle="modal"
				data-target="#myModal2">글 작성</button>
		</div>
		<c:choose>
			<c:when test="${listBoard != null }">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
<!-- 							<th>글쓴이</th> -->
<!-- 							<th>품종</th> -->
<!-- 							<th>성별</th> -->
<!-- 							<th>사진</th> -->
<!-- 							<th>책임비</th> -->
<!-- 							<th>sns</th> -->
<!-- 							<th>연락처</th> -->
							<th>찾은지역</th>
<!-- 							<th>내용</th> -->
<!-- 							<th>좋아요</th> -->
							<th>등록일자</th>
							<th>상태</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${listBoard }">
							<tr onclick="readBoard(${board.no});">
								<td>${board.no }</td>
								<td>${board.title }</td>
<%-- 								<td>${board.writer }</td> --%>
<%-- 								<td>${board.adoptkind }</td> --%>
<%-- 								<td>${board.gender }</td> --%>
<!-- 								<td><img src= ../resources/${board.image } width= '100px' height= '100px' /></td> -->
<%-- 								<td>${board.liabilityfee }</td> --%>
<%-- 								<td>${board.sns }</td> --%>
<%-- 								<td>${board.phone }</td> --%>
								<td>${board.adoptarea }</td>
<%-- 								<td>${board.contents }</td> --%>
<%-- 								<td>${board.bookmark }</td> --%>
								<td>${board.regdate }</td>
								<td> 
								<c:choose>
									<c:when test ="${board.state eq 'protected'}">
										<h6>보호중</h6>
									</c:when>								
								</c:choose>
								</td>
								<td>${board.readcnt }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
		</c:choose>

		<!-- 		<div style="float: right"> -->
		<!-- 			<button type="button" class="btn btn-success" -->
		<!-- 				onclick="location.href='/board/register';">글 등록</button> -->
		<!-- 		</div> -->
		
	</div>
	
	<div style="text-align: center;">
			<ul class="pagination">
				<c:if test="${param.pageNo > 1 }">
					<li><a
						href="/board/adopt/listAll?pageNo=1">&lt;&lt;</a></li>
				</c:if>
				<c:if test="${param.pageNo > 1 }">
					<li><a
						href="/board/adopt/listAll?pageNo=${param.pageNo - 1}">&lt;</a>
				</c:if>

				<c:forEach var="i" begin="${pagingInfo.startPageNoOfBlock }"
					end="${pagingInfo.endPageNoOfBlock }" step="1">
					<li><a
						href="/board/adopt/listAll?pageNo=${i }">${i }</a></li>
				</c:forEach>
				<c:if test="${param.pageNo < pagingInfo.totalPage }">
					<li><a
						href="/board/adopt/listAll?pageNo=${param.pageNo + 1 }">&gt;</a></li>
				</c:if>
				<c:if test="${param.pageNo < pagingInfo.totalPage }">
					<li><a
						href="/board/adopt/listAll?pageNo=${pagingInfo.totalPage }">&gt;&gt;</a></li>
				</c:if>
			</ul>
		</div>
	
		
	<!-- Modal -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body" style="height: 100%;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<jsp:include page="createBoard.jsp"></jsp:include>
				</div>
			</div>

		</div>
	</div>
  
  
</body>
</html>