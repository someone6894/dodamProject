<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>

	#miss{
	position : relative;
	bottom : 350px;
	right : 0px;
	}
	.col-sm-3:hover {
		background-color: lightblue;
		
	}
	.detailAnchor {
		text-decoration: none;
		color : black;
	}
</style>
<body>
	<div class="container" id="miss">
		<h2>찾고있는 동물들</h2>
				<c:forEach var="otherboard" items="${otherList }">
					<a href="/board/missing/detail?no=${otherboard.no}&userid=${loginSession.userid}" class="detailAnchor">
						<div class="col-sm-3">
							<div class="img_Reccontainer" style="padding: 20px 10px;">
								<c:choose>
									<c:when test="${otherboard.img != ''}">
										<c:choose>
											<c:when test="${otherboard.dpchknum eq null }">
												<img src="../../resources/uploads/kmj/missing${otherboard.img }" width="100%"/>
											</c:when>
											<c:otherwise>
												<img src="${otherboard.img }" width="100%" onerror="deleteBoard(${otherboard.no });" />
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<img src="../../resources/images/kmj/missing/noimage.png" width="100%"/>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="contents_container">
								<table>
									<tr>
										<td><strong>${otherboard.title }</strong></td>
									</tr>
									<tr>
										<td>${otherboard.name} / ${otherboard.breed } / ${otherboard.gender } / ${otherboard.age }</td>
									</tr>
									<tr>
										<td>${otherboard.location }</td>
									</tr>
									<tr>
										<td>실종일 : ${otherboard.missingdateWithoutTime }</td>
									</tr>
								</table>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
</body>
</html>