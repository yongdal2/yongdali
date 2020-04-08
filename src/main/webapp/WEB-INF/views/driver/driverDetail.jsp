
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



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
					<h1
						style="font-size: 25px; text-align: center; color: #000; font-family: Montserrat; height: 50px">
						<b style="font-weight: 500; letter-spacing: 5px;">모든 미배차 현황</b>
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

					<div class="modal" tabindex="-1" role="dialog" id="eventModal">
						<form action="getB.do">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 id="evetitle">배차신청</h4>
										<button type="button" class="close" data-dismiss="modal"aria-label="CLose">
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
											<button type="submit" class="btn btn-default">배차신청</button>S
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<br>
	<hr>

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
		<%-- $(function(){
			
		})
		function rView(){
			var $mibaechar = $('#mibaechar tbody');
			$mibaechar.html("");
			
			$.ajax({
				url : "mibaechar.do",
				data : "<%= session.getAttribute("loginUser").getUserId()%>";
				type : "post",
				dataType : "json",
				success : function(data){
					$.each(data,function(index,value){
						var $tr = ("<tr>");
						var $
					})
				},error : function(){
					console.log("error");
				}
				
			});
		} --%>
		
		
		
	</script>
</body>



</html>