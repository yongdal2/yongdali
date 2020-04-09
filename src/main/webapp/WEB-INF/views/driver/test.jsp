<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">

<title>용달이</title>
<style>
button {
	background: #F15F5F;
}
</style>



</head>

<body>

	<!-- Navigation -->

	<%@ include file="../common/nav_driver.jsp"%>


	<!-- Page Header -->

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<form id="chatForm">
					<input type="text" id="message" />
					<button>send</button>
				</form>
				<div id="chat"></div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

	




	<!-- Footer -->
	<%@ include file="../common/footer.jsp"%>
	<script src="${contextPath}/resources/js/sockjs.js"></script>
	<script>
		$(document).ready(function() {
			$("#chatForm").submit(function(event) {
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
		});

		var sock = new SockJS("/echo");
		sock.onmessage = function(e) {
			$("#chat").append(e.data + "<br/>");
		}

		sock.onclose = function() {
			$("#chat").append("연결 종료");
		}
	</script>
</body>



</html>