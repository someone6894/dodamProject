<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>관리자 메인</title>
  <!-- Favicon -->
  <link rel="icon" href="../resources/assets/missing/assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="../resources/assets/missing/assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="../resources/assets/missing/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Page plugins -->
  <!-- Argon CSS -->
  <link rel="stylesheet" href="../resources/assets/missing/assets/css/argon.css?v=1.2.0" type="text/css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<script>
	$(function() {
		if ("${boardName}" == "missingboard") {
			$("#missing").prop("checked", true);
			parseMissingBoard();
		}
		
		$("#adopt").click(function () {
			//let url = "/admin/getboard";
			
			// 아작스 처리
		});
	});
	
	function parseMissingBoard() {
		// 테이블 jstl써서 파싱
		let output = '<table class="table align-items-center table-flush"><thead class="thead-light">';
        output += '<tr><th scope="col" class="sort" data-sort="userid">아이디</th>';
        output += '<th scope="col" class="sort" data-sort="name">이름</th>';
        output += '<th scope="col" class="sort" data-sort="email">이메일</th>';
        output += '<th scope="col" class="sort" data-sort="phone">전화번호</th>';
        output += '<th scope="col" class="sort" data-sort="registerdate">가입일</th></tr></thead>';
        output += '<tbody class="list"><c:forEach var="member" items="${memberList }">';
        		//<tr>
            		//<th scope="row"><a href="/admin/userinfo?userid=${member.userid }">${member.userid }</a></th>
            		//<td class="name">${member.name }</td>
            		//<td class="email">${member.email }</td>
            		//<td class="phone">${member.phone }</td>
            		//<td class="regdate">${member.regdate }</td>
          		//</tr>
        	//</c:forEach>
        //</tbody>
      //</table>
		
	}
