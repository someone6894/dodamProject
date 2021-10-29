<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자랑하기 게시판</title>
<link rel="icon"
	href="../../resources/assets/missing/assets/img/brand/favicon.png"
	type="image/png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script>
	function replycount(no) {
		
	}

	function readBoard(no) {
		location.href='/board/proud/readboard?no=' + no;
	}
	
	function searchflow() {
		let keyword = $("#keyword").val();
		let type = $("#searchType").val();
		location.href='/board/proud/listAll?pageNo=1&searchBy=' + type + '&searchWord=' + keyword + '';
	}
</script>
<style>
.holup {
	margin-top: 30px;
}

#searchType {
	height: 37px;
	width: 130px;
	float: left;
}

.w300 {
	height: 40px;
	width: 420px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
}

#write2 {
	float: right;
}

#keyword {
	font-size: 16px;
	width: 235px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

#btnSearch {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff;
}
</style>
<body>

	<jsp:include page="../../template.jsp"></jsp:include>

	<div class="container" style="margin-top: 40px;">
		<div>
			<h2>
				<span class="glyphicon glyphicon-menu-hamburger"> </span> 반려견 자랑하기
				게시판
			</h2>
		</div>
		<c:choose>
			<c:when test="${proudlistBoard != null }">
				<table class="table table-hover">
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<c:forEach begin="0" end="35" step="1">
								<th></th>
							</c:forEach>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${proudlistBoard }">
							<tr onclick="readBoard(${board.no});">
								<td><h4>
										<span class="holup glyphicon glyphicon-thumbs-up"
											style="margin-top: 30px;"></span><br /> <strong>${board.likecount }
									</h4>
									</strong></td>
								<td><img id='thumnail'
									src='../../resources/${board.image }' width="120px"
									height="120px;" /></td>
								<td><div class="container-fluid bg-grey">
										<div class="row">
											<h3 style="color: #3262c5;">${board.title }</h3>
											<h4>
												<strong>${board.writer }</strong>
											</h4>
											<p>${board.postdate }</p>
										</div>
									</div></td>
								<c:forEach begin="0" end="35" step="1">
									<td></td>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
		</c:choose>

		<div class="form-group row justify-content-center">
			<div class="w100" style="padding-top: 40px"></div>

			<c:choose>
				<c:when test="${userid != null}">
					<button type="button" class="btn btn-success" id="write2"
						onclick="location.href='/board/proud/register';">글 등록</button>
				</c:when>
			</c:choose>

			<div class="w300" style="margint-top: 20px;">
				<select class="form-control form-control-sm" name="searchType"
					id="searchType">

					<option value="title">제목 + 내용</option>
					<option value="writer">작성자</option>
					<option value="reply">댓글</option>

				</select> <input type="text" class="form-control form-control-sm"
					id="keyword" name="keyword" id="keyword">
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch" onclick="searchflow();">검색</button>
			</div>

		</div>



		<div style="margin-top: 20px; margin-left: 50px; clear: right;"
			align="center">
			<ul class="pagination">
				<c:if test="${param.pageNo > 1 }">
					<li><a
						href="/board/proud/listAll?pageNo=1&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&lt;&lt;</a></li>
				</c:if>
				<c:if test="${param.pageNo > 1 }">
					<li><a
						href="/board/proud/listAll?pageNo=${param.pageNo - 1}&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&lt;</a>
				</c:if>

				<c:forEach var="i" begin="${pagingInfo.startPageNoOfBlock }"
					end="${pagingInfo.endPageNoOfBlock }" step="1">
					<li><a
						href="/board/proud/listAll?pageNo=${i }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">${i }</a></li>
				</c:forEach>
				<c:if test="${param.pageNo < pagingInfo.totalPage }">
					<li><a
						href="/board/proud/listAll?pageNo=${param.pageNo + 1 }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&gt;</a></li>
				</c:if>
				<c:if test="${param.pageNo < pagingInfo.totalPage }">
					<li><a
						href="/board/proud/listAll?pageNo=${pagingInfo.totalPage }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&gt;&gt;</a></li>
				</c:if>
			</ul>
		</div>


	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>