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
    <style>
        .img-responsive {
            display: inline-block;
        }
    </style>
</head>
<body>
   <script type="text/javascript">
       (function() {
          const result = "${ requestScope.searchId }";
          if(result == "failed") {
             alert('존재하지 않는 정보입니다. 이름 혹은 이메일을 확인해 주세요.');
          } else if(result == '') {
             console.log(result);
          } else {
             alert('아이디는 ' + result + "입니다.");
          }
       })();
    </script>
    <jsp:include page="../common/menubar.jsp"/>
    <section class="page-section bg" id="searchId" style="width: 500px; margin: auto;">
        <div class="container">
            <br><br>
            <h4>아이디 찾기</h4>
            <br>
            <form id="searchIdForm" action="${ pageContext.servletContext.contextPath }/member/searchId" method="post">
               <div class="mb-3">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-control" name="memberName" id="memberName" placeholder="이름" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">이메일</label>
                    <input type="text" class="form-control" name="email" id="email" placeholder="이메일" required>
                </div>
               <br><br>
               <div class="d-grid col-2 mx-auto">
                   <button class="btn btn-primary" type="submit">확인</button>
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
    