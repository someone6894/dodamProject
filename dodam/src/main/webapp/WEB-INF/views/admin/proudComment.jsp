<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>도담도담 관리자페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon"
	href="../resources/assets/missing/assets/img/brand/favicon.png"
	type="image/png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/1e6f7f51eb.js"
	crossorigin="anonymous"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

.sidenav>ul>li>a {
	font-size: 20px;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<h2 style="text-align: center;">
					<a href="/"><img
						src="../resources/images/kmj/admin/dodamlogo.png" width="250px" /></a>
				</h2>
				<ul class="nav nav-pills nav-stacked">
					<!-- <li><a href="/admin/adminhome"><i class="fas fa-user-cog"></i>&nbsp;&nbsp;관리자페이지
							메인</a></li> -->
					<li><a href="/admin/members"><i
							class="fas fa-user-friends"></i>&nbsp;&nbsp;회원관리</a></li>
					<li><a href="/admin/board"><i class="fas fa-chalkboard"></i>&nbsp;&nbsp;게시판
							관리</a></li>
					<li class="active"><a href="/admin/comment"><i
							class="far fa-comment"></i>&nbsp;&nbsp;&nbsp;댓글관리</a></li>
					<li>------------------------------------------------</li>
					<li><a href="/"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;나가기</a></li>
				</ul>
				<br>
			</div>

			<div class="col-sm-9">
				<button onclick="location.href='/admin/comment'"
					class="btn btn-default">찾아요</button>
				<button class="btn btn-primary" onclick="location.href='/admin/proud'">반려동물 자랑</button>
				<button class="btn btn-default">Q&A</button>
				<h2>찾아요 게시판 댓글</h2>
				<p>
					총 댓글 개수 : <span id="numOfComments">${numOfComments }</span>개
				</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>게시글 번호</th>
							<th>게시글 제목</th>
							<th>게시글 내용</th>
							<th>댓글 내용</th>
							<th>댓글 작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="comment" items="${Comments }">
							<tr>
								<c:choose>
									<c:when test="${comment.pno == 0 }">
										<td colspan="3">삭제됨<i class="fas fa-paw" style="color: #337ab7; font-size: 20px; margin-left: 10px;"></i></td>
										<!-- <td>삭제됨</td>
			     						<td>삭제됨</td> -->
									</c:when>
									<c:otherwise>
										<td>${comment.pno }</td>
										<td>${comment.title }</td>
										<td style="cursor: pointer;"
											onclick="location.href='/board/missing/detail?no=${comment.pno}&userid=';">${comment.pcontents }</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${fn:contains(comment.isdeleted, 'Y')}">
										<td colspan="3">삭제됨<i class="fas fa-paw" style="color: #337ab7; font-size: 20px; margin-left: 10px;"></i></td>
										<!-- <td>삭제됨</td>
			     						<td>삭제됨</td> -->
									</c:when>
									<c:otherwise>
										<td>${comment.recontents}</td>
										<td>${comment.replyer }</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>