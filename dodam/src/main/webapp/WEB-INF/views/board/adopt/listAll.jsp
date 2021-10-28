<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<title>분양해요</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="icon" href="../../resources/assets/missing/assets/img/brand/favicon.png" type="image/png">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript"> $.noConflict(); </script> -->
<script>

window.onload = function(){
	hideCreateBoard();
}

// 상세페이지
function readBoard(no) {
	console.log("상세페이지 보기 : " + no);
	location.href = '/board/adopt/readBoard?no=' + no;
}

// 세션 로그인 = null -> 로그인 하지않으면 글작성 버튼 안보이게 함.
function hideCreateBoard() {
	if(${loginSession == null}){
		$('#openCreatePage').hide();
	}
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
	<h2 style="text-align: center; font-family: 'Nanum Pen Script', cursive; background-color: #FFFC94;">분양해요</h2>

	<jsp:include page="adoptboardmini.jsp"></jsp:include>
	
	<div class="container">
		<br>
		
<!-- 		style="float: right" -->
		
		<c:choose>
			<c:when test="${listBoard != null }">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
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
								<td>${board.writer }</td>
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
	
		<div>
			<button type="button" class="btn btn-info btn-block" 
				id='openCreatePage' data-target='#createBoard' data-toggle="modal">글 작성</button>
		</div>
	</div>

 	<!-- 게시판 페이징 처리 -->		
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
	
	<!-- 글작성 페이지 모달창 -->
	<!-- Modal -->
	<div class="modal fade" id="createBoard" role="dialog" style='display:none;'>
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
	
  <jsp:include page="../../footer.jsp"></jsp:include>
  
</body>
</html>