<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>전시회 목록</title>

</head>
<body>

<jsp:include page="../../template.jsp"></jsp:include>

	<div class="container"> <br/>
		<h1 style="margin-bottom: 20px; margin-top: 30px; font-family: 'Jua', sans-serif;">전시회 목록</h1><br/>
		<!-- 카테고리 컬럼명 검색 -->
		<!-- <div role="menubar">
			<ul class="fusion-fiters" role="menu" aria-label="filters" style="display: block;">
				<li role="menuitem" class="fusion-filter fusion-filter-all fusion active">
					<a href="#" data-filters= "*">전부</a>
				</li>
				<li role="menuitem" class="fusion-filter">
					<a href="#" data-filters="">2018</a>	
				</li>
				<li role="menuitem" class="fusion-filter">
					<a href="#" data-filters="">2019</a>	
				</li>
				<li role="menuitem" class="fusion-filter">
					<a href="#" data-filters="">2020</a>	
				</li>
				<li role="menuitem" class="fusion-filter">
					<a href="#" data-filters="">2021</a>	
				</li>
			</ul>
		</div>		-->
	  <div class="w3-row-padding w3-padding-16 w3-center" id="event">
	<c:forEach items = "${list }" var ="list">
	<div class="w3-quarter" style="margin-bottom:35px;">
	<a href="/board/event/view?no=${list.no}">
      <img src="${list.thumbimg }" style="height:350px">
      <h3 style="font-family: 'Jua', sans-serif;">${list.title }</h3>
     <!--   <p>${list.contents }</p> -->
      </a>
    </div>
	</c:forEach>
	
	</div>

</div>
<div>
<c:choose>
		<c:when test="${loginSession.userid!= admin123}"><a href="/board/event/write" class="btn btn-primary pull-right">게시물 작성</a>
		</c:when></c:choose>
	</div>


  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
    	<a href="#" class="w3-bar-item w3-button #3C6E9F">«</a>
		<c:forEach begin="1" end="${pageNum }" var="num">
			<span>
				<a href="/board/event/listPage?num=${num }" class="w3-bar-item #3C6E9F w3-button" >${num}</a>				
			</span>
		</c:forEach>
		<a href="#" class="w3-bar-item w3-button #3C6E9F">»</a>
		
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
	
</div>
</body>
</html>