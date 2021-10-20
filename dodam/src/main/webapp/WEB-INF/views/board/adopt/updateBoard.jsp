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
<title>게시판 글 등록 페이지</title>
<script>
	$(function() {
		$(".fileDrop").on("dropenter dragover", function(evt) {
			evt.preventDefault();
		});

		$(".fileDrop").on("drop",function(evt) { 
							''
							evt.preventDefault(); // 이벤트 전파를 막음(drop된 파일이 열리는 것을 방지)

							let files = evt.originalEvent.dataTransfer.files; // 드래그 된 파일을 얻어옴
							console.log(files[0]);

							let formData = new FormData(); // form 객체 생성
							formData.append("upFiles", files[0]); // form객체에 파일 첨부
							let url = '/board/adopt/uploadFile'
							$.ajax({
										url : url, // ajax와 통신 할 곳
										data : formData, // 서블릿에 보낼 데이터
										dataType : "text", // 수신될 데이터의 타입
										type : "post", // 통신 방식
										processData : false, // 전송하는 데이터를 쿼리 스트링 형태로 변환하는지를 결정
										contentType : false, // 기본값 (application/x-www-form-urlencoded)
										success : function(data) { // 통신 성공시 수행될 콜백 함수
											console.log(data);
											let ext = data.substr(data.lastIndexOf('.') + 1).toLowerCase();
											console.log(ext);
											let output = '';
											let isImg = false;
											let imgAr = [ "jpg", "png", "jpeg", "gif" ];
											for (let i = 0; i < imgAr.length; i++) {
												if (ext == imgAr[i]) { // 이미지 파일이면
													output += "<img src='../../resources/uploads/phs" + data + "' />";

													isImg = true;
													$("#upfileNameThumb").val(data); // 썸네일 이미지 경로
													let origin1 = data.substring(0,data.lastIndexOf("/") + 1);
													let origin2 = data.split("thumb_")[1];

													let origin = origin1 + origin2;
													$("#upfileNameOrigin").val(origin);
													break;
												}
											}
											if (!isImg) {
												// 이미지 파일이 아니면
												output += "<a href='../../resources/uploads/phs" + data + "'>" + data + "</a>";
												$("#upfileName").val(data);
											}

											output += "<span id='" + data + "' onclick='delFile(this);'>"
													+ "<img src='../../resources/images/main/close.png' width='40px' />"
													+ "</span>";
											$(".fDropList").html(output);

										},
										error : function() { // 통신 실패시 수행될 콜백 함수

										}

									});
						});

	});

	function delFile(obj) {
		let origin = $("#upfileNameOrigin").val();
		let thumb = $("#upfileNameThumb").val();
		let notImg = $("#upfileName").val();

		let url = '/board/adopt/delFile';
		$.ajax({
			url : url, // ajax와 통신 할 곳
			data : {
				origin : origin,
				thumb : thumb,
				notImg : notImg
			}, // 서블릿에 보낼 데이터
			dataType : "text", // 수신될 데이터의 타입
			type : "post", // 통신 방식

			success : function(data) { // 통신 성공시 수행될 콜백 함수
				$(".fDropList").empty(); // 파일 업로드 리스트 초기화
				// input type hidden 초기화
				$("#upfileNameOrigin").val('');
				$("#upfileNameThumb").val('');
				$("#upfileName").val('');

			},
			error : function() { // 통신 실패시 수행될 콜백 함수

			}

		});
	}

	function openArea() {
		$(".fileDrop").show(200);
	}
	function closeArea() {
		$(".fileDrop").hide(200);
	}
</script>
</head>
<style>
.fileDrop {
	width: 100%;
	height: 50px;
	border: 1px dotted blue;
	display: none;
}

/*.fileDrop .fileContent {
	padding: 20px;
	text-align: center;
	margin: 10px auto;
} */

