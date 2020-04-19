<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>용달이 | 예약하기</title>

<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css" />
<!-- map API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=03ea077d7ecc6636dffede985cc5c57d&libraries=services"></script>
<!-- font -->
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" />
</head>
<body>
	<!-- header -->
	<c:import url="../common/home_nav.jsp" />

	<!-- body -->
	<form id="revForm" action="rev.do" method="post">
		<div id="body-div" class="container">
			<div>
				<h2 style="font-family: 'yg-jalnan';">용달이 예약이요~</h2>
				<hr style="border-color: black;">
			</div>
			<div style="display: flex;">
				<div>
					<div id="line1">
						<div class="edge11">
							<div class="title11">
								<label id="carGuide1"> <img src="${pageContext.request.contextPath}/resources/images/reservation/question-mark.svg" alt="안내"> <span id="carGuide-ment">차량 안내가 필요하신가요?</span>
								</label> 차량 정보
							</div>
							<div id="carOption-div" class="content22">
								<select name="capacity1" id="sl1" onchange="cl1();" required>
									<option class="opt1" value="" disabled selected>톤수 선택</option>
									<option class="opt2" value="1">1톤</option>
									<option class="opt2" value="1.4">1.4톤</option>
									<option class="opt2" value="2.5">2.5톤</option>
									<option class="opt2" value="3.5">3.5톤</option>
									<option class="opt2" value="5">5톤</option>
								</select> <select name="type" id="sl2" onchange="cl2();" required>
									<option class="opt1" value="" disabled selected>차종 선택</option>
									<option class="opt2" value="카고">카고</option>
									<option class="opt2" value="호루">호루</option>
									<option class="opt2" value="탑차">탑차</option>
									<option class="opt2" value="윙바디">윙바디</option>
									<option class="opt2" value="리프트">리프트</option>
								</select>
							</div>
						</div>
						<div class="edge11">
							<div class="title11">
								<label id="selectLoad-btn"> <img src="${pageContext.request.contextPath}/resources/images/reservation/round-add.svg" alt="안내"> <span id="load-title">이삿짐 선택</span>
								</label> 이삿짐
							</div>
							<div id="load-content-div" class="content22">
								<textarea name="luggage" id="load-content-area" cols="64" rows="3" placeholder="파손이나 분실시 확인할 수 있도록&#13;&#10;이삿짐 품목을 선택해주세요." readonly required></textarea>
							</div>
						</div>
					</div>
					<div id="line2">
						<div class="edge11">
							<div class="title11">
								<button id="stAddrList" type="button" class="addrList">
									<img src="${pageContext.request.contextPath}/resources/images/reservation/magnifying-glass-black.svg" alt="검색" style="width: 17px; height: 17px;"> 주소록
								</button>
								출발지 정보
							</div>
							<div id="startAddr-div" class="content22">
								<div style="display: flex;">
									<input id="startName" name="startName" type="text" placeholder="이름" required>
									<input id="startPhone" name="startPhone" type="text" placeholder="연락처" onKeyup="inputPhoneNumber(this);" maxlength="13" required>
								</div>
								<div id="searchAddr-div1">
									<div id="searchAddr-div11">
										<input id="startAddr" type="text" placeholder="주소 검색 (주소, 건물명)" onclick="searchStartAddr();" readonly required> <img src="${pageContext.request.contextPath}/resources/images/reservation/magnifying-glass-black.svg" alt="검색" onclick="searchStartAddr();" style="cursor: pointer;">
									</div>
									<input id="startDetailAddr" type="text" placeholder="상세 주소" required>
								</div>
								<div align="left">
									<label id="start-check" class="checkbox-wrap"> <input id="checkLoad1" type="checkbox" name="rightLoad" value="바로 상차"> <i class="check-icon" style="margin-top: 2px;"></i>
										<div style="font-size: 16px;">&nbsp;&nbsp;바로 상차</div>
									</label>
								</div>
								<div style="display: flex;">
									<div id="start-date-div" class="input-group date">
										<input id="datepicker1" name="startDate1" type="text" placeholder="날짜 선택">
										<div id="dt1" class="input-group-addon">
											<span class="glyphicon glyphicon-th" style="color: white;"></span>
										</div>
									</div>
									<div>
										<select name="startTime" id="sl3" onchange="cl3();">
											<option class="opt3" value="" disabled selected>시간 선택</option>
											<option class="opt4" value="00:00">00시 00분</option>
											<option class="opt4" value="00:30">00시 30분</option>
											<option class="opt4" value="01:00">01시 00분</option>
											<option class="opt4" value="01:30">01시 30분</option>
											<option class="opt4" value="02:00">02시 00분</option>
											<option class="opt4" value="02:30">02시 30분</option>
											<option class="opt4" value="03:00">03시 00분</option>
											<option class="opt4" value="03:30">03시 30분</option>
											<option class="opt4" value="04:00">04시 00분</option>
											<option class="opt4" value="04:30">04시 30분</option>
											<option class="opt4" value="05:00">05시 00분</option>
											<option class="opt4" value="05:30">05시 30분</option>
											<option class="opt4" value="06:00">06시 00분</option>
											<option class="opt4" value="06:30">06시 30분</option>
											<option class="opt4" value="07:00">07시 00분</option>
											<option class="opt4" value="07:30">07시 30분</option>
											<option class="opt4" value="08:00">08시 00분</option>
											<option class="opt4" value="08:30">08시 30분</option>
											<option class="opt4" value="09:00">09시 00분</option>
											<option class="opt4" value="09:30">09시 30분</option>
											<option class="opt4" value="10:00">10시 00분</option>
											<option class="opt4" value="10:30">10시 30분</option>
											<option class="opt4" value="11:00">11시 00분</option>
											<option class="opt4" value="11:30">11시 30분</option>
											<option class="opt4" value="12:00">12시 00분</option>
											<option class="opt4" value="12:30">12시 30분</option>
											<option class="opt4" value="13:00">13시 00분</option>
											<option class="opt4" value="13:30">13시 30분</option>
											<option class="opt4" value="14:00">14시 00분</option>
											<option class="opt4" value="14:30">14시 30분</option>
											<option class="opt4" value="15:00">15시 00분</option>
											<option class="opt4" value="15:30">15시 30분</option>
											<option class="opt4" value="16:00">16시 00분</option>
											<option class="opt4" value="16:30">16시 30분</option>
											<option class="opt4" value="17:00">17시 00분</option>
											<option class="opt4" value="17:30">17시 30분</option>
											<option class="opt4" value="18:00">18시 00분</option>
											<option class="opt4" value="18:30">18시 30분</option>
											<option class="opt4" value="19:00">19시 00분</option>
											<option class="opt4" value="19:30">19시 30분</option>
											<option class="opt4" value="20:00">20시 00분</option>
											<option class="opt4" value="20:30">20시 30분</option>
											<option class="opt4" value="21:00">21시 00분</option>
											<option class="opt4" value="21:30">21시 30분</option>
											<option class="opt4" value="22:00">22시 00분</option>
											<option class="opt4" value="22:30">22시 30분</option>
											<option class="opt4" value="23:00">23시 00분</option>
											<option class="opt4" value="23:30">23시 30분</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="edge11">
							<div class="title11">
								<button id="edAddrList" type="button" class="addrList">
									<img src="${pageContext.request.contextPath}/resources/images/reservation/magnifying-glass-black.svg" alt="검색" style="width: 17px; height: 17px;">
									<div>주소록</div>
								</button>
								도착지 정보
							</div>
							<div id="endAddr-div" class="content22">
								<div style="display: flex;">
									<input id="endName" name="endName" type="text" placeholder="이름" required> <input id="endPhone" name="endPhone" type="text" placeholder="연락처" onKeyup="inputPhoneNumber(this);" maxlength="13" required>
								</div>
								<div id="searchAddr-div2">
									<div id="searchAddr-div22">
										<input id="endAddr" name="edAddr" type="text" placeholder="주소 검색 (주소, 건물명)" onclick="searchEndAddr();" readonly required> <img src="${pageContext.request.contextPath}/resources/images/reservation/magnifying-glass-black.svg" alt="검색" onclick="searchEndAddr();" style="cursor: pointer;">
									</div>
									<input id="endDetailAddr" name="edDetailAddr" type="text" placeholder="상세 주소" required>
								</div>
								<div align="left">
									<label id="end-check" class="checkbox-wrap"> <input id="checkLoad2" name="rightUnload" type="checkbox" value="바로 하차"> <i class="check-icon" style="margin-top: 2px;"></i>
										<div style="font-size: 16px;">&nbsp;&nbsp;바로 하차</div>
									</label>
								</div>
								<div style="display: flex;">
									<div id="end-date-div" class="input-group date">
										<input id="datepicker2" name="endDate1" type="text" placeholder="날짜 선택" onchange="setEndDate();">
										<div id="dt2" class="input-group-addon">
											<span class="glyphicon glyphicon-th" style="color: white;"></span>
										</div>
									</div>
									<div>
										<select name="endTime" id="sl4" onchange="cl4();">
											<option class="opt3" value="" disabled selected>시간 선택</option>
											<option class="opt4" value="00:00">00시 00분</option>
											<option class="opt4" value="00:30">00시 30분</option>
											<option class="opt4" value="01:00">01시 00분</option>
											<option class="opt4" value="01:30">01시 30분</option>
											<option class="opt4" value="02:00">02시 00분</option>
											<option class="opt4" value="02:30">02시 30분</option>
											<option class="opt4" value="03:00">03시 00분</option>
											<option class="opt4" value="03:30">03시 30분</option>
											<option class="opt4" value="04:00">04시 00분</option>
											<option class="opt4" value="04:30">04시 30분</option>
											<option class="opt4" value="05:00">05시 00분</option>
											<option class="opt4" value="05:30">05시 30분</option>
											<option class="opt4" value="06:00">06시 00분</option>
											<option class="opt4" value="06:30">06시 30분</option>
											<option class="opt4" value="07:00">07시 00분</option>
											<option class="opt4" value="07:30">07시 30분</option>
											<option class="opt4" value="08:00">08시 00분</option>
											<option class="opt4" value="08:30">08시 30분</option>
											<option class="opt4" value="09:00">09시 00분</option>
											<option class="opt4" value="09:30">09시 30분</option>
											<option class="opt4" value="10:00">10시 00분</option>
											<option class="opt4" value="10:30">10시 30분</option>
											<option class="opt4" value="11:00">11시 00분</option>
											<option class="opt4" value="11:30">11시 30분</option>
											<option class="opt4" value="12:00">12시 00분</option>
											<option class="opt4" value="12:30">12시 30분</option>
											<option class="opt4" value="13:00">13시 00분</option>
											<option class="opt4" value="13:30">13시 30분</option>
											<option class="opt4" value="14:00">14시 00분</option>
											<option class="opt4" value="14:30">14시 30분</option>
											<option class="opt4" value="15:00">15시 00분</option>
											<option class="opt4" value="15:30">15시 30분</option>
											<option class="opt4" value="16:00">16시 00분</option>
											<option class="opt4" value="16:30">16시 30분</option>
											<option class="opt4" value="17:00">17시 00분</option>
											<option class="opt4" value="17:30">17시 30분</option>
											<option class="opt4" value="18:00">18시 00분</option>
											<option class="opt4" value="18:30">18시 30분</option>
											<option class="opt4" value="19:00">19시 00분</option>
											<option class="opt4" value="19:30">19시 30분</option>
											<option class="opt4" value="20:00">20시 00분</option>
											<option class="opt4" value="20:30">20시 30분</option>
											<option class="opt4" value="21:00">21시 00분</option>
											<option class="opt4" value="21:30">21시 30분</option>
											<option class="opt4" value="22:00">22시 00분</option>
											<option class="opt4" value="22:30">22시 30분</option>
											<option class="opt4" value="23:00">23시 00분</option>
											<option class="opt4" value="23:30">23시 30분</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="line3">
						<div class="edge11">
							<div class="title11">상하차 방법</div>
							<div id="help-div" class="content22">
								<label class="rad"> <input id="helpUnload-ch" type="radio" name="helpLoad1" required> <i></i>&nbsp;&nbsp;도움 필요하지 않아요
								</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label class="rad"> <input id="helpLoad-ch" type="radio" name="helpLoad1"> <i></i>&nbsp;&nbsp;도움 필요해요
								</label>
							</div>
						</div>
						<div class="edge11">
							<div class="title11">전달 사항</div>
							<div id="delivery-div" class="content22">
								<textarea id="delivery-area" name="msg" cols="64" rows="2" placeholder="기사님에게 전달되는 내용입니다.&#13;&#10;(물품 종류와 크기, 경유지 정보 등)"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="edge22">
						<div class="title11">
							<span id="amount">0원</span> 최종 결제 금액
						</div>
						<div id="charge-content" class="content22">
							<div class="charge-line">
								<div class="charge-content-div">
									<span id="carInfo" class="charge-content"></span>
								</div>
								<div align="left">
									<span class="charge-title">차량 정보</span>
								</div>
							</div>
							<div class="charge-line">
								<div class="charge-content-div">
									<span id="distance" class="charge-content"></span>
								</div>
								<div align="left">
									<span class="charge-title">거리</span>
								</div>
							</div>
							<div class="charge-line">
								<div class="charge-content-div">
									<span id="helpLoad" class="charge-content"></span>
								</div>
								<div align="left">
									<span class="charge-title">상차 옵션</span>
								</div>
							</div>
							<div class="charge-line">
								<div class="charge-content-div">
									<span id="helpUnload" class="charge-content"></span>
								</div>
								<div align="left">
									<span class="charge-title">하차 옵션</span>
								</div>
							</div>
							<div class="charge-line">
								<div class="charge-content-div">
									<span id="book-YN" class="charge-content"></span>
								</div>
								<div align="left">
									<span class="charge-title">하차 예약</span>
								</div>
							</div>
							<div class="charge-line">
								<div class="charge-content-div">
									<span id="btwDay" class="charge-content"></span>
								</div>
								<div align="left">
									<span class="charge-title">보관 기간&nbsp;<small>(60,000원/일)</small></span>
								</div>
							</div>
						</div>
					</div>
					<div id="booking-div">
						<br>
						<button id="booking-btn" type="submit">예 약 하 기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal1 : 차량 정보 -->
		<div id="myModal1" class="modal11" style="padding-top: 65px;">
			<div class="modal-content11" style="width: 704px;">
				<span id="modal-close1" class="close11" style="width: 30px;">&times;</span>
				<div id="carInfo-div">
					<div id="carInfo-title-div" align="center">
						<span id="carInfo-title">차량 안내</span>
					</div>
					<div id="modal1-content">
						<div style="display: flex;">
							<div id="type1" class="car-content-title" style="background: white;">차량 형태</div>
							<div id="size1" class="car-content-title">적재 크기</div>
						</div>
						<div id="guide-content1">
							<div class="car-content-div">
								<div>
									<img src="${pageContext.request.contextPath}/resources/images/truck/cargo-image.png" alt="" class="car-content-img">
								</div>
								<div class="car-content-type">
									<div class="car-content-type-font">카고</div>
								</div>
								<div class="car-each-content">
									<div class="car-each-content-font1">
										- 흔히 알고 있는 일반 것인 형태의 트럭<br> - 적재함이 오픈되어 있어 적재물 파악이 쉬움<br> - 비나 눈 등 날씨의 영향으로부터 적재물을 보호하기 어려움
									</div>
								</div>
							</div>
							<div class="car-content-div">
								<div>
									<img src="${pageContext.request.contextPath}/resources/images/truck/horu-image.png" alt="" class="car-content-img">
								</div>
								<div class="car-content-type">
									<div class="car-content-type-font">호루</div>
								</div>
								<div class="car-each-content">
									<div class="car-each-content-font2">
										- 가죽이나 비닐 등의 덮개가 씌워져 있는 트럭<br> - 비나 눈 등 날씨의 영향으로부터 적재물을 보호할 수 있음
									</div>
								</div>
							</div>
							<div class="car-content-div">
								<div>
									<img src="${pageContext.request.contextPath}/resources/images/truck/top-image.png" alt="" class="car-content-img">
								</div>
								<div class="car-content-type">
									<div class="car-content-type-font">탑차</div>
								</div>
								<div class="car-each-content">
									<div class="car-each-content-font1">
										- 적재함이 사각 형태로 막혀 있고, 잠금장치가 있는 트럭<br> - 날씨, 도난, 파손 등 외부의 영향으로부터 보호할 수 있음<br> - 식자재, 택배 물품 등의 운반에 주로 쓰임
									</div>
								</div>
							</div>
							<div class="car-content-div">
								<div>
									<img src="${pageContext.request.contextPath}/resources/images/truck/wingbody-image.png" alt="" class="car-content-img">
								</div>
								<div class="car-content-type">
									<div class="car-content-type-font">윙바디</div>
								</div>
								<div class="car-each-content">
									<div class="car-each-content-font1">
										- 적재함을 날개처럼 양쪽으로 개폐할 수 있는 트럭<br> - 날씨, 도난, 파손 등 외부의 영향으로부터 보호할 수 있음<br> - 또한 지게차를 이용한 상하차가 용이함
									</div>
								</div>
							</div>
							<div class="car-content-div">
								<div>
									<img src="${pageContext.request.contextPath}/resources/images/truck/lift-image.png" alt="" class="car-content-img">
								</div>
								<div class="car-content-type">
									<div class="car-content-type-font">리프트</div>
								</div>
								<div class="car-each-content">
									<div class="car-each-content-font2">
										- 무거운 제품의 상하차를 위해 리프팅 장비를 탑재한 트럭<br> - 대형 가전제품과 가구, 오토바이 등의 상하차에 주로 쓰임
									</div>
								</div>
							</div>
						</div>
						<div id="guide-content2" style="display: none;">
							<div align="center" style="margin-top: 70px;">
								<img id="standard-img" src="${pageContext.request.contextPath}/resources/images/truck/carrying-capacity-image.png" alt="">
							</div>
							<div align="center">
								<table id="standard-table">
									<thead>
										<tr style="text-align: center; background: rgb(105, 113, 120); color: white;">
											<th class="thd th11">톤수</th>
											<th class="thd th11">가로</th>
											<th class="thd th11">세로</th>
											<th class="thd th11">높이</th>
										</tr>
									</thead>
									<tbody id="truck-standard" style="text-align: center;">
										<tr>
											<td class="thd ton1">1톤</td>
											<td class="thd">160 cm</td>
											<td class="thd">280 cm</td>
											<td class="thd bd1">180 cm</td>
										</tr>
										<tr>
											<td class="thd ton1">1.4톤</td>
											<td class="thd">170 cm</td>
											<td class="thd">310 cm</td>
											<td class="thd bd1">180 cm</td>
										</tr>
										<tr>
											<td class="thd ton1">2.5톤</td>
											<td class="thd">170 cm</td>
											<td class="thd">310 cm</td>
											<td class="thd bd1">180 cm</td>
										</tr>
										<tr>
											<td class="thd ton1">3.5톤</td>
											<td class="thd">170 cm</td>
											<td class="thd">310 cm</td>
											<td class="thd bd1">180 cm</td>
										</tr>
										<tr>
											<td class="thd ton1">5톤</td>
											<td class="thd">170 cm</td>
											<td class="thd">310 cm</td>
											<td class="thd bd1">180 cm</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal2 : 이삿짐 선택 -->
		<div id="myModal2" class="modal11">
			<!-- Modal content -->
			<div class="modal-content11">
				<span id="modal-close2" class="close11" style="width: 30px;">&times;</span>
				<div id="selectLoad-div">
					<div id="selectLoad-title-div">
						<span id="selectLoad-title">이삿짐 선택</span>
					</div>
					<div id="selectLoad-topic">
						<div>
							<button type="button" id="funiture11" class="move-topic1">가구</button>
						</div>
						<div>
							<button type="button" id="appliance11" class="move-topic1">가전</button>
						</div>
						<div>
							<button type="button" id="etc11" class="move-topic1">기타</button>
						</div>
					</div>
					<!-- 가구 -->
					<div id="funiture22" class="move-topic11" style="display: block;">
						<div class="move-topic22">
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">침대(매트리스만)</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">침대(매트리스만+프레임)</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">수납장</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">신발장</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">화장대</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">책상</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">의자</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">소파</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">식탁</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">옷장</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">싱크대</div>
							</div>
						</div>
					</div>
					<!-- 가전 -->
					<div id="appliance22" class="move-topic11">
						<div class="move-topic22">
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">컴퓨터/노트북</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">모니터</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">프린터</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">에어컨</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">냉장고</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">TV</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">세탁기</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">공기청정기</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">청소기</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">오븐/전자레인지</div>
							</div>
							<div class="move-content11">
								<div class="move-content111">
									<div class="move-content1111 minus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img">
									</div>
									<span class="move-content1112">0</span>
									<div class="move-content1111 plus11">
										<img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img">
									</div>
								</div>
								<div class="move-content112">밥솥</div>
							</div>
						</div>
					</div>
					<!-- 기타 -->
					<div id="etc22" class="move-topic11">
						<div id="div11" class="move-topic22">
							<div style="height: 50px;" align="center">
								<div id="addList-btn">항목 추가</div>
							</div>
							<div class="move-content11">
								<div id="capacity-div" class="move-content111">
									<div class="move-content1111 minus11">
										<img class="move-minus-img" src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="">
									</div>
									<span class="move-content1113">0</span>
									<div class="move-content1111 plus11">
										<img class="move-plus-img" src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="">
									</div>
									&nbsp;&nbsp;&nbsp;
									<div id="xmark-div" class="item1">
										<img id="xmark-img" src="${pageContext.request.contextPath}/resources/images/reservation/x-mark.png" alt="" style="margin-bottom: 3px;">
									</div>
								</div>
								<div style="height: 35px;">
									<input id="writeLoad" class="move-content113" type="text">
								</div>
							</div>
						</div>
					</div>
					<div align="center">
						<button type="button" id="loadBtn">선 택 하 기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal34 : 주소 API -->
		<div id="myModal34">
			<div id="layer">
				<img id="searchAddr" src="https://t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>
		</div>
		<!-- Modal5 : 상하차 방법 -->
		<div id="myModal5" class="modal11" style="padding-top: 15%;">
			<div id="modal5" class="modal-content11">
				<span id="modal-close3" class="close11" style="width: 30px;">&times;</span>
				<div class="modal-help-div">
					<div class="help-title-div">
						<span class="help-title">상하차 방법</span>
					</div>
					<div class="help-content-div1">
						<div class="help-content-div11" style="border-bottom: 1px solid rgb(105, 113, 120)">
							<div class="help-content-div111">
								<div class="addCharge">추가 요금</div>
								<div class="check-title1">상하차 방법</div>
							</div>
							<div class="help-content-div112">
								<label class="checkbox-wrap2 checkHelp"> <input id="checkHelp1" type="checkbox" name="checkHelp1" value=""> <i class="check-icon2"></i>
									<div class="check-title11">상차만</div>
								</label>
								<div id="helpCharge1" class="checkCharge">+0원</div>
							</div>
							<div class="help-content-div112">
								<label class="checkbox-wrap2 checkHelp"> <input id="checkHelp2" type="checkbox" name="checkHelp1" value=""> <i class="check-icon2"></i>
									<div class="check-title11">하차만</div>
								</label>
								<div id="helpCharge2" class="checkCharge">+0원</div>
							</div>
						</div>
						<div class="help-content-div12">
							<button type="button" id="checkHelp-btn">선 택 하 기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal5-1 : 상차 선택 모달  -->
			<div id="modal51" class="modal-content11" style="display: none;">
				<span id="modal-close4" class="close11" style="width: 30px;">&times;</span>
				<div class="modal-help-div">
					<div class="help-title-div">
						<span class="help-title">상차 방법</span>
					</div>
					<div class="help-content-div1" style="border-bottom: 1px solid black;">
						<div class="help-content-div11" style="border-bottom: 1px solid rgb(105, 113, 120)">
							<div class="help-content-div111">
								<div class="addCharge">추가 요금</div>
								<div class="check-title1">상차 방법</div>
							</div>
							<div class="help-content-div112">
								<label class="checkbox-wrap2 checkHelp"> <input id="checkHelp3" type="checkbox" name="checkHelp11" value=""> <i class="check-icon2"></i>
									<div class="check-title11" style="font-size: 12pt;">기사님과 함께</div>
								</label>
								<div class="checkCharge" style="width: 152px;">+10,000원</div>
							</div>
							<div class="help-content-div112">
								<label class="checkbox-wrap2 checkHelp"> <input id="checkHelp4" type="checkbox" name="checkHelp12" value=""> <i class="check-icon2"></i>
									<div class="check-title11" style="font-size: 12pt;">기사님 단독</div>
								</label>
								<div class="checkCharge" style="width: 168px;">+20,000원</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal5-2 : 하차 선택 모달  -->
			<div id="modal52" class="modal-content11" style="display: none;">
				<span id="modal-close5" class="close11" style="width: 30px;">&times;</span>
				<div class="modal-help-div">
					<div class="help-title-div">
						<span class="help-title">하차 방법</span>
					</div>
					<div class="help-content-div1" style="border-bottom: 1px solid black;">
						<div class="help-content-div11" style="border-bottom: 1px solid rgb(105, 113, 120)">
							<div class="help-content-div111">
								<div class="addCharge">추가 요금</div>
								<div class="check-title1">하차 방법</div>
							</div>
							<div class="help-content-div112">
								<label class="checkbox-wrap2 checkHelp"> <input id="checkHelp5" type="checkbox" name="checkHelp11" value=""> <i class="check-icon2"></i>
									<div class="check-title11" style="font-size: 12pt;">기사님과 함께</div>
								</label>
								<div class="checkCharge" style="width: 152px;">+10,000원</div>
							</div>
							<div class="help-content-div112">
								<label class="checkbox-wrap2 checkHelp"> <input id="checkHelp6" type="checkbox" name="checkHelp12" value=""> <i class="check-icon2"></i>
									<div class="check-title11" style="font-size: 12pt;">기사님 단독</div>
								</label>
								<div class="checkCharge" style="width: 168px;">+20,000원</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal6 : 출발지 주소록 -->
		<div id="myModal6" class="modal11" style="padding-top: 10%;">
			<div class="modal-content11" style="width: 702px">
				<span id="modal-close6" class="close11" style="width: 30px;">&times;</span>
				<c:choose>
					<c:when test="${fn:length(list) == 0}">
						<div class="modal-addr-div" style="height: 375px;">
							<div class="addr-title-div">
								<span class="addr-title">나의 주소록(출발지)</span>
							</div>
							<br>
							<div class="col-xs-12 col-md-12 text-center noto">
								<div class="col-xs-12 col-md-12">
									<br>
									<img src="${pageContext.request.contextPath}/resources/images/reservation/unhappy.png" style="width: 150px; height: 150px;"/>
									<br><br>
									<span style="font-family: 'NeoDunggeunmo'; font-size: 17px;">주소록이 없어요..</span>
									<br><br>
									
									
									<!-- 주소록 추가 서블릿 나중에 넣으셈 -->
									<button type="button" id="stALBtn" onclick="location.href='#'">추 가 하 러 가 기</button>
									
									
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="modal-addr-div">
							<div class="addr-title-div">
								<span class="addr-title">나의 주소록(출발지)</span>
							</div>
							<br>
							<div class="col-xs-12 col-md-12 text-center noto">
								<div class="col-xs-12 col-md-12" style="min-height: 261px;">
									<div class="row fw6" style="border-bottom: 1px solid black;">
										<div class="col-xs-2 col-md-2">선택</div>
										<div class="col-xs-2 col-md-2">배송지</div>
										<div class="col-xs-4 col-md-4">주소</div>
										<div class="col-xs-2 col-md-2">연락처</div>
										<div class="col-xs-2 col-md-2">수정·삭제</div>
									</div>
								<c:forEach var="a" items="${ list }" varStatus="status">
									<div class="row small aL-row">
										<input type="radio" class="col-xs-2 col-md-2" name="startAddrList" style="margin-top: 10px; cursor: pointer;">
										<div class="col-xs-2 col-md-2">
											<span>${ a.aPlace }</span>
											<br>
											<span>${ a.aName }</span>
										</div>
										<div class="col-xs-4 col-md-4">
											<span>${addrList1[status.index]}</span>
											<br>
											<span>${addrList2[status.index]}</span>
										</div>
										<div class="col-xs-2 col-md-2" style="padding-top: 9px;">
											<span>${ a.aPhone }</span>
										</div>
										<div class="col-xs-2 col-md-2" style="display: flex; padding-top: 6px;">
											<div><button type="button" class="AddrModBtn1">수정</button></div>
											<div><button type="button" class="AddrDelBtn1">삭제</button></div>
										</div>
										<input class="stANo" type="hidden" value="${ a.aNo }">
										<input class="stAName" type="hidden" value="${ a.aName }">
										<input class="stAddr1" type="hidden" value="${ addrList1[status.index] }">
										<input class="stAddr2" type="hidden" value="${ addrList2[status.index] }">
										<input class="stAPhone" type="hidden" value="${ a.aPhone }">
										<input class="stLat" type="hidden" value="${ a.aLatitude }">
										<input class="stLong" type="hidden" value="${ a.aLongitude }">
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div align="center">
						<button type="button" id="stALBtn">선 택 하 기</button>
					</div>
					</c:otherwise>
				</c:choose>
				<br>
			</div>
		</div>
		<!-- Modal7 : 도착지 주소록 -->
		<div id="myModal7" class="modal11" style="padding-top: 10%;">
			<div class="modal-content11" style="width: 702px;">
				<span id="modal-close7" class="close11" style="width: 30px;">&times;</span>
				<c:choose>
					<c:when test="${fn:length(list) == 0}">
						<div class="modal-addr-div" style="height: 375px;">
							<div class="addr-title-div">
								<span class="addr-title">나의 주소록(출발지)</span>
							</div>
							<br>
							<div class="col-xs-12 col-md-12 text-center noto">
								<div class="col-xs-12 col-md-12">
									<br>
									<img src="${pageContext.request.contextPath}/resources/images/reservation/unhappy.png" style="width: 150px; height: 150px;"/>
									<br><br>
									<span style="font-family: 'NeoDunggeunmo'; font-size: 17px;">주소록이 없어요..</span>
									<br><br>
									
									<!-- 주소록 추가 서블릿 나중에 넣으셈 -->
									<button type="button" id="stALBtn" onclick="location.href='#'">추 가 하 러 가 기</button>
									
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
					<div class="modal-addr-div">
						<div class="addr-title-div">
							<span class="addr-title">나의 주소록(도착지)</span>
						</div>
						<br>
						<div class="col-xs-12 col-md-12 text-center noto" style="min-height: 261px;">
							<div class="col-xs-12 col-md-12" style="min-height: 261px;">
								<div class="row fw6" style="border-bottom: 1px solid black;">
									<div class="col-xs-2 col-md-2">선택</div>
									<div class="col-xs-2 col-md-2">배송지</div>
									<div class="col-xs-4 col-md-4">주소</div>
									<div class="col-xs-2 col-md-2">연락처</div>
									<div class="col-xs-2 col-md-2">수정·삭제</div>
								</div>
								<c:forEach var="a" items="${ list }" varStatus="status">
									<div class="row small aL-row">
										<input type="radio" class="col-xs-2 col-md-2" name="endAddrList" style="margin-top: 10px; cursor: pointer;">
										<div class="col-xs-2 col-md-2">
											<span>${ a.aPlace }</span>
											<br>
											<span>${ a.aName }</span>
										</div>
										<div class="col-xs-4 col-md-4">
											<span>${addrList1[status.index]}</span>
											<br>
											<span>${addrList2[status.index]}</span>
										</div>
										<div class="col-xs-2 col-md-2" style="padding-top: 9px;">
											<span>${ a.aPhone }</span>
										</div>
										<div class="col-xs-2 col-md-2" style="display: flex; padding-top: 6px;">
											<div><button type="button" class="AddrModBtn1">수정</button></div>
											<div><button type="button" class="AddrDelBtn1">삭제</button></div>
										</div>
										<input class="edANo" type="hidden" value="${ a.aNo }">
										<input class="edAName" type="hidden" value="${ a.aName }">
										<input class="edAddr1" type="hidden" value="${ addrList1[status.index] }">
										<input class="edAddr2" type="hidden" value="${ addrList2[status.index] }">
										<input class="edAPhone" type="hidden" value="${ a.aPhone }">
										<input class="edLat" type="hidden" value="${ a.aLatitude }">
										<input class="edLong" type="hidden" value="${ a.aLongitude }">
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div align="center">
						<button type="button" id="edALBtn">선 택 하 기</button>
					</div>
					</c:otherwise>
				</c:choose>
				<br>
			</div>
		</div>
		<!-- Modal8 : 결제 -->
		<div id="myModal8" class="modal11" style="padding-top: 10%;">
			<div class="modal-content11" style="width: 600px">
				<span id="modal-close8" class="close11" style="width: 30px;">&times;</span>
			</div>
		</div>

		<!-- hidden 값들 -->
		<input type="hidden" id="addStAddr" name="startAddr">
		<input type="hidden" id="addEdAddr" name="endAddr">
		<input type="hidden" id="amountVal" name="amount" value="0">
		<input type="hidden" id="distanceVal" name="distance">
		<input type="hidden" id="helpLoadVal" name="helpLoad">
		<input type="hidden" id="helpUnloadVal" name="helpUnload">
	</form>

	<!-- javascript files -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>

	<!-- footer -->
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>