<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="icon" href="../../resources/assets/missing/assets/img/brand/favicon.png" type="image/png"> 
  
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:8081/favicon.ico" />
<title>dodam dodam</title>
</head>
<script>
</script>
<body style="overflow-x: hidden">
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-store, must-revalidate");
%>

	<jsp:include page="template.jsp"></jsp:include><br/><br/><br/>
	<jsp:include page="board/adopt/adoptboardmini.jsp"></jsp:include><br/><br/>	
	<jsp:include page="mainBoardmini.jsp"></jsp:include>
	<jsp:include page="otherlist.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>