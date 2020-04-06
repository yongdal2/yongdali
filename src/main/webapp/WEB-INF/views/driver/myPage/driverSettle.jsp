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
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/driverMyPage.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/userMyPage.css" />
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <title>용달이 | 정산 내역</title>
</head>
<body>
	<c:import url="../../common/nav_driver.jsp"/>
	<div class="container">
		<div class="row">
			<div class="h2 jal">정산 내역</div>
			<hr>
		</div>
		<div class="row" style="margin: 20px;">
			<div class="col-xs-12 col-md-12 well text-center">
				<div class="col-xs-3 col-md-3">
					<select class="form-control" id="">
						<option value="ㅇㅇ">상태별 조회</option>
						<option value="ㅇㅇ">예약 대기</option>
						<option value="ㅇㅇ">상태별 조회</option>
					</select>
				</div>
				<div class="col-xs-7 col-md-7">
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<input type="date" class="form-control">
						</div>
						<div class="col-xs-6 col-md-6">
							<input type="date" class="form-control">
						</div>
					</div>
				</div>
				<div class="col-xs-2 col-md-2">
					<button class="btn btn_ydl_r">전체보기</button>
				</div>
			</div>
		</div>
		<div class="row" style="margin: 20px;">
			<div class="col-xs-12 col-md-12"
				style="padding: 0; border-radius: 16px; border: solid 1px #dedede; background-color: #ffffff;">
				<Br>
				<table class="table table-striped table-hover text-center">
					<thead>
						<tr>
							<td>예약 번호</td>
							<td>진행 상태</td>
							<td>예약 일자</td>
							<td>출발지</td>
							<td>도착지</td>
							<td>결제 금액</td>
							<td>차종</td>
						</tr>
					</thead>
					<tr>
						<td>089</td>
						<td>하차 완료</td>
						<td>2020.01.12</td>
						<td>부산시123</td>
						<td>제주시 1234</td>
						<td>123,000,34</td>
						<td>라보99ton</td>
					</tr>
					<tr>
						<td>089</td>
						<td>하차 완료</td>
						<td>2020.01.12</td>
						<td>부산시123</td>
						<td>제주시 1234</td>
						<td>123,000,34</td>
						<td>라보99ton</td>
					</tr>
					<tr>
						<td>089</td>
						<td>하차 완료</td>
						<td>2020.01.12</td>
						<td>부산시123</td>
						<td>제주시 1234</td>
						<td>123,000,34</td>
						<td>라보99ton</td>
					</tr>

				</table>
			</div>
			<div class="row text-center">
				<ul class="pagination ft_gr">
					<li><a href="#"> <<</a></li>
					<li><a href="#"> <</a></li>
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
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>

</html>