<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세페이지</title>

<style>
  table, th, td {
    border: 1px solid #bcbcbc;
  }
  table {
    width: 500px;
    height: 300px;
    margin-left: auto;
    margin-right: auto;
  }
</style>

</head>
<body>

<jsp:include page="../../template.jsp"></jsp:include>
	
	<div id="container" style="background-color:#3C6E9F;">
	
	<h1 style="margin-top:100px; margin-bottom:80px; margin-left:60px; text-align:left; font-size:50px"> ${view.title}</h1>	
	</div>		
	<img src= "${view.img}" style="height:650px; margin-left:10%;"><br />
	

	<table>
	
		<thead>
			<tr>
				<th style="font-size:25px">개최 일자</th>
				<th style="font-size:25px">개최 장소</th>
				<th style="font-size:25px">전시 규모</th>
				<th style="font-size:25px">참가 기업</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<!--<td stlye=""  -->
				<td>${view.hostdate}</td>
				<td>${view.hostplace}</td>
				<td>${view.huge }</td>
				<td>${view.company}</td>
			</tr>
		</tbody>
	</table>
	
	<div style="margin:5%">
		<a href="/board/event/modify?no=${view.no}" class="btn btn-primary pull-right">게시물 수정</a>, <a href="/board/event/delete?no=${view.no}" class="btn btn-primary pull-right">게시물 삭제</a><a href="/board/event/listPage" class="btn btn-primary pull-left">글 목록</a>
	</div>
</body>
</html>