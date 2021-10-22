<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		
		if($("#pwForm").submit(function(){
			if($("#password").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#password").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#password").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#password").val("").focus();
				return false;
			}else if($.trim($("#password").val()) !== $("#password").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
			
		}));
	})
</script>
</head>
<body>

	<jsp:include page="../template.jsp"></jsp:include>

	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h1>비밀번호 변경</h1>
			</div>
			<div>
				<br />
				<form id="pwForm" action="/member/passwordupdatecomp" method="post">
					<p>
						<label>아이디 <em style="color:red"> *</em></label> <input class="w3-input" type="text" id="userid"
							name="userid" style="background-color:#e9e9e9" value="${loginSession.userid }" readonly>
					</p>
					<p>
						<label><em style="color:red">* </em>현재 비밀번호</label> <input class="w3-input" id="oldpw"
							type="password" required>
					</p>
					<p>
						<label><em style="color:red">* </em>새 비밀번호</label> <input class="w3-input" id="password"
							name="password" type="password" required>
					</p>
					<p>
						<label><em style="color:red">* </em>새 비밀번호 확인</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호
							변경</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>