<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="${ pageContext.servletContext.contextPath }/resources/img/favicon.png" />
    <title>CODERUN</title>
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css" rel="stylesheet" />
    <script src="${ pageContext.servletContext.contextPath }/resources/js/script.js"></script>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <section class="page-section bg" id="teacher-info">
        <div class="container">
            <form action="${ pageContext.servletContext.contextPath }/mentor/apply2" name="teacher-info" method="post">
                <br><br>
                <h4>멘토 신청</h4>
                <br>
                <div class="mb-3">                                                                                                                                                                                                      
                    <label for="exampleFormControlInput1" class="form-label">닉네임</label>
                    <input type="text" class="form-control" name="nickname" placeholder="닉네임" required>
                </div>
                <br><br>
                <h4>자기 소개</h4>
                <br>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">자기 소개</label>
                    <textarea class="form-control" rows="5" style="resize: none" name="introduce" required></textarea>
                </div><br>
                <div class="d-grid col-2 mx-auto">
                    <button class="btn btn-primary" type="submit">신청하기</button>
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