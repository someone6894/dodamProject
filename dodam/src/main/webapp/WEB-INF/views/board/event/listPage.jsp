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
<title>전시회 목록</title>
</head>
<body>

<jsp:include page="../../template.jsp"></jsp:include>

	<div class="container"> <br/>
	
		<h2>전시회 목록</h2><br/>
			<table class= "table table-striped" style="text-align:center; border: 1px solid#dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: left;"></th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">지역</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
						<th style="background-color: #eeeeee; text-align: center;">좋아요</th>
						
	

	<tbody>
		<c:forEach items = "${list }" var ="list">
			<tr>
				<td>${list.no}</td>
				<td><a href="/board/event/view?no=${list.no}">${list.title}</a></td>
				<td><img src= "${list.thumbimg}" style="width:30%"></td>
				<td>
				<fmt:formatDate value="${list.registerdate}" pattern="yyyy-MM-dd" />
				</td>
				<td>${list.area}</td>
				<td>${list.readcnt}</td>
				<td>${list.likecount}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>	
</div>
<div>
		<a href="/board/event/write" class="btn btn-primary pull-right">게시물 작성</a>
	</div>


  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
		<c:forEach begin="1" end="${pageNum }" var="num">
			<span>
			    <a href="#" class="w3-bar-item w3-button #3C6E9F">«</a>
				<a href="/board/event/listPage?num=${num }" class="w3-bar-item #3C6E9F w3-button" >${num}</a>
				<a href="#" class="w3-bar-item w3-button #3C6E9F">»</a>
				
			</span>
		</c:forEach>
	</div>
</div>
</body>
</html>