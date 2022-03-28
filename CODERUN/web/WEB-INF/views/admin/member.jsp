<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <!-- 로그아웃 클릭 시 메인페이지 이동 + 로그아웃 상태 변경.!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                              <li><a class="dropdown-item" href="${ pageContext.servletContext.contextPath }/member/logout">Sign out</a></li>
                            </ul>
                          </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <form action="${ pageContext.servletContext.contextPath }/admin/member/list" method="GET">
                            <div class="input-group mb-4 border rounded-pill p-1">
                                <div class="input-group-prepend border-0">
                                <!-- button type=button->submit -->
                                <%-- <select id="Condition" name="searchCondition">
                                	<option value="id" ${ param.searchCondition == 'id' ? "selected" : "" }>아이디</option>
                                </select> --%>
                                <button id="button-addon4" type="submit" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
                                </div> 
                               <input type="search" placeholder="검색" aria-describedby="button-addon4" class="form-control bg-none border-0" style="margin-right: 20px;"
                                name="searchValue"	value="${ param.searchValue }">
                            </div> 
                        </form>
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">회원 구분</th>
                                    <th scope="col">아이디</th>
                                    <th scope="col">상세 조회</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- c:forEach 추가!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                                    <c:forEach var="adminMember" items="${ memList }">
                                    <tr>
                                        <td id="type">${ adminMember.type }</td>
                                        <td id="id">${ adminMember.id }</td>
                                        <td><a type="button" data-bs-toggle="modal" href="#" data-bs-target="#user-detail" class="user-detail">자세히보기</a></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <br>
							<jsp:include page="../common/paging.jsp"/>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <!-- popup-->
        <div class="modal hide" tabindex="-1" id="user-detail" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="id"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="margin-left: 30px;">
                        <br>
                        <div class="row">
                            <div class="col-4">
                                <img src="${ pageContext.servletContext.contextPath }/resources/img/profile-example.png" class="imgArea" id="imgArea" style="width: 150px;">
                            </div>
                            <div class="col-8">
                                <h5>기본 정보</h5><br>
                                <div class="mb-3 row">
                                    <label for="exampleFormControlInput1" class="col-md-3 col-form-label">이름</label>
                                    <div class="col-md-9">
                                        <input type="text" readonly class="form-control-plaintext" id="exampleFormControlInput1" value="">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="exampleFormControlInput1" class="col-md-3 col-form-label">이메일</label>
                                    <div class="col-md-9">
                                        <input type="text" readonly class="form-control-plaintext" id="exampleFormControlInput1" value="">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="exampleFormControlInput1" class="col-md-3 col-form-label">생년월일</label>
                                    <div class="col-md-9">
                                        <input type="text" readonly class="form-control-plaintext" id="exampleFormControlInput1" value="">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="exampleFormControlInput1" class="col-md-3 col-form-label">성별</label>
                                    <div class="col-md-9">
                                        <input type="text" readonly class="form-control-plaintext" id="exampleFormControlInput1" value="">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="exampleFormControlInput1" class="col-md-3 col-form-label">유형</label>
                                    <div class="col-md-9">
                                        <input type="text" readonly class="form-control-plaintext" id="exampleFormControlInput1" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br><br>
                        <!-- 결제정보 넣어야 함 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                        <h5>자기 소개</h5><br>
                        <div class="mb-3">
                            <textarea class="form-control-plaintext" id="exampleFormControlTextarea1" rows="5" style="resize: none" readonly>인간의 생명을 봄바람을 가는 꽃이 소담스러운 찾아 피가 있다. 예수는 맺어, 못할 얼마나 사람은 무한한 하는 사랑의 봄바람을 힘있다. 생명을 위하여서 붙잡아 가는 쓸쓸하랴? 희망의 영락과 그것은 물방아 열매를 부패뿐이다. 전인 불어 때에, 보배를 방황하였으며, 것이다. 살 눈이 끓는 시들어 이것은 청춘에서만 봄바람이다. 눈이 불어 황금시대를 너의 것은 가치를 만물은 맺어, 있는가? 인간에 못할 가치를 동산에는 소리다.이것은 듣는다. 못할 힘차게 평화스러운 속에 못할 봄바람을 그들은 구하지 가는 아니다. 보는 이상, 되는 이것이다. 실현에 어디 넣는 대고, 과실이 풍부하게 기관과 이상은 말이다. 착목한는 가장 방황하여도, 튼튼하며, 방황하였으며, 천하를 기쁘며, 아니다. 능히 못할 눈에 이상 돋고, 이상 것이다. 할지라도 못하다 속에 보이는 그들은 설레는 되려니와, 것은 칼이다. 이는 방황하였으며, 끓는 몸이 투명하되 끝까지 길지 동산에는 목숨을 있으랴? 하는 우는 청춘 희망의 산야에 바로 인생을 방황하였으며, 무한한 것이다. 방황하여도, 인생에 새가 그리하였는가? 실로 이 피부가 트고, 인생을 꾸며 원대하고, 작고 있다. 이상이 풍부하게 위하여서 이상은 석가는 같이 살았으며, 속에서 이것이다. 청춘의 위하여서 없으면, 없는 두손을 무한한 눈에 앞이 봄바람이다. 것이 속에서 피에 얼마나 있는 주며, 것이다. 하여도 것은 싹이 공자는 있으랴? 불어 열매를 이것은 같으며, 희망의 같은 품에 것이다. 발휘하기 원대하고, 무엇을 약동하다. 뜨고, 뭇 우는 황금시대의 생명을 청춘의 공자는 아니다. 것은 주는 청춘의 그림자는 싹이 광야에서 힘차게 인간이 황금시대를 사막이다. 찾아 인생의 그들을 이 두기 원대하고, 그들의 수 것이다. 천고에 작고 역사를 끓는 교향악이다. 발휘하기 풀밭에 싸인 인간이 그러므로 부패뿐이다. 속에 있는 얼음과 가치를 것은 보이는 착목한는 것이다. 군영과 청춘의 속잎나고, 풀이 남는 이것이다. 끓는 대고, 얼마나 피고 이상의 때문이다.
                            </textarea>
                        </div>
                        <br>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>
