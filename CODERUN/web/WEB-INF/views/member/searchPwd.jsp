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
          const result = "${ requestScope.searchPwdResult }";
          if(result == "fail") {
             alert('존재하지 않는 정보입니다. 이름 혹은 이메일을 확인해 주세요.');
          } else if(result == 'success') {
             alert('임시 비밀번호가 이메일로 전송되었습니다.');
          }
       })();
    </script>
    <jsp:include page="../common/menubar.jsp"/>
    <section class="page-section bg" id="searchPwd" style="width: 500px; margin: auto;">
        <div class="container">
            <br><br>
            <h4>비밀번호 찾기</h4>
            <br>
            <form id="searchPwdForm" action="${ pageContext.servletContext.contextPath }/member/searchPwd" method="post" onsubmit="submitPwd()">
               <div class="mb-3">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-control" name="memberId" id="memberId" placeholder="아이디" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">이메일</label>
                    <input type="text" class="form-control" name="email" id="email" placeholder="이메일" required>
                </div>
                <input type="hidden" id="memberPwd" name="memberPwd" value='generatePassword'>
                <input type="hidden" id="checkPwd" name="checkPwd" value='generatePassword'>
               <br><br>
               <div class="d-grid col-2 mx-auto">
                   <button class="btn btn-primary" type="submit">확인</button>
               </div>
            </form>
        </div>
        <script>
        var generatePassword = ( length = 10, wishlist = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" ) => Array(length)
                    .fill('')
                    .map(() => wishlist[Math.floor(crypto.getRandomValues(new Uint32Array(1))[0] / (0xffffffff + 1) * wishlist.length)])
                    .join('');
        
        function submitPwd() {
           document.getElementById('memberPwd').value = document.getElementById('checkPwd').value = generatePassword();
            console.log("memberPwd : " + document.getElementById('memberPwd').value);
            console.log("checkPwd : " + document.getElementById('checkPwd').value);
        }
        </script>
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
    