</script>
<body>
  <!-- Sidenav -->
  <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
    <div class="scrollbar-inner">
      <!-- Brand -->
      <div class="sidenav-header  align-items-center">
        <a class="navbar-brand" href="/">
          <h1><strong>Dodam Dodam</strong></h1>
        </a>
      </div>
      <div class="navbar-inner">
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
          <!-- Nav items -->
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="/admin">
                <i class="ni ni-tv-2 text-primary"></i>
                <span class="nav-link-text">관리자 메인</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="/admin/members">
                <i class="ni ni-single-02 text-orange"></i>
                <span class="nav-link-text">회원 정보 관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/board">
                <i class="ni ni-align-left-2 text-primary"></i>
                <span class="nav-link-text">게시판 관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/board">
                <i class="ni ni-align-left-2 text-primary"></i>
                <span class="nav-link-text">공지사항</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/board">
                <i class="ni ni-align-left-2 text-primary"></i>
                <span class="nav-link-text">Q&A</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/reply">
                <i class="ni ni-chat-round text-yellow"></i>
                <span class="nav-link-text">댓글 관리</span>
              </a>
            </li>
          </ul>
          <!-- Divider -->
          <hr class="my-3">
          <!-- Navigation -->
          <ul class="navbar-nav mb-md-3">
            <li class="nav-item">
              <a class="nav-link" href="/">
                <i class="ni ni-user-run text-dark"></i>
                <span class="nav-link-text">관리자페이지 나가기</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
  
  <!-- Main content -->
  <div class="main-content" id="panel">
    <!-- Topnav -->
    <nav class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Navbar links -->
          <ul class="navbar-nav align-items-center  ml-md-auto ">
            <li class="nav-item d-xl-none">
              <!-- Sidenav toggler -->
              <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </div>
            </li>
            <li class="nav-item d-sm-none">
              <a class="nav-link" href="#" data-action="search-show" data-target="#navbar-search-main">
                <i class="ni ni-zoom-split-in"></i>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="ni ni-bell-55"></i>
              </a>
              <div class="dropdown-menu dropdown-menu-xl  dropdown-menu-right  py-0 overflow-hidden">
                <!-- Dropdown header -->
                <div class="px-3 py-3">
                  <h6 class="text-sm text-muted m-0">You have <strong class="text-primary">13</strong> notifications.</h6>
                </div>
                <!-- List group -->
                <div class="list-group list-group-flush">
                  <a href="#!" class="list-group-item list-group-item-action">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <!-- Avatar -->
                        <img alt="Image placeholder" src="../assets/img/theme/team-1.jpg" class="avatar rounded-circle">
                      </div>
                      <div class="col ml--2">
                        <div class="d-flex justify-content-between align-items-center">
                          <div>
                            <h4 class="mb-0 text-sm">John Snow</h4>
                          </div>
                          <div class="text-right text-muted">
                            <small>2 hrs ago</small>
                          </div>
                        </div>
                        <p class="text-sm mb-0">Let's meet at Starbucks at 11:30. Wdyt?</p>
                      </div>
                    </div>
                  </a>
                </div>
                <!-- View all -->
                <a href="#!" class="dropdown-item text-center text-primary font-weight-bold py-3">View all</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Header -->
    <!-- Header -->
    <div class="header bg-primary pb-6">
      <div class="container-fluid">
        <div class="header-body">
          <div class="row align-items-center py-4">
            <div class="col-lg-6 col-7">
              <h6 class="h2 text-white d-inline-block mb-0">${userInfo.userid }</h6>
              <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                  <li class="breadcrumb-item" aria-current="page">회원정보</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--6">
      <div class="row">
        <div class="col-xl-12 order-xl-1">
          <div class="card card-profile">
            <div class="card-body pt-0">
              <div class="text-center">
              	<br />
                <h1>
                  ${userInfo.userid } / ${userInfo.name }
                </h1>
                <div class="row">
              </div>
                <div class="h5 font-weight-300">
                  <i class="ni location_pin mr-2"></i>회원 등급 : <span id="grade"></span>
                </div>
                <div class="h5 mt-4">
                  <i class="ni business_briefcase-25 mr-2"></i>email : ${userInfo.email }
                </div>
                <div class="h5 mt-4">
                  <i class="ni business_briefcase-25 mr-2"></i>전화번호 : ${userInfo.phone }
                </div>
                <div class="col">
                  <div class="card-profile-stats d-flex justify-content-center">
                    <div>
                      <span class="heading">22</span>
                      <span class="description">게시글</span>
                    </div>
                    <div>
                      <span class="heading">10</span>
                      <span class="description">댓글</span>
                    </div>
                    <div>
                      <span class="heading">89</span>
                      <span class="description">포인트</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-12 order-xl-1">
          <div class="card">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-12">
                  <h3 class="mb-0">회원 정보 변경 </h3>
                </div>
              </div>
            </div>
            <div class="card-body">
              <form>
                <h6 class="heading-small text-muted mb-4">회원 정보 입력</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-userid">아이디</label>
                        <input type="text" id="input-userid" class="form-control" value="${userInfo.userid }" readonly>
                      </div>
                    </div>
                   </div>
                   <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">이메일</label>
                        <input type="email" id="input-email" class="form-control" value="${userInfo.email }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-phone">전화번호</label>
                        <input type="text" id="input-phone" class="form-control" value="${userInfo.phone }">
                      </div>
                    </div>
                   </div>
                   <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-name">이름</label>
                        <input type="text" id="input-name" class="form-control" value="${userInfo.name }">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-12 text-right">
                  <a href="#!" class="btn btn-default">수정</a>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="col-xl-12 order-xl-1">
          <div class="card">
            <div class="card-header">
 	        	<div class="row align-items-center">
	            	<div class="col-6">
	                  <h3 class="mb-0">회원 게시글 </h3>
	                </div>
	                <div class="btn-group btn-group-toggle col-6" data-toggle="buttons">
		                <label class="btn btn-secondary active">
		                  <input type="radio" name="options" id="missing" autocomplete="off"> 찾아요
		                </label>
		                <label class="btn btn-secondary">
		                  <input type="radio" name="options" id="adopt" autocomplete="off"> 분양해요
		                </label>
		                <label class="btn btn-secondary">
		                  <input type="radio" name="options" id="proud" autocomplete="off"> 반려동물 자랑
		                </label>
		                <label class="btn btn-secondary">
		                  <input type="radio" name="options" id="qna" autocomplete="off"> Q&A
		                </label>
	              	</div>
	        	</div>
            </div>
            <div class="card-body">
              	<!-- Light table -->
	            <div class="table-responsive">
	              <table class="table align-items-center table-flush">
	                <thead class="thead-light">
	                  <tr>
	                    <th scope="col" class="sort" data-sort="userid">아이디</th>
	                    <th scope="col" class="sort" data-sort="name">이름</th>
	                    <th scope="col" class="sort" data-sort="email">이메일</th>
	                    <th scope="col" class="sort" data-sort="phone">전화번호</th>
	                    <th scope="col" class="sort" data-sort="registerdate">가입일</th>
	                  </tr>
	                </thead>
	                <tbody class="list">
	                	<c:forEach var="member" items="${memberList }">
	                		<tr>
	                    		<th scope="row"><a href="/admin/userinfo?userid=${member.userid }">${member.userid }</a></th>
	                    		<td class="name">${member.name }</td>
	                    		<td class="email">${member.email }</td>
	                    		<td class="phone">${member.phone }</td>
	                    		<td class="regdate">${member.regdate }</td>
	                  		</tr>
	                	</c:forEach>
	                </tbody>
	              </table>
	            </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Footer -->
      <footer class="footer pt-0">
        <div class="row align-items-center justify-content-lg-between">
          <div class="col-lg-6">
            <div class="copyright text-center  text-lg-left  text-muted">
              &copy; 2020 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
            </div>
          </div>
          <div class="col-lg-6">
            <ul class="nav nav-footer justify-content-center justify-content-lg-end">
              <li class="nav-item">
                <a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a>
              </li>
              <li class="nav-item">
                <a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a>
              </li>
              <li class="nav-item">
                <a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a>
              </li>
              <li class="nav-item">
                <a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a>
              </li>
            </ul>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!-- Argon Scripts -->
  <!-- Core -->
  <script src="../resources/assets/missing/assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="../resources/assets/missing/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/assets/missing/assets/vendor/js-cookie/js.cookie.js"></script>
  <script src="../resources/assets/missing/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
  <script src="../resources/assets/missing/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
  <!-- Optional JS -->
  <script src="../resources/assets/missing/assets/vendor/chart.js/dist/Chart.min.js"></script>
  <script src="../resources/assets/missing/assets/vendor/chart.js/dist/Chart.extension.js"></script>
  <!-- Argon JS -->
  <script src="../resources/assets/missing/assets/js/argon.js?v=1.2.0"></script>
</body>
</html>