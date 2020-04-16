<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/login&signUp.js"></script>	
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"
	rel="stylesheet" type="text/css">

<style>
#header1 {
	font-family: 'nanumsquare', Arial, Helvetica, sans-serif !important;
}
</style>

<header id="header1">
	<nav class="navbar navbar-expand navbar-dark mai-top-header"
		style="margin-bottom: 18px; padding-top: 23px; font-size: 18px;">
		<div class="container">
			<div class="row">
				<div class="navbar-header col-lg-4">
					<a class="navbar-brand" href="driverMain.ydl"
						style="font-size: 20px; color: #F15F5F; padding-top: 0px;" > <img alt="용달이로고(red)"
						src="${pageContext.request.contextPath}/resources/images/ydl_logo/ydl_lg_red(150X50).png"
						class="d-inline-block align-top" style="height: 48px;">
					</a>
				</div>
				<div class="col-lg-5">
					<ul class="nav navbar-nav navbar-center">
						<li class="nav-item"><a class="nav-link" href="${contextPath}/baeDetail.do?mNo=${loginUser.mNo}"
							style="color: black; font-weight: bold;">실시간예약</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/drivercal.ydl"
							style="color: black; font-weight: bold"">배차일정</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/2yong.ydl"
							style="color: black; font-weight: bold"">이용안내</a></li>
						<li class="nav-item"><a class="nav-link" href="dNoticeMain.no"
							style="color: black; font-weight: bold"">고객센터</a></li>
					</ul>
				</div>
				<div class="col-lg-3">
					<ul class="nav navbar-nav float-lg-right navbar-right">
						<!-- <li class="nav-item">
							<button class="btn btn-default navbar-btn loginView"
								style="background: #F15F5F; color: white">로그인</button>
						</li>
						<li class="nav-item">
							<button class="btn btn-outline-default navbar-btn signUpView"
								style="background: white">회원가입</button>
						</li> -->
						<c:if test="${empty sessionScope.loginUser}">
							<jsp:forward page="/WEB-INF/views/user/home.jsp"/>
						</c:if>
						<c:if test="${!empty sessionScope.loginUser}">
							<c:if test='${loginUser.mSort eq ("관리자")}'>
								<li class="nav-item">
									<button class="btn btn-default navbar-btn adminPage" style="background: #F15F5F; color: white;">관리자 페이지</button>
								</li> 
								<li class="nav-item">
									<button class="btn btn-default navbar-btn userPage" style="background: #F15F5F; color: white;">일반 페이지</button>
								</li>
							</c:if>
							<c:if test='${loginUser.mSort ne ("관리자")}'>
								<li class="nav-item">
									<button class="btn btn-default navbar-btn myPage" style="background: #F15F5F; color: white;" onclick="location.href='truckInfo.myp'">마이페이지</button>
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
	<div class="jumbotron" style="background: #F15F5F; text-align: center;">
		<p style="color: white">용달이에는 다양한 차종이 준비되어 있습니다.</p>
		<h2 style="color: white">고객님의 용도에 맞는 트럭을 찾아보세요</h2>
	</div>
</header>