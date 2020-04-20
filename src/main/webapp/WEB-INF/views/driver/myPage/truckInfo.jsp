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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/driverMyPage.css"/>
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<title>용달이 | 차량 정보</title>
</head>
<body>
	<c:import url="../../common/nav_driver.jsp" />
	<c:import url="../../driver/myPage/driverInfo.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 h2 jal">
				차량 정보
			</div>
			
			<div class="col-xs-12 col-md-12 na bBoxb">
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<p class="carInf bdbt1">
							<span class="lg">차량번호</span>
							<br>
							<span class="h3 carInf fw6">${ driver.carNo }</span>
						</p>
						<br>
						<br>
						<p class="carInf bdbt1">
							<span class="lg">톤수</span>
							<br>
							<span class="h3 carInf fw6">${ driver.capacity }</span>
						</p>
						<br>
						<br>
						<p class="carInf bdbt1">
							<span class="lg">차종</span>
							<br>
							<span class="h3 carInf fw6">${ driver.type }</span>
						</p>
						<br>
						<p class="carInf">
							<span class=>문의사항이 있으신가요?</span>
							<br>
							<span class="small">1:1채팅을 통해 답변해드리겠습니다.</span>
							<br>
							<span class="small hvbs">1:1채팅 바로가기</span>
						</p>
					</div>
					<div class="col-xs-1 col-md-1">
					</div>
					<div class="col-xs-5 col-md-5">
						<p class="carInf bdbt1">
							<span class="lg"> </span> <br> <span class="h3 carInf fw6">차량등록증</span>
							<br>
						</p>
						<img
							src="${contextPath}/resources/images/driver/regCard/${driver.regCardImgRename}"
							height="327px" class="zoom-in" data-toggle="modal"
									data-target="#zoomCRA"> <br>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 차랑등록증 크게보기 -->
	<div class="modal fade" id="zoomCRA" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
					<img
							src="${contextPath}/resources/images/driver/regCard/${driver.regCardImgRename}"
							width="600px" >
				</div>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp" />
</body>
</html>