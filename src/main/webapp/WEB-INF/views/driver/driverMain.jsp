
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">

<title>용달이</title>

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
				<a href="test.do">테스트 버튼</a>
					<h1
						style="font-size: 25px; text-align: center; color: #000; font-family: Montserrat; height: 50px">
						<b style="font-weight: 500; letter-spacing: 5px;">실시간 예약 현황</b>
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
				</div>

				<hr>
				<!-- 테스트 필요! -->
				<div class="btn_h1" style="margin-top: 60px;">
					<h1
						style="font-size: 25px; text-align: center; color: #000; font-family: Montserrat; height: 50px">
						<b style="font-weight: 500; letter-spacing: 5px;">나의 배차</b>
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
					</div>
					<div class="modal" tabindex="-1" role="dialog" id="eventModal">
						<form action="getB.do">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 id="evetitle">배차신청</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="CLose">
											<span aria-hidden="true">X</span>
										</button>
									</div>
									<div class="modal-body">

										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-title">예약번호</label> <input
													class="form-control" type="text" name="edit-title"
													id="edit-title" required="required" disabled="disabled" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-start">예약일</label> <input
													class="form-control" type="text" name="edit-start"
													id="edit-start" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-end">출발지</label> <input
													class="form-control" type="text" name="edit-end"
													id="edit-end" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-type">도착지</label> <input
													class="form-control" type="text" name="edit-type"
													id="edit-type">
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-start">이삿짐</label> <input
													class="form-control" type="text" name="edit-start"
													id="edit-start" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-color">차량종류</label> <select
													class="form-control" name="color" id="edit-color">
													<option value="damas" style="color: #D25565;">다마스</option>
													<option value="starex" style="color: #ffa94d;">스타렉스</option>
													<option value="bongo" style="color: #74c0fc;">봉고</option>
													<option value="1truck" style="color: #f06595;">1.5t</option>
													<option value="3truck" style="color: #63e6be;">3.5t</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-99">
												<label class="col-xs-98" for="edit-desc">설명</label>
												<textarea rows="4" cols="50" class="form-control"
													name="edit-desc" id="edit-desc"></textarea>
											</div>
										</div>
									</div>
									<div class="ContaineraddEvent" id="savecar">
										<div class="modal-footer">
											<button type="submit" class="btn btn-default">배차신청</button>
											S
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
									<div style="visibility: false"><p id="mNo">${loginUser.mNo}</p></div>
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
			$("#baechar").on('click',function(){
				$("#eventModal").modal();
				$("#deletecar").hide();
				$("#savecar").show();
			})
		});
		
		$(function(){
			console.log('sibal');
			var $mibaechar = $('#mibaechar tbody');
			$mibaechar.html("");
			
			
			
			console.log('sibal2');
			$.ajax({
				url : "mibaechar.do",
				data : { mNO : $('#mNo').text()},
				type : "post",
				dataType : "json",
				success : function(data){
					console.log(data);
					$.each(data,function(index,value){
						var $tr = $("<tr>");
						var $rno = $("<td>").text(value.rno);
						var $help = $("<td>").text(value.helpLoad+"/"+value.helpUnload);
						var $startAddr = $("<td colspan='3'>").text(value.startAddr);
						var $endAddr = $("<td colspan='3'>").text(value.endAddr);
						var $start_date = $("<td>").text(value.startDate);
						var $end_date = $("<td>").text(value.endDate);
						var $deal_btn = $("<td>");
						
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
		<%-- function mView(){
		 var $baechar = $('#baechar tbody');
		 $baechar.html("");
		 
		 $.ajax({
			 url : "baechar.do",
			 data : "<%= session.getAttribute("loginUser").getUserId()%>",
			 type : "post",
			 dataType : "json",
			 success : function(data){
				 $.each(data,function(index,value){
					 var $tr = ("<tr>");
					 var $start = ("<td>").text(value.start);
					 
					 $tr.append($start);
					 
					 $baechar.append($tr);
					 
				 }); 
			 }
		 });	 
		} --%>
		
		
	</script>
</body>



</html>