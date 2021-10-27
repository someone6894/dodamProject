<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-cache">
<meta http-equiv="Pragma" content="No-cache">
<link rel="icon" href="../../resources/assets/missing/assets/img/brand/favicon.png" type="image/png">
<title>자랑하기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<script>
	$(function() {
		// 현재글에 달려있는 모든 댓글을 읽어와서 출력
		viewAllReplies();	
	});
	function deleteBoard(no) {
		location.href='/board/proud/deleteboard?no=' + no;
	}

	function viewAllReplies() {
		let bno = "${param.no}";
		bno = parseInt(bno);
		let url = "/replies/all/" + bno;
			
		 $.ajax({
		         url : url, // ajax와 통신 할 곳
		         dataType : "json", // 수신될 데이터의 타입
		         type : "get", // 통신 방식, 제이슨으로 보내는게 아니기 때문에 headers 생략
		         success : function(data) { // 통신 성공시 수행될 콜백 함수
		        	 if(data != null) {
						console.log(data);
		    			
						$("#replyLst").empty();
						let output = '<ul class="list-group">';

		    			$.each(data, function(i, element) {
		    				viewoutput ='<li id= "reply' + element.no + '"class="list-group-item"><div>';

	    					if (element.step > 0) {
	    						console.log (element.step);
	    						for (i=0; i < element.step; i++){
	    							viewoutput += '<span style = "padding-left:25px;"></span>';
	    						}
	    						viewoutput += '<img style = "padding-right:5px;" class = "reimage" src="/resources/images/lcj/rereply.png">';
	    					} 
	    					
	    					viewoutput += '<span style="font-size : 14pt" id="spanreplyer' + element.no +'" >' + element.replyer + '</span>';
	    					if (element.registerdate != element.modifydate) {
		    					viewoutput += '<span style = "margin-left : 30px">' + new Date(element.registerdate).toLocaleString() + '</span>';
	    					}
	    					else{
		    					viewoutput += '<span style = "margin-left : 30px">' +new Date(element.modifydate).toLocaleString() + '</span>';
		    				}		    					
	    					viewoutput += '</div></br>';

	    					viewoutput += '<div id="orcontent' + element.no + '" style = "margin-left : 5px; margin-top : 10px;">';
	    					if (element.step > 0) {
	    						console.log (element.step);
	    						for (i=0; i < element.step; i++){
	    							viewoutput += '<span style = "padding-left:30px"></span>'
	    						}
	    					} 
	    					viewoutput += element.contents + '</div>';
	    					
	    					viewoutput += '<div id="regreg' + element.no + '"></div>';
	    					if(element.replyer == $("#replyer").val()) {
	    					viewoutput += '<div class ="fdb_nav"><a href="javascript:;" class = "far" onclick="UpReply(' + element.no + ')";><img class="fa fa-pencil" src="../../resources/images/lcj/replyupdate.png" /> 수정</a>';
	    					viewoutput += '<a href="javascript:;" class = "far" onclick="DeReply(' + element.no + ')";><img class="fa fa-eraser" src="../../resources/images/lcj/replydelete.png" /> 삭제</a>';
	    					viewoutput += '<a href="javascript:;" class = "far" onclick="ReReply(' + element.no + ')";><img class="fa fa-talk" src="../../resources/images/lcj/replyreply.png" /> 댓글</a></div>';
	    					}else if( element.replyer != $("#replyer").val() && $("#replyer").val() != null){
	    						viewoutput += '<div class ="fdb_nav">';
		    					viewoutput += '<a href="javascript:;" class = "far" onclick="ReReply(' + element.no + ')";><img class="fa fa-talk" src="../../resources/images/lcj/replyreply.png" /> 댓글</a></div>';	    						
	    					}
	    					viewoutput += '</li>'
	    					
	    					
		    				viewoutput += '<div id="replyUpdate' + element.no + '" class="replyUpdate" style="clear : both;">';
	    					viewoutput += '<div class="form-group">';
	    					
	    					viewoutput += '<a href="javascript:;" class = "right" style = "color : black" onclick ="Hide(' + element.no + ')";><img class="fa far2" src ="../../resources/images/lcj/close.png"/>닫기</a>';

	    					viewoutput += '<input type="hidden" class="form-control" id="replyer' + element.no +'" name = "replyerupdate" value ="${userid}">';
	    					
	    					viewoutput += '<label for ="replyContents"><h4>${userid}</h4></label>'
	    					viewoutput += '<textarea id="replyContents' + element.no + '" rows="6" cols="158">' + element.contents + '</textarea>'
	    					viewoutput += '<button type="button" class = "btn btn-danger" onclick ="updateReply(' + element.no + ');">등록</button>';
	    					viewoutput += '</div></div>';


	    					
	    					viewoutput += '<div id="reReply' + element.no + '" class="reReply" style="clear : both;">';
	    					viewoutput += '<div class="form-group">';
	    					viewoutput += '<a href="javascript:;" class = "right" style = "color : black" onclick ="HideReReply(' + element.no + ')";>';
	    					viewoutput += '<img class="fa far2" src ="../../resources/images/lcj/close.png"/>닫기</a>';

	    					
	    					viewoutput += '<input type="hidden" class="form-control" id="rereplyer' + element.no + '" name = "rereplyer' + element.no + '" value="${userid}">';
	    					viewoutput += '<input type="hidden" id="reforder' + element.no + '" value = "' + element.reforder + '">';

	    					viewoutput += '<label for ="replyContents"><h4>${userid}</h4></label>';
	    					viewoutput += '<textarea id="rereplyContents' + element.no + '" rows="6" cols="158"></textarea>';
	    					viewoutput += '<button type="button" class = "btn btn-danger" onclick ="addreReply(' + element.no + ' , ' + element.step + ');">등록</button>';
	    					viewoutput += '</div></div>';
	    					
	    					output += viewoutput;
		    			}); // 반복문 끝

		    			output += "</ul>";
		    			
		    			$("#replyLst").html(output);
		    		}
		         },
		         error : function() { // 통신 실패시 수행될 콜백 함수
		         }

		      });  
		
	}
	
	function addReply() {
		let bno = '${param.no}';
		bno = parseInt(bno);
		let replyer = $("#replyer").val();
		let content = $("#replyContents").val();
		
		let url = '/replies/create';
		
		let sendData = JSON.stringify({ // json 타입의 객체로 보이는 문자열 생성
			bno : bno, replyer : replyer, contents : content 
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
					if(data == "success") {
						alert("댓글 등록 완료!");

						$("#replyer").val("");
						$("#replyContents").val("");
						viewAllReplies();
					} else if (data =="fail") {
						alert('댓글 등록 실패! \r\n 문제가 지속되면 상현이한테 연락하세요!');
					}
  		        	 
  		         },
  		         error : function() { // 통신 실패시 수행될 콜백 함수

  		         }

  		      });  
		
	}
	
	function addreReply(no,step) {
		let bno = '${param.no}';
		bno = parseInt(bno);
		let replyer = $("#rereplyer" + no).val();
		let contents = $("#rereplyContents" + no).val();
		let reforder = $("#reforder" + no).val();
		
		console.log(reforder);
		
		let url = '/replies/replies';
		
		let sendData = JSON.stringify({ // json 타입의 객체로 보이는 문자열 생성
			bno : bno, replyer : replyer, contents : contents , no : no, step : step, reforder : reforder
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
					if(data == "success") {
						alert("댓글 등록 완료!");

						$("#rereplyer").val("");
						$("#rereplyContents").val("");
						HideReReply(no);
						viewAllReplies();
					} else if (data =="fail") {
						alert('댓글 등록 실패! \r\n 문제가 지속되면 상현이한테 연락하세요!');
					}
  		        	 
  		         },
  		         error : function() { // 통신 실패시 수행될 콜백 함수

  		         }

  		      });  
		
	}
	function updateReply(no) {

		let replyer = $("#replyer" + no).val();
		let content = $("#replyContents" + no).val();
		
		let url = '/replies/update';
		
		let sendData = JSON.stringify({ // json 타입의 객체로 보이는 문자열 생성
			no : no, replyer : replyer, contents : content 
		});

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
					if(data == "success") {
						alert("댓글 수정 완료!");
						viewAllReplies();
					} else if (data =="fail") {
						alert('댓글 수정 실패! \r\n 문제가 지속되면 상현이한테 연락하세요!');
					}

  		         },
  		         error : function() { // 통신 실패시 수행될 콜백 함수

  		         }

  		      });  
	}

	function UpReply(no) {
		$("#replyUpdate" + no).show(500);
	}
	
	function Hide(no) {
		$("#replyUpdate" + no).hide(300);
	}
	

	function showReply() {
		$("#replyUpdate" + no).hide(300);
		$("#reReply" + no).hide(300);
	}
	
	

	function ReReply(no) {
		$("#reReply" + no).show(500);
		$("#replyUpdate" + no).hide(300);
	}

	function HideReReply(no) {
		$("#reReply" + no).hide(300);
	}
	
	function DeReply(no){

		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			
			let url = '/replies/delete';
		
			let sendData = JSON.stringify({ // json 타입의 객체로 보이는 문자열 생성
				no : no
			});
			
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
					if(data == "success") {
						alert("댓글 삭제 완료!");
						viewAllReplies();
					} else if (data =="fail") {
						alert('댓글 삭제 실패!');
					}

  		         },
  		         error : function() { // 통신 실패시 수행될 콜백 함수

  		         }

  		      });  
			 
		}else{   //취소
		    return;
		}

	}

	function show(no) {
		
		let url = '/board/proud/like';
		
		let sendData = JSON.stringify({ // json 타입의 객체로 보이는 문자열 생성
			no : no
		});
		
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
				if(data == "success") {
					alert("추천 되었습니다!");
					$("#chang").hide(100);
					$("#mo").show(100);
					location.reload();
				} else if (data =="fail") {
					alert('추천 실패!');
				}

		         },
		         error : function() { // 통신 실패시 수행될 콜백 함수

		         }

		      });  
	}
	
	function hide(no) {
		let url = '/board/proud/dislike';
		
		let sendData = JSON.stringify({ // json 타입의 객체로 보이는 문자열 생성
			no : no
		});
		
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
				if(data == "success") {
					alert("추천 취소하였습니다.!");
					$("#mo").hide(100);
					$("#chang").show(100);
					location.reload();
				} else if (data =="fail") {
					alert('추천 취소 실패!');
				}

		         },
		         error : function() { // 통신 실패시 수행될 콜백 함수

		         }

		      });  
	}
