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

<!-- <script type="text/javascript"> $.noConflict(); </script> -->


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
   height: 350px;
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
   padding-left: 300px;
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
         <li>
            <a href="/member/register">
               <span class="glyphicon glyphicon-user"></span> 회원가입</a>
         </li>
         <li>
            <a href="#">
               <span class="glyphicon glyphicon-log-in"></span> 로그인</a>
         </li>
      </ul>
   </div>

   <div class="banner" style="padding-top: 30px;">
      <img id='bannerimg' src='../../resources/images/main/banner.jpg' width="auto" height="300px;"/>
   </div>

   <!-- class = navbar navbar-inverse -->
   <nav class="menu">
      <div class="container">
         <ul class="nav navbar-nav">
            <li id="main" class="active"><a href="/">
               <img src="../../resources/images/main/paw.png" width="24px;" style="padding: 0 6px 3px 0;"/>메인</a></li>
            <li><a href="#"><img src="../../resources/images/main/notice.png" width="24px;" style="padding: 0 6px 3px 0;"/>공지사항</a></li>
               <!--       <li><a href="/board/register">게시판 만들기</a></li> -->
            <li id="adoptBoard"><a href="/board/adopt/listAll?pageNo=1"><img src="../../resources/images/main/pet.png" width="30px;" style="padding: 0 6px 3px 0;"/>찾기,보호,분양</a></li>
<!--                <li><a href="/board/publicAdoptList"><img src="../resources/images/publicpet.png" width="30px;" style="padding: 0 6px 3px 0;"/>유기동물 공고</a> -->
            <li class="dropdown"><a href="#"><img src="../../resources/images/main/perhospital.png" width="30px;" style="padding: 0 6px 3px 0;"/>동물보호소 찾기</a>
               <ul class="dropdown-content" style="padding-left: 0;">
                  <li><a href="#">공공기관 찾기</a></li>
                  <li><a href="#">동물병원 찾기</a></li>
               </ul>
            </li>
            <li id="adoptBoard"><a href="/board/proud/listAll?pageNo=1"><img src="../../resources/images/main/proud.png" width="30px;" style="padding: 0 6px 3px 0;"/>반려견자랑</a></li>
            <li class="dropdown"><a href="#"><img src="../../resources/images/main/publicpet.png" width="30px;" style="padding: 0 6px 3px 0;"/>반려동물 축제</a>
               <ul class="dropdown-content" style="padding-left: 0;">
                  <li><a href="#">반려동물 전시회</a></li>
                  <li><a href="#">반려동물 행사</a></li>
               </ul>
            </li>
            <li><a href=""><img src="../../resources/images/main/paw.png" width="30px;" style="padding: 0 6px 3px 0;"/>Q&A</a></li>
            
         </ul>
      </div>
   </nav>
   

   <!-- <jsp:include page="adoptboardmini.jsp"></jsp:include> -->
   
   <!-- <div class="container"> -->

   <!--   <h1>메인 페이지를 어떻게 꾸밀까요</h1> -->
   <!--   <p1> 기능구현이 주력이기 때문에 메인 페이지는 간단하고 깔끔해서 비어보이지만 않게끔 로고 블럭버튼 형식으로 꾸밀까요? ex) 건보공단 홈페이지</p1> -->

   <!--   <h3>메인 바디</h3> -->
   <!--   <p> 부트스트랩 각종 폼 따와서 넣어서 메인바디 꾸미기  -->
   <!--       ex) 인풋 폼, 리스트 폼, 페이징 넘버 폼 etc -->
   <!--   </p> -->
   <!-- </div> -->


<!--    <div class="bxslider"> --><!--
       <div> -->
<!--          <img -->
<!--             src="https://movie-phinf.pstatic.net/20200721_250/1595306482797hfWqC_JPEG/movie_image.jpg?type=m665_443_2" -->
<!--             alt="슬라이드 이미지1"> -->
<!--       </div> -->
<!--       <div> -->
<!--          <img -->
<!--             src="https://movie-phinf.pstatic.net/20200721_131/1595306483541uxv0I_JPEG/movie_image.jpg?type=m665_443_2" -->
<!--             alt="슬라이드 이미지2"> -->
<!--       </div> -->
<!--    </div> -->

   
</body>
</html>
