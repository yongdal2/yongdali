<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	type="text/javascript"></script>

<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<link
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"
	rel="stylesheet" type="text/css">
<!-- <link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet"> -->
<script src="${contextPath}/resources/js/login&signUp.js"></script>	
<style>
#header1 {
	font-family: 'nanumsquare', Arial, Helvetica, sans-serif
}

.chatBadge{
	position: absolute;
    border-radius: 50%;
    background-color: #df3102;
    padding: 0px 5px;
    color: white;
    top: 0px;
    right: 3px;
    font-size: 11px;
}
</style>

<header id="header1" style="border-bottom:1px solid #eee;">
	<nav class="navbar navbar-expand navbar-dark mai-top-header" style="margin-bottom: 18px; padding-top: 23px; font-size: 18px;">
		<div class="container">
			<div class="row">
			
			<%-- <input type="text" id="test1" value="${loginUser.mId}"/> --%>
			<div class="navbar-header col-lg-4">
				<a class="navbar-brand" href="#" style="font-size: 30px; color: rgb(87,187,138); padding-top: 0px;">
					<img alt="사진안들어감"src="${pageContext.request.contextPath}/resources/images/ydl_logo/ydl_lg_gr(150x50).png" class="d-inline-block align-top" style="height: 48px">
				</a>
			</div>
			<div class="col-lg-4">
				<ul class="nav navbar-nav navbar-center" style="margin-left:50px;">
					<li class="nav-item"><a class="nav-link" href="reservation.go" style="color: black; font-weight: bold">예약하기</a></li>
					<li class="nav-item"><a class="nav-link" href="information.ydl" style="color: black; font-weight: bold">차량안내</a></li>
					<li class="nav-item"><a class="nav-link" href="uNoticeMain.no" style="color: black; font-weight: bold">고객센터</a></li>
				</ul>
			</div>
			<div class="col-lg-4">
				<ul class="nav navbar-nav float-lg-right navbar-right">
					<c:if test="${empty sessionScope.loginUser}">
						<li class="nav-item">
							<button class="btn btn-default navbar-btn loginView" style="background: rgb(87,187,138); color: white;">로그인</button>
						</li>
						<li class="nav-item">
							<button class="btn btn-outline-default navbar-btn signUpView" style="background: white;" >회원가입</button>
						</li>
					</c:if>
					<c:if test="${!empty sessionScope.loginUser}">
						<c:if test='${loginUser.mSort eq ("관리자")}'>
							<li class="nav-item">
								<button class="btn btn-default navbar-btn adminPage" style="background: rgb(87,187,138); color: white;">관리자 홈</button>
							</li>
							<li class="nav-item">
								<button class="btn btn-default navbar-btn driverPage" style="background: rgb(87,187,138); color: white;">기사 홈</button>
							</li>
							<li class="nav-item">
								<button class="btn btn-default navbar-btn chatPage" onclick="adminChat();" style="background: none;border: none; position:relative;">
									<svg class="bi bi-chat-dots-fill" style="color:rgb(87,187,138);" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  									<path fill-rule="evenodd" d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 01-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0zm3 1a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
									</svg>
									<span class="chatBadge">N</span>
								</button>
							</li>
						</c:if>
						<c:if test='${loginUser.mSort ne ("관리자")}'>
							<li class="nav-item">
								<button class="btn btn-default navbar-btn myPage" style="background: rgb(87,187,138); color: white;" onclick="location.href='addrBook.myp'">마이페이지</button>
							</li>
						</c:if>
						<li class="nav-item">
							<button class="btn btn-outline-default navbar-btn logout" style="background: white;" >로그아웃</button>
						</li>
					</c:if>	
				</ul>
			</div>
		</div>
		</div>
	</nav>
</header>