<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script>
	function readBoard(no) {
		location.href='/board/readBoard?no=' + no;
	}
</script>
<body>
	<jsp:include page="../../template.jsp"></jsp:include>
	<div class="container">
		<c:choose>
			<c:when test="${listBoard != null }">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>시군구</th>
							<th>병원명</th>
							<th>영업상태</th>
							<th>지번주소</th>
							<th>도로명주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${listBoard }">
							<tr onclick="readBoard(${board.no});">
								<td>${hospital.ciyy }</td>
								<td>${hospital.hospital }</td>								
								<td>${hospital.state }</td>
								<td>${hospital.jibeonjuso }</td>
								<td>${hospital.dolomyeongjuso }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
		</c:choose>
		
		<div style="margin-top: 15px; clear : right;">
			${pagingInfo }
			<ul class="pagination">
				<c:if test="${param.pageNo > 1 }">
					<li><a href="/board/hosptal/listAll?pageNo=1&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&lt;&lt;</a></li>
				</c:if>
				<c:if test="${param.pageNo > 1 }">
					<li>
					<a href="/board/hosptal/listAll?pageNo=${param.pageNo - 1}&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&lt;</a>
				</c:if>

				<c:forEach var="i" begin="${pagingInfo.startPageNoOfBlock }"
					end="${pagingInfo.endPageNoOfBlock }" step="1">
					<li><a href="/board/hosptal/listAll?pageNo=${i }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">${i }</a></li>
				</c:forEach>
				<c:if test="${param.pageNo < pagingInfo.totalPage }">
					<li><a href="/board/hosptal/listAll?pageNo=${param.pageNo + 1 }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&gt;</a></li>
				</c:if>
				<c:if test="${param.pageNo < pagingInfo.totalPage }">
					<li><a href="/board/hosptal/listAll?pageNo=${pagingInfo.totalPage }&searchBy=${param.searchBy}&searchWord=${param.searchWord}">&gt;&gt;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>