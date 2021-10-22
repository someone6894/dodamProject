<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실종 : ${MissingBoard.title }</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" 
  integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
	<script>
		$(function() {
			
			// 게시글 이미지 가져오기----------------------------------------------------------------------------------------------
			let imgAr = "${MissingBoard.img}".split(", ");
			console.log(imgAr);
			let output = "";
			
			let imgCnt = 0;
			for (let i=0; i<imgAr.length; i++) {
				if (imgAr[i] != "") {
					if (imgAr[i].split(":")[0] == "http") {
						output += "<img src='" + imgAr[i] + "' width='30%'/>";
					} else {
						output += "<img src='../resources/uploads/kmj/missing" + imgAr[i] + "' width='30%'/>";
					}
					imgCnt++;
				}
			}
			
			for (let i=0; i<3-imgCnt; i++) {
				output += "<img src='../../resources/images/kmj/missing/noimage.png' width='30%' />";
			}
			
			console.log(output);
			$(".img_container").html(output);
			
			let animal = process_animal();
			let missingdate = "${MissingBoard.missingdate }".split(" ")[0];
			let registerdate = "${MissingBoard.registerdate}".substring(0,"${MissingBoard.registerdate}".lastIndexOf(":"));
			let gender = process_gender();
			
			$("#registerdate").html(registerdate);
			$("#missingdate").html(missingdate);	
			$("#animal_breed").html(animal);
			$("#gender").html(gender);
			
			// 전화번호 뒷자리 로그인한 사용자에게만 공개되도록 설정---------------------------------------------------------
			let contact = "${MissingBoard.contact }";
			if ("${loginSession.userid}" == '') {
				contact = contact.substring(0, 9) + "＊＊＊＊";
				contact += "<div style='color: #3C6E9F;'>전화번호를 보러면 로그인하세요.</div>";
			}
			$("#contact").html(contact);
			

			// 찾았어요, 찾습니다 전환 버튼 나타나게 하기---------------------------------------------------------
			if ("${MissingBoard.category}" == "missing") {
				$("#category").attr("class", "foundBtn");
				$("#category").html("찾았어요!");
			} else {
				$("#category").attr("class", "missingBtn");
				$("#category").html("찾았어요 취소");
				$("#found_span").html("<찾았어요!>");
			}
			
			// 글 작성자에게만 찾았어요, 찾습니다 버튼 나타나도록 설정---------------------------------------------------------
			if("${loginSession.userid}" == "${MissingBoard.writer}") {
				$("#category").show();
			}
			
			// 로그인 한 유저의 경우 좋아요 기록 가져와서 하트 채우기---------------------------------------------------------
			if ("${loginSession.userid}" != "") {
				let url = '/missing/bookmarkHistory';
				
				$.ajax({
					url : url, // ajax와 통신 할 곳
					data : {no : "${param.no}", userid : "${loginSession.userid}"}, // 서블릿에 보낼 데이터
					dataType : "text", // 수신될 데이터의 타입
					type : "POST", // 통신 방식
					success : function(data) { // 통신 성공시 수행될 콜백 함수
						console.log(data);
						let output = '';
						if (data == "exist") {
							output += "<img src='../../resources/images/kmj/missing/bookmark.png' id='unbookmark' onclick='Unbookmark();'/>";
						} else if (data == "none") {
							output += "<img src='../../resources/images/kmj/missing/unbookmark.png' id='bookmark' onclick='Bookmark();'/>";
						}
						$("#bookmarkSpan").html(output);
					}
				});
			}
			
			

			// 모든 댓글 가져오기---------------------------------------------------------
			viewAllReplies();
		
			// 댓글 메뉴 이외의 배경 클릭시 메뉴리스트 사라지도록 설정---------------------------------------------------------
			$('html').click(function(e) { 
				if(!$(e.target).hasClass("target")) {
					$(".replyMenu").hide();
				}
			});
			
			// JavaScript 코드---------------------------------------------------
			// 삭제 모달에서 삭제 버튼 클릭시 게시물, 댓글 분기하여 삭제메서드 호출되도록 설정
			document.getElementById("delete").addEventListener("click", function() {
				closeRemove();
				
				let what = document.getElementsByClassName("boardOrReply")[0].innerHTML;
				let no = document.getElementById("deleteNo").value;
				if (what == "게시글") {
					deleteBoard();
				} else if (what == "댓글") {
					deleteReply(no);
				}
			});
		});
		
		// esc키 누르면 삭제모달 사라지면서 화면 잠김 해제--------------------------------------------------------- 
		$(document).keydown(function(event){ 
			if(event.which=='27'){ 
				$("#remove").fadeOut(300); 
				$(".backLayer").fadeOut(1000); 
				$('body').css("overflow", "scroll");
			} 
		}); 
		
		// 삭제모달 나타났을 때 보이는 반투명 배경 -> 윈도우가 resize될때마다 backLayer를 조정--------------------------------------------------------- 
		$(window).resize(function(){ 
			let width = $(window).width(); 
			let height = $(window).height(); 
			$(".backLayer").width(width).height(height); 
		});
		
		// 북마크 해지버튼, 북마크 수 -1, 북마크 아이콘 비우기----------------------------------------------------------------------------------
		function Unbookmark() {
			let userid = "${loginSession.userid}";
			let no = "${MissingBoard.no}";
			
			let url = "/missing/unbookmark";
			
			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : {no : no, userid : userid}, // 서블릿에 보낼 데이터
				dataType : "json", // 수신될 데이터의 타입
				type : "POST", // 통신 방식
				success : function(data) { // 통신 성공시 수행될 콜백 함수
					console.log(data);
					if (data.result == 1) {
						let output = "<img src='../../resources/images/kmj/missing/unbookmark.png' id='bookmark' onclick='Bookmark();'/>";
						$("#bookmarkSpan").html(output);
						$("#bookmarkcount").html(data.bookmarkCount);
					}
				}
			});
		}
		
		// 북마크 버튼 클릭시 북마크 수, 북마크 채우기----------------------------------------------------------------------------------
		function Bookmark() {
			let userid = "${loginSession.userid}";
			let no = "${MissingBoard.no}";
			
			let url = "/missing/bookmark";
			
			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : {no : no, userid : userid}, // 서블릿에 보낼 데이터
				dataType : "json", // 수신될 데이터의 타입
				type : "POST", // 통신 방식
				success : function(data) { // 통신 성공시 수행될 콜백 함수
					console.log(data);
					if (data.result == 1) {
						let output = "<img src='../../resources/images/kmj/missing/bookmark.png' id='unbookmark' onclick='Unbookmark();'/>";
						$("#bookmarkSpan").html(output);
						$("#bookmarkcount").html(data.bookmarkCount);
					}
				}
			});
		}
		
		// 동물 종류 처리하는 메서드----------------------------------------------------------------------------------
		function process_animal() {
			let animal = "";
			if ("${MissingBoard.animal }" == "dog") {
				animal = "개";
			} else if ("${MissingBoard.animal }" == "cat") {
				animal = "고양이";
			}
			
			return animal;
		}
			
		// 동물 성별 처리하는 메서드----------------------------------------------------------------------------------
		function process_gender() {
			let gender = "";
			if ("${MissingBoard.gender }" == 'M') {
				gender = "수컷";
			} else if ("${MissingBoard.gender }" == 'F') {
				gender = "암컷";
			} else if ("${MissingBoard.gender }" == 'N') {
				gender = "성별 모름";
			}
		
			return gender;
		}
		
		// 게시물 삭제하는 메서드----------------------------------------------------------------------------------
		function deleteBoard() {
			let url = '/missing/remove';
			let no = "${MissingBoard.no }";
			
			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : {no : no}, // 서블릿에 보낼 데이터
				dataType : "text", // 수신될 데이터의 타입
				type : "POST", // 통신 방식
				success : function(data) { // 통신 성공시 수행될 콜백 함수
					console.log(data);
					if(data == "success") {
						alert("게시물을 삭제하였습니다!");
						location.href="/missing/list";
					} else {
						alert("게시물을 삭제하는데에 실패하였습니다!");
					}
				}
			});
		}
		
		function showReply() {
			$('#isSecret').prop('checked', false);
			$("#replyContents").val("");
			$("#replyDiv").fadeIn(500);
		}
		
		// 찾았어요 찾았어요취소 버튼 바꾸는 메서드----------------------------------------------------------------------------------
		function changeCategory() {
			let status = $("#category").attr("class");
			let category = '';
			let no = "${MissingBoard.no }";
			
			if (status == "foundBtn") {
				category = "found";
			} else if (status == "missingBtn"){
				category = "missing";
			}
			
			let url = '/missing/changeCategory';
			
			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : {no : no, category : category}, // 서블릿에 보낼 데이터
				dataType : "text", // 수신될 데이터의 타입
				type : "POST", // 통신 방식
				success : function(data) { // 통신 성공시 수행될 콜백 함수
					if (data == "success") {
						if (category == "found") {
							$("#category").attr("class", "missingBtn");
							$("#category").html("찾았어요 취소");
							$("h1").css("color", "black");
							$("#found_span").html("<찾았어요!>");
						} else {
							$("#category").attr("class", "foundBtn");
							$("#category").html("찾았어요!");
							$("h1").css("color", "#ff7f00");
							$("#found_span").html("");
						}
					}
				}
			});
		}
		
		// 댓글 등록하는 메서드----------------------------------------------------------------------------------
		function addReply() {
			
			if ("${loginSession.userid}" != "") {
				let pno = "${param.no }";
				pno = parseInt(pno);
				let writer = "${loginSession.userid }";
				let content = $("#replyContents").val();
				let isSecret = 'N';
				if (document.getElementById("isSecret").checked) {
					isSecret = 'Y';
				}
				let url = '/missing/reply';
				
				let sendData = JSON.stringify({pno : pno, replyer : writer, contents : content, issecret : isSecret});
				
				console.log(sendData);
				
				$.ajax({
		            url : url, // ajax와 통신 할 곳
		            data : sendData, // 서블릿에 보낼 데이터
		            dataType : "text", // 수신될 데이터의 타입
		            type : "POST", // 통신 방식
		            success : function(data) { // 통신 성공시 수행될 콜백 함수
		            	console.log(data);
						if (data == "success") {
							alert("댓글이 등록되었습니다!");
							$("#replyDiv").hide(500);
							viewAllReplies();
						} else if (data == "fail") {
							alert("댓글 등록 실패!\r\n 다시 시도해주세요!\r\n 계속 실패 시 고객응대 이메일로 문의해주세요.");
						}
		            },
		            error : function() { // 통신 실패시 수행될 콜백 함수
	
		            }
		        });
			} else {
				alert("세션이 만료되어 댓글 수정에 실패했습니다. \r\n 로그인 후 다시 시도해주세요.");
			}
		}
		
		// 댓글 목록 가져오기----------------------------------------------------------------------------------
		function viewAllReplies() {
			let pno = "${param.no}";
			
			let url = "/missing/reply/viewAll/" + pno;
			$.ajax({
	            url : url, // ajax와 통신 할 곳
	            dataType : "json", // 수신될 데이터의 타입
	            type : "GET", // 통신 방식
	            success : function(data) { // 통신 성공시 수행될 콜백 함수
	            	parseReply(data);
	            },
	            error : function() { // 통신 실패시 수행될 콜백 함수

	            }
	        });
		}
		
		// 댓글 파싱하기----------------------------------------------------------------------------------
		function parseReply(data) {
			if (data != null) {
				console.log(data);
				$("#replyLst").empty();
				let output = '<div class="list-group">'; // 보이는 댓글
	    		$(data).each(function(i, element){
	    			let secoutput ='';
	    			let viewoutput = '';
	        		let loginUser = '${loginSession.userid}'; // 로그인 유저
	        		let bwriter = '${MissingBoard.writer}'; // 부모글 작성자
	        		let replyer = element.replyer;
	        		
					// -------------- 비밀글 템플릿 ---------------------------
	    			secoutput += '<div id="reply' + element.no + '" class="list-group-item">';
	    			secoutput += '<div><img src="../../resources/images/kmj/missing/lock.png" width="15px" />';
	    			secoutput += ' 댓글 작성자가 비밀글로 처리한 글입니다. </div>';
	    			secoutput += '</div>';

	    			// ------------비밀글이 아닌 댓글 템플릿 -----------------
	    			viewoutput += '<div id="reply' + element.no + '" class="list-group-item">';
	        		if (loginUser != "") {
	        			viewoutput += '<div id="reply_menu' + element.no + '" style="float: right;"><img src="../../resources/images/kmj/missing/more.png" width="15px" class="target" onclick="showReplyMenu(' + element.no + ');"/></div>';
	        		}
					viewoutput += '<div>작성자 : <span id="replyer'+ element.no +'">' + element.replyer + '</span></div>';
	        		viewoutput += '<div>내용 : <div  id="orcontent' + element.no + '">' + element.contents + '</div></div>';
	        		
	        		regdate = calcReply(element.lastmodifieddate);
	        		
	        		viewoutput += '<div>작성일 : ' + regdate + '</div>';

	        		
	        		// -------------------------------------------------------
	        		
	        		if (element.issecret == 'Y') { // 비밀글이다
						if (loginUser == bwriter || loginUser ==  replyer) { // 보이는 조건에 해당
								viewoutput += "<div style='color:red;'><img src='../../resources/images/kmj/missing/lock.png' width='15px'>이 글은 비밀글 입니다.</div>";
							if(loginUser == replyer) { // 댓글 작성자인 경우
					       		viewoutput += '<div><ul id="replyMenu' + element.no + '" class="replyMenu">'
					       		viewoutput += '<li class="target" onclick="showModifyReply(' + element.no + ')">수정하기</li>';
					       		viewoutput += '<li class="target" onclick="remove(this, ' + element.no + ');">삭제하기</li></ul></div>';
							} else if (loginUser == bwriter) { // 부모글 작성자인 경우
					       		viewoutput += '<div><ul id="replyMenu' + element.no + '" class="replyMenu">';
					       		viewoutput += '<li class="target" onclick="remove(this, ' + element.no + ');">삭제하기</li>';
					       		viewoutput += '<li class="target">신고하기</li>';
					       		viewoutput += '<li class="target">차단하기</li></ul></div>';
							}
							viewoutput += '</div>';
							output += viewoutput;
							
						} else { // 로그인을 했지만 보이는 조건에 맞지 않는 경우 or 비밀글인데 로그인을 하지 않은 경우
							output += secoutput;
						}
	        		} else {
	        			if(loginUser == replyer) { // 댓글 작성자인 경우
					       	viewoutput += '<div><ul id="replyMenu' + element.no + '" class="replyMenu">';
					       	viewoutput += '<li class="target" onclick="showModifyReply(' + element.no + ')">수정하기</li>';
					       	viewoutput += '<li class="target" onclick="remove(this, ' + element.no + ');">삭제하기</li></ul></div>';
						} else if (loginUser == bwriter) { // 부모글 작성자인 경우
					       	viewoutput += '<div><ul id="replyMenu' + element.no + '" class="replyMenu">';
					       	viewoutput += '<li class="target" onclick="remove(this, ' + element.no + ');">삭제하기</li>';
					       	viewoutput += '<li class="target">신고하기</li>';
					       	viewoutput += '<li class="target">차단하기</li></ul></div>';
						} else { // 비밀글이 아닌데 로그인을 한 경우 or 로그인을 하지 않은 경우
			        		viewoutput += '<div><ul id="replyMenu' + element.no + '" class="replyMenu">';
			        		viewoutput += '<li class="target replydel">신고하기</li>';
			        		viewoutput += '<li class="target">차단하기</li></ul></div>';
						}
	        			
	        			viewoutput += '</div>';
	        			output += viewoutput;
	        		}
	    		}); // 반복문 끝
	    		output += "</div>";
	    		
	    		if (data.length != 0) { // 댓글 data가 존재하면
	    			$("#replyLst").html(output);
	    			$("#replyLst").fadeIn(500);
	    		} else {
	    			$("#replyLst").fadeOut(500);
	    		}
	    	}
		}
		
		// 댓글 단 날짜 표시하는 기준을 정하는 메서드----------------------------------------------------------------------------------
		function calcReply(regdate) {
			let diff = new Date() - regdate; // 댓글 단 시간과 현재시간의 차이
			let diffSecond = diff / 1000; // 현재시간 초단위
			if (diffSecond < 60 * 5) return '방금 전';
			let diffMinutes = diffSecond / 60; // 분단위
			if (diffMinutes < 60) return Math.floor(diffMinutes) + '분 전';
			let diffHours = diffMinutes / 60; // 시간단위
			if (diffHours < 24) return Math.floor(diffHours) + "시간 전";
			let diffDays = diffHours / 24; // 일단위
			if (diffDays < 7) return Math.floor(diffDays) + "일 전";
			return new Date(regdate).toLocaleString();
		}
		
		// 댓글 메뉴 보여주기----------------------------------------------------------------------------------
		function showReplyMenu(no) {
			$(".replyMenu").fadeOut(300);
			$("#replyMenu" + no).fadeIn(300);
		}

		// 게시글이나 댓글 삭제 확인하는 모달 띄우기----------------------------------------------------------------------------------
		function remove(obj, no) {
			if ($(obj).attr("class") == "target") {
				$(".boardOrReply").html("댓글");
			} else {
				$(".boardOrReply").html("게시글");
			}

			$(".replyMenu").fadeOut(300);
			
			let width = $(window).width();
			let height = $(window).height();
			
			//화면을 가리는 레이어의 사이즈 조정 
			$(".backLayer").width(width); 
			$(".backLayer").height(height); 
			$(".backLayer").css("top", $(window).scrollTop());
			
			//화면을 가리는 레이어를 보여준다 (0.5초동안 30%의 농도의 투명도) 
			$(".backLayer").fadeTo(500, 0.3); 
			$('body').css("overflow", "hidden");
			
			
			let div = $('#remove');
			div.css("position", "absolute");
			div.css("z-index", "999");
			div.css("top", ((height - div.outerHeight()) / 2) + $(window).scrollTop() + "px");
			div.css("left", ((width - div.outerWidth()) / 2) + $(window).scrollLeft() + "px");
			$('#deleteNo').val(no);
			$('#remove').fadeIn(500);
		}
		
		// 삭제 확인 모달 닫기----------------------------------------------------------------------------------
		function closeRemove() {
			$('#remove').fadeOut(500);
			$('body').css("overflow", "scroll");
			$(".backLayer").fadeOut(1000); 
		}
		
		// 댓글 삭제하기----------------------------------------------------------------------------------
		function deleteReply(no) {
			let url = "/missing/reply/" + no;
			$.ajax({
	            url : url, // ajax와 통신 할 곳
	            dataType : "text", // 수신될 데이터의 타입
	            type : "DELETE", // 통신 방식
	            headers : {
	            	"content-type" : "application/json",
	            	"X-HTTP-Method-Override" : "POST" // 예전에 나온 프로그램은 PUT이나 DELETE방식을 모르기 때문에 비슷한 방법을 알려줘야함
	            },
	            success : function(data) { // 통신 성공시 수행될 콜백 함수
	            	console.log(data);
	            	if (data == "success") {
						alert("댓글이 삭제되었습니다!");
						viewAllReplies();
					} else if (data == "fail") {
						alert("댓글 삭제 실패!\r\n 다시 시도해주세요!\r\n 계속 실패 시 고객응대 이메일로 문의해주세요.");
					}
	            },
	            error : function() { // 통신 실패시 수행될 콜백 함수

	            }
	        });
		}
		
		// 댓글 수정하는 창 보이기----------------------------------------------------------------------------------
		function showModifyReply(no) {
			$("#replyModify").insertAfter($("#reply" + no));
			$("#replyModify").show(500);
			// 수정할 댓글의 pk를 ReplyModify에 동적으로 넣어줌
			
			let newHidden = document.createElement("input");
			newHidden.setAttribute("type", "hidden");
			newHidden.setAttribute("id", "no");
			
	        document.getElementById("replyModify").appendChild(newHidden); // 동적으로 태그 객체 삽입
	        
	        let replyContents = $("#orcontent" + no).html();
	        
	        replyContents = replyContents.replaceAll("<br>", "\n");
	        
	        $("#no").val(no);
	        $("#replyContentsModify").val(replyContents);
		}
		
		// 댓글 수정하기----------------------------------------------------------------------------------
		function modifyReply() {
			if ("${loginSession.userid}" != "") {
				let no = $("#no").val();
				let replyer = "${loginSession.userid}";
				let contents = $("#replyContentsModify").val();
				let isSecretModify = 'N';
				if (document.getElementById("isSecretModify").checked) {
					isSecretModify = 'Y';
				}
				
				let url = '/missing/reply/' + no;
				let sendData = JSON.stringify({
					no : no, replyer : replyer, contents : contents, issecret : isSecretModify
				});
				
				console.log(sendData);
				
				$.ajax({
		            url : url, // ajax와 통신 할 곳
		            data : sendData, // 서블릿에 보낼 데이터
		            dataType : "text", // 수신될 데이터의 타입
		            type : "PUT", // 통신 방식
		            headers : {
		            	"content-type" : "application/json",
		            	"X-HTTP-Method-Override" : "POST" // 예전에 나온 프로그램은 PUT이나 DELETE방식을 모르기때문에 비슷한 POST, GET방식을 알려줘야함
		            },
		            success : function(data) { // 통신 성공시 수행될 콜백 함수
						if (data == "success") {
							alert("댓글이 수정되었습니다!");
							viewAllReplies();
						} else if (data == "fail") {
							alert("댓글 수정 실패!\r\n 잠시 후 다시 시도해주세요. \r\n 문제가 지속되면 고객응대 이메일로 문의해주세요.");
						}
		            },
		            error : function() { // 통신 실패시 수행될 콜백 함수
	
		            }
		         });
			} else {
				alert("세션이 만료되어 댓글 수정에 실패했습니다. \r\n 로그인 후 다시 시도해주세요.");
			}
		}
	</script>
	<style>
		h1 {
			font-size: 48px;
		}
	
		.img_container {
			display : block;
			margin : 30px 0;
			text-align: center;
		}
		
		table {
			font-size: 14px;
			width: 100%;
		}
		
		.table {
			font-size: 16px;
		}
		
		.wrap {
			width: 90%;
			margin: 100px auto;
		}
		
		.add_border {
			border-top: 2px solid #666666;
		}
		
		.img_tr {
			border-top: 1px solid #d5d5d5;
		}
		
		#replyDiv, #replyModify {
			display : none;
			padding: 10px;
		}
		
		textarea {
			width: 80%;
		}
		
		#bookmark, #unbookmark {
			width: 20px;
			margin-bottom: 2px;
			cursor: pointer;
		}
		
		.foundBtn {
			background-color: #3c6e9f;
			padding-top: 4px;
			color: #ffffff;
			width: 130px;
			height: 30px;
			border-radius: 4px;
			font-size: 16px;
			text-align: center;
      		float: right;
      		cursor: pointer;
		}
		
		.missingBtn {
			background-color: #d5d5d5;
			padding-top: 4px;
			width: 130px;
			height: 30px;
			border-radius: 4px;
			font-size: 16px;
			text-align: center;
      		float: right;
      		cursor: pointer;
		}
		
		#found_span {
			color: #008000;
		}
		
		.replyMenu {
			display: none;
			position: absolute;
			top: 35px;
			right: -50px;
			list-style: none;
			z-index: 999;
		}
		
		.replyMenu > li {
			background-color: #ffffff;
			padding: 8px 10px;
			border: 1px solid #d5d5d5;
			cursor: pointer;
		}
		
		.replyMenu > li:first-child {
			background-color: #ffffff;
			padding: 8px 10px;
			border: 1px solid #d5d5d5;
			cursor: pointer;
			border-radius: 4px 4px 0 0;
		}
		
		.replyMenu > li:last-child {
			background-color: #ffffff;
			padding: 8px 10px;
			border: 1px solid #d5d5d5;
			cursor: pointer;
			border-radius: 0 0 4px 4px;
		}
		
		.replyMenu > li:hover {
			background-color: #efefef;
		}
		
		.target {
			cursor: pointer;
		}
		
		#category {
			display: none;
		}
		
		#replyLst {
			margin: 25px auto;
			border-top: 1px solid #d5d5d5;
			padding-top: 30px;
		}

		#board_btn {
			position: relative;
			height: 25px;
		}
		
		#list_btn {
			position: absolute;
			right:0px;
		}
		
		#remove {
			display: none;
			background-color: #ffffff;
			padding: 20px;
			box-shadow: 1px 1px 3px 1px;
		}
		
		div.backLayer {
			display:none;
			background-color:black;
			position:absolute;
			left:0px; 
			top:0px; 
		}
		
		div#loadingDiv { 
			background-color:skyblue; 
			display: none; 
			position: absolute; 
			width:300px; 
			height:300px; 
		}
	</style>
