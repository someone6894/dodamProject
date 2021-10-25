<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dodam Dodam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<style>

#login {
	width: 300px;
/* 	margin-top: 10px; */
/* 	margin-left: 500px; */
	margin : 0 auto;
	margin-top: 100px;
	padding: 30px;
	margin-bottom: 100px;
 	border: 2px solid gray;
}


</style>
<script>

	window.onload = function() {
		let status = "${status}";
	
		if (status == "logingfail") {
			alert("로그인에 실패하셨습니다. \n아이디와 비밀번호를 다시 입력해주세요.");
		}
		
	};

	function scanMember(){
	
	location.href='scanMember';
	
	}

</script>

<body>

	<jsp:include page="../template.jsp"></jsp:include>

	<div class="container" id='login' style="width: 500px;">
<!-- 		<h3>로그인</h3> -->
		<form action="login.do" method="POST">
			<div class="form-group">
				<label for="userid">아이디:</label> <input type="text"
					class="form-control" id="userid" placeholder="Enter ID"
					name="userid"> <span id="iderror" class="error"></span>
			</div>

			<div class="form-group">
				<label for="password">비밀번호 :</label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password"><span id="pwderror" class="error"></span>
			</div>

			<button type="submit" class="btn btn-primary btn-block">로그인</button>
		</form>
		
		</br>
			<button class="btn btn-default btn-block" onclick='scanMember()' > 아이디 / 비밀번호 찾기 </button>
	</div>
	<br>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>