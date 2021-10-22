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
	margin-top: 100px;
	padding: 10px;
	border: 2px solid gray;
	width: 30%;
}

body {
	padding: 0;
	margin: 0;
}

div {
	box-sizing: border-box;
}

/* alert badge */
.circle {
	display: inline-block;
	width: 5px;
	height: 5px;
	border-radius: 2.5px;
	background-color: #ff0000;
	position: absolute;
	top: -5px;
	left: 110%;
}

/* 녹색 텍스트 */
.green {
	color: #24855b;
}

.wrap {
	background-color: #F8F8F8;
}
/* 녹색배경 */
.greenContainer {
	height: 132px;
	background-color: #24855b;
	display: flex;
	align-items: flex-end;
	padding: 16px;
}

.greenContainer .name {
	font-size: 20px;
	font-weight: bold;
	color: #ffffff;
}

.greenContainer .modify {
	margin-left: auto;
}

/* 단골상점 , 상품후기 , 적립금 박스 */
.summaryContainer {
	background-color: white;
	display: flex;
	padding: 21px 16px;
	height: 90px;
	margin-bottom: 10px;
}
/* 단골상점 , 상품후기 , 적립금 */
.summaryContainer .item {
	flex-grow: 1
}
/* 녹색 숫자 */
.summaryContainer .number {
	font-size: 19px;
	font-weight: bold;
	color: #24855b;
}
/* 텍스트 */
.summaryContainer .item>div:nth-child(2) {
	font-size: 13px;
}

/* ================== 주문/배송조회 박스 시작 ==================== */
.shippingStatusContainer {
	padding: 21px 16px;
	background-color: white;
	margin-bottom: 10px;
}

