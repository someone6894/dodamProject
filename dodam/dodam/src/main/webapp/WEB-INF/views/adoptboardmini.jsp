<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dodam dodam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</head>
<style>

</style>
<script>
$(function(){
	  $('.bxslider').bxSlider({
		    mode: 'fade',
		    captions: true,
		    slideWidth: 600
		});
  });
</script>
<body>
<div class="bxslider">
  <div><img src="../resources/images/paw.png"></div>
  <div><img src="../resources/images/test2.jpg"></div>
  <div><img src="../resources/images/paw.jpg"></div>
</div>

<!-- <div class=' grid-container'>
	<c:forEach var="board" items="${listBoard }" begin="0" end="3">
							<div onclick="readBoard(${board.no});">
							<div> 
								<c:choose>
									<c:when test ="${board.state eq 'protected'}">
										보호중
									</c:when>								
								</c:choose>
							</div>
<%-- 								<div>${board.no }</div> --%>
<%-- 								<div>${board.adoptarea }</div> --%>
								<div><img src= ../resources/${board.image} width= '200px' height= '200px' /></div>
								<div>${board.title }</div>
<%-- 								<div>${board.contents }</div> --%>
								<div>${board.regdate }</div>
							</div>
	</c:forEach>
	</div>
 -->
</body>
</html>