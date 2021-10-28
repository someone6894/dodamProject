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
				<h1>이메일 주소 변경</h1>
			</div>
			<div>
				<br />
				<form id="pwForm" action="/member/.." method="post">

					<h1>이메일 주소 변경</h1>
					<p>사용하는 이메일 주소를 변경할 수 있습니다.</p>
					<input type="email" id="email_address" name="email_address"
						placeholder="이메일 주소" title="이메일 주소"> <input type="submit"
						value="신규 메일 주소로 인증 메일 발송" class="btn btn-inverse">
				</form>
			</div>
		</div>
	</div>

</body>
</html>