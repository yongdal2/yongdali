
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">

<title>용달이</title>
<style>
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
 button{
 	background: #F15F5F;
 }
textarea:disabled{
	background: white;
}
 input[type="text"]:disabled {
 	background:  white; 
 }
 .modal-body {
 	background : lightgrey;
  }
 .modal-header {
 	background :lightgrey;	
  }
 .modal-footer {
 	background : lightgrey;
  }
  div > label{
  	color : black;
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
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-10 mx-auto">
				<div class="row">
					<h1
						style="font-size: 25px; text-align: center; color: #000; height: 50px" class="jal">
						<b style="font-weight: 500; letter-spacing: 5px;">미배차 확인</b>
					</h1>
				</div>
				<hr>
				<div class="row" style="text-align-last: center;">
					<table class="table" style="font-size: 12px;" id="mibaechar">
						<thead>
							<tr>
								<th>예약번호</th>
								<th>도움여부(상/하차)</th>
								<th colspan="3">출발지</th>
								<th colspan="3">도착지</th>
								<th>상차일</th>
								<th>하차일</th>
								<th>배차신청</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<a href="baeDetail.do?mNo=${loginUser.mNo }" class="pull-right">+ 상세보기</a>
				</div>

				<hr>
				<!-- 테스트 필요! -->
				<div class="btn_h1" style="margin-top: 60px;">
					<h1
						style="font-size: 25px; text-align: center; color: #000; font-family: Montserrat; height: 50px; " class="jal">
						나의 배차
					</h1>
		

					<div class="row" style="text-align-last: center;">
						<table class="table" style="font-size: 12px;" id="baechar">
							<thead>
								<tr>
									<th>예약번호</th>
									<th>도움여부(상/하차)</th>
									<th colspan="3">출발지</th>
									<th colspan="3">도착지</th>
									<th>상차일</th>
									<th>하차일</th>
									<th>배차신청</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<a href="myDetail.do?mNo=${loginUser.mNo }" class="pull-right">+ 상세보기</a>
					</div>
					<div class="modal" tabindex="-1" role="dialog" id="eventModal">
						<form action="Deal.do" method="post">
							<div class="modal-dialog" role="document" >
								<div class="modal-content" style="border-radius: 20px 20px 20px 20px / 20px 20px 20px 20px; border: 2px solid white">
									<div class="modal-header" style="border-radius: 20px 20px 0px 0px / 20px 20px 0px 0px">
									<button type="button" class="close" data-dismiss="modal"
											aria-label="CLose">
											<span aria-hidden="true">X</span>
										</button>
										<h2 id="evetitle" style="color: white"><b>배차정보</b></h2>
									</div>
									<div class="modal-body">

										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-title">예약번호</label> 
												<input
													class="form-control" type="text" name="rNo"
													id="rNo" required="required" readonly />
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-start">예약일</label> <input
													class="form-control" type="text" name="enrollDate"
													id="enrollDate" disabled="disabled"/>
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-start">상차일</label> <input
													class="form-control" type="text" 
													id="sangDate" disabled="disabled"/>
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-start">하차일</label> <input
													class="form-control" type="text" 
													id="haDate" disabled="disabled"/>
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-end">출발지</label> <input
													class="form-control" type="text" 
													id="start" disabled="disabled"/>
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-type">도착지</label> <input
													class="form-control" type="text" 
													id="end" disabled="disabled"/>
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-color">차량종류</label>
												 <input
													class="form-control" type="text" 
													id="type" disabled="disabled"/>
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-start">이삿짐</label>
												<textarea rows="3" class="form-control"
													name="luggage" id="luggage" disabled="disabled"></textarea>
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-desc">요청사항</label>
												<textarea rows="3" class="form-control"
													name="msg" id="msg" disabled="disabled"></textarea>
											</div>
										</div>
									</div>
									<div style="visibility: hidden; height: 2px"><input id="mNo" name="mNo" value="${loginUser.mNo}"></div>
									<div class="ContaineraddEvent" id="savecar">
										<div class="modal-footer" style="border-radius: 0px 0px 20px 20px / 0px 0px 20px 20px" >
											<button id="submit" class="btn" style="background: white; color: grey">배차신청</button>
											<button type="button" class="btn " style="background: white; color: grey"
												data-dismiss="modal" >닫기</button>
										</div>
									</div>
									<div class="ContaineraddEvent" id="deletecar">
										<div class="modal-footer" style="border-radius: 0px 0px 20px 20px / 0px 0px 20px 20px" >
											<button id="cancelBtn" type="button" class="btn" style="background: white; color: grey" onclick="myCancel();">배차취소</button>
											<button type="button" class="btn " style="background: white; color: grey"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
									
								</div>
							</div>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	


	<br>

	<!-- Footer -->
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">	
		$(function(){
			var $mibaechar = $('#mibaechar tbody');
			$mibaechar.html("");
			
			
			
			$.ajax({
				url : "mibaechar.do",
				data : { mNO : $('#mNo').val()},
				type : "post",
				dataType : "json",
				success : function(data){
					console.log(data);
					$.each(data,function(index,value){
						var $deal_btn = $("<button class='dealB btn btn-sm' style='color:white;' onclick='Deal(this.value)'>").val(value.rNo).text('배차신청');
						
						var $tr = $("<tr>");
						var $rno = $("<td>").text(value.rNo);
						var $help = $("<td>").text(value.helpLoad+"/"+value.helpUnload);
						var $startAddr = $("<td colspan='3'>").text(value.startAddr);
						var $endAddr = $("<td colspan='3'>").text(value.endAddr);
						var $start_date = $("<td>").text(value.startDate);
						var $end_date = $("<td>").text(value.endDate);
						var $deal = $("<td>");
						
						$deal.append($deal_btn);
						$tr.append($rno);
						$tr.append($help);
						$tr.append($startAddr);
						$tr.append($endAddr);
						$tr.append($start_date);
						$tr.append($end_date);
						$tr.append($deal_btn);
						
						$mibaechar.append($tr);
					})
				},error : function(){
					console.log("error");
				}
				
			});
		})
		/* 모달에 선택한 예약 값 띄우기*/
		function Deal(aa){
				$("#eventModal").modal();
				$("#deletecar").hide();
				$("#savecar").show();
				
				
				$('#rNo').val(aa);
				
				$.ajax({
					url : "dModal.do",
					data : {rNo : aa},
					dataType : 'json',
					success : function(data){
						console.log(data);
						$("#enrollDate").val(data[0].enrollDate);
						$("#sangDate").val(data[0].startDate);
						$("#haDate").val(data[0].endDate);
						$("#start").val(data[0].startAddr);
						$("#end").val(data[0].endAddr);
						$("#luggage").val(data[0].luggage);
						$("#type").val(data[0].type);
						$("#msg").val(data[0].msg);
					}
				})
				
		}
		
		$(function(){
			var $baechar = $('#baechar tbody');
			$baechar.html("");
			
			
			
			$.ajax({
				url : "mybaechar.do",
				data : { mNo : $('#mNo').val()},
				type : "post",
				dataType : "json",
				success : function(data){
					console.log(data);
					$.each(data,function(index,value){
						var $deal_btn = $("<button class='dealB btn btn-sm' style='color:white;' onclick='edit(this.value)'>").val(value.rNo).text('배차취소');
						
						var $tr = $("<tr>");
						var $rno = $("<td>").text(value.rNo);
						var $help = $("<td>").text(value.helpLoad+"/"+value.helpUnload);
						var $startAddr = $("<td colspan='3'>").text(value.startAddr);
						var $endAddr = $("<td colspan='3'>").text(value.endAddr);
						var $start_date = $("<td>").text(value.startDate);
						var $end_date = $("<td>").text(value.endDate);
						var $deal = $("<td>");
						
						$deal.append($deal_btn);
						$tr.append($rno);
						$tr.append($help);
						$tr.append($startAddr);
						$tr.append($endAddr);
						$tr.append($start_date);
						$tr.append($end_date);
						$tr.append($deal_btn);
						
						$baechar.append($tr);
					})
				},error : function(){
					console.log("error");
				}
				
			});
		})
		
		function edit(aa){
				$("#eventModal").modal();
				$("#savecar").hide();
				$("#deletecar").show();
				
				
				$('#rNo').val(aa);
				
				$.ajax({
					url : "dModal.do",
					data : {rNo : aa,
						mNO : $('#mNo').val()},
					dataType : 'json',
					success : function(data){
						console.log(data);
						$("#enrollDate").val(data[0].enrollDate);
						$("#sangDate").val(data[0].startDate);
						$("#haDate").val(data[0].endDate);
						$("#start").val(data[0].startAddr);
						$("#end").val(data[0].endAddr);
						$("#luggage").val(data[0].luggage);
						$("#type").val(data[0].type);
						$("#msg").val(data[0].msg);
					}
				})
				
		}
		function myCancel(){
			var aa = $('#mNo').val()
			var bb = $('#rNo').val();
			
			location.href = "cancel.do?mNo="+aa+"&rNo="+bb;
			
		}
		
		
	</script>
</body>



</html>