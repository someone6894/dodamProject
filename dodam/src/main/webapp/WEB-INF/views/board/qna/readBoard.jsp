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
<title>Insert title here</title>
</head>
<script>
// 함수호출
 window.onload = function(){
	viewAllReplies();
	console.log('문자열');
}


//게시판 삭제
	function deleteBoard(no) {
		location.href='/board/qna/deleteBoard?no=' + no;
		
	}
	
	function calcDate(regdate) {
		let diff = new Date() - regdate // 댓글 단 시간과 현재시간의 차
		let diffSecond = diff / 1000; // 초단위
		if (diffSecond < 60 * 5) return '방금 전';
	 	let diffMinutes = diffSecond / 60; // 분단위
	 	if (diffMinutes < 60) return Math.floor(diffMinutes) + '분전';
	 	return new Date(regdate).toLocaleString();
	}
	

	function viewAllReplies() {
		let bno = '${param.no}';
		let url = '/qna/replies/all/' + bno
		
		
		$.ajax({
			url : url, // ajax와 통신 할 곳
			dataType : "json", // 수신될 데이터의 타입
			type : "get", // 통신 방식
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				if (data != null) {
					console.log(data);
					
					$("#replyLst").empty(); 
					let output = '<ul class="list-group">'; // 보이는 댓글
					
					let secoutput = '';
					$.each(data, function(i, e) {
						// ----------------------- 비밀글 템플릿 ---------------------------
						secoutput += '<li id="reply' + e.no + '" class="list-group-item">';
						secoutput += "<div><img src='../../resources/images/main/lock.PNG' width='15px' />" +   
						" 댓글 작성자가 비밀글로 처리한 글입니다 </div>";
						secoutput += "</li>";
						// -------------------------비밀글이 아닌 댓글 템플릿--------------------------------
						let viewoutput = '<li id="reply' + e.no + '" class="list-group-item">';
						viewoutput += "<div style='float: right; margin-right:10px;'>" + 
							"<img src='../../resources/images/main/gear.png' width='25px' onclick='showReplyModify(" + e.no +");' />";
						viewoutput += "<img src='../../resources/images/main/trash.png' width='25px' onclick='showReplyDel(" + e.no + ")'/></div></div>";
						viewoutput += '<div>작성자 : <span id="replyer' + e.no + '">' + e.replyer + '</span></div>';
						viewoutput += '<div id="orcontent' + e.no  + '">내용 : ' + e.contents + '</div>';
						
						let regdate = calcDate(e.regdate);
											
						viewoutput += "<div>작성일 : " + regdate + "</div>";
						
						// ------------------------------------------------------------------
						
						
						let loginUser = "${loginSession.userid}"; // 로그인 유저
						let bwriter = '${board.writer}'; // 부모글 작성자
						let replyer = e.replyer;  // 댓글 작성자
						
						
						if (e.issecret == 'Y') { // 비밀글 이다
							if (loginUser == '') { // 로그인 하지 않았다
								output += secoutput;
							} else { // 비밀글인데 로그인을 한 경우
								if (loginUser == bwriter || loginUser == replyer) { // 보이는 조건에 해당
									viewoutput += "<div style='color : red;'><img src='../resources/images/lock.PNG' width='15px' />이 글은 비밀글입니다!</div>";
									viewoutput += "</li>";
									output += viewoutput;
									
								} else { // 로그인을 했지만 보이는 조건에 맞지 않는 경우
									output += secoutput;
								}
							}
						
						} else { // 비밀 글이 아님	
							viewoutput += "</li>";
							output += viewoutput;
							
						}
						
					}); // 반복문 끝
					
					output += "</ul>";
					
					$("#replyLst").html(output);
				}
				
								
			},
			error : function() { // 통신 실패시 수행될 콜백 함수

			}

		}); 
		
	}
	
	function showReplyDel(no) {
		$("#replyRemove").insertAfter($("#reply" + no));
		$("#replyRemove").show(500);
		
		let newHidden = document.createElement("input");
        newHidden.setAttribute("type", "hidden");
        newHidden.setAttribute("id", "rno");
     	document.getElementById("replyRemove").appendChild(newHidden); // 동적으로 태그 객체 삽입
     	
     	$("#rno").val(no);
	}
	
	function showReplyModify(no) {
		$("#replyModify").insertAfter($("#reply" + no));
		$("#replyModify").show(500);
		//수정할 댓글의 pk를 replyModify에 동적으로 넣어줌
		
		
		let newHidden = document.createElement("input");
        newHidden.setAttribute("type", "hidden");
        newHidden.setAttribute("id", "no");
     	document.getElementById("replyModify").appendChild(newHidden); // 동적으로 태그 객체 삽입
        
		$("#no").val(no);
 	
     	$("#replyContentsModify").val($("#orcontent" + no).html());
     	
     	
	}
	
	function showReply() {
		$("#replyDiv").show(500);
	}
	
	function addReply() {
		let bno = "${param.no}";
		bno = parseInt(bno);
		let replyer = $("#replyer").val();
		let contents = $("#replyContents").val();

		let url = "/qna/replies/create";
		
		let sendData = JSON.stringify({  // json타입의 객체로 보이는 문자열 생성
			bno : bno, replyer : replyer, contents : contents
		});
		
		console.log(sendData);
		
		$.ajax({
			url : url, // ajax와 통신 할 곳
			data : sendData, // 서블릿에 보낼 데이터
			dataType : "text", // 수신될 데이터의 타입
			type : "post", // 통신 방식
			headers : {
				"content-type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				if (data == "success") {
					alert('댓글 등록 완료!');
					viewAllReplies();
					$("#replyDiv").hide();
				} else if (data == "fail") {
					alert('댓글 등록 실패!\r\n 문제가 지속되면 상현이한테 연락하세요!');
				}
								
			},
			error : function() { // 통신 실패시 수행될 콜백 함수

			}

		}); 
		
	}
	
	function closeRemove() {
		$("#replyRemove").hide();
	}
	
	function modifyReply() {
		let no = $("#no").val();
		let loginUser = "${loginSession.userid}";
		
			
		if (loginUser == '') {
			alert("로그인 하셔야 이용 가능합니다!");
			location.href='../member/login';
		}
		let replyer = $("#replyer" + no).html();
		if (loginUser != replyer) {
			alert("댓글은 작성자만 수정/삭제 가능합니다");
			$("#replyModify").hide();
			return;
		}
		let contents = $("#replyContentsModify").val();
		
		let isSecretModify = 'N';
		if (document.getElementById("isSecretModify").checked) {
			isSecretModify = 'Y';
		}
		
		let url = '/qna/replies/modify' + no;
		
		let sendData = JSON.stringify({
			no : no, replyer : replyer, contents : contents, issecret : isSecretModify
		});
		
		console.log(sendData);
			
		$.ajax({
			url : url, // ajax와 통신 할 곳
			data : sendData, // 서블릿에 보낼 데이터
			dataType : "text", // 수신될 데이터의 타입
			type : "put", // 통신 방식
			headers : {
				"content-type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				if (data == "success") {
					alert('댓글 수정 완료!');
					viewAllReplies();
				} else if (data == "fail") {
					alert('댓글 등록 실패!\r\n 문제가 지속되면 상현이한테 연락하세요!');
				}
								
			},
			error : function() { // 통신 실패시 수행될 콜백 함수

			}

		}); 
		
	
	}
	
	function removeReply() {
		let no = $("#rno").val();
		
		let loginUser = '${loginSession.userid}'
			
		let replyer = $("#replyer" + no).html();
		if (loginUser != replyer) {
			alert("댓글은 작성자만 수정/삭제 가능합니다");
			location.href = '../member/login';
			$("#replyModify").hide();
			return;
		}
		
		let url = '/replies/remove' + no;
		$.ajax({
			url : url, // ajax와 통신 할 곳
			dataType : "text", // 수신될 데이터의 타입
			type : "delete", // 통신 방식
			headers : {
				"content-type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				if (data == "success") {
					alert('댓글 삭제 완료!');
					viewAllReplies();
				} else if (data == "fail") {
					alert('댓글 삭제 실패!\r\n 문제가 지속되면 상현이한테 연락하세요!');
				}
								
			},
			error : function() { // 통신 실패시 수행될 콜백 함수

			}

		});

	}
	
