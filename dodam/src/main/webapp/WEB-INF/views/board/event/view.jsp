<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<label>제목</label>
		${view.title}<br />
		
	<label>작성자</label>
		${view.admin}<br />
		
	<label>내용</label><br />
		${view.content}<br />
	<div>
		<a href="/board/event/modify?no=${view.no}">게시물 수정</a>, <a href="/board/event/delete?no=${view.no}">게시물 삭제</a>
	</div>
</body>
</html>