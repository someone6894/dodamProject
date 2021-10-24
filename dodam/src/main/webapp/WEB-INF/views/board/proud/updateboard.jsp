<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content ="No-cache">
<meta http-equiv="Pragma" content ="No-cache">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"	rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
$(function(){
		$("#content").summernote(
							{
								height : 700,
								width : 1200,
								minHeight : null, // 최소 높이
								maxHeight : null, // 최대 높이
								focus : true, // 에디터 로딩후 포커스를 맞출지 여부
								lang : "ko-KR", // 한글 설정
								placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
								callbacks : { //여기 부분이 이미지를 첨부하는 부분
									onImageUpload : function(files) {
										uploadSummernoteImageFile(files[0]);
									},
									onPaste : function(e) {
										var clipboardData = e.originalEvent.clipboardData;
										if (clipboardData
												&& clipboardData.items
												&& clipboardData.items.length) {
											var item = clipboardData.items[0];
											if (item.kind === 'file'
													&& item.type
															.indexOf('image/') !== -1) {
												e.preventDefault();
											}
										}
									}
								}
							});
		});

		function uploadSummernoteImageFile(files) {

			let formData = new FormData(); // form 객체 생성
			formData.append("upFile", files);
			
			console.log(files);
			
			let url = '/board/proud/uploadFile';

			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : formData,
				dataType : "text", // 수신될 데이터의 타입
				type : "post", // 통신 방식
				contentType : false,
				processData : false,
				success : function(data) {
  		            console.log(data);
					let ext = data.substr(data.lastIndexOf('.') + 1).toLowerCase();
  		            console.log(ext);  		  
  		            let output = '';
					let isImg = false;
  		            let imgAr = ["jpg", "png", "jpeg", "gif"];

  		            for (let i = 0; i < imgAr.length ; i ++) {
  		            	if (ext == imgAr[i]) { // 이미지 파일이면
  		            		output = "<img src='../../resources/uploads/lcj" + data + "' />";
    		  		        
  		            		let origin1 = "uploads/lcj" + data;
  		            		console.log("db에 저장 = " + origin1);
  		  		            $("#upfileNameOrigin").val(origin1);
  		            		
  		            		isImg = true;
  		            		
  		            		console.log(output);
  		            	}
  		            }
					$('.note-editable').append(output);
				},
				error : function() { // 통신 실패시 수행될 콜백 함수

				}
			});
		}

	
	</script>
</head>

<body>

   <jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
      <h2>게시판 상세 페이지</h2>
      <form action="/board/proud/update" method="post" >

      <div class="form-group">
         <label for="title">글번호:</label> <input type="text"
            class="form-control" id="no" name="no"
            value="${board.no }" readonly>
         <div>
            <span id='readcount'>조회수 : <span class="badge">${board.readcount }</span></span>

            <span id='likeDislike'> 좋아요 :
               <span id='isLikeSpan'></span> <span id="likeCount" class="badge">${board.likecount }</span>
            </span>
         </div>

      </div>
      <div class="form-group">
         <label for="title">제목:</label> <input type="text"
            class="form-control" id="title" name="title"
            value="${board.title }" >
      </div>

      <div class="form-group">
         <label for="writer">작성자 :</label> <input type="text"
            class="form-control" id="writer" name="writer"
            value="${board.writer}" readonly>
      </div>

      <div class="form-group">
            <label for="content">내용 :</label>
            <textarea class = "form-control" rows="20" cols="150"
             id="content" name="content" >${board.content }</textarea>        	
   	  </div>
   	  
			<input type ="hidden" name="image" id="upfileNameOrigin" />
   	  
      <button type="submit" class="btn btn-success">수정완료</button>
      <button type="reset" class= "btn btn-warning" onclick ="location.href='/board/proud/readboard?no=${board.no}';">취소</button>
      </form>
     
   </div>
	<script type = "text/javascript">$.noConflict();</script>
</body>
</html>