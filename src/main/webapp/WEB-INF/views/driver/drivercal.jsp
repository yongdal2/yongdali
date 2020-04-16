<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/js/fullcal/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/js/fullcal/vendor/css/bootstrap.min.css">
<link rel="stylesheet" href='${contextPath}/resources/js/fullcal/vendor/css/select2.min.css' />
<link rel="stylesheet" href='${contextPath}/resources/js/fullcal/vendor/css/bootstrap-datetimepicker.min.css' />
<link rel="stylesheet" href="${contextPath}/resources/js/fullcal/css/main.css">
<title>용달이</title>
<style>

 button{
 	background: #F15F5F;
 }
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
.jal {
	font-family: 'yg-jalnan', Arial, Helvetica, sans-serif !important;
}
</style>
</head>

<body>

	<!-- Navigation -->

	<%@ include file="../common/nav_driver.jsp"%>


	<!-- Page Header -->

	<!-- Main Content -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6" style="text-align: left; margin-bottom: 10px">
				<h2 style="color: grey;" class="jal">
					<b style="font-weight: 5000; letter-spacing: 3px;">▷ 예약 일정</b>
				</h2>
			</div>
			<br>
		</div>
		<div class="row" style="margin-bottom: 10px">
			<div class="col-md-3">
			</div>
			<div class="col-md-6" style="height: 2px; background: grey"></div>
		</div>
		<div class="row" style="margin-bottom: 10px">
			<div class="col-md-3"></div>
			<div class="col-md-6" id="calendar"></div>

		</div>
		<hr>
	</div>
	<div style="visibility: hidden; height: 2px"><input id="mNo" name="mNo" value="${loginUser.mNo}"></div>
	<br>
	

	<!-- Footer -->
	<%@ include file="../common/footer.jsp"%>
	<script src="${contextPath}/resources/js/fullcal/vendor/js/moment.min.js"></script>
	<script src="${contextPath}/resources/js/fullcal/vendor/js/fullcalendar.min.js"></script>
	<script src="${contextPath}/resources/js/fullcal/vendor/js/ko.js"></script>
	<script src="${contextPath}/resources/js/fullcal/vendor/js/select2.min.js"></script>
	<script src="${contextPath}/resources/js/fullcal/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script src="${contextPath}/resources/js/fullcal/js/main.js"></script>
</body>



</html>