</script>
<style>
#image {
	width: 300px;
	height: 300px;
	border: 1px dotted blue;
}

#replyDiv {
	boarder: 1px dotted #e1bee7;
	padding: 5px;
}

.reReply {
	boarder: 1px dotted #e1bee7;
	display: none;
	padding: 5px;
}

.replyUpdate {
	boarder: 1px dotted #e1bee7;
	display: none;
	padding: 5px;
}

.fdb_nav {
	position: absolute;
	top: 10px;
	right: 10px;
}

.fa-pencil {
	width: 13px;
	text-align: center;
}

.fa-eraser {
	width: 13px;
	text-align: center;
}

.fa-talk {
	width: 13px;
	text-align: center;
}

.far {
	margin-right: 15px;
}

.far2 {
	width: 10px;
	margin-right: 8px;
}

.right {
	float: right;
}

.feeling_div {
	display: flex;
	justify-content: center;
	align-items: center;
}

.button-container {
	margin-left: 20px;
	margin-top: 50px;
	matgin-bottom: 50px;
}

.feeling_a {
	background-color: #fff;
	border: 2px solid #2199e8;
	padding: 10px 20px;
	border-radius: 2px;
	color: #2199e8;
}

.feeling_b {
	background-color: #2199e8;
	border: 2px solid #2199e8;
	padding: 10px 20px;
	border-radius: 2px;
	color: #fff;
}