/* 주문/배송조회 타이틀 */
.shippingStatusContainer .title {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.shippingStatusContainer .status {
	display: flex;
	justify-content: space-between;
	margin-bottom: 21px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.shippingStatusContainer .item {
	display: flex;
}

.shippingStatusContainer .number {
	font-size: 31px;
	font-weight: 500;
	text-align: center;
}

.shippingStatusContainer .text {
	font-size: 12px;
	font-weight: normal;
	color: #c2c2c2;
	text-align: center;
}

.shippingStatusContainer .icon {
	display: flex;
	align-items: center;
	padding: 20px;
	width: 16px;
	height: 16px;
}

/*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
.listContainer {
	padding: 0;
	background-color: #ffffff;
	margin-bottom: 10px;
}

.listContainer .item {
	display: flex;
	align-items: center;
	padding: 16px;
	color: black;
	text-decoration: none;
	height: 56px;
	box-sizing: border-box;
}

.listContainer .icon {
	margin-right: 14px;
}

.listContainer .text {
	font-size: 16px;
	position: relative;
}

.listContainer .right {
	margin-left: auto;
}

/*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
.listContainer .smallLight {
	font-size: 14px;
	color: #c2c2c2;
}

.listContainer .smallLight>span {
	margin-left: 10px;
}

.listContainer .right .blct {
	font-size: 14px;
	font-weight: bold;
	margin-right: 5px;
}

/* 공지사항 이용안내 고객센터 */
.infoContainer {
	background-color: white;
	display: flex;
	height: 100px;
	margin-bottom: 10px;
}

.infoContainer .item {
	flex-grow: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	font-size: 13px;
	text-decoration: none;
	color: black;
}

.infoContainer .item>div:first-child {
	margin-bottom: 2px;
}

/*  */
.listContainer .item:hover {
	/*   background-color: #f8f8f8; */
	
}

.infoContainer .item:hover {
	/*   background-color: #f8f8f8; */
	
}
</style>
</head>
<body>

	<jsp:include page="../template.jsp"></jsp:include>

	<div class="container">
		<div class="wrap">
			<div class="greenContainer">
				<div>
					<div class="grade">GOLD</div>
					<div class="name">${loginSession.userid }</div>
				</div>
				<div class="modify">i</div>
			</div>
			
			<div class="summaryContainer">
				<div class="item">
					<div class="number">이름</div>
					<div>${loginSession.name }</div>
				</div>
				<div class="item">
					<div class="number">이메일</div>
					<div>${loginSession.email }</div>
				</div>
				<div class="item">
					<div class="number">전화번호</div>
					<div>${loginSession.phone }</div>
				</div>
				<div class="item">
					<div class="number">가입일</div>
					<div>${loginSession.regdate }</div>
				</div>
				
			</div>
			
			<div class="shippingStatusContainer">
				<div class="title">작성글 / 댓글조회</div>
				<div class="status">

					<div class="item">
						<div>
							<div class="green number">6</div>
							<div class="text">작성글</div>
						</div>
						<div class="icon">></div>
					</div>
					<div class="item">
						<div>
							<div class="green number">3</div>
							<div class="text">내 댓글</div>
						</div>
						<div class="icon">></div>
					</div>
					<div class="item">
						<div>
							<div class="green number">GOLD</div>
							<div class="text">회원 등급</div>
						</div>
						<div class="icon">></div>
					</div>
					<div class="item">
						<div>
							<div class="green number">1</div>
							<div class="text">신고 목록</div>
						</div>
						<div class="icon">></div>
					</div>
				</div>
			</div>
			
			<div class="listContainer">
				<a href="#" class="item">
					<div class="icon">ii</div>
					<div class="text">
						<span>내지갑</span> <span class="smallLight"> <span>|</span> <span>적립
								포인트</span>
						</span>
					</div>
					<div class="right">
						<span class="blct">170</span> >
					</div>
				</a> <a href="#" class="item">
					<div class="icon">ii</div>
					<div class="text">포인트 내역</div>
					<div class="right">></div>
				</a> <a href="#" class="item">
					<div class="icon">ii</div>
					<div class="text">설정</div>
					<div class="right">></div>
				</a>
			</div>
			
			
			
			<div class="listContainer">
				<a href="/member/infoupdate" class="item">
					<div class="icon">ii</div>
					<div class="text">
						회원정보 변경<span class="circle"></span>
					</div>
					<div class="right">></div>
				</a> 
				<a href="/member/passwordupdate" class="item">
					<div class="icon">ii</div>
					<div class="text">비밀번호 변경</div>
					<div class="right">></div>
				</a>
				<a href="/member/emailupdate" class="item">
					<div class="icon">ii</div>
					<div class="text">이메일 주소 변경</div>
					<div class="right">></div>
				</a> 
				<a href="/member/deleteAccount" class="item">
					<div class="icon">ii</div>
					<div class="text">회원정보 삭제</div>
					<div class="right">></div>
				</a>
			</div>
			
			<div class="infoContainer">
				<a href="#" class="item">
					<div>icon</div>
					<div>공지사항</div>
				</a> <a href="#" class="item">
					<div>icos</div>
					<div>이용안내</div>
				</a> <a href="#" class="item">
					<div>icon</div>
					<div>고객센터</div>
				</a>
			</div>
		</div>
	</div>

		<%-- <div id="info">
			<h2>${loginSession.userid }님의 마이 페이지</h2>
			<hr />
			<!-- 	회원가입시 저장된 정보 불러오기 성공 -> hide -->
			<%-- 	<div>${memberInfo }</div> --%>
			<%-- 	<div>userid : ${memberInfo.userid }</div> --%>
			<%-- 	<div>password : ${memberInfo.password }</div> --%>
			<%-- 	<div>name : ${memberInfo.name }</div> --%>
			<%-- 	<div>email : ${memberInfo.email }</div> --%>
			<%-- 	<div>phone : ${memberInfo.phone }</div> --%>
			<br />--%>

			 <%--	<div id='loginsession'> login_session : ${loginSession} </div> 
			<div>login_session_userid : ${loginSession.userid }</div>
			<div>login_session_password : ${loginSession.password }</div>
			<div>login_session_name : ${loginSession.name }</div>
			<div>login_session_email : ${loginSession.email }</div>
			<div>login_session_phone : ${loginSession.phone }</div>
		</div>--%>
</body>
</html>