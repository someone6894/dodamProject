<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dodam dodam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--   <link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" /> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script> -->
<script type="text/javascript"> $.noConflict(); </script>

<style>
</style>

<script>
$(function(){
   
   $("#adoptBoard").click(function(){
      var listBoard = "<c:out value= '${listBoard != null }' />";
      console.log(listBoard);
      if(listBoard){
         $("#adoptBoard").addClass("active");
      }
      
   });
   
//    $("#main").click(function(){
//       $("#adoptBoard").removeClass("active");
//    });

});

function Ac(){
   var listBoard = "<c:out value= '${listBoard != null }' />";
   console.log(listBoard);
   if(listBoard){
      $("#adoptBoard").addClass("active");
   }
}

function ActiveBar(){
   let sBtn = $(".navbar-nav > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
   sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
      sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
      $(this).parent().addClass("active"); // 클릭한 li에 (active)클래스를 넣는다.
//       $(this).css('backgroundColor', 'red');
   });   
}



</script>

<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap');

/* .active{ */
/*    background-color: red; */
/* } */

.banner0 {
   height: 50px;
   text-align: center;
   font-size: 30px;
   font-family: 'Nanum Pen Script', cursive;
   margin-right: 20px;
}

.login {
   font-size: 20px;
}

.banner {
   height: 280px;
   background-color: #3C6E9F;
   /* test2와 같은 색상 */
}

#bannerimg {
   margin: 0 auto;
   /*     margin-top : 25px; */
   position: relative;
   display: block;
}

.menu {
   background-color: white;
   height : 50px;
   box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.2);
   
   margin: 0 auto;
   position: relative;
   display: block;
   padding-left: 200px;
/*    font-family: 'Single Day', cursive; */
   font-family: 'Gaegu', cursive;
   font-size: 17px;
}

.container li:active {
   background-color: #eee;
}
.dropdown {
   position: relative;
   display: inline-block;
}

.dropdown-content {
   display: none;
   position: absolute;
   /*          background-color: #F9F9F9; */
   /*          min-width: 160px; */
   /*          padding: 8px; */
   width : 150px;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown:hover .dropdown-content {
   display: block;
}

.dropdown-content li {
   padding : 15px 15px 15px 15px;
   list-style: none;
   display: block;
}

.dropdown-content li:hover {
   background-color: #eee;
}

.dropdown-content li a {
   text-decoration: none;
   color: black;
}


</style>
</head>
<body>

   <div class="banner0">
      <span style="margin: 0 auto; padding-left:14%;"> 도담 도담. 아가야 건강하고 행복하게 자라렴 </span>

      <ul class="nav navbar-nav navbar-right login">
         
         
          <c:choose>
				<c:when test="${loginSession == null }">
				    <li>
           		 		<a href="/member/register">  <span class="glyphicon glyphicon-user"></span> 회원가입</a>
         			</li>
				</c:when>
           </c:choose>
        
           <c:choose>
				<c:when test="${loginSession == null }">
				 <li>
				 	 <a href="/member/login"> <span class="glyphicon glyphicon-log-in"></span> 로그인</a>
         		</li>
				</c:when>
           </c:choose>
  
            <c:choose>
				<c:when test="${loginSession != null and loginSession.isadmin != 'Y' }">
				 <li>
				 	 <a href="/member/mypage"> <span class="glyphicon glyphicon-user"></span> 마이페이지 </a>
         		</li>
				</c:when>
          	 </c:choose>
          	 
          	 <c:choose>
         		<c:when test="${loginSession != null and loginSession.isadmin == 'Y' }">
				 	<li>
				 	 	<a href="/admin/members"> <span class="glyphicon glyphicon-user"></span> 관리자페이지 </a>
         			</li>
				</c:when>
			</c:choose>
				
             <c:choose>
				<c:when test="${loginSession != null }">
				 <li>
				 	 <a href="/member/logout"> <span class="glyphicon glyphicon-log-out"></span> 로그아웃</a>
         		</li>
				</c:when>
          	 </c:choose>
          	 
      </ul>
   </div>

   <div class="banner" style="padding-top: 10px;">
      <a href="/"><img id='bannerimg' src='../../resources/images/main/banner.jpg' width="auto" height="270px;"/></a>
   </div>

   <!-- class = navbar navbar-inverse -->
   <nav class="menu">
      <div class="container">
         <ul class="nav navbar-nav">
            <li id="main" class="active"><a href="/"><img src="../../resources/images/main/paw.png" width="24px;" style="padding: 0 6px 3px 0;"/>메인</a></li>
            <li id="notice"><a href="/board/notice/listAll"><img src="../../resources/images/main/notice.png" width="24px;" style="padding: 0 6px 3px 0;"/>공지사항</a></li>
            <li id="missing"><a href="/board/missing/list"><img src="../../resources/images/main/missing.png" width="30px;" style="padding: 0 6px 3px 0;"/>찾아요</a></li>
            <li id="adopt"><a href="/board/adopt/listAll?pageNo=1"><img src="../../resources/images/main/pet.png" width="30px;" style="padding: 0 6px 3px 0;"/>분양해요</a></li>
		    <li id='publicAdopt'><a href="/board/adopt/publicAdoptList"><img src="../../resources/images/main/publicpet.png" width="30px;" style="padding: 0 6px 3px 0;"/>유기동물 공고</a>
<!--             <li class="hospital dropdown"><a href="/"><img src="../../resources/images/main/perhospital.png" width="30px;" style="padding: 0 6px 3px 0;"/>동물보호소 찾기</a> -->
<!--                <ul class="dropdown-content" style="padding-left: 0;"> -->
<!--                   <li><a href="#">공공기관 찾기</a></li> -->
<!--                   <li><a href="#">동물병원 찾기</a></li> -->
<!--                </ul> -->
            </li>
            <li id="proud"><a href="/board/proud/listAll"><img src="../../resources/images/main/proud.png" width="30px;" style="padding: 0 6px 3px 0;"/>반려견자랑</a></li>
            <li class="event"><a href="/board/event/listPage"><img src="../../resources/images/main/publicpet.png" width="30px;" style="padding: 0 6px 3px 0;"/>반려동물 전시회</a></li>
            <li id='qna'><a href="/board/qna/listAll"><img src="../../resources/images/main/paw.png" width="30px;" style="padding: 0 6px 3px 0;"/>Q&A</a></li>
            
         </ul>
      </div>
   </nav>
   

</body>
</html>
