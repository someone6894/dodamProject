<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<title>Dodam Dodam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>


 	// CORS (Cross-Origin Resource Sharing) 문제 해결 : https://shinsunyoung.tistory.com/86 or https://ooz.co.kr/232
 	// CORS (Cross-Origin Resource Sharing) 문제 해결2 : https://ooz.co.kr/232
 	
	// 상세페이지
	function readBoard(no) {
// 		console.log("상세페이지 보기 : " + no);
// 		location.href = '/board/adopt/readBoard?no=' + no;
		
		var key = "LhtsYqsaFhYYq3GuCIigdN7A5khhuIdcyZsvVTvwBZTmkMJ28dJMaAU78ccZMy1isz6RnT6kiaYvHFjB9pDNSA%3D%3D";
		
		
		var dataUrl = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20140301&endde=20140430&pageNo=1&numOfRows=10&ServiceKey=" + key;
		
		// dataUrl2 = dataUrl+key
		var dataUrl2 = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20140301&endde=20140430&pageNo=1&numOfRows=10&ServiceKey=LhtsYqsaFhYYq3GuCIigdN7A5khhuIdcyZsvVTvwBZTmkMJ28dJMaAU78ccZMy1isz6RnT6kiaYvHFjB9pDNSA%3D%3D";
			
			
			
			
		 $.ajax({
		        url: "public.do", // 데이터가 송수신 될 서버의 주소
		        type: "GET",  // 통신 방식(get, post)
		        dataType  : "xml", // 수신받을 데이터의 타입
		        success: function (data) { // 통신이 성공하면 수행될 문장들...
		            console.log("ajax data 통신성공 : " + data );
		        	if(data != null){
		        		console.log(data.getElementsByTagName("items")[0].children[0]);
		        		console.log(data.getElementsByTagName("items")[0].children[0].childNodes.length);
// 		        		console.log(data.getElementsByTagName("age")[0]);
// 		        		console.log(data.getElementsByTagName("age")[1]);

		        		for(i=0; i < 5; i++){
		        			console.log(data.getElementsByTagName("age")[i]);
		        		}
		        	
		        	
		        	}
		        }
		    });
			
		 
			
	}

</script>

<body>
	<jsp:include page="../../template.jsp"></jsp:include>
	<br/>
	<button style=" margin: 0 auto; display: block" onclick="readBoard(18)">test</button>
	
	
	
	
</body>
</html>