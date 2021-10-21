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

//게시판 삭제
	function deleteBoard(no) {
		location.href='/board/qna/deleteBoard?no=' + no;
		
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
	
	
 

	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		<h2>게시판 상세 페이지</h2>

		<div class="form-group">
			<label for="title">글번호:</label> <input type="text"
				class="form-control" id="no" name="no" value="${board.no }" readonly>
			<div>
				<span id='readcount'>조회수 : <span class="badge">${board.readcount }</span></span>

				<span id='likeDislike'> 좋아요 : <span id='isLikeSpan'></span> <span
					id="likeCount" class="badge">${board.likecount }</span>
				</span>
			</div>


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

		<div class="form-group">
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

		<c:if test="${board.writer == loginMember.userid }">
			<button type="button" class="btn btn-success">수정</button>
			<button type="button" class="btn btn-warning">삭제</button>
			
		</c:if>
		
		<c:if test="${loginMember.userid != null }">
			<button type="button" class="btn btn-danger" onclick="showReply();">댓글달기</button>
		</c:if>
		
		<button type="button" class="btn btn-info" style="float : right;"
			onclick="location.href='/board/qna/listAll?pageNo=1'">목록으로</button>

		<button type="button" class="btn btn-info" style="float : left;"
			onclick="deleteBoard(${board.no})">글 삭제하기</button>
		
		<button type="button" class="btn btn-success"
         onclick="location.href='/board/qna/modifyBoard?no=${board.no }'">글 수정</button>
         
		<div id="replyDiv" style="clear : both;">
			<div class="form-group">
				<div class="checkbox">
					<label><input type="checkbox" id="isSecret">비밀글로 등록</label>
				</div>
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
				<div class="checkbox">
					<label><input type="checkbox" id="isSecretModify">비밀글로 등록</label>
				</div>
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
		
	</div>
</body>
</html>