<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>	
let numOfImgs=0;
	$(function() {
		$("#no").val("${MissingBoard.no }");
		$("#title").val("${MissingBoard.title }");
		$("#writer").val("${MissingBoard.writer }");
		$("#animal").val("${MissingBoard.animal }");
		$("#breed").val("${MissingBoard.breed }");
		$("#gender").val("${MissingBoard.gender }");
		$("#name").val("${MissingBoard.name }");
		$("#age").val("${MissingBoard.age }");
		$("#location").val("${MissingBoard.location }");
		$("#dlocation").val("${MissingBoard.dlocation}");
		$("#missingdate").val("${MissingBoard.missingdate }".split(" ")[0]);
		$("#contact").val("${MissingBoard.contact }");
		

		let output = '';
		if ("${MissingBoard.dpchknum}" == "") {
			let thumbAr = "${MissingBoard.thumbimg }".split(", ");
			console.log(thumbAr);

			for(let i in thumbAr) {
				if (thumbAr[i] != '') {
					i = parseInt(i);
					// $(".fileContent").show();
					console.log(i+1);
					output += '<span id="imgPreview' + (i+1) + '" style="margin-right: 50px;"><img src="../../resources/uploads/kmj/missing' + thumbAr[i] + '" style="margin-right: 5px;" width="200px;" />' +
						'<img src="../../resources/images/kmj/missing/cancel.png" style="width: 20px;" onclick="delImg(this);" /></span>';
						
					// 썸네일과 원래이미지를 input hidden에 저장
					$("#upImgNameThumb" + (i+1)).val(thumbAr[i]);
					let splitName = thumbAr[i].split("thumb_");
					let origin = splitName[0] + splitName[1];
					
					$("#upImgNameOrigin" + (i+1)).val(origin);

				}
			}
		} else {
			let imgAr = "${MissingBoard.img }".split(", ");
			console.log(imgAr);

			console.log(numOfImgs);
			for (let i in imgAr) {
				i = parseInt(i);
				if (imgAr[i] != '') {
					// $(".fileContent").show();
					if (imgAr[i].split(":")[0] != "http") {
						output += '<span id="imgPreview' + (i+1) + '" style="margin-right: 50px;"><img src="../../resources/uploads/kmj/missing' + imgAr[i] + '" style="margin-right: 5px;" width="200px;" />' +
						'<img src="../../resources/images/kmj/missing/cancel.png" style="width: 20px;" onclick="delImg(this);" /></span>';
					} else {
						output += '<span id="imgPreview' + (i+1) + '" style="margin-right: 50px;"><img src="' + imgAr[i] + '" style="margin-right: 5px;" width="200px;" />' +
						'<img src="../../resources/images/kmj/missing/cancel.png" style="width: 20px;" onclick="delUrlImg(this);" /></span>';
					}
				
					$("#upImgNameOrigin" + (i+1)).val(imgAr[i]);
					numOfImgs++;
				}
			}
		}
		
		console.log(numOfImgs);
	
		// 미리보기 div에 썸네일 사진 띄우기
		$(".fDropList").html(output);
		
		output = '';
		$(".fileDrop").on("dropenter dragover", function(e) {
			e.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(e) {
			e.preventDefault(); // drop된 파일이 chrome브라우저에서 열리는 이벤트 전파를 막음
			
			$("#uploadError").empty();			
			let files = e.originalEvent.dataTransfer.files; // 드래그 된 파일을 얻어옴
			console.log(files);
			
			if (files.length > 3) {
				$("#uploadError").append("사진은 3개까지만 업로드 가능합니다!");
			} else if (notImgCheck(files)) {
				$("#uploadError").append("이미지 파일만 업로드 가능합니다!");
			} else {
				// 게시글 등록 전 이미지 파일 먼저 업로드
				let formData = new FormData(); // form 객체 생성
				for(let i = 0; i < files.length; i++) { // form 객체에 파일 첨부
					formData.append("uploadImg", files[i]);
						numOfImgs++;
				}
			
				if (numOfImgs < 4) {
					$("#uploadError").html("");
					let url = '/board/missing/uploadImgs';
					$.ajax({
						url : url, // ajax와 통신 할 곳
						data : formData, // 서블릿에 보낼 데이터
						dataType : "text", // 수신될 데이터의 타입
						type : "post", // 통신 방식
						processData : false, // 전송하는 데이터를 쿼리 스트링 형태로 반환하는지를 결정(파일은 길이가 길기 때문에 url길이 초과됨)
						contentType : false, // encType의 기본값 (application/x-www-form-urlencoded) multipart/form-data 쓸거니까 false
						success : function(data) { // 통신 성공시 수행될 콜백 함수
							let thumbImgs = data.split(", ");
							console.log(thumbImgs);
							console.log(numOfImgs-files.length);
							for(let i = 0; i < thumbImgs.length-1; i++) {
								output += '<span id="imgPreview' + ((numOfImgs-files.length)+i+1) + '" style="margin-right: 50px;"><img src="../../resources/uploads/kmj/missing' + thumbImgs[i] + '" style="margin-right: 5px;" />' +
								'<img src="../../resources/images/kmj/missing/cancel.png" style="width: 20px;" onclick="delImg(this);" /></span>';
								
								// 썸네일과 원래이미지를 input hidden에 저장
								$("#upImgNameThumb" + ((numOfImgs-files.length)+i+1)).val(thumbImgs[i]);
								let splitName = thumbImgs[i].split("thumb_");
								let origin = splitName[0] + splitName[1];
								
								$("#upImgNameOrigin" + ((numOfImgs-files.length)+i+1)).val(origin);
								
								// 미리보기 div에 썸네일 사진 띄우기
								console.log(output);
								$(".fDropList").append(output);
								output = '';
							}
						}
					});	
				} else {
					$("#uploadError").append("사진은 3개까지만 업로드 가능합니다!");
					numOfImgs -= files.length;
				}
			}
		});
		
		$("#cancelBtn").click(function() {
			location.href='/board/missing/detail?no=${MissingBoard.no}&userid=${loginSession.userid}';
		});
		
		$("#cancelBtn").click(function() {
			location.href='/board/missing/list';
		});
		
		$("#title").keyup(function() {
			titleChk();
		});
		
		$("#contents").keyup(function(e) {
			contentsChk();
		});
		
		$("#contact").keyup(function() {
			contactChk();
		});
		
		$("#missingdate").change(function() {
			dateChk();
		});

	});
	
	function dateChk() {
		let chkDate = false;
		let missingDate = new Date($("#missingdate").val());
		console.log(missingDate.setHours(0));
		let today = new Date();
		
		let diff = today - missingDate;
		if (diff > 0) {
			chkDate = true;
			$("#missingdate_notice").html("");
		} else {
			$("#missingdate_notice").html("실종날짜는 현재날짜 이전만 입력가능합니다.");
			$("#missingdate").focus();
		}
		
		return chkDate;
	}
	
	function delImg(obj) {
		let id = obj.parentElement.getAttribute("id");
		let num = Number(id.substring(id.length-1));
		console.log(id);
		
		let thumb = $("#upImgNameThumb" + num).val();
		let origin = $("#upImgNameOrigin" + num).val();
		
		console.log(thumb, origin);
		
		$("#"+id).remove();
		if(num != "3") {
			for(let i=num; i<3; i++) {
				console.log($("#upImgNameThumb"+(i+1)).val());
				$("#upImgNameThumb" + i).val($("#upImgNameThumb"+(i+1)).val());
				$("#upImgNameOrigin" + i).val($("#upImgNameOrigin"+(i+1)).val());
				$("#imgPreview"+(i+1)).attr("id", "imgPreview"+i);
			}
		}
		$("#upImgNameThumb3").val("");
		$("#upImgNameOrigin3").val("");
		numOfImgs--;
		console.log(numOfImgs);
		
		// 수정할 때 지우면 취소시 못 되돌림! 그냥 놔두자
		/*
		let url = '/board/missing/delImg';
		$.ajax({
			url : url, // ajax와 통신 할 곳
			data : {origin : origin, thumb : thumb}, // 서블릿에 보낼 데이터
			dataType : "text", // 수신될 데이터의 타입
			type : "POST", // 통신 방식
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				console.log(data);
				if (data == "success") {
					$("#"+id).remove();
					if(num != "3") {
						for(let i=num; i<3; i++) {
							console.log(i+1);
							console.log($("#upImgNameThumb"+(i+1)).val());
							$("#upImgNameThumb" + i).val($("#upImgNameThumb"+(i+1)).val());
							$("#upImgNameOrigin" + i).val($("#upImgNameOrigin"+(i+1)).val());
							$("#imgPreview"+(i+1)).attr("id", "imgPreview"+i);
						}
					}
					$("#upImgNameThumb3").val("");
					$("#upImgNameOrigin3").val("");
					numOfImgs -= 1;
					console.log(numOfImgs);
				}
			}
		});
		*/
	}
	
	function delUrlImg(obj) {
		let id = $(obj.parentElement).attr("id");
		let num = Number(id.substring(id.length-1));
		
		$(obj.parentElement).remove();
		
		if(num != "3") {
			for(let i=num; i<3; i++) {
				$("#upImgNameOrigin" + i).val($("#upImgNameOrigin"+(i+1)).val());
				$("#imgPreview"+(i+1)).attr("id", "imgPreview"+i);
			}
		}
		$("#upImgNameThumb3").val("");
		$("#upImgNameOrigin3").val("");
		numOfImgs--;
		console.log(numOfImgs);
	}
	
	// 이미지 파일이 아닌 파일이 있으면 true, 모두 이미지 파일이면 false
	function notImgCheck(uploadImgAr) {
		let extAr = ["jpg", "png", "gif", "jpeg"];
		let flag = false;
		for(let i=0; i<uploadImgAr.length; i++) {
			let ext = uploadImgAr[i].name.substring(uploadImgAr[i].name.lastIndexOf('.')+1);
			if(!extAr.includes(ext)) {
				flag = true;	
			}
		}
		console.log(flag);
		return flag;
	}
	
	function showDropDiv() {
		$(".fileContent").show();
	}
	
	function validate() {
		let chkResult = false;
		
		if (titleChk() && missingdateChk() && contactChk() && contentsChk() && sessionChk() && dateChk()) {
			chkResult = true;
		}
		
		return chkResult;
	}
	
	// 세션에 로그인 객체가 살아 있는지 확인
	function sessionChk() {
		
		if ("${loginSession.userid}" == '') {
			alert("로그인이 만료되었습니다. 다시 로그인 해주세요!");
			window.location.href = '/member/login';
		}
		
		return true;
	}
	
	// 제목은 필수 입력사항. 입력됐으면 true, 입력되지 않았으면 false 반환
	function titleChk() {
		let chkTitle = false;
		let title = $("#title").val();
		
		if (title.length == 0) {
			$("#title_notice").html("제목을 입력해주세요.");
			$("#title").focus();
		} else if(title.length > 0 && title.length < 50) {
			$("#title_notice").html("");
			chkTitle = true;
		} else {
			$("#title_notice").html("제목은 50자 이하이여야 합니다.");
		}

		return chkTitle;
	}
	
	// 특이사항은 필수 입력사항. 입력됐으면 true, 입력되지 않았으면 false 반환
	function contentsChk() {
		let chkContents = false;
		let contents = $("#contents").val();
		
		if (contents.length == 0) {
			$("#contents_notice").html("특이사항을 입력해주세요.");
			$("#contents").focus();
		} else if(contents.length > 0 && contents.length < 5000) {
			$("#contents_notice").html("");
			chkContents = true;
		} else {
			$("#contents_notice").html("특이사항은 5000자 이하이여야 합니다.");
		}
		
		return chkContents;
	}
	
	// 실종날짜는 필수 입력사항. 입력됐으면 true, 입력되지 않았으면 false 반환
	function missingdateChk() {
		let chkMissingdate = false;
		let missingdate = $("#missingdate").val();

		if (missingdate.length == "") {
			$("#missingdate_notice").html("실종날짜를 입력해주세요.");
			$("#missingdate").focus();
		} else {
			$("#missingdate_notice").html("");
			chkMissingdate = true;
		}
		
		return chkMissingdate;
	}
	
	function contactChk() {
		let chkContact = false;
		let contact = $("#contact").val();
		let regEx = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;
		
		if (contact.length == 0) {
			$("#contact_notice").html("연락처를 입력해주세요.");
			$("#contact_notice").attr("class", "notice");
			$("#contact").focus();
		} else {
			if (contact.match(regEx)) {
				$("#contact_notice").html("");
				chkContact = true;
			} else {
				$("#contact_notice").html("※ 010-0000-0000의 형식으로 입력해주세요.");
				$("#contact_notice").attr("class", "notice");
				$("#contact").focus();
			}
		}

		return chkContact;
	}
</script>
<style>
	.wrap {
		margin-top: 140px;
		margin-bottom: 50px;
	}
	
	.fileContent {
		border : 1px dashed #3C6E9F;
		background-color:#ededed;
		border-radius: 4px;
		height : 150px;	
		display : none;	
	}
	
	select {
		width: 200px;
		padding: .5em .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('../../resources/images/kmj/missing/arrow.jpg') no-repeat 100% 50%;
		border-radius: 4px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}

	select::-ms-expand {
	    display: none;
	}

	.form-container {
		padding: 0 50px;
	}
	
	.col-sm-offset-2 {
		text-align: center;
	}
	
	.notice {
		font-size: 14px;
		color: #ff7f00;
	}
</style>
</head>
<body>
	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container wrap">
		  <h1>글 수정</h1>
		  <div class="form-container">
			  <form class="form-horizontal" action="/board/missing/update" method="POST">
			  	<input type="hidden" name="no" id="no" />
			    <div class="form-group">
			    	<label class="control-label col-sm-2" for="title">제목</label>
			      	<div class="col-sm-10">
			        	<input type="text" class="form-control" id="title" name="title">
			        	<span id="title_notice" class="notice"></span>
			      	</div>
			    </div>
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="writer">작성자</label>
			      <div class="col-sm-10">          
			        <input type="text" class="form-control" id="writer" name="writer" readonly>
			      </div>
			    </div>
			    <fieldset>
			    	<legend style="color: #3C6E9F;">동물 정보</legend>
				    <div class="form-group">
				    	<label class="control-label col-sm-2" for="animal">동물</label>
				      	<div class="col-sm-2">
				        	<select id="animal" name="animal">
				        		<option value="dog">강아지</option>
				        		<option value="cat">고양이</option>
				        		<option value="other">다른 동물</option>
				        	</select>
				      	</div>
				      	<label class="control-label col-sm-2" for="breed">품종</label>
				      	<div class="col-sm-2">
				        	<input type="text" class="form-control" id="breed" name="breed">
				     	</div>
				    	<label class="control-label col-sm-1" for="gender">성별</label>
				      	<div class="col-sm-3">
				        	<select id="gender" name="gender">
				        		<option value="F">암컷</option>
				        		<option value="M">수컷</option>
				        		<option value="N">성별모름</option>
				        	</select>
				      	</div>
				    </div>
				    <div class="form-group">
				      	<label class="control-label col-sm-2" for="name">이름</label>
				      	<div class="col-sm-5">          
				        	<input type="text" class="form-control" id="name" name="name">
				      	</div>
				      	<label class="control-label col-sm-2" for="age">나이</label>
				      	<div class="col-sm-3">          
				        	 <select id="age" name="age">
				        		<option value="1살미만">1살미만</option>
				        		<c:forEach var="i" begin="1" end="29" step="1">
				        			<option value="${i }살">${i }살</option>
				        		</c:forEach>
				        		<option value="30살이상">30살이상</option>
				        	</select>
				      	</div>
				    </div>
				
				    <div class="form-group">
				   		<label class="control-label col-sm-2" for="location">실종 지역</label>
				      	<div class="col-sm-3">          
				      		<select id="location" name="location">
				        		<option value="서울특별시">서울특별시</option>
				        		<option value="경기도">경기도</option>
				        		<option value="인천광역시">인천광역시</option>
				        		<option value="강원도">강원도</option>
				        		<option value="충청남도">충청남도</option>
					        	<option value="대전광역시">대전광역시</option>
				    	    	<option value="충청북도">충청북도</option>
				        		<option value="세종특별자치시">세종시</option>
				        		<option value="부산광역시">부산광역시</option>
					        	<option value="울산광역시">울산광역시</option>
				    	    	<option value="대구광역시">대구광역시</option>
				        		<option value="경상북도">경상북도</option>
				        		<option value="경상남도">경상남도</option>
					        	<option value="전라남도">전라남도</option>
				    	    	<option value="광주광역시">광주광역시</option>
				        		<option value="전라북도">전라북도</option>
				        		<option value="제주특별자치도">제주도</option>
				        	</select>
				      	</div>
				      	<label class="control-label col-sm-2" for="dlocation">상세 장소</label>
				      	<div class="col-sm-5">          
				        	<input type="text" class="form-control" id="dlocation" name="dlocation">
				      	</div>
				    </div>
				        <div class="form-group">
				      	<label class="control-label col-sm-2" for="missingdate">실종일자</label>
				      	<div class="col-sm-4">          
				        	<input type="date" class="form-control" id="missingdate" name="missingdate">
				      		<span id="missingdate_notice" class="notice"></span>
				      	</div>
				      	<label class="control-label col-sm-2" for="contact">연락처</label>
				      	<div class="col-sm-4">          
				        	<input type="text" class="form-control" id="contact" name="contact">
				        	<div id="contact_notice">※ 010-0000-0000의 형식으로 입력해주세요</div>
				      	</div>
				    </div>
				    <div class="form-group">
				      	<label class="control-label col-sm-2" for="contents">특이사항</label>
				      	<div class="col-sm-10">          
				        	<textarea class="form-control" id="contents" name="contents" rows="15">${MissingBoard.contents }</textarea>
				      		<span id="contents_notice" class="notice"></span>
				      	</div>
				    </div>
				    <div class="form-group">
				    	<label class="control-label col-sm-2" for="contents">사진</label>
				    	<div class="col-sm-10">  
					    	<button type="button" class="btn btn-default" onclick="showDropDiv();">파일 업로드</button>
							<div class="fileDrop">
								<div class="fileContent">
									<div>이 영역에 업로드 할 파일을 드래그 드롭 해주세요!</div>
									<div style="font-size:13px; color: gray;">※첨부사진은 최대 3개까지 등록이 가능합니다.</div>
								</div>
								<div id="uploadError" style="color: red; font-weight: bold;"></div>
							</div>
							<div class="fDropList"></div>
						</div>
				        <input type="hidden" name="thumbimage" id="upImgNameThumb1" />
				        <input type="hidden" name="image" id="upImgNameOrigin1" />
				        
				        <input type="hidden" name="thumbimage" id="upImgNameThumb2" />
				        <input type="hidden" name="image" id="upImgNameOrigin2" />
				        
				        <input type="hidden" name="thumbimage" id="upImgNameThumb3" />
				        <input type="hidden" name="image" id="upImgNameOrigin3" />
				    </div>
			    </fieldset>
			    <div class="form-group">        
			      <div class="col-sm-offset-2 col-sm-10">
			        <button type="submit" class="btn btn-primary" onclick="return validate();">수정</button>
			        <button type="button" class="btn btn-default" id="cancelBtn">취소</button>
			      </div>
			    </div>
		 </form>
		 </div>
	</div>
</body>
</html>