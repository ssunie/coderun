<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="${ pageContext.servletContext.contextPath }/resources/img/favicon.png" />
    <title>CODERUN</title>
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css" rel="stylesheet" />
    <style>
        .img-responsive {
            display: inline-block;
        }
    </style>
</head>
<body>
	<script type="text/javascript">
    	(function() {
    		const result = "${ requestScope.loginFailed }";
    		if(result == "loginFailed") {
    			/* $("#loginFailedModal").modal("show"); */
    			alert('아이디 혹은 비밀번호가 틀렸습니다.');
    		}
    	})();
    </script>
	<jsp:include page="../common/menubar.jsp"/>
	<section class="page-section bg" style="width: 500px; margin: auto;">
        <div class="container">
            <br><br>
            <h4 class="text-center">로그인</h4>
            <br><br>
            <form action="${ pageContext.servletContext.contextPath }/member/login" method="post">
            <div class="mb-3">
                <label for="memberId" class="form-label">아이디</label>
                <input type="text" class="form-control" name="memberId" id="memberId" placeholder="아이디" required>
            </div>
            <div class="mb-3">
                <label for="memberPwd" class="form-label">비밀번호</label>
                <input type="password" class="form-control" name="memberPwd" id="memberPwd" placeholder="비밀번호" required> 
            </div>
            <br>
            <div class="mb-3 row justify-content-evenly" style="color: #6c757d;">
                <span class="col-5 text-center"><a href="${ pageContext.servletContext.contextPath }/member/searchId" style="text-decoration: none; color: #6c757d;">아이디 찾기</a></span>
                <span class="col-2 text-center" style="cursor: default">|</span>
                <span class="col-5 text-center"><a href="${ pageContext.servletContext.contextPath }/member/searchPwd" style="text-decoration: none; color: #6c757d;">비밀번호 찾기</a></span>
            </div>
            <br>
            <div class="d-grid col-2 mx-auto">
                <button type="submit" class="btn btn-primary">
                    Login
                </button>
            </div>
            </form>
   		</div>
    </section>
    <footer class="footer py-4 bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12 text-lg-end">Copyright &copy; CODERUN 2022</div>
            </div>
        </div>
    </footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>