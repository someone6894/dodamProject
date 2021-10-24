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
	margin-top: 10px;
	padding: 20px;
	border: 3px solid gray;
}


</style>
<script>


window.onload = function() {
	let status = "${status}";

	if (status == "findSuccess") {
		alert("입력하신 이메일에 회원정보가 발송되었습니다.");
	}
	if (status == "findFail") {
		alert("입력하신 이메일로 등록된 회원정보가 없습니다. \n다시 입력해주세요.");
	}
	
	
};


	function scanId(){
		
		location.href='board/member/scanId';
		
	}
	
	function scanPwd(){
		
		location.href='board/member/scanPwd';
		
	}
</script>

<body>

	<jsp:include page="../template.jsp"></jsp:include>
	<br>
	<br>
	<div class='container' style='width: 40%; margin: 0 auto; padding-left: 200px;'>
	<h1>이메일 주소로 계정 찾기</h1>
	<p>회원정보에 등록된 메일 주소로 아이디/비밀번호를 알려드립니다. <br>메일 주소를 입력하고 "ID/PW 찾기" 버튼을 클릭해 주세요.<br /></p>
		<form action="findAccount.do" method="post" >
		<div>
			<input type="email" name="email" required placeholder="이메일 주소" title="이메일 주소" /><br /><br />
			<input type="submit" class="btn" value="ID/PW 찾기" />
		</div>
		</form>
	</div>
	
	
<!-- 	<button class="btn" onclick='scanId' style='float:left'> 아이디 찾기 </button> -->
<!-- 	<button class="btn" onclick='scanPwd' style='float:left; margin-left:10px;'> 비밀번호 찾기 </button> -->
<!-- 	<br> -->

</body>
</html>