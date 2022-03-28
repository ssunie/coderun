<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <jsp:include page="../common/menubar.jsp"/>
    <section class="page-section bg" id="regist" style="width: 1000px; margin: 0 auto;">
        <div class="container">
            <br><br>
            <h4>CODERUN에 오신 것을 환영합니다</h4>
            <br>
            <form name="joinForm" id="joinForm" action="${ pageContext.servletContext.contextPath }/member/regist" method="post" onsubmit="checkAll()">
                <div class="mb-3">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-control" name="memberId" id="memberId" placeholder="아이디" required>
                    <a id="idCheck" type="button" style="color: #F2AA4C">중복 확인</a>
                </div>
                <div class="mb-3">
                    <label class="col-form-label">비밀번호</label>
                    <input type="password" class="pw form-control" name="memberPwd" id="memberPwd" placeholder="비밀번호" required>
                    <span class="helper">8~16자리의 영문 대소문자, 숫자를 조합하여 설정</span>
                </div>
                <div class="mb-3">
                    <label class="col-form-label">비밀번호 확인</label>
                    <input type="password" class="pw form-control" name="memberPwd2" id="memberPwd2" onchange="isSame()" placeholder="비밀번호 확인" required>
                    <span id="same"></span>
                </div>
                <div class="mb-3">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-control" name="memberName" id="memberName" placeholder="이름" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">이메일</label>
                    <input type="text" class="form-control" name="email" id="inputEmailForm" placeholder="이메일" required>
                    <a id="emailAuthBtn" type="button" style="text-decoration: none; color: #F2AA4C">인증 메일 받기</a>
                </div>
                <div class="mb-3">
                    <label class="form-label">인증 번호 입력</label>
                    <input type="text" class="form-control" name="authCode" id="inputAuthCode" placeholder="이메일" readonly>
                    <a id="authCodeCheckBtn" type="button" style="text-decoration: none; color: #F2AA4C">확인</a>
                    <input type="hidden" name="authPass" id="authPass" value="false">
                </div>
                <div class="mb-3">
                    <label class="form-label">생년월일</label><br>
                    <input type="date" class="form-control" name="birthday" id="birthday" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">성별</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="F">
                        <label class="form-check-label" for="female">여성</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="M">
                        <label class="form-check-label" for="male">남성</label>
                    </div>
                </div>
                <br>
                <div class="d-grid col-2 mx-auto">
                    <button class="btn btn-primary" type="button" id="joinBtn">가입하기</button>
                </div>
            </form>
        </div>
    </section>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    
    <script>    
    	var isUsable1 = false;
    	var isUsable2 = false;
    
    	$("#idCheck").click(function(){
    		const memberId = $("[name=memberId]");
    		
    		if(!memberId || memberId.val().length < 6) {
    			alert("아이디는 최소 6자리 이상이어야 합니다.");
    			memberId.focus();
    		} else {
    			$.ajax({
    				url: "${ pageContext.servletContext.contextPath }/member/idCheck",
    				type: "post",
    				data: { memberId : memberId.val() },
    				success: function(result) {
    					if(result == "fail") {
    						alert("사용할 수 없는 아이디입니다.");
    						memberId.focus();
    					} else {
    						if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) {
    							memberId.attr('readonly', true);
    							isUsable1 = true;
    						} else {
    							memberId.attr('readonly', false);
    							isUsable1 = false;
    							memberId.focus();
    						}
    					}
    				},
    				error: function(e) {
    					console.log(e);
    				}
    			});
    		}
    	});
    	
    	$("#emailAuthBtn").click(function(){
    		var isUsable2 = false;
    		var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    		var email = document.joinForm.email.value;
    		
    		if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
    			return false;
    		} else {
    			$.ajax({
    				url: "${ pageContext.servletContext.contextPath }/member/emailCheck",
    				type: "get",
    				data: { email : email },
    				success: function(result) {
    					if(result == "fail") {
    						alert("사용할 수 없는 이메일입니다.");
    						$("#inputEmailForm").focus();
    					} else {
    						if(confirm("사용 가능한 이메일입니다. 사용하시겠습니까?")) {
    							$("#inputEmailForm").attr('readonly', true);
    							$("#inputAuthCode").attr('readonly', false);
    							requestAuthEmail();
    						} else {
    							$("#inputEmailForm").attr('readonly', false);
    							$("#inputAuthCode").attr('readonly', true);
    							$("#inputEmailForm").focus();
    						}
    					}
    				},
    				error: function(e) {
    					console.log(e);
    				}
    			});
    		}    		
    	});
    	
    	function check(pattern, target, message) {
    		if(pattern.test(target)) {
    			return true;
    		}
    		alert(message);
    		target.focus();
    		return false;
    	}
    	
    	var generateCode = ( length = 6, wishlist = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" ) => Array(length)
	      .fill('')
	      .map(() => wishlist[Math.floor(crypto.getRandomValues(new Uint32Array(1))[0] / (0xffffffff + 1) * wishlist.length)])
	      .join('');
    	
    	function requestAuthEmail() {    		
    		var email = document.joinForm.email.value;
    		var checkCode = generateCode();
    		document.getElementById('authPass').value = checkCode;
    		    		
    		$.ajax({
				url: "${ pageContext.servletContext.contextPath }/member/emailCheck",
				type: "post",
				data: { email : email, checkCode : checkCode },
				success: function(result) {
					if(result == "fail") {
						alert("인증 번호 전송에 실패했습니다.");
					} else {
						alert("인증 번호를 전송했습니다. 메일을 확인해 주세요.");
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
    	}
    	
    	$("#authCodeCheckBtn").click(function(){
    		var inputCode = $("#inputAuthCode");
    		var authPass = $("#authPass");
    		
    		if($("#authPass").val() == $("#inputAuthCode").val()) {
    			alert("인증에 성공했습니다.");
    			isUsable2 = true;
    			$("#inputAuthCode").attr('readonly', true);
    		} else {
    			alert("인증 번호를 다시 확인해 주세요.");
    			isUsable2 = false;
    		}
    	});
    	
    	if(isUsable1 == true && isUsable2 == true) {
    		$("#joinBtn").attr('type', 'submit');
    	}
    </script>
    
    <div class="modal fade" id="checkEmail" tabindex="-1" aria-labelledby="checkEmail" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="checkEmail">인증 메일 발송 완료</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    작성한 이메일로 인증 확인 메일이 전송 되었습니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <footer class="footer py-4 bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12 text-lg-end">Copyright &copy; CODERUN 2022</div>
            </div>
        </div>
    </footer>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>