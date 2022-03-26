<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>CODERUN</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/img/favicon.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="${ pageContext.servletContext.contextPath }"><img src="${ pageContext.servletContext.contextPath }/resources/img/logo.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <c:if test="${ empty sessionScope.loginMember }">
                    	<li class="nav-item"><a class="nav-link" href="/사용자/멘토 소개.html">멘토 소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="/커뮤니티/게시글 목록.html">커뮤니티</a></li>
                        <!-- 로그인 전에 멘토 되기 하면 로그인 하라고 -->
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/member/login">멘토 되기</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/member/regist">회원 가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/member/login">로그인</a></li>
                    	</c:if>
                        <c:if test="${ sessionScope.loginMember.type eq '회원' }">
                    	<li class="nav-item"><a class="nav-link" href="/사용자/멘토 소개.html">멘토 소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="/커뮤니티/게시글 목록.html">커뮤니티</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/mentor/apply1">멘토 되기</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/member/modify">회원 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/member/logout">로그아웃</a></li>
                    	</c:if>
                    	<c:if test="${ sessionScope.loginMember.type eq '멘토' }">
                    	<li class="nav-item"><a class="nav-link" href="/사용자/멘토 소개.html">멘토 소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="/커뮤니티/게시글 목록.html">커뮤니티</a></li>
                        <li class="nav-item"><a class="nav-link" href="/사용자/멘토 되기(신청 1단계).html">멘토 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/member/modify">회원 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/member/logout">로그아웃</a></li>
                    	</c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
