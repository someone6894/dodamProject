<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>publicadoptlist</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script>
	// 상세페이지
	// 	function readBoard(no) {
	// 		console.log("찍힌다.");
	// 		location.href = '/board/readBoard?no=' + no;
	// 	}
</script>
<style>
.container {
	width: 100px;
}
</style>
<body>



	<jsp:include page="../../template.jsp"></jsp:include>
	
	<div class="container">
		<h2 style="text-align: center;">유기동물 공고 게시판</h2>
		<br>
		<c:choose>
			<c:when test="${listBoard != null }">
				<table class="table table-hover">
					<thead>
						<tr>
							<!-- 							<th>resultCode</th> -->
							<!-- 							<th>resultMsg</th> -->
							<th>나이</th>
							<th>보호소 위치</th>
							<th>보호소명</th>
							<th>보호자연락처</th>
							<th>보호자명</th>
							<th>피부색</th>
							<!-- 							<th>desertionNo</th> -->
							<th>사진</th>
							<th>유기일자</th>
							<th>유기장소</th>
							<th>중성화 여부</th>
							<th>공고일자</th>
							<!-- 							<th>noticeSdt</th> -->
							<th>관할서번호</th>
							<th>관할지역</th>
							<!-- 							<th>popfile</th> -->
							<th>현재상태</th>
							<th>성별</th>
							<th>특징</th>
							<!-- 							<th>numOfRows</th> -->
							<!-- 							<th>pageNo</th> -->
							<!-- 							<th>totalCount</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${listBoard }">
							<%-- 							<tr onclick="readBoard(${board.no});"> --%>
							<tr>
								<%-- 								<td>${board.resultCode }</td> --%>
								<%-- 								<td>${board.resultMsg }</td> --%>
								<td>${board.age }</td>
								<td>${board.careAddr }</td>
								<td>${board.careNm }</td>
								<td>${board.careTel }</td>
								<td>${board.chargeNm }</td>
								<td>${board.colorCd }</td>
								<%-- 								<td>${board.desertionNo }</td> --%>
								<td><img src=${board.popfile}   width='200px' height= '200px' /></td>
								<td>${board.happenDt }</td>
								<td>${board.happenPlace }</td>
								
								<td> 
								<c:choose>
									<c:when test ="${board.neuterYn eq 'N'}">
										<h6>중성화안함</h6>
									</c:when>	
									<c:when test ="${board.neuterYn eq 'Y'}">
										<h6>중성화됨</h6>
									</c:when>			
									<c:when test ="${board.neuterYn eq 'U'}">
										<h6>확인불가</h6>
									</c:when>										
								</c:choose>
								</td>

								<td>${board.noticeEdt }</td>
<%-- 								<td>${board.noticeNo }</td> --%>
<%-- 								<td>${board.noticeSdt }</td> --%>
								<td>${board.officetel }</td>
								<td>${board.orgNm }</td>
<%-- 								<td><img src= ${board.popfile } width= '100px' height= '100px' /></td> --%>
								<td>${board.processState }</td>
								<td>${board.sexCd }</td>
								<td>${board.specialMark }</td>
<%-- 								<td>${board.numOfRows }</td> --%>
<%-- 								<td>${board.pageNo }</td> --%>
<%-- 								<td>${board.totalCount }</td> --%>
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

<!-- 		<div style="float: right"> -->
<!-- 			<button type="button" class="btn btn-default" data-toggle="modal" -->
<!-- 				data-target="#myModal2">글 등록2</button> -->
<!-- 		</div> -->


	</div>




	<!-- Modal -->
<!-- 	<div class="modal fade" id="myModal2" role="dialog"> -->
<!-- 		<div class="modal-dialog"> -->

<!-- 			<!-- Modal content--> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-body" style="height: 100%;"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
<%-- 					<jsp:include page="createBoard.jsp"></jsp:include> --%>
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 		</div> -->
<!-- 	</div> -->
</body>
</html>