.container {
	margin-left: 70px;
}

.label {
	margin-left: 3px;
	margin-right: 20px;
}

.btn-sm {
	float: right;
}

#mokrock {
	float: left;
}

.reimage {
	width : 30px;
	height : 30px;
}
</style>
<body>
	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		<br />
		<h4>
			<small>반려견 자랑 | 자랑하기 게시판</small>
		</h4>
		<hr>
		<h2>${board.title }</h2>
		<span class="glyphicon glyphicon-time"></span> Post by
		${board.writer}, ${board.postdate }
		<hr>
		<h4>
			조회 수 : <span class="label label-danger">${board.readcount }</span> 추천
			수 : <span class="label label-primary">${board.likecount }</span>
		</h4>
		<hr>
		<br />
		<p>${board.content }</p>
		<br>


		<c:choose>
			<c:when test="${userid != null}">
				<div class="feeling_div">
					<div class="button-container like-container">

						<c:if test="${likehistory eq 0 }">
							<div id="chang">
								<button class="feeling_a" onclick="show(${board.no });">
									<i class="fa fa-heart-o"> Like</i> </a>
								</button>
								&nbsp;&nbsp;<span class="badge">${board.likecount }</span>
							</div>
						</c:if>

						<c:if test="${likehistory eq 1 }">
							<div id="mo">
								<button class="feeling_b" onclick="hide(${board.no });">
									<i class="fa fa-heart"> Like</i>
								</button>
								&nbsp;&nbsp;<span class="badge">${board.likecount }</span> </a>
							</div>
						</c:if>

					</div>
				</div>
			</c:when>
		</c:choose>

		<br /> <br />

		<c:choose>
			<c:when test="${userid == board.writer}">
				<button type="button" class="btn btn-default btn-sm"
					data-toggle="modal" data-target="#myModal">
					<span class="glyphicon glyphicon-trash"></span> 삭제
				</button>

				<button type="button" class="btn btn-default btn-sm"
					onclick="location.href='/board/proud/updateboard?no=${board.no }'">
					<span class="glyphicon glyphicon-pencil"></span> 수정
				</button>
			</c:when>
		</c:choose>

		<button type="button" class="btn btn-default btn-sm"
			onclick="location.href='#top'">
			<span class="glyphicon glyphicon-arrow-up"></span>
		</button>

		<button type="button" id="mokrock" class="btn btn-default btn-sm"
			onclick="location.href='/board/proud/listAll'">
			<span class="glyphicon glyphicon-th-list"></span> 목록
		</button>

		<br />
		<br />
		<hr>
		<br />

		<div id="replyLst"></div>
		<br />

		<form role="form">
			<div id="replyDiv" style="clear: both;">
				<div class="form-group">
					<input type="hidden" class="form-control" id="replyer"
						name="replyer" value="${userid}"> <label
						for="replyContents"><h4>${userid}:</h4></label>
					<textarea id="replyContents" rows="5" cols="158"
						placeholder="댓글 내용을 입력해주세요"></textarea>
				</div>
				<button type="button" class="btn btn-success" onclick="addReply();">댓글등록</button>
			</div>
		</form>

		<br /> <br />

		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">게시물 삭제</h4>
					</div>
					<div class="modal-body">
						<p>게시물을 정말 삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal"
							onclick="deleteBoard(${board.no});">삭제하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>

		<br /> <br /> <br />


		<div style="margin-bottom: 100px"></div>
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>