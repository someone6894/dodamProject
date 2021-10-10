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
	function deleteBoard(no) {
		location.href='/board/proud/deleteboard?no=' + no;
	}
</script>
<style>
	#image {
		width : 300px;
		height : 300px;
		border : 1px dotted blue;
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
	  
   		<c:choose>
			<c:when test="${board.image != null}">
				<img id ="image" src="../../resources/${board.image }" />
			</c:when> 
		</c:choose>
     	
     	<div></div>
    
      <button type="button" class="btn btn-success"
         onclick="location.href='/board/proud/updateboard?no=${board.no }'">글 수정</button>
         
      <button type="button" class="btn btn-info"
         onclick="location.href='/board/proud/listAll'">목록으로</button>
     
         
         <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#myModal">글 삭제하기</button>

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
   
</div>
</body>
</html>