</head>
<body>
	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		<div class="wrap">
			<table>
				<tr>
					<td colspan="2"><h1 style="color: #ff7f00;"><span id="found_span"></span>※ ${MissingBoard.title } ※</h1>
					<!-- <td></td> -->
				</tr>
				<tr>
					<td style="padding-bottom: 10px;">
						<div style="margin: 10px 0 10px 0;">${MissingBoard.writer } | 
						<span id="registerdate"></span> |
					 	조회 ${MissingBoard.readcount } | 북마크 
					 	<c:if test="${loginSession.userid != null}">
					 		<span id="bookmarkSpan">
					 			<img src="../../resources/images/kmj/missing/unbookmark.png" id="bookmark" onclick="Bookmark();" />
					 		</span>
					 	</c:if>
					 	<span id="bookmarkcount"> ${MissingBoard.likecount }</span></div>
					 	<div id="category" onclick="changeCategory();"></div>
					 </td>
					<!-- <td></td> -->
				</tr>
				<tr class="img_tr">
					<td colspan="2"><div class="img_container"></div></td>
					<!-- <td></td> -->
				</tr>
				<tr>
					<td colspan="2"><h3>실종 동물 정보</h3></td>
					<!-- <td></td> -->
				</tr>
				<tr>
					<td colspan="2">
						<table class="table table-hover">
							<tbody>
								<tr class="add_border">
									<td style="width: 15%">이름</td>
									<td>${MissingBoard.name }</td>
								</tr>
								<tr>
									<td>종</td>
									<td><span id="animal_breed"></span> / ${MissingBoard.breed }</td>
								</tr>
								<tr>
									<td>성별</td>
									<td><span id="gender"></span></td>
								</tr>
								<tr>
									<td>실종일자</td>
									<td><span id="missingdate"></span></td>
								</tr>
								<tr>
									<td>실종장소</td>
									<td>${MissingBoard.location } 
									<c:if test="${MissingBoard.dlocation != null }">
										${MissingBoard.dlocation }
									</c:if>
									</td>
								</tr>
								<tr>
									<td>특이사항</td>
									<td>${MissingBoard.contents }</td>
								</tr>
								<tr>
									<td>연락처</td>
									<c:if test=""></c:if>
									<td id="contact"></td>
									<!-- ####### 로그인한 회원에게만 연락처 노출될 수 있도록 함 ###### -->
									<!-- 가짜연락처임 내가 임의로 만든 거임!!! 기억해... -->
								</tr>
							</tbody>
						</table>
					</td>
					<!-- <td></td> -->
				</tr>
			</table>
			<div id="board_btn">
				<button type="button" class="btn btn-success" id="list_btn" onclick="location.href='/missing/list'">목록</button>
				<c:if test="${loginSession.userid != null }">
					<div>
						<button type="button" class="btn btn-danger" onclick="showReply();">댓글달기</button>
						<c:if test="${loginSession.userid == MissingBoard.writer }">
							<button type="button" class="btn btn-danger" onclick="location.href='/missing/modify?no=${MissingBoard.no}&userid=${loginSession.userid }'">수정</button>
							<button type="button" class="btn btn-danger" onclick="remove(this, ${MissingBoard.no});">삭제</button>
						</c:if>
					</div>
				</c:if>
			</div>
			
			<div id="replyDiv">
				<div class="form-group">
					<div class="checkbox">
	  					<label><input type="checkbox" id="isSecret">비밀글로 등록</label>
					</div>
	            	<label for="replyContents">댓글 내용: </label>
	            	<div><textarea rows="8" id="replyContents" style="width: 100%;"></textarea></div>
	         	</div>
	         	<button type="button" class="btn btn-danger" onclick="addReply();">댓글등록</button>
			</div>
			
			<div id="replyLst" style="display: none;"></div>

			
			<div id="replyModify" style="display: none;">
				<div>댓글 수정</div>
				<div class="form-group">
					<div class="checkbox">
	  					<label><input type="checkbox" id="isSecretModify">비밀글로 등록</label>
					</div>
	            	<label for="replyContents">댓글 내용:</label>
	            	<div><textarea rows="6" id="replyContentsModify" style="width: 100%;"></textarea></div>
	         	</div>
	         	<button type="button" class="btn btn-danger" onclick="modifyReply();">댓글수정</button>
			</div>
		</div>
	</div>
	
	<div class='backLayer' style='position: absolute;' ></div>
	<div id="remove">
		<div style="font-size: 20px; margin-bottom: 10px;"><img src="../../resources/images/kmj/missing/exclamation.png" width="25px;" style="margin-bottom: 5px;"/> <span class="boardOrReply"></span> 삭제</div>
		<div class="form-group">
			삭제된 <span class="boardOrReply"></span>은 복구가 불가능합니다. 삭제할까요? <br />
			<input type="hidden" id="deleteNo" />
			<div style="float:right;">
				<button type="button" class="btn btn-warning" id="delete">삭제</button>
				<button type="button" class="btn" onclick="closeRemove();">취소</button>
			</div>
		</div>
	</div> 
</body>
</html>