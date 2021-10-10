<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

	<jsp:include page="template.jsp"></jsp:include>

<nav class="navbar navbar-default">
	
		<div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="/board/proud/listAll?pageNo=1">게시판</a></li>
      <li><a href="/member/login">로그인</a></li>
      <li><a href="#">회원가입</a></li>
    </ul>
  </div>
  
</nav>
</body>
</html>
