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
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
   	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=03ea077d7ecc6636dffede985cc5c57d&libraries=services"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>

    <title>용달이 | 예약 내역</title>
</head>

<body>
	<c:import url="../../common/nav.jsp"/>
	<c:import url="../../user/myPage/userInfo.jsp"/>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 h2 jal">
				예약내역 <br> <br>
			</div>
			<!-- 필터 -->
			<div class="col-xs-2 col-md-2 text-center bszB1">
				<select class="form-control ft54" name="rStatus" id="rStatus">
					<option value="rst">상태별 조회</option>
					<option value="pay">결제완료</option>
					<option value="deal">배차완료</option>
					<option value="pick">상차완료</option>
					<option value="drop">하차완료</option>
					<option value="canc">취소</option>
				</select>
			</div>
			<div class="text-center"></div>
			<div class="col-xs-3 col-md-3 text-center bszB">
				<input placeholder="상차일" class="form-control ft54" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date" />
			</div>
			<div class="col-xs-3 col-md-3 text-center bszB">
				<input placeholder="하차일" class="form-control ft54" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date" />
			</div>
			<div class="col-xs-3 col-md-3 text-center bszB">
				<input type="search" class="form-control ft54" placeholder="검색">
			</div>
			<div class="col-xs-1 col-md-1 bszB">
				<button class="btn btn_ydl sch">
					<span class="glyphicon glyphicon-search" style="font-size: 22px"></span>
				</button>
			</div>
			<div class="col-xs-12 col-md-12 tbPdR" >
				<Br>
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<td>예약 번호</td>
							<td>진행 상태</td>
 							<td>예약 일자</td>
 							<td>상차일</td>
 							<td>하차일</td>
							<td>출발지</td>
							<td>도착지</td>
							<td>결제 금액</td>
							<td>차량정보</td>
							<td>상세정보</td>
							<td>메세지</td>
							
							
						</tr>
					</thead>
					<c:forEach var="r" items="${ rList }" varStatus="vs">
						<tr>
							<td>${ r.rNo }</td>
							<td>진행 상태</td>
 							<td>예약 일자</td>
 							<td>상차일</td>
 							<td>하차일</td>
							<td>출발지</td>
							<td>도착지</td>
							<td>결제 금액</td>
							<td><span class="fas fa-truck" id="turck${vs.index }"></span></td>
							<td></td>
							<td>${r.msg }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row text-center">
			<ul class="pagination ft_gr">
				<li><a href="#"><<</a></li>
				<li><a href="#"><</a></li>
				<li><a href="#">1</a></li>
				<li class="active"><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">></a></li>
				<li><a href="#">>></a></li>
			</ul>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>

</html>