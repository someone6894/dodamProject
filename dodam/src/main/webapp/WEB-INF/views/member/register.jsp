<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../../resources/assets/missing/assets/img/brand/favicon.png" type="image/png">
<title>마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>

$(function() {
	
	$("#email").keyup( function(){
		let email = $(this).val();
		emailCheck(email);
		});
	
	// 아이디 중복 확인 검사 예외처리
	let status = "${status}";
	if (status == "dupliacted") {
		alert("이미 가입된 아이디 입니다. \n다시 입력해주세요.");
	} else if (status == "canUsed"){
		//alert("사용가능한 아이디 입니다.");
		document.getElementById("iderror").innerHTML = "사용가능한 아이디 입니다.";
		$("#userid").val("${userid}");
		$("#userid").focus();
		
		//$("#userid").val(${userid});
		//var userid = $("#userid").val();
		
		// 보류 : 중복확인시 페이지 이동이 있어서 값입력이 안됨. 
		// setCookie(변수이름, 변수값, 기간);
		//setCookie("userid", userid, 1);
		
		// getCookie(변수이름)
		//var useridCookie = getCookie("userid");
		//console.log("쿠키 useridCookie 변수에 저장된 값: "+useridCookie);
		//$("#userid").val(useridCookie);
	}
	
	
	
	// 유저가 입력한 아이디 중복검사후 아이디칸에 유저가 입련한 아이디값 자동입력을 위한 쿠키
		var setCookie = function(name, value, exp) {
		var date = new Date();
		date.setTime(date.getTime() + exp*24*60*60*1000);
		document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
		};
		
	// 쿠키 가져오기 
		var getCookie = function(name) {
			var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
			return value? value[2] : null;
			};
		
	$("#userid").keyup( function(){
		let userid = $(this).val();
		idCheck(userid);
	});
	
	$("#password").keyup( function(){
		let password = $("#password").val();
		pwdCheck1(password)
	});
	
	
	$("#password2").keyup( function(){
		let password = $("#password").val();
		let password2 = $("#password2").val();
		pwdCheck2(password, password2)
	});
	
	$("#phone").keyup( function(){
		let phone = $(this).val();
		phoneCheck(phone);
	});
	
	$("#email").keyup( function(){
		let email = $(this).val();
		emailCheck(email);
	});
	
	
});

// 아이디 중복확인 검사
function checkDuplicatedId(){
	let userid = document.getElementById("userid").value.toLowerCase();
	console.log(userid);
	
	if ( idCheck(userid) == true ){
		location.href='checkDuplicatedId?userid=' + userid;
	} else if (idCheck(userid) == false ){
		alert("아이디는 6자 이상 12자 이하로 입력해주세요.");
	}
	
	console.log(${userid});
	$("#userid").val(${userid});
	
}



function idCheck(userid) {
    
    if(userid.length >= 6 && userid.length <= 12){
    	document.getElementById("iderror").innerHTML ="";
    	return true;
    }
    
    if (userid == "") {
        document.getElementById("iderror").innerHTML = "아이디는 필수 항목입니다.";
		return false;
    } else if (userid.length < 6 || userid.length > 12) {
        document.getElementById("iderror").innerHTML = "아이디는 6자 이상 12자 이하로 입력해주세요.";
        return false;
    } 
    
}


// 비밀번호 유효성 검사
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





//이메일체크
function emailCheck(email) {
  let result = false;
  if (email.length > 0) {
      let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		console.log(email);
      if (email.match(regExp) != null) {
          // 이메일 주소 형식이다.
          result = true;
          document.getElementById("emailerror").innerHTML = "";
          $('#confirmEmail').show();
          
          
      } else {
          document.getElementById("emailerror").innerHTML = "이메일 주소 형식이 아닙니다";
      }
  } else {
	  document.getElementById("emailerror").innerHTML = "이메일을 입력해주세요.";
  }

  return result;
}



function sendMailCode () {
	 
	let inputEmail = $("#email").val();
	console.log("email2 : " + inputEmail);
	
// 	let url = "sendMail.do";
	let url = "mailCheck.do";
	$.ajax({
		url : url, // ajax와 통신 할 곳
		data : {email : inputEmail},  // 서블릿에 보낼 데이터
		dataType : "text", // 수신될 데이터의 타입
		type : "get", // 통신 방식
		success : function (data) { // 통신 성공시 수행될 콜백 함수
			console.log("받아온 data : " + data);
		
			if(data == "success"){
				alert("메일 발송 완료");
			} else if (data == "fail") {
				alert("메일 발송 실패\r\n 잠시 후 다시 시도 해 보세요");
			}
			
			}, error : function() { // 통신 실패시 수행될 콜백 함수
			
		}
	});
}

