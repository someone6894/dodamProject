<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>도담도담 관리자페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="../resources/assets/missing/assets/img/brand/favicon.png" type="image/png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/1e6f7f51eb.js" crossorigin="anonymous"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    .sidenav > ul > li > a {
    	font-size: 20px;
    }

    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }

  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav">
     <h2 style="text-align: center;"><a href="/"><img src="../resources/images/kmj/admin/dodamlogo.png" width="250px"/></a></h2>
      <ul class="nav nav-pills nav-stacked">
        <!-- <li><a href="/admin/adminhome"><i class="fas fa-user-cog"></i>&nbsp;&nbsp;관리자페이지
							메인</a></li> -->
        <li><a href="/admin/members"><i class="fas fa-user-friends"></i>&nbsp;&nbsp;회원관리</a></li>
        <li><a href="/admin/board"><i class="fas fa-chalkboard"></i>&nbsp;&nbsp;게시판 관리</a></li>
        <li class="active"><a href="/admin/comment"><i class="far fa-comment"></i>&nbsp;&nbsp;&nbsp;댓글관리</a></li>
        <li>------------------------------------------------</li>
        <li><a href="/"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;나가기</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9">
      
    </div>
  </div>
</div>

</body>
</html>