<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="text-align: center"><h1>ERROR</h1></div>
			<hr>
		</div>
		<div class="row">
			<div class="col-md-12" style="text-align: center">
				<h2 align="center"><b>${msg}</b></h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				오류가 계속될 시 관리자에게 문의해 주세요!<hr>
				<button onclick="lth.ydl">메인페이지로 돌아가기</button>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>