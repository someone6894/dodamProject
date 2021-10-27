<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!-- 서머노트 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<script>
$(document).ready(function() {
	  $('#summernote').summernote();
	});


$(document).ready(function() {
    $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
});

</script>

<body>


	<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
	%>

	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		<h2>글 쓰기 페이지</h2>
		<form action="/board/notice/createview" method="post" >
			<div class="form-group">
				<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" name="title">
			</div>

			<div class="form-group">
				<label for="writer">작성자 :</label> <input type="text"
					class="form-control" id="writer" name="writer" value="${loginSession.userid }" readonly><span
					id="writerError" class="error"></span>
			</div>

	
		
		<textarea name="contents" id="summernote" value="contents"></textarea>
	
			<button type="submit" class="btn btn-success">저장</button>
			<button type="reset" class="btn btn-warning"><a href="/board/notice/listAll">취소</a></button>
		</form>
		
	</div>
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