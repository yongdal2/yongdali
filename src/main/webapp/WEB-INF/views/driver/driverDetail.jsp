
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<style>
button {
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
tfoot{
	font-family: 'yg-jalnan', Arial, Helvetica, sans-serif !important;
}
</style>
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
				<h1
					style="font-size: 25px; text-align: center; color: #000; font-family: Montserrat; height: 50px"
					class="jal">
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
						<c:forEach var="r" items="${ list }">
							<tr>
								<td align="center">${r.rNo }</td>
								<td align="center">${r.helpLoad} / ${r.helpUnload}</td>
								<td align="center" colspan="3">${r.startAddr }</td>
								<td align="center" colspan="3">${r.endAddr }</td>
								<td align="center">${r.startDate }</td>
								<td align="center">${r.endDate }</td>
								<td align="center"><button class="dealB btn" style="color: white;" onclick="Deal(this.value)" value="${r.rNo}">배차신청</button></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center" height="20" >
							<td colspan="12">
								<!-- [이전] --> 
								<c:if test="${ pi.currentPage eq 1 }">&lt;&lt; &nbsp;</c:if>
								<c:if test="${ pi.currentPage ne 1 }">
									<c:url var="before" value="baedetail.do">
										<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										<c:param name="mNo" value="${loginUser.mNo}"/>
									</c:url>
									<a href="${ before }" style="font: 20px;">&lt;&lt;</a> &nbsp;
								</c:if>
								
								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<font color="#F15F5F" size="4"><b>[${ p }]</b></font>
									</c:if>

									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="baedetail.do">
											<c:param name="currentPage" value="${ p }" />
											<c:param name="mNo" value="${loginUser.mNo}"/>
										</c:url>
										<a href="${ pagination }">${ p }</a> &nbsp;
									</c:if>
								</c:forEach>
								
								<!-- [다음] -->
								<c:if test="${ pi.currentPage eq pi.maxPage }">&gt;&gt;</c:if>
								<c:if test="${ pi.currentPage ne pi.maxPage }">
									<c:url var="after" value="baedetail.do">
										<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										<c:param name="mNo" value="${loginUser.mNo}"/>
									</c:url>
									<a href="${ after }">&gt;&gt;</a>
								</c:if>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<hr>
			<!-- 테스트 필요! -->
			<div class="btn_h1" style="margin-top: 60px;">

				<div class="modal" tabindex="-1" role="dialog" id="eventModal">
					<form action="cancel.do">
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
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<br>
	<hr>

	<!-- Footer -->
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
		$(function() {
			$("#baechar").on('click', function() {
				$("#eventModal").modal();
				$("#deletecar").hide();
				$("#savecar").show();
			})
		});

		$(function() {
			var $mibaechar = $('#mibaechar tbody');
			$mibaechar.html("");

			$
					.ajax({
						url : "baeDetail.do",
						data : {
							mNO : $('#mNo').val()
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							console.log(data);
							$
									.each(
											data,
											function(index, value) {
												var $deal_btn = $(
														"<button class='dealB btn' style='color:white;' onclick='Deal(this.value)'>")
														.val(value.rNo).text(
																'배차신청');

												var $tr = $("<tr>");
												var $rno = $("<td>").text(
														value.rNo);
												var $help = $("<td>")
														.text(
																value.helpLoad
																		+ "/"
																		+ value.helpUnload);
												var $startAddr = $(
														"<td colspan='3'>")
														.text(value.startAddr);
												var $endAddr = $(
														"<td colspan='3'>")
														.text(value.endAddr);
												var $start_date = $("<td>")
														.text(value.startDate);
												var $end_date = $("<td>").text(
														value.endDate);
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
						},
						error : function() {
							console.log("error");
						}

					});
		})
		function Deal(aa) {
			$("#eventModal").modal();
			$("#deletecar").hide();
			$("#savecar").show();

			$('#rNo').val(aa);

			$.ajax({
				url : "dModal.do",
				data : {
					rNo : aa
				},
				dataType : 'json',
				success : function(data) {
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
	</script>
</body>



</html>