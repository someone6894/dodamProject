<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>자세히 보기</title>
</head>
<body>
	<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
	%>

	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">

		<div class="form-group">
			<label for="no">글번호:</label> <input type="text" class="form-control"
				id="no" name="no" value="${board.no }" readonly>
			<div>
				<span id='readcount'>조회수 : <span class="badge">${board.viewcount }</span></span>
			</div>


		</div>

		<div class="w3-row">
			<div class="w3-col w3-container w3-gray" style="width: 150px">
				<label for="title">제목</label>
			</div>
			<div class="w3-rest w3-container">
				<p>공지사항</p>
			</div>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" id="title" name="title"
				value="${board.title }" readonly>
		</div>

		<div class="form-group">
			<label for="writer">작성자 :</label> <input type="text"
				class="form-control" id="writer" name="writer"
				value="${board.writer}" readonly>
		</div>

		<div class="form-group">
			<label for="content">내용 :</label>
			<div>${board.contents }</div>

		</div>



		<button type="button" class="btn btn-success"
			onclick="location.href='/board/notice/updateBoard?no=${board.no }'">수정</button>
		<button type="button" class="btn btn-warning"
			onclick="location.href='/board/notice/delete?no=${board.no }'">삭제</button>
		<button type="button" class="btn btn-info"
			onclick="location.href='/board/notice/listAll?pageNo=1'">목록으로</button>

		<button type="button" class="btn btn-danger" onclick="">댓글달기</button>
		
		
		
		<style>
footer {
	display: block;
}

section {
	background-color: silver;
}
</style>
	<section>
		<div class="footer container">
			<div class="in_footer xe_width clearBoth">
				<div class='foot_left' style='float:left;'>
				<h1 class="foot_logo">
					<a href="http://someone09.cafe24.com/" title="유기견보호센터"> <img
						class="logo" src="../../resources/images/main/dodamMain.png"
						width="250px;" height="250px;" alt="유기견보호센터" border="0">
					</a>
				</h1>
				</div>
				<div class="foot_right" style='float:left;'>
					<div class="foot_menu">
						<ul class="clearBoth">
						</ul>
					</div>

					<div class="copylight">
						유기동물보호 종합커뮤니티 도담은 goot academy's project 홈페이지로, 반려동물을 잃어버린 분과
						유기동물을 보호중인 분들을 위한 인터넷신고센터 입니다. 유기동물보호 종합커뮤니티 도담은 정부기관/관련보호소가 아닙니다.
						해당지역보호소/공고내역은 <a href="http://animal.go.kr"
							onclick="window.open(this.href);return false;">동물보호관리시스템</a>에서 꼭
						확인하세요

					</div>
					<p>Copyright ⓒ 도담 http://someone09.cafe24.com All rights
						reserved // dodamserver@gmail.com</p>
					<p></p>
				</div>
				<div class="wrap_in_select">
					<a class="act_search" href="#">패밀리 사이트</a>
					<ul class="in_select">
					</ul>
				</div>
				<div class="foot_absolute"></div>
			</div>
		</div>
	</section>

		
</body>
</html>