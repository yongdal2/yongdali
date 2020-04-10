<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="AOS - Animate On Scroll library using CSS3">
    <meta name="keywords" content="AOS, animate on scroll, css3 scroll animations, simple scroll animations">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/userMyPage.css" />
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    
    <!-- Bootstrap Dropdown Hover CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/myPage/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/myPage/bootstrap-dropdownhover.min.css" rel="stylesheet">
	
    <title>용달이 | 예약 내역</title>
</head>
<body>


	<div style="display: flex; margin-left: 400px; margin-top: 300px">
		<div OnClick="location.href ='information.ydl'"
			style="width: 100px; height: 100px; background: lightblue; cursor: pointer; border-radius: 10px; margin-right: 20px;">
			차량안내</div>
		<div OnClick="location.href ='addrBook.myp'"
			style="width: 100px; height: 100px; background: lightcoral; cursor: pointer; border-radius: 10px; margin-right: 20px;">
			주소록</div>
		<div OnClick="location.href ='myRSV.myp'"
			style="width: 100px; height: 100px; background: lightgreen; cursor: pointer; border-radius: 10px; margin-right: 20px;">
			예약내역</div>
		<div OnClick="location.href ='myInfo.myp'"
			style="width: 100px; height: 100px; background: lightpink; cursor: pointer; border-radius: 10px; margin-right: 20px;">
			계정정보</div>
		<div OnClick="location.href ='truckInfo.myp'"
			style="width: 100px; height: 100px; background: green; cursor: pointer; border-radius: 10px; margin-right: 20px; color: white;">
			차량정보</div>
		<div OnClick="location.href ='driverSettle.myp'"
			style="width: 100px; height: 100px; background: lightslategrey; cursor: pointer; border-radius: 10px; margin-right: 20px; color: white;">
			운전자정산</div>
	</div>
	
	
	<!-- ex1 -->
	<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
   Dropdown <span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li class="dropdown">
      <a href="#">One more dropdown</a>
      <ul class="dropdown-menu">
        <li><a href="#">Action</a></li>
        <li><a href="#">Another action</a></li>
        <li class="dropdown">
          <a href="#">One more dropdown</a>
          <ul class="dropdown-menu">
          </ul>
        </li>
        <li><a href="#">Something else here</a></li>
        <li><a href="#">Separated link</a></li>
       </ul>
    </li>
    <li><a href="#">Something else here</a></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>


<br>

<!-- 예제2 -->

<div class="collapse navbar-collapse" data-hover="dropdown" data-animations="fadeInDown fadeInRight fadeInUp fadeInLeft">
    <ul class="nav navbar-nav">
    </ul>
</div>
or
<div class="collapse navbar-collapse">
    <ul class="nav navbar-nav" data-hover="dropdown" data-animations="fadeInDown fadeInRight fadeInUp fadeInLeft">
    </ul>
</div>



	
	
	<!-- script -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	   <!-- Bootstrap Dropdown Hover JS -->
    <script src="${pageContext.request.contextPath}/resources/js/myPage/bootstrap-dropdownhover.min.js"></script>
</body>
</html>