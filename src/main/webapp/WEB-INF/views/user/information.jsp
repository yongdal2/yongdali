<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>

<head>
<link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainInfo.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<body>
	<c:import url="../common/nav.jsp"/>

	<script>
        AOS.init({});
    </script>

	<div class="container">
		<!-- 이용안내 -->
		<div class="row" id="use_info">
			<div class="h2 jal">
				<a href="#use" id="use"><span class="semibar_span">이용 안내</span></a>
				<a href="#car"><span class="semibar_span">차량 안내</span></a>				
				<a href="#size"><span class="semibar_span">적재 크기 안내</span></a>				
				<a href="#price"><span class="semibar_span">운송비 기준</span></a>				
				<hr>
			</div>
			<br>
			<div class="h2 text-center jal">빠르고 쉽게 쓰는 용달이 이용 안내</div>
			<br>
			<div class="row aos-init aos-animate">
				<div class="ydl_abs_cont_sh" data-aos="fade-up"
					data-aos-easing="ease-in-out-sine" data-aos-duration="400"
					data-aos-delay="0">
					<div class="ydl_step_abs text_center col-md-12">
						<h3 class="text-center">
							<span class="label ydl_c">STEP1</span>
						</h3>
						<br>
						<div class="text-center">
							<img
								src="${pageContext.request.contextPath}/resources/images/info/step1.png"
								class="img-thumbnail" alt="step1.png">
						</div>
						<div class="h3 text-center">
							<p class="noto fw6">
								<br>배송 수단 선택 이삿짐 선택
							</p>
						</div>
						<div class="h4 na col-md-12 text-center">
							배송할 짐의 크기에 맞춰 차량의 크기와 타입을 선택 한 후 파손, 또는 분실, 정확한 배송을 위해 배송할 품목들을 선택 합니다.
							<br><br><br>
						</div>
					</div>
				</div>
			</div>
			<div class="row aos-init aos-animate">
				<div class="ydl_abs_cont_sh" data-aos="fade-up"
					data-aos-easing="ease-in-out-sine" data-aos-duration="400"
					data-aos-delay="200">
					<div class="ydl_step_abs text_center col-md-12">
						<h3 class="text-center">
							<span class="label ydl_c">STEP2</span>
						</h3>
						<br>
						<div class="text-center">
							<img
								src="${pageContext.request.contextPath}/resources/images/info/step3.png"
								class="img-thumbnail" alt="step3.png">
						</div>
						<div class="h3 text-center">
							<p class="noto fw6">
								<br>출발지와 도착지 정보 입력 
							</p>
						</div>
						<div class="h4 na col-md-12 text-center">
							이삿짐 혹은 배송할 품목이 출발할 장소, 도착한 장소를 설정 한 후 상차 시간과 날짜를 지정합니다. <br>
							바로 상차의 경우 적재 가능한 차량을 바로 예약하며 바로 하차의 경우 도착지에서 바로 짐을 하차합니다. <br>
							상차 이후 보관기관이 발생할 겨우 별도의 비용이 발생합니다.
							<br><br><br>
						</div>
					</div>
				</div>
			</div>
			<div class="row aos-init aos-animate">
				<div class="ydl_abs_cont_sh" data-aos="fade-up"
					data-aos-easing="ease-in-out-sine" data-aos-duration="400"
					data-aos-delay="200">
					<div class="ydl_step_abs text_center col-md-12">
						<h3 class="text-center">
							<span class="label ydl_c">STEP3</span>
						</h3>
						<br>
						<div class="text-center">
							<img
								src="${pageContext.request.contextPath}/resources/images/info/step5.png"
								class="img-thumbnail" alt="step5.png">
						</div>
						<div class="h3 text-center">
							<p class="noto fw6">
								<br> 상하차 방법 선택 전달사항 입력
							</p>
						</div>
						<div class="h4 na col-md-12 text-center">
							상항차시 도움이 필요한 경우 도움이 필요해요를 체크하여 기사님과 함께 상하차 또는 기사님 단독 하차 선택이 가능합니다.<br>
							추가적인 전달 사항이 있을경우 전달사항을 통해 전달할 수 있습니다.
							<br><br><br>
						</div>
					</div>
				</div>
			</div>
			<br> <br> <br>
		</div>
		<!-- 차량안내 -->
		<div class="row">
			<div class="h2 jal">
				<span class="h2" id="car">차량 안내</span>
			</div>
			<hr>
			<br>
			<div class="h2 text-center jal">빠르고 쉽게 쓰는 용달이 차량 안내</div>
			<br> <br> <br>
			<div class="row">
				<!-- 카고 -->
				<div class="col-xs-6 col-md-4 aos-init aos-animate"
					data-aos="zoom-out" data-aos-duration="800" data-aos-delay="100">
					<img
						src="${pageContext.request.contextPath}/resources/images/truck/cargo-image.png"
						alt="" class="img-thumbnail">
					<div class="h3">
						<span class="span na fw6">카고</span>
						<div class="badge ydl_c lh15">1t</div>
						<div class="badge ydl_c lh15">1.4t</div>
						<div class="badge ydl_c lh15">2.5t</div>
						<div class="badge ydl_c lh15">3.5t</div>
						<div class="badge ydl_c lh15">5t</div>
						<div class="h5">
							흔히 알고 있는 일반적인 형태의 트럭입니다. 적재함이 오픈되어 있어 적재물 파악이 쉽습니다. 하지만 비나 눈 등
							날씨의 영향으로부터 적재물을 보호하기 어렵습니다. <br> <br>
						</div>
					</div>
				</div>
				<!-- 호루 -->
				<div class="col-xs-6 col-md-4 aos-init aos-animate"
					data-aos="zoom-out" data-aos-duration="800" data-aos-delay="100">
					<img
						src="${pageContext.request.contextPath}/resources/images/truck/horu-image.png"
						alt="" class="img-thumbnail">
					<div class="h3">
						<span class="span na fw6">호루</span>
						<div class="badge ydl_c lh15">1t</div>
						<div class="badge ydl_c lh15">1.4t</div>
						<div class="badge ydl_c lh15">2.5t</div>
						<div class="badge ydl_c lh15">3.5t</div>
						<div class="badge ydl_c lh15">5t</div>
						<div class="h5">
							가죽이나 비닐 등의 덮개가 씌워져 있는 트럭입니다. 비나 눈 등 날씨의 영향으로부터 적재물을 보호할 수 있습니다. <br>
							<br> <br>
						</div>
					</div>
				</div>
				<!-- 탑차 -->
				<div class="col-xs-6 col-md-4 aos-init aos-animate"
					data-aos="zoom-out" data-aos-duration="800" data-aos-delay="100">
					<img
						src="${pageContext.request.contextPath}/resources/images/truck/top-image.png"
						alt="" class="img-thumbnail">
					<div class="h3">
						<span class="span na fw6">탑차</span>
						<div class="badge ydl_c lh15">1t</div>
						<div class="badge ydl_c lh15">1.4t</div>
						<div class="badge ydl_c lh15">2.5t</div>
						<div class="badge ydl_c lh15">3.5t</div>
						<div class="badge ydl_c lh15">5t</div>
						<div class="h5">
							적재함이 사각형 형태로 되어 있고 장금장치가 있는 트럭입니다. 날씨, 도난, 파손 등 외부의 영향으로부터 적재물을
							보호할 수 있습니다. 식자재, 택배 물품 등의 운반에 주로 스입니다. <br> <br>
						</div>
					</div>
				</div>
				<!-- 윙바디 -->
				<div class="col-xs-6 col-md-4 aos-init aos-animate"
					data-aos="zoom-out" data-aos-duration="800" data-aos-delay="100">
					<img
						src="${pageContext.request.contextPath}/resources/images/truck/wingbody-image.png"
						alt="" class="img-thumbnail">
					<div class="h3">
						<span class="span na fw6">윙바디</span>
						<div class="badge ydl_c lh15">1t</div>
						<div class="badge ydl_c lh15">1.4t</div>
						<div class="badge ydl_c lh15">2.5t</div>
						<div class="badge ydl_c lh15">3.5t</div>
						<div class="badge ydl_c lh15">5t</div>
						<div class="h5">
							적재함을 날개처럼 양쪽으로 개폐할 수 있는 트럭입니다. 날씨, 도난, 파손 등 외부의 영향으로부터 적재물을 보호할 수
							있습니다. 또한 지게차를 이용한 상하차가 용이합니다. <br> <br> <br>
						</div>
					</div>
				</div>
				<!-- 리프트 -->
				<div class="col-xs-6 col-md-4 aos-init aos-animate"
					data-aos="zoom-out" data-aos-duration="800" data-aos-delay="100">
					<img
						src="${pageContext.request.contextPath}/resources/images/truck/lift-image.png"
						alt="" class="img-thumbnail">
					<div class="h3">
						<span class="span na fw6">리프트</span>
						<div class="badge ydl_c lh15">1t</div>
						<div class="badge ydl_c lh15">1.4t</div>
						<div class="badge ydl_c lh15">2.5t</div>
						<div class="badge ydl_c lh15">3.5t</div>
						<div class="badge ydl_c lh15">5t</div>
						<div class="h5">
							무거운 제품의 상하차를 위해 리프팅 장비를 탑재한 트럭입니다. 대형 가전제품과 가구, 오토바이 등의 상하차에 주로
							쓰입니다. <br> <br> <br>
						</div>
					</div>
				</div>
			</div>
			<br> <br>
		</div>
		<!-- 적재 크기 안내 -->
		<div class="row">
			<div class="h2 jal">
				<span class="h2" id="size">적재 크기 안내 </span>
			</div>
			<hr>
			<br>
			<div class="h2 text-center jal">용달이 차량 적재 크기 안내</div>
			<br> <br>
			<div class="row">
				<img
					src="https://www.1truck.co.kr/static/images/carrying-capacity-image.png"
					class="col-xs-6 col-md-4 aos-init aos-animate" data-aos="zoom-in"
					data-aos-duration="800" data-aos-delay="100" style="border: none;">
				<div class="col-xs-6 col-md-8 text-center aos-init aos-animate"
					data-aos="zoom-in" data-aos-duration="800" data-aos-delay="100">
					<table class="table table-hover table-striped  h4 na text-center">
						<thead class="text-center">
							<tr class="fw6">
								<th style="text-align: center;">톤수(ton)</th>
								<th style="text-align: center;">가로(cm)</th>
								<th style="text-align: center;">세로(cm)</th>
								<th style="text-align: center;">높이(cm)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1톤</td>
								<td>160</td>
								<td>280</td>
								<td>180</td>
							</tr>
							<tr>
								<td>1.4</td>
								<td>170 </td>
								<td>310 </td>
								<td>180</td>
							</tr>
							<tr>
								<td>2.5</td>
								<td>170 </td>
								<td>310 </td>
								<td>180</td>
							</tr>
							<tr>
								<td>3.5</td>
								<td>170 </td>
								<td>310 </td>
								<td>180</td>
							</tr>
							<tr>
								<td>5</td>
								<td>170 </td>
								<td>310</td>
								<td>180</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 적재 크기 안내 -->
		<div class="row">
			<div class="h2 jal">
			<br>
			<br>
			<br>
				<span class="h2" id="price">운송비 기준</span>
			</div>
			<hr>
			<br>
			<div class="h2 text-center jal">운송비 기준표(서울만)</div>
			<div class="row text-right">
				<div class="col-xs-10 col-xs-offset-1 col-md-10 col-md-offset-1">(가격단위 : 만원)</div>
			</div>
			<div class="row text-center">
			<div class="col-xs-10 col-xs-offset-1 col-md-10 col-md-offset-1 text-center aos-init aos-animate"
					data-aos="zoom-in" data-aos-duration="800" data-aos-delay="100">
					<table class="table table-hover table-bordered h4 na text-center">
						<thead class="text-center" >
							<tr class="fw6" style="background-color: rgb(87,187,138); ">
								<th style="text-align: center; color: white;">이동거리</th>
								<th style="text-align: center; color: white;">1톤</th>
								<th style="text-align: center; color: white;">1.4톤</th>
								<th style="text-align: center; color: white;">2.5톤</th>
								<th style="text-align: center; color: white;">3.5톤</th>
								<th style="text-align: center; color: white;">5톤</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="fw6">10km</td>
								<td>4</td>
								<td>5</td>
								<td>9</td>
								<td>10</td>
								<td>12</td>
							</tr>
							<tr>
								<td class="fw6">20km</td>
								<td>6</td>
								<td>7</td>
								<td>11</td>
								<td>12</td>
								<td>14</td>
							</tr>
							<tr>
								<td class="fw6"td>30km</td>
								<td>7</td>
								<td>8</td>
								<td>12</td>
								<td>13</td>
								<td>15</td>
							</tr>
							<tr>
								<td class="fw6">50km</td>
								<td>8</td>
								<td>9</td>
								<td>13</td>
								<td>14</td>
								<td>16</td>
							</tr>
							<tr>
								<td class="fw6">70km</td>
								<td>9</td>
								<td>10</td>
								<td>14</td>
								<td>15</td>
								<td>19</td>
							</tr>
							<tr>
								<td class="fw6">90km</td>
								<td>10</td>
								<td>11</td>
								<td>15</td>
								<td>16</td>
								<td>21</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
		<br> <br> <br>
		<div class="row text-center">
			<button class="btn btn-lg btn-default na fw6 aos-init aos-animate"
				onclick="location.href='#header1'" data-aos="flip-left"
				data-aos-duration="2000" data-aos-anchor-placement="center-bottom">페이지
				상단으로 가기</button>
		</div>
	<br>
	<br>
	<c:import url="../common/footer.jsp"/>
</body>

</html>
