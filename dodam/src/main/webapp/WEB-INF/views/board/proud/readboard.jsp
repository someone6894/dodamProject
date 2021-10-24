<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content ="No-cache">
<meta http-equiv="Pragma" content ="No-cache">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
		    				viewoutput ='<li id= "reply' + element.no + '"class="list-group-item">';							
	    					viewoutput += '<div><span style="font-size : 14pt" id="spanreplyer' + element.no +'" >' + element.replyer + '</span>';
	    					if (element.registerdate != element.modifydate) {
		    					viewoutput += '<span style = "margin-left : 30px">' + new Date(element.registerdate).toLocaleString() + '</span>';
	    					}
	    					else{
		    					viewoutput += '<span style = "margin-left : 30px">' +new Date(element.modifydate).toLocaleString() + '</span>';
		    				}		    					
	    					viewoutput += '</div></br>';
	    					viewoutput += '<div id="orcontent' + element.no + '" style = "margin-left : 5px; margin-top : 10px;">' + element.contents + '</div>';
	    					viewoutput += '<div id="regreg' + element.no + '"></div>';
	    					viewoutput += '<div class ="fdb_nav"><a href="javascript:;" class = "far" onclick="UpReply(' + element.no + ')";><img class="fa fa-pencil" src="../../resources/images/lcj/replyupdate.png" /> 수정</a>';
	    					viewoutput += '<a href="javascript:;" class = "far" onclick="DeReply(' + element.no + ')";><img class="fa fa-eraser" src="../../resources/images/lcj/replydelete.png" /> 삭제</a>';
	    					viewoutput += '<a href="javascript:;" class = "far" onclick="ReReply(' + element.no + ')";><img class="fa fa-talk" src="../../resources/images/lcj/replyreply.png" /> 댓글</a></div>';
	    					viewoutput += '</li>'
	    					
		    				viewoutput += '<div id="replyUpdate' + element.no + '" class="replyUpdate" style="clear : both;">';
	    					viewoutput += '<div class="form-group">';
	    					viewoutput += '<label for="replyer">작성자 : </label>';
	    					
	    					viewoutput += '<a href="javascript:;" class = "right" style = "color : black" onclick ="Hide(' + element.no + ')";><img class="fa far2" src ="../../resources/images/lcj/close.png"/>닫기</a>';

	    					viewoutput += '<input type="text" class="form-control" id="replyer' + element.no +'" name = "replyerupdate" value ="' + element.replyer + '">';
	    					viewoutput += '<label for ="replyContents">댓글 수정:</label>'
	    					viewoutput += '<textarea id="replyContents' + element.no + '" rows="6" cols="150">' + element.contents + '</textarea>'
	    					viewoutput += '<button type="button" class = "btn btn-danger" onclick ="updateReply(' + element.no + ');">등록</button>';
	    					viewoutput += '</div></div>';

	    					
	    					
	    					viewoutput += '<div id="reReply' + element.no + '" class="reReply" style="clear : both;">';
	    					viewoutput += '<div class="form-group">';
	    					
	    					viewoutput += '<a href="javascript:;" class = "right" style = "color : black" onclick ="HideReReply(' + element.no + ')";>';
	    					viewoutput += '<img class="fa far2" src ="../../resources/images/lcj/close.png"/>닫기</a>';
	    					viewoutput += '<label for="rereplyer">작성자 : </label>';
	    					
	    					viewoutput += '<input type="text" class="form-control" id="rereplyer' + element.no + '" name = "rereplyer' + element.no + '" >';
	    					viewoutput += '<label for ="replyContents">대댓글 달기:</label>'; 
	    					viewoutput += '<textarea id="rereplyContents' + element.no + '" rows="6" cols="150"></textarea>';
	    					viewoutput += '<button type="button" class = "btn btn-danger" onclick ="addreReply(' + element.no + ');">등록</button>';
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
						HideReply();
						viewAllReplies();
					} else if (data =="fail") {
						alert('댓글 등록 실패! \r\n 문제가 지속되면 상현이한테 연락하세요!');
					}
  		        	 
  		         },
  		         error : function() { // 통신 실패시 수행될 콜백 함수

  		         }

  		      });  
		
	}
	
	function addreReply(no) {
		let bno = '${param.no}';
		bno = parseInt(bno);
		let replyer = $("#rereplyer" + no).val();
		let contents = $("#rereplyContents" + no).val();
		
		let url = '/replies/replies';
		
		let sendData = JSON.stringify({ // json 타입의 객체로 보이는 문자열 생성
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
		$("#replyDiv").hide(300);
		$("#reReply" + no).hide(300);
	}
	
	function Hide(no) {
		$("#replyUpdate" + no).hide(300);
	}
	

	function showReply() {
		$("#replyDiv").show(500);
		$("#replyUpdate" + no).hide(300);
		$("#reReply" + no).hide(300);
	}
	
	function HideReply() {
		$("#replyDiv").hide(300);
	}
	

	function ReReply(no) {
		$("#reReply" + no).show(500);
		$("#replyUpdate" + no).hide(300);
		$("#replyDiv").hide(300);
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

</script>
<style>
	#image {
		width : 300px;
		height : 300px;
		border : 1px dotted blue;
	}
	
	#replyDiv {
		boarder : 1px dotted #e1bee7;
		display : none;
		padding : 5px;
	}
	
	.reReply {
		boarder : 1px dotted #e1bee7;
		display : none;
		padding : 5px;
	}
	
	.replyUpdate {
		boarder : 1px dotted #e1bee7;
		display : none;
		padding : 5px;
	}
	
	.fdb_nav {
		position : absolute;
		top : 10px;
		right : 10px;
	}
	
	.fa {
    width: 13px;
    text-align: center;
	}
	
	.far {
		margin-right : 15px; 
	}
	
	.far2 {
		margin-right : 8px; 
	}
	
	.right {
		float : right;
	}
</style>
<body>
   <jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
      <h2>게시판 상세 페이지</h2>

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
            value="${board.title }" readonly>
      </div>

      <div class="form-group">
         <label for="writer">작성자 :</label> <input type="text"
            class="form-control" id="writer" name="writer"
            value="${board.writer}" readonly>
      </div>

      <div class="form-group">
        <label for="content">내용 :</label>
        <div>${board.content }</div>	  
	  </div>
     	
     	<div></div>
    
      <button type="button" class="btn btn-success"
         onclick="location.href='/board/proud/updateboard?no=${board.no }'">글 수정</button>
         
      <button type="button" class="btn btn-info"
         onclick="location.href='/board/proud/listAll'">목록으로</button>
              
         <button type="button" class="btn btn-danger"
          data-toggle="modal" data-target="#myModal">글 삭제하기</button>

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
	
	      <button type="button" class="btn btn-danger" onclick="showReply();">댓글달기</button>	  
	      
	      <br/><br/><br/>

    <div id="replyDiv" style="clear : both;">
      		<div class="form-group">

	    	<a href="javascript:;" class = "right" style = "color : black" onclick ="HideReply()">
	    	<img class="fa far2" src ="../../resources/images/lcj/close.png"/>닫기</a>
	    	
            <label for="replyer">작성자 :</label> <input type="text"
               class="form-control" id="replyer" name="replyer" ><span
               id="writerError" class="error"></span>
	    					

            <label for="replyContents">댓글 내용:</label>
            <textarea id="replyContents" rows="6" cols="150"></textarea>
            <button type="button" class = "btn btn-danger" onclick="addReply();">댓글등록</button>
         </div>
     </div>
     
        <div id="replyLst">
     </div>
     
     <div style="margin-bottom : 100px"></div>
</div>
</body>
</html>