/* .container { */
/* 	border: 2px solid gray; */
/* 	padding: 10px; */
/* } */
</style>
<body>
	<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
	%>

	<%-- 	<jsp:include page="../template.jsp"></jsp:include> --%>
	<div class="container" style="height: auto; width: auto;">
		<!-- 	<div class="container" style="border: 1px solid gray; height: auto; width: 30%;"> -->
		<h2>분양 등록 페이지</h2>
		<br>

		<form action="/board/adopt/updateBoardInsert" method="post" enctype="multipart/form-data">

			<!-- 			<div class="form-group"> -->
			<!-- 				<label for="title">말머리:</label> <select name="category"> -->
			<!-- 					<option value="free">주저리주저리</option> -->
			<!-- 					<option value="sale">판매글</option> -->
			<!-- 					<option value="question">질문</option> -->
			<!-- 				</select> -->
			<!-- 			</div> -->

				
			<div class="row">
			
				<div class="col-sm-4">
					<div class="form-group">
						<label for="no">글 번호 </label> <input type="text"
							class="form-control" id="no" name="no" value="${board.no }" readonly>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="form-group">
						<label for="adoptkind">품종 </label> <input type="text"
							class="form-control" id="adoptkind" name="adoptkind" value="${board.adoptkind }">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label for="gender">성별 </label> <input type="text"
							class="form-control" id="gender" name="gender" value="${board.gender }">
					</div>
				</div>

				<div class="col-sm-4">
					<div class="form-group">
						<label for="liabilityfee">책임비 </label> <input type="text"
							class="form-control" id="liabilityfee" name="liabilityfee" value="${board.liabilityfee }">
					</div>
				</div>


				<div class="col-sm-4">
					<div class="form-group">
						<label for="writer">작성자 </label> <input type="text"
							class="form-control" id="writer" name="writer" value="${board.writer }"><span
							id="writerError" class="error"></span>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="form-group">
						<label for="phone">연락처 </label> <input type="text"
							class="form-control" id="phone" name="phone" value="${board.phone }">
					</div>
				</div>

				<div class="col-sm-4">
					<div class="form-group">
						<label for="sns">SNS </label> <input type="text"
							class="form-control" id="sns" name="sns" value="${board.sns }">
					</div>
				</div>

				<div class="col-sm-4">
					<div class="form-group">
						<label for="adoptarea">분양 지역 </label> <input type="text"
							class="form-control" id="adoptarea" name="adoptarea" value="${board.adoptarea }">
					</div>
				</div>

				<div class="col-sm-4">
					<div class="form-group">
						<label for="password">글 비밀번호 </label> <input type="password"
							class="form-control" id="password" name="password" value="${board.password }">
					</div>
				</div>


			</div>




			<!-- 			<div class="form-group"> -->
			<!-- 				<label for="pwd">수정/삭제 비밀번호 :</label> <input type="password" -->
			<!-- 					class="form-control" id="pwd" placeholder="Enter password" -->
			<!-- 					name="pwd"><span id="pwdError" class="error"></span> -->
			<!-- 			</div> -->


			<div class="form-group">
				<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" name="title" value="${board.title }" readonly> <span
					id="titleError" class="error"></span>
			</div>


			<!-- 			rows="20" cols="150" -->
			<div class="form-group">
				<label for="contents">내용 :</label>
				<textarea rows="15"
					style="border: 1px solid gray; height: auto; width: 100%;"
					id="contents" name="contents" value="${board.contents }"></textarea>

			</div>


			<div class="form-group">
				<button type="button" class="btn btn-default" onclick="openArea();">사진 업로드</button>


				<!-- 			<div class="form-group"> -->
				<!-- 				<button type="button" class="btn btn-default" data-toggle="modal" -->
				<!-- 					data-target="#myModal">사진 업로드</button> -->

				<!-- 				Modal -->
				<!-- 				<div class="modal fade" id="myModal" role="dialog"> -->
				<!-- 					<div class="modal-dialog"> -->

				<!-- 						Modal content -->
				<!-- 						<div class="modal-content"> -->
				<!-- 							<div class="modal-header"> -->
				<!-- 								<button type="button" class="close" data-dismiss="modal">&times;</button> -->
				<!-- 								<h4 class="modal-title">사진 업로드</h4> -->
				<!-- 							</div> -->
				<!-- 							<div class="modal-body" style="height: 400px;"> -->
				<!-- 								<div class="fileContent">이 영역에 업로드 할 파일을 드래그 드롭 해 주세요!</div> -->
				<!-- 								<div class="fDropList"></div> -->
				<!-- 							</div> -->
				<!-- 							<div class="modal-footer"> -->
				<!-- 								<button type="button" class="btn btn-default" -->
				<!-- 									data-dismiss="modal">Close</button> -->
				<!-- 							</div> -->
				<!-- 						</div> -->

				<!-- 					</div> -->
				<!-- 				</div> -->

				<div class="fileDrop">
					<button type="button" class="btn btn-default" onclick="closeArea();" style="float: right;">닫기</button>
					<div class="fileContent">이 영역에 업로드 할 파일을 드래그 드롭 해 주세요!</div>

				</div>
				<div class="fDropList"></div>
			</div>

			<input type="hidden" name="thumbimage" id="upfileNameThumb" /> 
			<input type="hidden" name="image" id="upfileNameOrigin" /> 
			<input type="hidden" name="notimage" id="upfileName" />

			<button type="submit" style="float:right;" class="btn btn-success">저장</button>
		</form>

	</div>

</body>
</html>