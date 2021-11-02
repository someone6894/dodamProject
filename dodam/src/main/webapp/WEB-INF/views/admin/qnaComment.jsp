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

.board {
	margin: 0px 0px 20px 0px;
	float:left;
}

.boardLink {
	font-weight: bold;
	cursor: pointer;
	color: #337ab7;
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
<script>
	$(function(){
		
	});
	
	function deleteReply(no) {
		let url = '/admin/qna/deleteReply';
		
		if (!confirm("댓글을 삭제하시겠습니까?")) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
	    } else {
			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : {no : no}, // 서블릿에 보낼 데이터
				dataType : "text", // 수신될 데이터의 타입
				type : "post", // 통신 방식
				success : function(data) { // 통신 성공시 수행될 콜백 함수
					console.log(data);
					if(data == "success") {
						alert("삭제 완료!");
						history.go(0);
					} else {
						alert("댓글 삭제에 실패했습니다. \r\n잠시후 다시 시도해주세요.");
					}
				}
			});	
	    }
	}
</script>
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
					<!-- <li><a href="/admin/board"><i class="fas fa-chalkboard"></i>&nbsp;&nbsp;게시판
							관리</a></li> -->
					<li class="active"><a href="/admin/comment"><i
							class="far fa-comment"></i>&nbsp;&nbsp;&nbsp;댓글관리</a></li>
					<li>------------------------------------------------</li>
					<li><a href="/"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;나가기</a></li>
				</ul>
				<br>
			</div>

			<div class="col-sm-9" style="margin: 20px;">
				<button onclick="location.href='/admin/comment'" class="btn btn-default board">찾아요</button>
				<button class="btn btn-default board" onclick="location.href='/admin/proud'">반려동물 자랑</button>
				<button class="btn btn-primary board">Q&A</button>
				<h2 style="clear: left;">Q&A 게시판 댓글</h2>
				<p>
					총 댓글 개수 : <span id="numOfComments">${numOfComments }</span>개
				</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>게시글 번호</th>
							<th>게시글 제목</th>
							<th style="width: 300px;">게시글 내용</th>
							<th style="width: 400px;">댓글 내용</th>
							<th>댓글 작성자</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="comment" items="${Comments.qcommentList }">
							<tr>
								<td>${comment.pno }</td>
								<td class="boardLink"
									onclick="location.href='/board/qna/readBoard?no=${comment.pno}&userid=';">${comment.title }</td>
								<td>${comment.pcontents }</td>
								<td>${comment.recontents}</td>
								<td>${comment.replyer }</td>
								<td><button class="btn btn-default" onclick="deleteReply(${comment.no});">댓글 삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>