let emailCheckBoolean = false;
function confirmEmailCode(){
//		let codeInSession = '${sessionScope.confirmCode}'; // 이렇게하면 코드 노출돼서 안됨

	let userCode = $("#emailConfrimCode").val();
	let url = 'getConfirmCode.do';
	$.ajax({
		url : url, // ajax와 통신 할 곳
		data : {userCode : userCode},  // 서블릿에 보낼 데이터
		dataType : "text", // 수신될 데이터의 타입
		type : "get", // 통신 방식
		success : function (data) { // 통신 성공시 수행될 콜백 함수
			console.log("data : " + data);
			console.log("$('#emailConfrimCode').val() : " + $("#emailConfrimCode").val());
			if(data == $("#emailConfrimCode").val() ){
				$("#emailError").html("이메일 인증에 성공했습니다");
				console.log("이메일 인증에 성공했습니다");
				 emailCheckBoolean = true;
				$("#email").attr("readonly","readonly");
			} else if( data == "fail" ){
				$("#emailError").html("이메일 인증에 실패했습니다");
				console.log("이메일 인증에 실패했습니다");
			}
			
		}, error : function() { // 통신 실패시 수행될 콜백 함수

			
		}
		
	});
	
}






//전체 유효성 검사, 전체가 다 유효성검사 통과되야 submit되게
function validate() {
    let isCheckOk = false; 
//     let isCheckOk = true; 
    
	
    let userid = document.getElementById("userid").value.toLowerCase();
    let idCheckResult = idCheck(userid);
    
    console.log(userid);
    console.log(idCheckResult);
    
    let password = document.getElementById("password").value;
    let password2 = document.getElementById("password2").value;
    let pwdCheckResult1 = pwdCheck1(password);
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
    
    
    if (idCheckResult && pwdCheckResult1 &&pwdCheckResult2 && nameCheckResult && nicknameCheckResult && phoneCheckResult && emailCheckBoolean ) {
    		
    	isCheckOk  = true;
    	console.log("everthing's checked ok!");
    	alert("도담의 회원으로 가입을 축하드립니다!");
    		
    } else {
    	console.log("Checking's not finished.");
    	alert("정보 입력을 완료해주세요.");
    }
    
    return isCheckOk;
}

</script>
<style>
#register {
	width: 500px;
/* 	margin-top: 10px; */
/* 	margin-left: 500px; */
	margin : 0 auto;
	margin-top: 100px;
	margin-bottom: 100px;
	padding: 30px;
	padding-top: 10px;
 	border: 2px solid gray;
/* 	background-color:silver; */
}

.error {
	color: red;
	font-size: 15px;
}
</style>


</head>
<body>

	<jsp:include page="../template.jsp"></jsp:include>

	<div class="container" id='register' style="width: 500px;">
		<h3 style='text-align:center;'>회 원 가 입</h3> <hr/>
		<h6 style="color: red">* 필수항목</h6>
		<form action="registerMember.do" method="POST">
			<div class="form-group">
				<label for="userid">*아이디:</label> <button type="button" class="btn" style='width:30%; float:right'
				onclick="checkDuplicatedId();">아이디 중복확인</button>
				<input type="text"
					class="form-control" id="userid" placeholder="Enter ID"
					name="userid"  style='width:60%;'> <span id="iderror" class="error"></span> 
					
			</div> 

			<div class="form-group">
				<label for="password">*비밀번호 :</label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password"><span id="pwderror" class="error"></span>
			</div>

			<div class="form-group">
				<label for="password2">*비밀번호 확인 :</label> <input type="password"
					class="form-control" id="password2" placeholder="Enter password">
			</div>

			<div class="form-group">
				<label for="name">*이름 :</label> <input type="text"
					class="form-control" id="name" placeholder="Enter Name" name="name"><span
					id="nameerror" class="error"></span>
			</div>
			
			<div class="form-group">
				<label for="nickname">별명 :</label> <input type="text"
					class="form-control" id="nickname" placeholder="Enter NickName" name="nickname"><span
					id="nicknameerror" class="error"></span>
			</div>

			<div class="form-group">
				<label for="phone">*휴대폰 번호 :</label> <input type="text"
					class="form-control" id="phone" placeholder="Enter phone number"
					name="phone"><span id="phoneerror" class="error"></span>
			</div>

			<div class="form-group">
				<label for="email">*이메일 :</label> <input type=text
					class="form-control" id="email" placeholder="Enter email"
					name="email"><span id="emailerror" class="error"></span>

				<div id="confirmEmail" style="display: none">
					<br />
					<button type="button" class="btn btn-info" id="sendMail"
						onclick="sendMailCode();">코드 전송</button>
					<input type="text" class="form-control" id="emailConfrimCode"
						placeholder="전송된 코드를 쓰세요" style="width: 300px;"
						name="emailConfrimCode">
					<button type="button" class="btn btn-info" id="confirmBtn"
						onclick="confirmEmailCode();">확인</button>
					<div id="emailError" class="error"></div>
				</div>
			</div>


			<!-- 			<button type="button" class="btn btn-default" id="checkInfo" -->
			<!-- 				onclick="validate();">확인</button> -->
			<button type="submit" class="btn btn-primary btn-block"
				onclick="return validate();">회원가입</button>
			<!--  버튼 색 : success or primary  -->
		</form>
	</div>
	<br>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>