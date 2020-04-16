
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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

tfoot {
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
					<b style="font-weight: 500; letter-spacing: 5px;">신청가능한 예약</b>
				</h1>
				<br>
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
								<td align="center">${r.helpLoad}/${r.helpUnload}</td>
								<td align="center" colspan="3">${r.startAddr }</td>
								<td align="center" colspan="3">${r.endAddr }</td>
								<td align="center"><fmt:formatDate value="${r.startDate }"
										type="date" pattern="yyyy-MM-dd" /></td>
								<td align="center"><fmt:formatDate value="${r.endDate }"
										type="date" pattern="yyyy-MM-dd" /></td>
								<td align="center"><button class='dealB btn'
										style='color: white;' onclick='edit(this.value)'
										value="${r.rNo }">배차취소</button></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center" height="20">
							<td colspan="12">
								<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">&lt;&lt; &nbsp;</c:if>
								<c:if test="${ pi.currentPage ne 1 }">
									<c:url var="before" value="myDetail.do">
										<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										<c:param name="mNo" value="${loginUser.mNo}" />
									</c:url>
									<a href="${ before }" style="font: 20px;">&lt;&lt;</a> &nbsp;
								</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
									end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<font color="#F15F5F" size="4"><b>[${ p }]</b></font>
									</c:if>

									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="myDetail.do">
											<c:param name="currentPage" value="${ p }" />
											<c:param name="mNo" value="${loginUser.mNo}" />
										</c:url>
										<a href="${ pagination }">${ p }</a> &nbsp;
									</c:if>
								</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">&gt;&gt;</c:if>
								<c:if test="${ pi.currentPage ne pi.maxPage }">
									<c:url var="after" value="myDetail.do">
										<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										<c:param name="mNo" value="${loginUser.mNo}" />
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
			<div class="modal" tabindex="-1" role="dialog" id="eventModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content"
						style="border-radius: 20px 20px 20px 20px/20px 20px 20px 20px; border: 2px solid white">
						<div class="modal-header"
							style="border-radius: 20px 20px 0px 0px/20px 20px 0px 0px">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="CLose">
								<span aria-hidden="true">X</span>
							</button>
							<h2 id="evetitle" style="">
								<b>배차정보</b>
							</h2>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-title">예약번호</label> <input
										class="form-control" type="text" name="rNo" id="rNo"
										required="required" readonly />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-start">예약일</label> <input
										class="form-control" type="text" name="enrollDate"
										id="enrollDate" disabled="disabled" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-start">상차일</label> <input
										class="form-control" type="text" id="sangDate"
										disabled="disabled" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-start">하차일</label> <input
										class="form-control" type="text" id="haDate"
										disabled="disabled" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-end">출발지</label> <input
										class="form-control" type="text" id="start"
										disabled="disabled" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-type">도착지</label> <input
										class="form-control" type="text" id="end" disabled="disabled" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-color">차량종류</label> <input
										class="form-control" type="text" id="type" disabled="disabled" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-start">이삿짐</label>
									<textarea rows="3" class="form-control" name="luggage"
										id="luggage" disabled="disabled"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-desc">요청사항</label>
									<textarea rows="3" class="form-control" name="msg" id="msg"
										disabled="disabled"></textarea>
								</div>
							</div>
						</div>
						<div style="visibility: hidden; height: 2px">
							<input id="mNo" name="mNo" value="${loginUser.mNo}">
						</div>
						<div class="ContaineraddEvent" id="deletecar">
							<div class="modal-footer"
								style="border-radius: 0px 0px 20px 20px/0px 0px 20px 20px">
								<button id="cancelBtn" type="button" class="btn"
									style=" color: white" onclick="myCancel();">배차취소</button>
								<button type="button" class="btn "
									style="background: white; color: grey" data-dismiss="modal">닫기</button>
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
		function edit(aa){
			$("#eventModal").modal();
			
			
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