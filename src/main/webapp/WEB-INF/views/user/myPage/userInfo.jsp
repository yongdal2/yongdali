<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>

<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="AOS - Animate On Scroll library using CSS3">
    <meta name="keywords" content="AOS, animate on scroll, css3 scroll animations, simple scroll animations">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/userMyPage.css" />
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <title>용달이 | 계정 관리</title>
</head>
	<c:import url="../../common/nav.jsp"/>
<body>
	<body>
	<script>
		$(document).ready(function() {
			$("#header1>.jumbotron").css("display","none");
		});
	</script>
	
	<!-- 점보트론 -->
	<div class="jumbotron" id="driverMyPjumbo">
		<div class="container">
			<div class="row">
				<div class="col-xs-9 col-md-9">
					<div class="h2 jal">
						어서오세요 정해인님!
					</div>
					<br>
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<div class="h4 na">E-mail</div>
							<div class="h3 jal lg mgt">sols@gmail.com</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="h4 na">연락처</div>
							<div class="h3 jal lg mgt">
								010-2712-6866
								<div class="glyphicon glyphicon-pencil hvDr" data-toggle="modal"
									data-target="#changePhone"></div>
							</div>
						</div>
					</div>
					<div class="hvDr">
						<span class="na h4" data-toggle="modal" data-target="#changePwd">
							비밀번호 변경</span>
						</div>
				</div>
				<div class="col-xs-3 col-md-3">
					<div class="img-circle" id="pro_img"
						style="background-image: url('https://img1.daumcdn.net/thumb/R750x0/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fcafeattach%2F1Xh2D%2Fe9efdcce7223d088ee2e401a429f62f86cdff6cb');">
						<div class="editP sub text-center" data-toggle="modal"
							data-target="#changePhoto">
							<div class="glyphicon glyphicon-pencil"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 세미바 -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 h3">
				<a href="truckInfo.myp"><span class="semibar_span">차량정보</span></a>
				<a href="driverSettle.myp"><span class="semibar_span">정산</span></a>
			</div>
		</div>
	</div>
</body>

	<c:import url="../../common/footer.jsp"/>

</html>