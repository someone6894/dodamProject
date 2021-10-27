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
		location.href='/board/qna/readBoard?no=' + no;
	}
</script>
<style>
#cate {
	color: gray;
}

footer {
	display: block;
}

section {
	background-color: silver;
}
</style>
<body>
	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		<c:choose>
			<c:when test="${qnaListBoard != null }">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>글내용</th>
							<th>작성일</th>
<!-- 							<th>조회수</th> -->
<!-- 							<th>좋아요</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${qnaListBoard }">
							<tr onclick="readBoard(${board.no});">
								<td>${board.no }</td>
								<td>${board.title }</td>
								<td>${board.writer }</td>
								<td>${board.contents }</td>
								<td>${board.regdate }</td>
<%-- 								<td>${board.readcount }</td> --%>
<%-- 								<td>${board.likecount }</td> --%>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
		</c:choose>

		<div style="float: right">
			<button type="button" class="btn btn-success"
				onclick="location.href='/board/qna/register';">글 등록</button>
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



	<div style="margin-top : 15px; clear:right;">
			<ul class="pagination">
            <c:if test="${param.pageNo > 1 }">
               <li><a href="/board/qna/listAll?pageNo=1&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&lt;&lt;</a></li>
            </c:if>
            <c:if test="${param.pageNo > 1 }">
               <li>
               <a href="/board/qna/listAll?pageNo=${param.pageNo - 1}&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&lt;</a>
            </c:if>

            <c:forEach var="i" begin="${pagingInfo.startPageNoOfBlock }"
               end="${pagingInfo.endPageNoOfBlock }" step="1">
               <li><a href="/board/qna/listAll?pageNo=${i }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">${i }</a></li>
            </c:forEach>
            <c:if test="${param.pageNo < pagingInfo.totalPage }">
               <li><a href="/board/qna/listAll?pageNo=${param.pageNo + 1 }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&gt;</a></li>
            </c:if>
            <c:if test="${param.pageNo < pagingInfo.totalPage }">
               <li><a href="/board/qna/listAll?pageNo=${pagingInfo.totalPage }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&gt;&gt;</a></li>
            </c:if>
         </ul>
	</div>
<!-- 주석처리 페이징 끝 -->

	</div>
	
	<section>
		<div class="footer container">
			<div class="in_footer xe_width clearBoth">
				
				<div class='foot_left' style='float:left; width: 25%; margin-bottom:20px;'>
				<h1 class="foot_logo">
					<a href="http://someone09.cafe24.com/" title="유기견보호센터"> <img
						class="logo" src="../../resources/images/main/dodamMain.png"
						width="250px;" height="250px;" alt="유기견보호센터" border="0">
					</a>
				</h1>
				</div>
				
				<div class="foot_right" style='float:left; width: 60%;'>
					<div class="foot_menu">
						<ul class="clearBoth">
						</ul>
					</div>

					<div class="copylight" style='margin-top:100px;'>
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
				
			</div>
		</div>
	</section>
</body>
</html>