<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>도담도담 관리자페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon"
	href="../resources/assets/missing/assets/img/brand/favicon.png"
	type="image/png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/1e6f7f51eb.js"
	crossorigin="anonymous"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 750px;
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

.sidenav>ul>li>a {
	font-size: 20px;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

#userInfo {
	display: none;
	background-color: #ffffff;
	margin-left: 100px;
	border: 1px solid blue;
	border-radius: 10px;
	padding : 50px;
	position: absolute;
	top : 15px;
	left: 15%;
	z-index: 999;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
<script>
	$(function () {
		let url = "/admin/getGrade";
	});
	
	function pwdCheck1(password) {
	    // 검증 ok : true, 검증 실패 : false 
	    let result = false; 
	    if (password == "") {
	        document.getElementById("pwderror").innerHTML = "비밀번호는 필수 항목입니다.";
	    } else if (password.length < 8 || password.length > 12) {
	        document.getElementById("pwderror").innerHTML = "비밀번호는 8자 이상 12자 이하로 입력해 주세요";
	    }
	}
	    
	// 비밀번호 확인 검사
	function pwdCheck2(password, password2) {
	    // 검증 ok : true, 검증 실패 : false 
	    let result = false; 
	    if (password == "") {
	        document.getElementById("pwderror").innerHTML = "비밀번호는 필수 항목입니다.";
	    } else if (password.length < 8 || password.length > 12) {
	        document.getElementById("pwderror").innerHTML = "비밀번호는 8자 이상 12자 이하로 입력해 주세요";
	    } else if (password != password2) {
	        document.getElementById("pwderror").innerHTML = "비밀번호가 서로 맞지 않습니다.";
	    } else if (password == password2){
	    	document.getElementById("pwderror").innerHTML ="비밀번호가 서로 일치 합니다.";
	        result = true;
	    }
	    
	    return result;
	}
	//이름 필수 체크
	function nameCheck(name) {
	    let result = false;
	    if (name == "") {
	        document.getElementById("nameerror").innerHTML = "이름은 필수 입니다.";
	    } else {
	        document.getElementById("nameerror").innerHTML = "";
	        result = true;
	    }
	    return result;
	}
	
	// 별명 필수 체크
	function nicknameCheck(nickname) {
		console.log("nickname : " + nickname);
	    let result = false;
	    if (nickname == "") {
	        document.getElementById("nicknameerror").innerHTML = "별명을 입력해주세요.";
	    } else {
	        document.getElementById("nicknameerror").innerHTML = "";
	        result = true;
	    }
	    return result;
	}
	//전화번호체크
	function phoneCheck(phone) {
		console.log("phone : "+ phone);
	    let result = false;
	    if (phone.length > 0) {
	        let regExp = /^\d{3}-\d{3,4}-\d{4}$/;
	        console.log("regExp : " + regExp);
	        if (phone.match(regExp) != null) {
	            // 전화번호 형식
	            result = true;
	            document.getElementById("phoneerror").innerHTML = "";
	        } else if (phone.match(regExp) == null){
	            document.getElementById("phoneerror").innerHTML = "휴대폰 번호 형식이 아닙니다. 010-0000-0000";
	            document.getElementById("phone").focus();
	        }
		console.log("phone.match(regExp) : " + phone.match(regExp));
	    } else {
	    	document.getElementById("phoneerror").innerHTML = "휴대폰 번호를 입력해주세요.";
	    }
	    
	    
	    
		console.log("phone_result : " + result);
	    return result;
	}
	
	// 개인정보수정 div숨기기
	function hideDiv() {
		$("#userInfo").fadeOut(500);
	}
	
	// 개인정보수정 div보이기
	function showDiv(obj) {
		console.log(obj.innerHTML);
		let userid = obj.innerHTML;
		let url = "/admin/getMemberInfo";
		
		$.ajax({
			url : url, // ajax와 통신 할 곳
			data : {userid : userid}, // 서블릿에 보낼 데이터
			dataType : "json", // 수신될 데이터의 타입
			type : "post", // 통신 방식
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				console.log(data);
				$("#userid").val(data.userid);
				$("#name").val(data.name);
				$("#phone").val(data.phone);
				$("#email").val(data.email);
				
				$("#userInfo").fadeIn(500);
			}
		});	
		
	}
	
	//전체 유효성 검사, 전체가 다 유효성검사 통과되야 submit되게
	function validate() {
	    let isCheckOk = false; 
	    
	    let password = document.getElementById("password").value;
	    let password2 = document.getElementById("password2").value;
	    let pwdCheckResult2 = pwdCheck2(password, password2);
	
	    let name = document.getElementById("name").value;
	    let nameCheckResult = nameCheck(name);
	    if (nameCheckResult) {
	        name = name.replace(/\s/gi, ""); 
	    }
	    
	    let nickname = document.getElementById("nickname").value;
	    let nicknameCheckResult = nicknameCheck(nickname);
	    if (nicknameCheckResult) {
	        nickname = nickname.replace(/\s/gi, ""); 
	    }
	    
	    let phone = document.getElementById("phone").value;
	    let phoneCheckResult = phoneCheck(phone);
	    console.log("phoneCheckResult : " + phoneCheckResult);
	    
		console.log("emailCheckBoolean : " + emailCheckBoolean);
	    
	    
	    if (pwdCheckResult2 && nameCheckResult && phoneCheckResult) {
	    		
	    	isCheckOk  = true;
	    	console.log("everthing's checked ok!");
	    		
	    } else {
	    	console.log("Checking's not finished.");
	    	alert("정보 입력을 완료해주세요.");
	    }
	    
	    return isCheckOk;
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<h2 style="text-align: center;">
					<a href="/"><img
						src="../resources/images/kmj/admin/dodamlogo.png" width="250px" /></a>
				</h2>
				<ul class="nav nav-pills nav-stacked">
					<!-- <li><a href="/admin/adminhome"><i class="fas fa-user-cog"></i>&nbsp;&nbsp;관리자페이지
							메인</a></li> -->
					<li class="active"><a href="/admin/members"><i
							class="fas fa-user-friends"></i>&nbsp;&nbsp;회원관리</a></li>
					<li><a href="/admin/board"><i class="fas fa-chalkboard"></i>&nbsp;&nbsp;게시판
							관리</a></li>
					<li><a href="/admin/comment"><i class="far fa-comment"></i>&nbsp;&nbsp;&nbsp;댓글관리</a></li>
					<li>------------------------------------------------</li>
					<li><a href="/"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;나가기</a></li>
				</ul>
				<br>
			</div>
			<div class="col-sm-9" style="margin: 20px;">
				<h2>회원관리</h2>
				<p>
					총 회원 : ${totalPost }명
				</p>
				<div style="padding: 0 50px; height: 450px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>등급</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>가입일</th>
							</tr>
						</thead>
						<tbody id="memTable">
							<c:forEach var="member" items="${memList}">
								<tr>
									<td onclick="showDiv(this);" style="text-weight: bold; color: red; cursor: pointer;">${member.userid }</td>
									<td>${member.name }</td>
									<td id="${member.userid }"></td>
									<td>${member.phone }</td>
									<td>${member.email }</td>
									<td>${member.regdate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="padding: 0 50px; text-align: right;">
					    <ul class="pagination">
					    	<c:forEach var="i" begin="${pagingInfo.startPageNoOfBlock }" end="${pagingInfo.endPageNoOfBlock }">
					      		<li><a href="/admin/members?pageNo=${i }">${i }</a></li>
					      	</c:forEach>
					    </ul>
				</div>
			</div>
			<div class="col-sm-7" id="userInfo">
				<h3 style="font-weight: bold;">개인 정보 변경</h3>
					<form action="registerMember.do" method="POST">
					<div class="form-group">
						<label for="userid">아이디:</label>
						<input type="text"
							class="form-control" id="userid" placeholder="Enter ID"
							name="userid" readonly> <span id="iderror" class="error"></span> 
					</div>
					<div class="form-group">
						<label for="email">이메일 :</label> <input type="text"
							class="form-control" id="email" placeholder="Enter email"
							name="email" readonly>
					</div> 		
					<div class="form-group">
						<label for="password">기존 비밀번호 :</label> <input type="password"
							class="form-control" id="password" placeholder="Enter password"
							name="password"><span id="pwderror" class="error"></span>
					</div>
					<div class="form-group">
						<label for="password2">새 비밀번호 :</label> <input type="password"
							class="form-control" id="password2" placeholder="Enter password">
					</div>
					<div class="form-group">
						<label for="password2">비밀번호 확인 :</label> <input type="password"
							class="form-control" id="password2" placeholder="Enter password">
					</div>
					<div class="form-group">
						<label for="name">이름 :</label> <input type="text"
								class="form-control" id="name" placeholder="Enter Name" name="name"><span
							id="nameerror" class="error"></span>
					</div>
					<div class="form-group">
							<label for="phone">휴대폰 번호 :</label> <input type="text"
						class="form-control" id="phone" placeholder="Enter phone number"
							name="phone"><span id="phoneerror" class="error"></span>
					</div>
					<div style="text-align: center;">
						<button type="button" class="btn btn-primary"
						onclick="return validate();">회원정보수정</button>
						<button type="button" class="btn btn-default" onclick="hideDiv();">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>