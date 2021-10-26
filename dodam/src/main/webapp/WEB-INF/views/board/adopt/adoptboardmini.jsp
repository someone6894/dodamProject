<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dodam dodam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- <script type="text/javascript"> $.noConflict(); </script> -->

</head>
<script>

//상세페이지
function readBoard(no) {
	console.log("상세페이지 보기 : " + no);
	location.href = '/board/adopt/readBoard?no=' + no;
}

// 슬라이더 테스트



</script>
<style>

.grid-container {
  display: grid;
  height: 400px;
  width : 1170px;
  align-content: center;
  grid-template-columns: auto auto auto auto;
/*    background-color: #2196F3;  */
  margin: 0 auto;
 
}

.grid-container > div {
/*   background-color: rgba(255, 255, 255, 0.8); */
  text-align: center;
  width:280px;
  font-size: 27px;
  font-family: 'Nanum Pen Script', cursive;
/*   border: 1px solid; */
}

 .img-rounded { 
 	width: 280px;
 	height: 275px;
 	 background: silver; 
   } 
    
/*   .titleCss:hover {  */
/*     background: yellow;  */
     
/*   }  */
  
   .img-rounded:hover { 
    background: yellow; 
     
  } 
  
</style>
<body>

 <div class='grid-container '>
	<c:forEach var="board" items="${listBoard }" begin="0" end="3">
							<div onclick="readBoard(${board.no});">
							<div style='color:#2982FF;'>"${board.adoptarea }"</div>
<!-- 							<div>  -->
<%-- 								<c:choose> --%>
<%-- 									<c:when test ="${board.state eq 'protected'}"> --%>
<!-- 										보호중 -->
<%-- 									</c:when>								 --%>
<%-- 								</c:choose> --%>
<!-- 							</div> -->
<!-- 								<div>${board.no }</div> -->
<!-- 								<div>${board.adoptarea }</div> -->
								<div class='titleCss'>
								<c:choose>
									<c:when test ="${board.image != null}">
										<div class='img-rounded'><img src= ../../resources/${board.image} width= '270px' height= '270px' /></div>
									</c:when>
									<c:otherwise>
										<div class='img-rounded'><img src='../../resources/images/main/noimg.jpg' width= '290px' height= '270px' /></div>
									</c:otherwise>
								</c:choose>
								<div ><${board.title }></div>
								</div>
<!-- 								<div>${board.contents }</div> -->
								<div style='font-size:20px;'>${board.regdate }</div>
							</div>
	</c:forEach>
	</div> 
	
	
	
	
<!-- 	listBoard -->
<!-- 	boardminiList -->
	
</body>
</html>