<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function button_event(){
		if(confirm("정말 삭제하시겠습니까?")==true){
			document.form.submit();
		}else{
			return false;
		}
	}
	function clip(){

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
</script>

<style>

.event_view{
	font-family: 'Single Day', cursive;
	
	position: relative;
	
	padding: 0 0 0 400px;
	
	width:1050px;
	
	box-sizing: border-box;
}
.event_view h2 {
	padding: 0 0 0 20px;
	
	border-bottom : 2px solid #333;
	
	font-size:45px;
	
	color:#232323; 
	
	line-height: 50px;
	
	margin: 0 0 15px;
}
.event_view table th,
.event_view table td{
	padding : 14px 0; 	
	
	font-size: 28px; 
	
	color:#444; 
	
	text-align: left;
}
.event_view .btns{
	padding:45px 0 0;
	
	text-align: center;
}

.event_view table td{
	margin_top: 20px;
}
.event_view .btns > a{
	display: inline-block; 
	
	width: 136px;
	
	height: 42px;
	
	font-size: 16px;
	
	color:#fff; 
	
	border-radius:2px;
	
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
	
	<div class="event_view" style="margin-left: 450px; margin-top: 100px; margin-bottom: 150px" >
		<h2 style="font-weight: bold;">${view.title}</h2>
		<table style= "margin-left:20px;">
	
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
									 top:0;width: 368px; height: 500px; 
									 border:1px solid #e8e8e8;
									 -webkit-box-shadow: 20px 20px 24px rgba(0,0,0,0.3);
									 box-shadow: 20px 20px 24px rgba(0,0,0,0.3);" 
									 onclick="location.href='${view.img}'">
			</div>
		
			
			<div class="btns">
			<c:choose>
				<c:when test="${loginSession.userid!= admin123}">
				<a href="/board/event/modify?no=${view.no}" class="btn1">게시물 수정</a>, 
				<a href="/board/event/delete?no=${view.no}" class="btn2" 
				onclick="return button_event();">게시물 삭제</a>
				</c:when></c:choose>
				<a href="/board/event/listPage" class="btn3">글 목록</a>
				<span class="button gray medium"><a href="#" onclick="clip(); return false;" >
				<img src="https://cdn-icons.flaticon.com/png/512/2990/premium/2990295.png?token=exp=1635133206~hmac=f7d1162a99aec4e36596eddbd27dabca" style="width:40px;">
				공유</a></span>
			</div>
		</div>	
	<div class="container">
		<h3 style="font-weight: bold; 
		color: #222; 
		border-bottom : 2px solid #333; 
		padding: 0 0 0 20px;
		line-height: 50px; 
		margin-bottom: 30px">부스 배치도 & 참가 기업 리스트</h3>
		<div class="img">
		<img src = "${view.mallLocation}" style="width:1140px; 
		height: 700px; margin-bottom:50px;" 
		onclick="location.href='${view.mallLocation}'">
		</div>
		
	</div>
	
</body>
</html>