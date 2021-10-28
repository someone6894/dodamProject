<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../../resources/assets/missing/assets/img/brand/favicon.png" type="image/png">
<title>마이페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

	<jsp:include page="../template.jsp"></jsp:include>

	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h1 style="border-bottom: 1px solid #ccc">회원정보 조회/수정</h1>
			</div>
			<div>
				<br />

				<form id="myForm" action="/member/infoupdatecomp" method="post">
					<p>
						<label>아이디 <em style="color:red"> *</em></label> <input class="w3-input" type="text" id="userid"
							name="userid" style="background-color:#e9e9e9" value="${loginSession.userid }" readonly>
					</p>
					<p>
						<label><em style="color:red">* </em>이메일</label> <input class="w3-input" type="text" id="email"
							name="email" value="${loginSession.email }" >
					</p>
					<p>
						<label><em style="color:red">* </em>전화번호</label> <input class="w3-input" type="text" id="phone"
							name="phone" value="${loginSession.phone }" >
					</p>
					<p>
						<label><em style="color:red">* </em>이름</label> <input class="w3-input" type="text" id="name"
							name="name" value="${loginSession.name }" >
					</p>
					
					<input type="hidden" id = "regdate" name="regdate" value="${ loginSession.regdate }">
					
					<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보
							변경</button>
					</p>
					
					
				</form>

			</div>
		</div>
	</div>
</body>
</html>