</script>
<style>
#replyDiv {
	boarder: 1px dotted #e1bee7;
	display: none;
	padding: 5px;
}

</style>
<body>
	<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
	%>
	
	
 

	<jsp:include page="../../template.jsp"></jsp:include><br/><br/>
	<div class="container">
		<h2>게시판 상세 페이지</h2><br/><br/>

		<div class="form-group">
			<label for="title">글번호:</label> <input type="text"
				class="form-control" id="no" name="no" value="${board.no }" readonly>
<!-- 			<div> -->
<%-- 				<span id='readcount'>조회수 : <span class="badge">${board.readcount }</span></span> --%>

<!-- 				<span id='likeDislike'> 좋아요 : <span id='isLikeSpan'></span> <span -->
<%-- 					id="likeCount" class="badge">${board.likecount }</span> --%>
<!-- 				</span> -->
<!-- 			</div> -->


		</div>
		<div class="form-group">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" name="title" value="${board.title }"
				readonly>
		</div>

		<div class="form-group">
			<label for="writer">작성자 :</label> <input type="text"
				class="form-control" id="writer" name="writer"
				value="${board.writer}" readonly>
				<div id="writeInfo" style="display: none;">
					<div><a href="listAll?page=1&searchType=writer&searchWord=${board.writer }">작성자 글보기</a></div>
					<div>쪽지보내기</div>
				</div>
		</div>

		<div class="form-group" style="height:500px;">
			<label for="content">내용 :</label>
			<div>${board.contents }</div>

			<c:choose>
				<c:when test="${board.image == '' }">
				</c:when>
				<c:when test="${board.image != null }">
					<img src="../resources/${board.image }" />
				</c:when>
				<c:when test="${board.notimage != null }">
					<a href='../resources/${board.notimage }'>${board.notimage }</a>
				</c:when>

			</c:choose>

		</div>

