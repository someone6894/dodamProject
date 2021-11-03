<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
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
	
	#moreList {
		background-color: #e9e7ea;
		margin-top: 20px;
  		margin-bottom: 10px;
		width: 60px;
		height: 30px;
		float: right;
		cursor:pointer;
		border: 1px solid black;
		border-radius: 4px;
		text-align: center;
		padding-top:6px;
	}

</style>
<body>
	<div class="container" id="miss" style="font-family: 'Gowun Dodum', sans-serif;">
		<div><h2 style="display: inline-block;"><strong>찾고있는 동물들</strong></h2><div id="moreList" style="float:right;" onclick="location.href='/board/missing/list'">더보기</div></div>
				<c:forEach var="otherboard" items="${otherList }">
					<a href="/board/missing/detail?no=${otherboard.no}&userid=${loginSession.userid}" class="detailAnchor">
						<div class="col-sm-3" style="height: 355px;">
							<div class="img_Reccontainer" style="padding: 20px 10px;">
								<c:choose>
									<c:when test="${otherboard.img != ''}">
										<c:choose>
											<c:when test="${otherboard.dpchknum eq null }">
												<img src="../../resources/uploads/kmj/missing${otherboard.img }" width="100%"/>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${otherboard.img eq ''}">
														<img src="../../resources/images/kmj/missing/noimage.png" width="100%"/>
													</c:when>
													<c:otherwise>
														<img src="${otherboard.img }" width="100%" onerror="deleteBoard(${otherboard.no });" />
													</c:otherwise>
												</c:choose>
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