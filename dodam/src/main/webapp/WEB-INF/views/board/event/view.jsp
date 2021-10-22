<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세페이지</title>

<style>


.event_view{
	position: relative;
	padding: 0 0 0 395px;
	width:1000px;
	box-sizing: border-box;
}
.event_view h2 {
	padding: 0 0 0 20px;
	border-bottom : 2px solid #333;
	font-size:40px; color:#232323; line-height: 50px;
	margin: 0 0 15px;
}
.event_view table th,
.event_view table td{
	padding : 14px 0; 	font-size: 20px; color:#444; text-align: left;
}
.event_view .btns{
	padding:45px 0 0;
	text-align: center;
}
.event_view .btns > a{
	display: inline-block; 
	width: 136px;
	height: 42px;
	font-size: 16px;
	color:#fff; border-radius:2px;
	line-height: 42px;
}

.event_view .btns > a.btn1{
	background: #666;
}
.event_view .btns > a.btn2{
	background: #3C6E9F;
}
.event_view .btns > a.btn3{
	background: #3C6E9F;
}
</style>

</head>
<body>

<jsp:include page="../../template.jsp"></jsp:include>
	
	<div class="event_view" style="margin-left: 450px; margin-top: 100px; margin-bottom: 300px" >
		<h2>${view.title}</h2>
		<table>
	
			<colgroup>
			<col style="width:174px;">
			<col>
			</colgroup>
			<tbody>
			<tr>
			<th>개최 일자</th>
			<td>${view.hostdate}</td>
			</tr>
			<tr>
			<th>개최 장소</th>
			<td>${view.hostplace}</td>
			</tr>
			<tr>
			<th>전시 규모</th>
			<td>${view.huge }</td>
			</tr>		
			<tr>
			<th>참가 기업</th>
			<td>${view.company}</td>
			</tr>
			</tbody>
		</table>
			<div class="img">
			<img src= "${view.img}"  style="position: absolute; left:0; 
									 top:0;width: 368px; height: 500px; border:1px solid #e8e8e8;" >
			</div>
		
			<div class="btns">
				<a href="/board/event/modify?no=${view.no}" class="btn1">게시물 수정</a>, 
				<a href="/board/event/delete?no=${view.no}" class="btn2">게시물 삭제</a>
				<a href="/board/event/listPage" class="btn3">글 목록</a>
			</div>
	</div>
</body>
</html>