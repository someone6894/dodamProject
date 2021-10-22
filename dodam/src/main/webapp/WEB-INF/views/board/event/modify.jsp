<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<style>
.container {
	area : "80px";
}

</style>
</head>
<body>

<jsp:include page="../../template.jsp"></jsp:include>


	<form method="post">
		<div id="container">
		<label>제목</label>
			<input type="text" name="title" value="${view.title }"/><br />
	
		<label>작성자</label>
			<input type="text" name="admin" value="${view.admin }"/><br />
	
		<label>내용</label>
			<textarea cols="50" rows="5" name="contents" >${view.contents }</textarea><br />
			
		<label>이미지</label>
	<button type="submit">수정하기</button>
	</div>
	</form>
</body>
</html>