<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>용달이 | 관리자 페이지</title>

<!-- Custom Css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/admin/admin.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>
	<!-- Navigation -->
	<%@ include file="../common/nav_admin.jsp"%>
	<!-- 배경색 -->
	<div id="backg">
		<!-- <div style="width: 100%; height: 100%; padding-top: 30px; padding-top: 30px;"> -->

		<!-- main -->
		<div id="white">
			<div class="content container">
				<div class="row">
					<div id=title>
						<h2 class="jal">
							<a href="adminHome.ydl">관리자 페이지</a>
						</h2>
					</div>
					<hr>
				</div>



				<div class="row" id="content">
					<!-- <div id="content"> -->
					<div class="col-lg-3 sidebar">
						<a href="aMem.ad"><span class="sidebar_span">회원님 목록</span></a><br>
						<a href="aDri.ad"><span class="sidebar_span">기사님 목록</span></a><br>
						<a href="aRes.ad"><span class="sidebar_span">: 예약 내역</span></a><br>
						<a href="aJung.ad"><span class="sidebar_span">정산 내역</span></a><br>
						<a href="adRef.ad"><span class="sidebar_span">환불 내역</span></a><br>
						<!-- <a href="#"><span class="sidebar_span">채팅 내역</span></a> -->
					</div>

					<!-- list -->
					<div class="row" id="rowList">
						<div class="col-xs-12 col-md-12" id="table">
							<br>
							<!-- <table style="text-align: center" class="table table-striped table-hover text-center"> -->
							<table class="table table-striped table-hover text-center">
								<thead id="thead">
									<tr>
										<!--	<th>상세보기</th>  모달창(집중) 예약컬럼의 전체 상세내역 -->
										<td>예약 번호</td>
										<td>예약자 코드</td>
										<td>배차자코드</td>
										<td>상차일</td>
										<td>하차일</td>
										<td>결제 금액</td>
										<td>상세/정산</td>
									</tr>
								</thead>

								<c:forEach var="a" items="${ list }">
									<tbody id="tbody">
										<tr>
											<td>${a.rNo }</td>
											<td>${a.rMNo }</td>
											<td>${a.rDNo }</td>
											<c:choose>
												<c:when test="${a.startDate != null}">
													<td>${a.startDate}</td>
												</c:when>
												<c:otherwise>
													<td>-</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${a.endDate != null}">
													<td>${a.endDate}</td>
												</c:when>
												<c:otherwise>
													<td>-</td>
												</c:otherwise>
											</c:choose>
											<td>${a.amount }원</td>
											<td><button onclick="openModal(this.value)" value="${a.rNo}">상세/정산</button></td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>


						<!-- 페이징 처리 -->
						<div class="row text-center" style="height: 400px">
							<ul class="pagination ft_gr">

								<!-- << 처음  -->
								<li><c:if test="${ pi.currentPage eq 1 }">
										<a>&lt;&lt; &nbsp;</a>
									</c:if> <c:if test="${ pi.currentPage ne 1 }">
										<a href="adRef.ad?currentPage=1">&lt;&lt; &nbsp;</a>
									</c:if></li>

								<!-- < -->
								<li><c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="adRef.ad">
											<c:param name="currentPage" value="${ pi.currentPage -1 }" />
										</c:url>
										<a href="${ before }">&lt; &nbsp;</a>
									</c:if> <c:if test="${ pi.currentPage eq 1 }">
										<a> &lt; &nbsp;</a>
									</c:if></li>

								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }"
									end="${ pi.endPage }">
									<li><c:if test="${ p eq pi.currentPage }">
											<a><b><font color="#5a8cff">${ p }</font></b></a>
										</c:if> <c:if test="${ p ne pi.currentPage }">
											<a
												href="<c:url var="pagination" value="adRef.ad">	
									<c:param name="currentPage" value="${ p }"/>
								</c:url>
						${ pagination }">${ p }</a>
										</c:if></li>
								</c:forEach>

								<!-- > -->
								<li><a
									href="
						<c:if test="${ pi.currentPage ne pi.maxPage }">
							<c:url var="after" value="adRef.ad">
								<c:param name="currentPage" value="${ pi.currentPage +1 }"/>
							</c:url>
						</c:if>
						${ after }">&gt;
										&nbsp;</a></li>

								<!-- >> 의도: 마지막 페이지에서는 >> 표시 사라짐(현재페이지가 끝 페이지임을 표시)-->
								<li><c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="lastPage" value="adRef.ad">
											<c:param name="currentPage" value="${ pi.maxPage }" />
										</c:url>
										<a href="${ lastPage }">&gt;&gt; &nbsp;</a>
									</c:if></li>
							</ul>
						</div>
						<!-- 페이징 처리 -->
					</div>
					<!-- list -->
				</div>
			</div>
			<!-- 하얀테두리 -->
		</div>
		<div class="modal" tabindex="-1" role="dialog" id="eventModal">
			<form action="Jungsan.do" method="post">
				<div class="modal-dialog" role="document">
					<div class="modal-content"
						style="border-radius: 20px 20px 20px 20px/20px 20px 20px 20px; border: 2px solid white">
						<div class="modal-header"
							style="border-radius: 20px 20px 0px 0px/20px 20px 0px 0px">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="CLose">
								<span aria-hidden="true">X</span>
							</button>
							<h2 id="evetitle" style="color: white">
								<b>예약 상세정보</b>
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
						<div class="ContaineraddEvent" id="savecar">
							<div class="modal-footer"
								style="border-radius: 0px 0px 20px 20px/0px 0px 20px 20px">
								<button id="submit" class="btn"
									style="background: white; color: grey">정산</button>
								<button type="button" class="btn "
									style="background: white; color: grey" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="../common/footer.jsp"%>


	<!-- 예약내역 상세보기 : 이목 집중 모달창 -->
	<script type="text/javascript">
		function openModal(aa){
			$("#eventModal").modal();
			
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
	</script>





	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}

		$('#resFaq').click(function() {
			$(this).css({
				'background' : 'rgb(87, 187, 138)',
				'color' : 'white'
			});
			$('.faq_index_ul li:not(:contains("예약"))').css({
				'background' : 'rgb(231, 230, 230)',
				'color' : 'black'
			});
			$('#resFaqDetail').css({
				'display' : 'block'
			})
			$('#delivFaqDetail').css({
				'display' : 'none'
			})
			$('#payFaqDetail').css({
				'display' : 'none'
			})
			$('#sDelFaqDetail').css({
				'display' : 'none'
			})
			$('#etcFaqDetail').css({
				'display' : 'none'
			})
		});
		$('#delivFaq').click(function() {
			$(this).css({
				'background' : 'rgb(87, 187, 138)',
				'color' : 'white',
			});
			$('.faq_index_ul li:not(:contains("배송"))').css({
				'background' : 'rgb(231, 230, 230)',
				'color' : 'black'
			});
			$('#resFaqDetail').css({
				'display' : 'none'
			})
			$('#delivFaqDetail').css({
				'display' : 'block'
			})
			$('#payFaqDetail').css({
				'display' : 'none'
			})
			$('#sDelFaqDetail').css({
				'display' : 'none'
			})
			$('#etcFaqDetail').css({
				'display' : 'none'
			})
		});
		$('#payFaq').click(function() {
			$(this).css({
				'background' : 'rgb(87, 187, 138)',
				'color' : 'white',
			});
			$('.faq_index_ul li:not(:contains("결제"))').css({
				'background' : 'rgb(231, 230, 230)',
				'color' : 'black'
			});
			$('#resFaqDetail').css({
				'display' : 'none'
			})
			$('#delivFaqDetail').css({
				'display' : 'none'
			})
			$('#payFaqDetail').css({
				'display' : 'block'
			})
			$('#sDelFaqDetail').css({
				'display' : 'none'
			})
			$('#etcFaqDetail').css({
				'display' : 'none'
			})
		});
		$('#sDelFaq').click(function() {
			$(this).css({
				'background' : 'rgb(87, 187, 138)',
				'color' : 'white',
			});
			$('.faq_index_ul li:not(:contains("소형이사"))').css({
				'background' : 'rgb(231, 230, 230)',
				'color' : 'black'
			});
			$('#resFaqDetail').css({
				'display' : 'none'
			})
			$('#delivFaqDetail').css({
				'display' : 'none'
			})
			$('#payFaqDetail').css({
				'display' : 'none'
			})
			$('#sDelFaqDetail').css({
				'display' : 'block'
			})
			$('#etcFaqDetail').css({
				'display' : 'none'
			})
		});
		$('#etcFaq').click(function() {
			$(this).css({
				'background' : 'rgb(87, 187, 138)',
				'color' : 'white',
			});
			$('.faq_index_ul li:not(:contains("기타"))').css({
				'background' : 'rgb(231, 230, 230)',
				'color' : 'black'
			});
			$('#resFaqDetail').css({
				'display' : 'none'
			})
			$('#delivFaqDetail').css({
				'display' : 'none'
			})
			$('#payFaqDetail').css({
				'display' : 'none'
			})
			$('#sDelFaqDetail').css({
				'display' : 'none'
			})
			$('#etcFaqDetail').css({
				'display' : 'block'
			})
		});
	</script>
</body>
</html>