<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	type="text/javascript"></script>
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
	font-family: 'nanumsquare', Arial, Helvetica, sans-serif
}
</style>

<header id="header1">
	<nav class="navbar navbar-expand navbar-dark mai-top-header"
		style="margin-bottom: 0px; margin-top: 20px; font-size: 18px">
		<div class="container">
			<div class="row">
				<div class="navbar-header col-lg-4">
					<a class="navbar-brand" href="#"
						style="font-size: 20px; color: #F15F5F;"> <img alt="사진안들어감"
						src="web/resources/homepage/images/yongdal.png"
						class="d-inline-block align-top">
					</a>
				</div>
				<div class="col-lg-5">
					<ul class="nav navbar-nav navbar-center">
						<li class="nav-item"><a class="nav-link" href="${contextPath}/driverMain.ydl"
							style="color: grey;">실시간예약</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/drivercal.ydl"
							style="color: grey;">배차일정</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/2yong.ydl"
							style="color: grey;">이용안내</a></li>
						<li class="nav-item"><a class="nav-link" href=""
							style="color: grey;">고객센터</a></li>
					</ul>
				</div>
				<div class="col-lg-3">
					<ul class="nav navbar-nav float-lg-right navbar-right">
						<li class="nav-item">
							<button class="btn btn-default navbar-btn"
								style="background: #F15F5F; color: white">로그인</button>
						</li>
						<li class="nav-item">
							<button class="btn btn-outline-default navbar-btn"
								style="background: white">회원가입</button>
						</li>
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