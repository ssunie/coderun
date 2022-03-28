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
        <link rel="icon" type="image/x-icon" href="${ pageContext.servletContext.contextPath }/resources/img/favicon.png" />
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <link href="${ pageContext.servletContext.contextPath }/resources/css/main-style.css" rel="stylesheet">
    </head>
    <body id="page-top">
	    <script type="text/javascript">
	    	(function() {
	    		const result = "${ requestScope.message }";
	    		if(result == "fail")
	    		alert("회원 탈퇴에 실패했습니다.");
	    	})();
	    </script>
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
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">좋은 멘토를 원하는 곳에서</div>
                <div class="masthead-heading text-uppercase">Welcome To CODERUN!</div>
            </div>
        </header>
        <!-- Portfolio Grid-->
        <section class="page-section bg" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">모든 언어의 달인이 되어 보세요</h2>
                    <h3 class="section-subheading text-muted">교실에서는 체험할 수 없는 학습 경험</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${ pageContext.servletContext.contextPath }/resources/img/mentor-search.png" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">멘토 소개</div>
                                <div class="portfolio-caption-subheading text-muted">코드런의 멘토진을 만나 보세요</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${ pageContext.servletContext.contextPath }/resources/img/community.png" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">커뮤니티</div>
                                <div class="portfolio-caption-subheading text-muted">지식을 나눠 보세요</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${ pageContext.servletContext.contextPath }/resources/img/mentor-intro.png" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">멘토 되기</div>
                                <div class="portfolio-caption-subheading text-muted">코드런의 멘토를 찾고 있어요</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer py-4 bg-light">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12 text-lg-end">Copyright &copy; CODERUN 2022</div>
                </div>
            </div>
        </footer>
        <!-- Portfolio Modals-->
        <!-- Portfolio item 1 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="${ pageContext.servletContext.contextPath }/resources/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">멘토 소개</h2><br>
                                    <img class="img-fluid d-block mx-auto" src="${ pageContext.servletContext.contextPath }/resources/img/mentor-search.png" alt="..." />
                                    <p>코드런의 유능한 멘토진들이 회원님을 기다리고 있습니다.</p>
                                    <button class="btn btn-primary btn-xl" type="button" onclick="location.href='/사용자/멘토 소개.html'">바로가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 2 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="${ pageContext.servletContext.contextPath }/resources/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">커뮤니티</h2><br>
                                    <img class="img-fluid d-block mx-auto" src="${ pageContext.servletContext.contextPath }/resources/img/community.png" alt="..." />
                                    <p>개발자들의 놀이터에서 자유롭게 대화해 보세요.</p>
                                    <button class="btn btn-primary btn-xl" type="button" onclick="location.href='/커뮤니티/게시글 목록.html'">바로가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 3 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="${ pageContext.servletContext.contextPath }/resources/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">멘토 되기</h2><br>
                                    <img class="img-fluid d-block mx-auto" src="${ pageContext.servletContext.contextPath }/resources/img/mentor-intro.png" alt="..." />
                                    <p>나의 지식을 나눠 사람들에게 배움의 기회를 주고, 의미 있는 대가를 가져가세요.</p>
                                    <button class="btn btn-primary btn-xl" type="button" onclick="location.href='/사용자/멘토 되기(신청 1단계).html'">바로가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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