<%-- 		<c:if test="${board.writer == loginSession.userid }"> --%>
<!-- 			<button type="button" class="btn btn-success">수정</button> -->
<!-- 			<button type="button" class="btn btn-warning">삭제</button> -->
			
<%-- 		</c:if> --%>
		
		
		<button type="button" class="btn btn-danger" onclick="showReply();">댓글달기</button>
		<c:if test="${loginSession.userid != null }">
			
		</c:if>
		
		<button type="button" class="btn btn-info" style="float : right;"
			onclick="location.href='/board/qna/listAll?pageNo=1'">목록으로</button>

		<button type="button" class="btn btn-info" 
			onclick="deleteBoard(${board.no})">글 삭제하기</button>
		
		<button type="button" class="btn btn-success"
         onclick="location.href='/board/qna/modifyBoard?no=${board.no }'">글 수정</button>
         
		<div id="replyDiv" style="clear : both;">
			<div class="form-group">
<!-- 				<div class="checkbox"> -->
<!-- 					<label><input type="checkbox" id="isSecret">비밀글로 등록</label> -->
<!-- 				</div> -->
				
<!-- 				 <label for="replyer">작성자 :</label> <input type="text" -->
<!--                class="form-control" id="replyer" name="replyer" ><span -->
<!--                id="writerError" class="error"></span> -->
				
				
				
				<label for="replyContents">댓글 내용:</label>
				<textarea id="replyContents" rows="6" cols="150"></textarea>
				<button type="button" class="btn btn-danger" onclick="addReply();">댓글등록</button>
			</div>
		</div>
		
		<div id="replyLst">
		
		</div>
		
		<div id="replyModify" style="display: none;">
			<div>댓글 수정</div>
			<div class="form-group">
<!-- 				<div class="checkbox"> -->
<!-- 					<label><input type="checkbox" id="isSecretModify">비밀글로 등록</label> -->
<!-- 				</div> -->
				<label for="replyContents">댓글 내용:</label>
				<textarea id="replyContentsModify" rows="6" cols="150"></textarea>
				<button type="button" class="btn btn-danger" onclick="modifyReply();">댓글수정</button>
			</div>
		</div>
		
		<div id="replyRemove" style="display: none;">
			<div>댓글 삭제</div>
			<div class="form-group">
				정말로 진심으로 진짜로 삭제 할까요? (삭제된 댓글은 복구가 불가능 합니다!)
				<button type="button" class="btn btn-info" onclick="closeRemove();">취소</button>
				<button type="button" class="btn btn-danger" onclick="removeReply();">댓글삭제</button>
				
			</div>
		</div>
		
	</div><br/><br/>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>