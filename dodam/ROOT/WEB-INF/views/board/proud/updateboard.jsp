<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   	  
      <button type="submit" class="btn btn-success">수정완료</button>
      <button type="reset" class= "btn btn-warning" onclick ="location.href='/board/proud/readboard?no=${board.no}';">취소</button>
      </form>
     
   </div>
</body>
</html>