<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>

<body>
<!-- Sidenav -->
  <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
    <div class="scrollbar-inner">
      <!-- Brand -->
      <div class="sidenav-header  align-items-center">
        <a class="navbar-brand" href="javascript:void(0)">
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
              <a class="nav-link" href="/admin/members">
                <i class="ni ni-single-02 text-orange"></i>
                <span class="nav-link-text">회원 정보 관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="/admin/board">
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