<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 목록</title>
</head>
<body>
<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>지역</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요수</th>
			</tr>
		</thead>
	<tbody>
		<c:forEach items = "${list }" var ="list">
			<tr>
				<td>${list.no}</td>
				<td><a href="/board/event/view?no=${list.no}">${list.title}</a></td>
				<td>${list.area}</td>
				<td>
				<fmt:formatDate value="${list.registerdate}" pattern="yyyy-MM-dd" />
				</td>
				<td>${list.readcount}</td>
				<td>${list.likecount}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>	

<div>
		<c:forEach begin="1" end="${pageNum }" var="num">
			<span>
				<a href="/board/event/listPage?num=${num }">${num}</a>
			</span>
		</c:forEach>
</div>
</body>
</html>