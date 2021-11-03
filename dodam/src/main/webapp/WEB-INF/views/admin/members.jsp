<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	height: 800px;
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
	margin-left: 100px;
	border: 1px solid #337ab7;
	border-radius: 10px;
	padding: 50px;
	position: absolute;
	top: 15%;
	left: 15%;
	z-index: 999;
	background-color: #ffffff;
}

#changePwd {
	display: none;
	margin-left: 100px;
	border: 1px solid #337ab7;
	border-radius: 10px;
	padding: 50px;
	position: absolute;
	top: 20%;
	left: 30%;
	z-index: 999;
	background-color: #ffffff;	
}

.error {
	color: red;
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
let pwdOriginalCheck = false;
	$(function () {		
		if ("${param.userid}" != "") {
			let userid = "${param.userid}";
			alert("정보수정완료!");
			ajaxUserInfo(userid);
		}
		
		
		$("#originalPwd").keyup(function() {
			let originalPwd = $("#originalPwd").val();
			let userid = $("#useridPwd").val();
			
			if (originalPwd.length == 0) {
				$("#pwdCheck").html("기존 비밀번호를 입력해주세요");
				pwdOriginalCheck = false;
			} else {
				let url = "/admin/pwdCheck";
				
				$.ajax({
					url : url, // ajax와 통신 할 곳
					data : {userid : userid, password : originalPwd}, // 서블릿에 보낼 데이터
					dataType : "text", // 수신될 데이터의 타입
					type : "post", // 통신 방식
					success : function(data) { // 통신 성공시 수행될 콜백 함수
						console.log(data);
						if (data == "exist") {
							$("#pwdOk").html("V 비밀번호 체크 완료! 새 비밀번호를 입력해주세요.");
							$("#pwdOk").show();
							$("#pwdCheck").hide();
							$("#newPwd").focus();
							
							pwdOriginalCheck = true;
						} else if (data == "none") {
							$("#pwdCheck").html("비밀번호가 틀렸습니다. 다시 입력해주세요.");
							$("#pwdOk").hide();
							$("#pwdCheck").show();
							$("#originalPwd").focus();
							
							pwdOriginalCheck = false;
						}
					}
				});	
			}
			
		});
		
		$("#search").keyup(function () {
			searchId(1);
		});
		
	});
	
	function searchId(pageNo) {
		let searchId = $("#search").val();
		console.log(searchId);
		
		let url = "/admin/searchId";
		
		$.ajax({
			url : url, // ajax와 통신 할 곳
			data : {pageNo : pageNo, searchId : searchId}, // 서블릿에 보낼 데이터
			dataType : "json", // 수신될 데이터의 타입
			type : "post", // 통신 방식
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				console.log(data);
				let output = '';
				let result = data.searchResult;
				console.log(result);
				if(result.length == 0) {
					output += '<div style="margin: 60px; font-size: 20px;">검색결과가 없습니다.</div>';
				} else {
					output += '<table class="table table-hover"><thead><tr><th>아이디</th><th>이름</th>	<th>등급</th>';
					output += '<th>전화번호</th><th>이메일</th><th>가입일</th><th>비밀번호 변경</th><th>회원 삭제</th></tr></thead>';
					output += '<tbody id="memTable">';
					for(let i in result) {
						output += '<tr><td onclick="showDiv(this);"	style="text-weight: bold; color: #de6972; cursor: pointer; font-size: 20px;">' + result[i].userid + '</td>';
						output += '<td>' + result[i].name + '</td><td id="' + result[i].userid + '"></td><td>' + result[i].phone + '</td><td>' + result[i].email + '</td>';
						output += '<td>';
						let newregdate = new Date(result[i].regdate).toISOString();
						newregdate = newregdate.split("T")[0] + " " + newregdate.split("T")[1].split(".")[0] + ".0";
						output += newregdate + '</td><td><button type="button" class="btn" style="background-color: #5597d0; color:#ffffff;" onclick="showChangePwd(' + result[i].userid + ');" >비밀번호 변경</button></td>';
						if (result[i].isadmin == 'Y') {
							output += '<td style="text-align: center"><i class="fas fa-dog" style="color: pink; font-size: 30px; margin-top: 3px;"></i></td>';
						} else {
							output += '<td style="text-align: center"><button type="button" class="btn" style="background-color: #5597d0; color:#ffffff;" onclick="showDelete(${member.userid});">삭제</button>';
						}
						output += '</tr>';
					}
					output += '</tbody></table>';
				}
				
				$("#memberTable").html(output);
				
				let pagingInfo = data.pagingInfo;
				let pagingOutput = '';
				if (pageNo > 1) {
					pagingOutput += '<li><a href="javascript:searchId(1);"><<</a></li>';
				}
				for (let i = pagingInfo.startPageNoOfBlock; i <= pagingInfo.endPageNoOfBlock; i++) {
					pagingOutput += '<li><a href="javascript:searchId(' + i + ');">' + i + '</a></li>';
				}
				if (pageNo < pagingInfo.totalPage) {
					pagingOutput += '<li><a href="javascript:searchId(' + pagingInfo.totalPage + ');">>></a></li>';
				}
				
				$(".pagination").html(pagingOutput);
			}
		});	
	}
	
	function hidechangePwd() {
		$("#changePwd").fadeOut(500);
		
	}
	
	function showChangePwd(obj) {
		$("#useridPwd").val($(obj).attr("id"));
		$("#changePwd").fadeIn();
		
		$("#originalPwd").val("");
		$("#newPwd").val("");
		$("#newPwd2").val("");
		$("#pwdCheck").html("");
		$("#pwdOk").html("");
		$("#newPwdCheck").html("");
	}

	function changePwd() {
		let userid = $("#useridPwd").val();
		let originalPwd = $("#originalPwd").val();
		let newPwd = $("#newPwd").val();
		let newPwd2 = $("#newPwd2").val();
		
		let pwdCheckResult = pwdCheck(newPwd, newPwd2);
		if (pwdCheckResult) {
			let url = "/admin/pwdChange";
			
			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : {userid : userid, password : newPwd}, // 서블릿에 보낼 데이터
				dataType : "text", // 수신될 데이터의 타입
				type : "post", // 통신 방식
				success : function(data) { // 통신 성공시 수행될 콜백 함수
					console.log(data);
					if (data == "success") {
						alert("비밀번호 변경 성공!");
						$("#changePwd").hide();
					} else if (data == "fail") {
						alert("비밀번호 변경에 실패했습니다. \r\n잠시후 다시 시도해주세요.");
					}
				}
			});	
		}
	}
	
	function pwdCheck(newPwd, newPwd2) {
		let result = false;
		if (newPwd.length == 0) {
			$("#newPwdCheck").html("새 비밀번호를 입력해주세요!");
			$("#newPwd").focus();
		} else if (newPwd.length < 8) {
			$("#newPwdCheck").html("비밀번호는 8자 이상이어야 합니다!");
		} else if (newPwd != newPwd2) {
			$("#newPwdCheck").html("비밀번호가 일치하지 않습니다!");
			$("#newPwd").focus();
		} else if($.trim(newPwd) !== newPwd){
			$("#newPwdCheck").html("공백은 입력이 불가능합니다.");
		} else {
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
		
		ajaxUserInfo(userid);
	}
	
	// div띄우기 위한 user정보 가져오는 ajax통신
	function ajaxUserInfo(userid) {
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
				
				$("#userInfo").fadeIn();
			}
		});	
	}
	
	// 회원 삭제 알럿창 띄우기
	function showDelete(obj) {
		let userid = $(obj).attr("id");
		
		 if (!confirm("회원 " + userid + "를 탈퇴처리하시겠습니까?")) {
		        // 취소(아니오) 버튼 클릭 시 이벤트
		    } else {
		        url = "/admin/deleteUser";
		        
		        $.ajax({
					url : url, // ajax와 통신 할 곳
					data : {userid : userid}, // 서블릿에 보낼 데이터
					dataType : "text", // 수신될 데이터의 타입
					type : "post", // 통신 방식
					success : function(data) { // 통신 성공시 수행될 콜백 함수
						console.log(data);
						if (data == "success") {
							alert("회원" + userid + "가 삭제되었습니다.");
							history.go(0);
						} else if (data == "fail") {
							alert("회원 삭제에 실패했습니다. \r\n잠시후 다시 시도해주세요.");
						}
					}
				});	
		    }
	}
	
	//전체 유효성 검사, 전체가 다 유효성검사 통과되야 submit되게
	function validate() {
	    let isCheckOk = false; 
	    
	    let name = document.getElementById("name").value;
	    let nameCheckResult = nameCheck(name);
	    if (nameCheckResult) {
	        name = name.replace(/\s/gi, ""); 
	    }
	    
	    let phone = document.getElementById("phone").value;
	    let phoneCheckResult = phoneCheck(phone);
	    console.log("phoneCheckResult : " + phoneCheckResult);
	    
	    
	    if (nameCheckResult && phoneCheckResult) {
	    		
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
					<!-- <li><a href="/admin/board"><i class="fas fa-chalkboard"></i>&nbsp;&nbsp;게시판
							관리</a></li> -->
					<li><a href="/admin/comment"><i class="far fa-comment"></i>&nbsp;&nbsp;&nbsp;댓글관리</a></li>
					<li>------------------------------------------------</li>
					<li><a href="/"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;나가기</a></li>
				</ul>
				<br>
			</div>
			<div class="col-sm-9" style="margin: 20px;">
				<h1>회원관리</h1>
				<p>총 회원 : ${totalPost }명</p>
				<div class="form-inline" style="float:right; margin-right: 50px; margin-bottom: 10px;">
      				<span>검색 </span><input class="form-control" id="search" type="text" placeholder="아이디 검색">
    			</div>
				<div style="padding: 0 50px; height: 600px;" id="memberTable">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>등급</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>가입일</th>
								<th>비밀번호 변경</th>
								<th>회원 삭제</th>
							</tr>
						</thead>
						<tbody id="memTable">
							<c:forEach var="member" items="${memList}">
								<tr>
									<td onclick="showDiv(this);"
										style="text-weight: bold; color: #de6972; cursor: pointer; font-size: 20px;">${member.userid }</td>
									<td>${member.name }</td>
									<td id="${member.userid }"></td>
									<td>${member.phone }</td>
									<td>${member.email }</td>
									<td>${member.regdate }</td>
									<td><button type="button" class="btn" style="background-color: #5597d0; color:#ffffff;" onclick="showChangePwd(${member.userid});" >비밀번호 변경</button></td>
									<c:choose>
										<c:when test="${member.isadmin == 'Y' }">
											<td style="text-align: center"><i class="fas fa-dog" style="color: pink; font-size: 30px; margin-top: 3px;"></i></td>
										</c:when>
										<c:otherwise>
											<td style="text-align: center"><button type="button" class="btn" style="background-color: #5597d0; color:#ffffff;" onclick="showDelete(${member.userid});">삭제</button>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="padding: 0 50px; text-align: right;">
					<ul class="pagination">
						<c:if test="${param.pageNo > 1}">
							<li><a href="/admin/members?pageNo=1"><<</a></li>
						</c:if>
						<c:forEach var="i" begin="${pagingInfo.startPageNoOfBlock }"
							end="${pagingInfo.endPageNoOfBlock }">
							<li><a href="/admin/members?pageNo=${i }">${i }</a></li>
						</c:forEach>
						<c:if test="${param.pageNo == null or param.pageNo < pagingInfo.totalPage }">
							<li><a href="/admin/members?pageNo=${pagingInfo.totalPage }">>></a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="col-sm-7" id="userInfo">
				<h3 style="font-weight: bold;">개인 정보 변경</h3><br/>
				<form action="/admin/infoupdate" method="POST">
					<div class="form-group">
						<label for="userid">아이디:</label> <input type="text"
							class="form-control" id="userid" placeholder="Enter ID"
							name="userid" readonly> <span id="iderror" class="error"></span>
					</div>
					<div class="form-group">
						<label for="email">이메일 :</label> <input type="text"
							class="form-control" id="email" placeholder="Enter email"
							name="email" readonly>
					</div>
					<div class="form-group">
						<label for="name">이름 :</label> <input type="text"
							class="form-control" id="name" placeholder="Enter Name"
							name="name"><span id="nameerror" class="error"></span>
					</div>
					<div class="form-group">
						<label for="phone">휴대폰 번호 :</label> <input type="text"
							class="form-control" id="phone" placeholder="Enter phone number"
							name="phone"><span id="phoneerror" class="error"></span>
					</div>
					<div style="text-align: center;">
						<button type="submit" class="btn btn-primary" style=" color: #ffffff;"
							onclick="return validate();">회원정보수정</button>
						<button type="button" class="btn btn-default" onclick="hideDiv();">취소</button>
					</div>
				</form>
			</div>
			<div class="col-sm-7" id="changePwd" style="width: 500px;">
				<h3 style="font-weight: bold;">비밀번호 변경</h3><br/>
				<!-- <div class="form-group">
					<label for="originalPwd">기존 비밀번호:</label> <input type="password"
						class="form-control" id="originalPwd"
						name="originalPwd">
						<span id="pwdCheck" style="color: red;"></span>
						<span id="pwdOk" style="color: green;"></span>
				</div> -->
				<div class="form-group">
					<label for="newPwd">새 비밀번호 :</label> <input type="password"
						class="form-control" id="newPwd"
						name="newPwd">
				</div>
				<div class="form-group">
					<label for="newPwd2">비밀번호 확인 :</label> <input type="password"
						class="form-control" id="newPwd2"
						name="newPwd2"><span id="newPwdCheck" style="color: red;"></span>
				</div>
				<input type="hidden" name="useridPwd" id="useridPwd" />
				<div style="text-align: center;">
					<button type="button" class="btn btn-primary"
						onclick="changePwd();">비밀번호변경</button>
					<button type="button" class="btn btn-default" onclick="hidechangePwd();">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>