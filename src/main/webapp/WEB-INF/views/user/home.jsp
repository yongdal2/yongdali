<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<html>
<head>
	<title>용달이 | 메인페이지</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/home_bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/home.css" />
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=03ea077d7ecc6636dffede985cc5c57d&libraries=services"></script>
	
	<!-- 카카오 아이디로 로그인 -->
	<script src="${contextPath}/resources/js/kakao.min.js"></script>
	<script type="text/javascript">
		Kakao.API.request({
		    url: '/v2/user/me',
		    success: function(response) {
		        console.log(response);
		    },
		    fail: function(error) {
		        console.log(error);
		    }
		});
	</script>
</head>
<body style="overflow-x: hidden;">
	<!-- header -->
	<c:import url="../common/home_nav.jsp"/>
	<!-- body -->
	<div id="booking" class="section">
		<div class="section-center">
			<div id="container1" class="container">
				<div class="row">
					<div id="mentDiv" class="col-md-5">
						<div class="booking-cta">
							<p id="ment-title" class="jal">&nbsp;&nbsp;&nbsp;&nbsp;당신이 원하는 단 하나의 트럭! </p>
							<p id="ment-content" class="chosun">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span id="ment-content-initcap">용달이</span>에는 운반에 필요한 다양한 차종이 준비되어 있습니다.
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								고객님의 용도에 맞는 트럭을 찾아보세요!
							</p>
						</div>
					</div>
					<div id="preEstimateDiv" class="col-md-6 col-md-offset-1">
						<div id="preEstimateForm" class="booking-form">
							<form>
								<div id="preEstimate-title">
									<h3 class="jal">요금 미리 알아보기</h3>
								</div>
								<hr>
								<div id="startAddrDiv1" class="row">
									<div id="form-group1" class="form-group">
										<input id="startAddr" class="form-control" type="text" onclick="searchStartAddr();">
										<span id="startAddr-title" class="form-label nanum">출발지
										</span>
										<img id="startAddr-img" src="${pageContext.request.contextPath}/resources/images/home/magnifying-glass-black.svg" alt="검색" onclick="searchStartAddr();">
									</div>
								</div>
								<div id="endAddrDiv1" class="row">
									<div id="form-group2" class="form-group">
										<input id="endAddr" class="form-control" type="text" onclick="searchEndAddr();">
										<span id="endAddr-title" class="form-label nanum">도착지
										</span>
										<img id="endAddr-img" src="${pageContext.request.contextPath}/resources/images/home/magnifying-glass-black.svg" alt="검색" onclick="searchEndAddr();">
									</div>
							
								</div>
								<div id="carSelectDiv" class="row">
									<div id="slDiv1" class="form-group">
										<span class="form-label nanum" style="margin-left: 23px;">차량 크기</span>
										<select id="sl1" class="form-control nanum" style="color: white;" onchange="cl1();">
											<option class="opt1" value="">선택</option>
											<option class="opt2" value="0">1톤</option>
											<option class="opt2" value="1">1.4톤</option>
											<option class="opt2" value="5">2.5톤</option>
											<option class="opt2" value="6">3톤</option>
											<option class="opt2" value="8">5톤</option>
										</select>
										<span class="select-arrow"></span>
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div id="slDiv2" class="form-group" style="width: 50%;">
										<span class="form-label nanum" style="margin-left: 37px;">옵션</span>
										<select id="sl2" class="form-control nanum" style="color: white;" onchange="cl2();">
											<option class="opt1" value="">선택</option>
											<option class="opt2" value="0">카고</option>
											<option class="opt2" value="2">호루</option>
											<option class="opt2" value="2">탑차</option>
											<option class="opt2" value="2">윙바디</option>
											<option class="opt2" value="2">리프트</option>
										</select>
										<span class="select-arrow"></span>
									</div>
								</div>
								<div id="preEstimateChargeDiv" class="row" align="right">
									<h4 id="preEstimateCharge" class="jal" style="font-size: 14pt;">예상 요금 &nbsp;&nbsp;&nbsp;<span id="preCharge">0</span>&nbsp;원 ~</h4>
								</div>
								<br>
								<div class="form-btn">
									<a href="reservation.go" id="submit-btn" class="submit-btn jal" style="font-size: 16pt;">예약하러 가기</a>
								</div>
							</form>
						</div>
						<small id="preCondition" class="chosun">&nbsp;&nbsp;&nbsp;* 산출된 요금은 추가 옵션이 적용되지 않은 기본요금입니다.</small>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 주소 검색창 -->
	<div id="myModal11" class="modal11">
		<div id="layer">
			<img id="searchAddr" src="https://t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>		
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/home.js"></script>
	
	<!-- footer -->
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
