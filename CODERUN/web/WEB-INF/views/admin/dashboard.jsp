<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" type="image/x-icon" href="${ pageContext.servletContext.contextPath }/resources/img/favicon.png" />
        <title>CODERUN</title>
        <link href="${ pageContext.servletContext.contextPath }/resources/css/admin-style.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="navbar-brand" href="${ pageContext.servletContext.contextPath }"><img src="${ pageContext.servletContext.contextPath }/resources/img/logo.png" alt="..." style="width: 190px; margin-left: 10px;"/></a>
                            <br><br>
                            <a class="nav-link collapsed" href="${ pageContext.servletContext.contextPath }/admin/dashboard">
                                대시보드
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <a class="nav-link collapsed" href="${ pageContext.servletContext.contextPath }/admin/member/list">
                                회원 정보 조회
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <a class="nav-link collapsed" href="/관리자/관리자 멘토 관리.html">
                                멘토 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <a class="nav-link collapsed" href="/관리자/관리자 게시글 목록.html">
                                게시판 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <a class="nav-link collapsed" href="/관리자/관리자 신고 관리.html">
                                신고 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="dropdown">
                            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                              <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                              <strong>관리자</strong>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                              <li><a class="dropdown-item" href="${ pageContext.servletContext.contextPath }/member/logout">Sign out</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <div class="container" style="margin: 0 auto;">
                            <br><br><br><br>
                            <div class="row justify-content-evenly">
                                <div class="card col-5" style="width: 300px;">
                                    <div class="card-body">
                                        <br>
                                        <div id="mento-title" class="text-center fs-4"><a href="#" onclick="location.href='관리자 멘토 관리.html'" id="mento-title" style="color: #ffc800;">멘토 요청</a></div>
                                        <br>
                                        <div id="mento-num" class="text-center fs-5"><a href="#" onclick="location.href='관리자 멘토 관리.html'" id="mento-num">19</a></div>
                                        <br>
                                    </div>
                                </div>
                                <div class="card col-5" style="width: 300px;">
                                    <div class="card-body">
                                        <br>
                                        <div id="report-title" class="text-center fs-4"><a href="#" onclick="location.href='관리자 신고 관리.html'" id="report-title" style="color: #ffc800;">신고 요청</a></div>
                                        <br>
                                        <div id="report-num" class="text-center fs-5"><a href="#" onclick="location.href='관리자 신고 관리.html'" id="report-num">14</a></div>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
    </body>
</html>
