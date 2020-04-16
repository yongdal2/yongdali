<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">

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
			<div class="col-md-2"></div>

			<div class="col-md-6" style="text-align: left; margin-bottom: 10px">
				<h2 style="color: grey; font-family: Montserrat;" cla>
					<b style="font-weight: 5000; letter-spacing: 3px;">▷ 사이트 이용안내</b>
				</h2>
			</div>
			<br>
		</div>
		<div class="row" style="margin-bottom: 10px">
			<div class="col-md-2">
			</div>
			<div class="col-md-2" style="height: 2px; background: grey"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-1">
				<button class="btn btn-lg btn-disable btn-block" disabled="disabled"
					style=" color: white;">&nbsp;배차 신청&nbsp;</button>
					<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<table class="table" style="font-size: 12px;" id="mibaechar">
						<tr>
							<th>예약번호</th>
							<th>신청일자</th>
							<th colspan="3">출발지</th>
							<th colspan="3">도착지</th>
							<th>예약일</th>
							<th>옵션</th>
							<th>배차신청</th>
						</tr>
						<tr>
							<td>01</td>
							<td>2020.03.21</td>
							<td colspan="3">인천시 부평구</td>
							<td colspan="3">제주시 서귀포구</td>
							<td>03.20</td>
							<td>1</td>
							<td>
								<button class="btn" style=" color: white" disabled="disabled">배차신청</button>
							</td>
						</tr>
						<tr>
							<td>02</td>
							<td>2020.03.21</td>
							<td colspan="3">서울시 강남구</td>
							<td colspan="3">부산시 해운대구</td>
							<td>03.20</td>
							<td>1</td>
							<td>
								<button class="btn" style="color: white" disabled="disabled">배차신청</button>
							</td>
						</tr>
						
						<tr>
							<td>03</td>
							<td>2020.03.21</td>
							<td colspan="3">러시아 사할린</td>
							<td colspan="3">체코 프라하</td>
							<td>03.20</td>
							<td>1</td>
							<td>
								<button class="btn" style="color: white" disabled="disabled">배차신청</button>
							</td>
						</tr>
					</table>
			</div>
			<div class="col-md-4">
				<blockquote style="background: rgb(246,151,151); color: white; border-radius: 20px; font-size: 15px" >
				<b>▶배차신청 안 된 예약 확인하기</b><br><br>
				실시간 예약 페이지에서 미배차 된 예약 현황들을 볼 수 있습니다.<br><br><br>
				<b>▶배차 신청하기</b><br><br>
				아직 배차신청이 완료되지 않은 예약 중 마음에 드는 조건을 골라 우측의 배차 신청을 누르면 나오는 형식을 채우면 배차 신청을 할 수 있을껄요?
				
				 <br>
				</blockquote>
			</div>		
		</div>
		<div class="row" style="margin-bottom: 10px">
		
			<div class="col-md-2"></div>
			<div class="col-md-8" style="height: 2px; background: lightgray"></div>
			<div class="col-md-2"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-1">
				<button class="btn btn-lg btn-disable btn-block" disabled="disabled" style="color: white;">&nbsp;정산방법&nbsp;</button>
			</div>
		</div>
		<br>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-6 pull-left">
				<dl class="dl-horizontal">
					<dt style="font-size: 20px; color: #F15F5F;">●배차확인</dt>
					<dd>
						<blockquote style="font-size: 15px">
							상단의 나의 일정 페이지에 들어가면 예약된 배차와 완료된 배차를 확인할 수 있는 달력이 있습니당. <br>
							달력의 일정을 클릭하거나 마우스를 올리면 요금을 포함한 간단한 정보를 확인 할 수 있습니다.<br>
							자세한 사항은 실시간 예약 페이지의 나의 예약에서 확인 가능합니다. 
						</blockquote>
					</dd>
					<hr>
					<dt style="font-size: 20px; color: #F15F5F">●정산현황</dt>
					<dd>
						<blockquote style="font-size: 15px">
							이번달 지급되는 비용이 궁금하다면 마이페이지의 정산현황 페이지에 들어가면 확인 할 수 있습니다.<br>
							정산금은 설정한 기간동안 완료한 배차및 요금에 따라 달라집니다.<br>
							주별, 월별로 정산금을 확인할 수 있습니다.
						</blockquote>
					</dd>
					<hr>
					<dt style="font-size: 20px; color: #F15F5F">●정산금 신청</dt>
					<dd>
						<blockquote style="font-size: 15px">
							매월 말일 자동적으로 정산금이 등록된 계좌로 송금됩니다.<br>
							하지만 바로 지급되길 바라신다면 정산금 신청 페이지에서 쌓인 정산금을 요청할 수 있습니다.<br>
							이 경우 말일에 지급되는 정산금에 비해 낮은 금액이 정산 될 수도 있스며 이 점 유의 바랍니다.  
						</blockquote>
					</dd>
				</dl>
			</div>

		</div>
		
		


	</div>
	<br>
	

	<!-- Footer -->
	<%@ include file="../common/footer.jsp"%>
</body>



</html>