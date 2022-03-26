<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/favicon.png" />
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
    <jsp:include page="../common/menubar.jsp"/>
    <section class="page-section bg" id="teacher-info">
        <div class="container">
            <br><br>
            <h1 class="text-center">코드런의 멘토가 되어보세요!</h1>
            <br>
            <p class="p-small text-center">
                마음껏 자신의 강의를 운영해 보세요.
            </p>
            <br><br>
            <div class="col-sm-12 text-center">
                <img class="img-responsive" src="${ pageContext.servletContext.contextPath }/resources/img/mentor-icon.png">
            </div>
            <br><br>
            <p class="p-regular text-center">
                형식에 구애받지 않고 가르치는 것을 좋아하는<br>프로그래밍 언어 구사자를 모집합니다.
            </p>
            <br><br>
            <div class="d-grid col-2 mx-auto">
                <button class="btn btn-primary" type="button" onclick="location.href='${ pageContext.servletContext.contextPath }/mentor/apply2'">신청하기</button>
            </div>
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