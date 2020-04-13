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
<style>
#header1 {
		font-family: 'nanumsquare', Arial, Helvetica, sans-serif !important;
}
</style>

<header id="header1">
	<nav class="navbar navbar-expand navbar-dark mai-top-header" style="margin-bottom: 18px; padding-top: 23px; font-size: 18px;">
		<div class="container">
			<div class="row">
			<div class="navbar-header col-lg-4">
				<a class="navbar-brand" href="home.do" style="font-size: 30px; color: rgb(90,140,255); padding-top: 0px;">
					<img alt="용달이로고(gr)"src="${pageContext.request.contextPath}/resources/images/ydl_logo/ydl_lg_bl(150x50).png" class="d-inline-block align-top" style="height: 48px">
				</a>
			</div>
			<div class="col-lg-4">
				<ul class="nav navbar-nav navbar-center" style="margin-left:50px;">
					<li class="nav-item"><a class="nav-link" href="#" style="color: rgb(90,140,255);; font-weight: bold;">요금조회</a></li>
					<li class="nav-item"><a class="nav-link" href="information.ydl" style="color: rgb(90,140,255); font-weight: bold;">차량안내</a></li>
					<li class="nav-item"><a class="nav-link" href="uNoticeMain.no" style="color: rgb(90,140,255); font-weight: bold;">고객센터</a></li>
				</ul>
			</div>
			<div class="col-lg-4">
				<ul class="nav navbar-nav float-lg-right navbar-right">
					<c:if test="${empty sessionScope.loginUser}">
						<li class="nav-item">
							<button class="btn btn-default navbar-btn loginView" style="background: rgb(90,140,255); color: white;">로그인</button>
						</li>
						<li class="nav-item">
							<button class="btn btn-outline-default navbar-btn signUpView" style="background: white;" >회원가입</button>
						</li>
					</c:if>
					<c:if test="${!empty sessionScope.loginUser}">
						<c:if test='${loginUser.mSort eq ("관리자")}'>
							<li class="nav-item">
								<button class="btn btn-default navbar-btn adminPage" style="background: rgb(90,140,255); color: white;">관리자 페이지</button>
							</li>
							<li class="nav-item">
								<button class="btn btn-default navbar-btn driverPage" style="background: rgb(90,140,255); color: white;">기사 페이지</button>
							</li>
						</c:if>
						<c:if test='${loginUser.mSort ne ("관리자")}'>
							<li class="nav-item">
								<button class="btn btn-default navbar-btn myPage" style="background: rgb(90,140,255); color: white;">마이페이지</button>
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
	
	
	 <div class="jumbotron" style="margin-bottom:0px; background: rgb(90,140,255); text-align: center;">
		<p style="color: white">용달이에는 다양한 차종이 준비되어 있습니다.</p>
		<h2 style="color: white" >고객님의 용도에 맞는 트럭을 찾아보세요</h2>
	</div>
</header>