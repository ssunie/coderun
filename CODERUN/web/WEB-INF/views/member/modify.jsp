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
	<jsp:include page="../common/menubar.jsp"/>
    <section class="page-section bg" id="modify" style="width: 1000px; margin: 0 auto;">
        <div class="container">
                <br><br>
	            <h4>프로필 사진</h4>
	            <br><br>
	            
	            <form method="post" action="${ pageContext.servletContext.contextPath }/prfileImg/insert">
		            <div class="d-grid col-2 mx-auto">
		        		<div class="imgfix">
		          			<img src="${ pageContext.servletContext.contextPath }/resources/img/profile-example.png" class="imgArea" id="imgArea">
		        		</div>
		        		<br>
		        		<input type="file" id="imgfile" name="thumbnail" accept="image/gif,image/jpeg,image/png">
		      		</div>
		      		<div class="d-grid col-2 mx-auto">
		      		<br>
                    	<button class="btn btn-primary" type="submit" id="updateBtn">사진 변경</button>
                	</div>
	            </form>
	            
	      		<br><br>
	      		<!-- 프리패스 소지한 회원인지 아닌지에 따라서 다르게 -->
            <form name=form id="modifyForm" action="${ pageContext.servletContext.contextPath }/member/modify" method="post">
	      		<div>
	        		<img src="${ pageContext.servletContext.contextPath }/resources/img/crown.png" class="align-middle" style="width: 20px; margin-right: 5px;">
	        		<span class="align-middle">프리패스를 소지한 회원입니다.</span>
	      		</div>
	      		<br>
                <div class="mb-3">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-control" name="memberName" id="memberName" value="${ loginMember.name }" requried>
                </div>
                <div class="mb-3">
                    <label class="form-label">이메일</label>
                    <input type="text" class="form-control" name="email" id="email" value="${ loginMember.email }" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">생년월일</label><br>
                    <input type="date" class="form-control" name="birthday" id="birthday" value="${ loginMember.birthday }" required>
                </div>
                <c:if test="${ loginMember.gender eq 'F' }">
                	<div class="mb-3">
                    <label class="form-label">성별</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="F" checked>
                        <label class="form-check-label" for="female">여성</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="M">
                        <label class="form-check-label" for="male">남성</label>
                    </div>
                </div>
                </c:if>
                <c:if test="${ loginMember.gender eq 'M' }">
                	<div class="mb-3">
                    <label class="form-label">성별</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="F">
                        <label class="form-check-label" for="female">여성</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="M" checked>
                        <label class="form-check-label" for="male">남성</label>
                    </div>
                </div>
                </c:if>
                <br><br>
                <div class="d-grid col-2 mx-auto">
		          <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
		            data-bs-whatever="@mdo">비밀번호 변경</button>
        		</div>
        		<br>
        		<div class="d-grid col-2 mx-auto">
                    <button class="btn btn-primary" type="submit" id="updateBtn">수정</button>
                </div>
                <br><br>
                <div class="d-grid col-2 mx-auto">
                	<a class="btn btn-secondary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">회원 탈퇴</a>
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
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body">
	          <form name=form method="post" onsubmit="checkAll()">
	            <div class="mb-3">
	              <label for="recipient-name" class="col-form-label">현재 비밀번호</label>
	              <input type="password" class="form-control" id="recipient-name" placeholder="현재 비밀번호" required>
	            </div>
	            <div class="mb-3">
	              <label for="recipient-name" class="col-form-label">변경할 비밀번호</label>
	              <input type="password" class="pw form-control" name="password1" id="pw" placeholder="변경할 비밀번호"
	                required>
	              <span class="helper">
	                8~16자리의 영문 대소문자, 숫자를 조합하여 설정
	              </span>
	            </div>
	            <div class="mb-3">
	              <label for="recipient-name" class="col-form-label">변경할 비밀번호 확인</label>
	              <input type="password" class="pw form-control" name="password2" id="pwCheck" onchange="isSame()"
	                placeholder="변경할 비밀번호 확인" required>
	              &nbsp;&nbsp; <span id="same"></span>
	            </div>
	            <div class="modal-footer">
	              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	              <button type="submit" class="btn btn-primary">변경</button>
	            </div>
	          </form>
	        </div>
	      </div>
	    </div>
	  </div>
	  <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
          tabindex="-1">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel">회원 탈퇴</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <br>
                코드런을 떠나신다니 너무 아쉽네요.<br>
                계정을 탈퇴한 후에는 회원님의 정보는 더이상 존재하지 않으며,<br>
                검색 결과에도 나타나지 않습니다.<br><br>
                탈퇴 하시겠습니까?<br><br>
              </div>
              <div class="modal-footer">
                <button class="btn btn-primary" data-bs-target="#exampleModalToggle2"
                  data-bs-toggle="modal">탈퇴하기</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
          tabindex="-1">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel2">회원 탈퇴</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                회원 탈퇴가 완료되었습니다.
              </div>
              <div class="modal-footer">
                <button class="btn btn-primary" data-bs-toggle="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>
    <script>
		(function(){
			const result = "${ requestScope.modifyResult }";
			if(result == "success"){
				alert('정보 수정에 성공하셨습니다.')
			} else if(result == "fail"){
				alert('정보 수정에 실패하셨습니다.')
			}
		})();
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/scripts.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</body>
</html>