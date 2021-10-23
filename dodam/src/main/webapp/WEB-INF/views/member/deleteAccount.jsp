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
</head>
<body>

	<jsp:include page="../template.jsp"></jsp:include>

	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h1>회원정보 삭제</h1>
			</div>
			<p>
				이 작업은 로그인한 SNS 계정을 삭제하는 것이 아니라, 사이트에서 그 동안 사용했던 회원정보를 삭제하는 작업입니다.<br>사이트에서
				'나'에 대한 모든정보가 삭제되며, 삭제후에는 복구가 불가능합니다. <br>&nbsp;<br>!또한
				이전에 작성했던 글에 대한 수정및 삭제 권한도 삭제됩니다. 삭제후에는 다시 권한을 획득하지못하니, 주의바랍니다.
			</p>

			<div>
				<form id="pwForm" action="/member/deleteAccountcomp" method="post">

					<div>
						<span class="input-append"> <input type="text"
							value="${loginSession.userid }" id="userid" name="userid"
							readonly> <input type="submit" value="삭제"
							class="btn btn-inverse">
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>