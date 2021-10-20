<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dodam Dodam</title>
<script>
	window.onload = function() {
		let status = "${status}";

		if (status == "success") {
			alert("도담에 오신걸 환영합니다!");
		} else if (status == "fail") {
			alert("회원가입에 실패하셨습니다. \n 잠시후 다시 입력해주세요.");
		}
		
		// phs : login test check 
		// 2021.10.20 test success. -> hide
// 		if (status == "logingsuccess") {
// 			alert("로그인 성공!");
			
// 		} else if (status == "logingfail") {
// 			alert("로그인 실패. \n 아이디와 비밀번호를 다시 확인해주세요.");
// 		}
		

	};
</script>
<style>
#info {
	margin-left: 200px;
	margin-top : 100px;
	padding : 10px;
	border : 2px solid gray;
	width : 30%;
}


</style>
</head>
<body>

	<jsp:include page="../template.jsp"></jsp:include>
	<div id="info"><h2>${loginSession.userid } 님의 마이 페이지</h2>
	<hr />
<!-- 	회원가입시 저장된 정보 불러오기 성공 -> hide -->
<%-- 	<div>${memberInfo }</div> --%>
<%-- 	<div>userid : ${memberInfo.userid }</div> --%>
<%-- 	<div>password : ${memberInfo.password }</div> --%>
<%-- 	<div>name : ${memberInfo.name }</div> --%>
<%-- 	<div>email : ${memberInfo.email }</div> --%>
<%-- 	<div>phone : ${memberInfo.phone }</div> --%>
	<br/>
	
<%-- 	<div id='loginsession'> login_session : ${loginSession} </div> --%>
	<div>login_session_userid : ${loginSession.userid }</div>
	<div>login_session_password : ${loginSession.password }</div>
	<div>login_session_name : ${loginSession.name }</div>
	<div>login_session_email : ${loginSession.email }</div>
	<div>login_session_phone : ${loginSession.phone }</div>
	</div>
</body>
</html>