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

<!-- Bootstrap cdn 설정 : popover -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
	<!-- Navigation -->
	<%@ include file="../common/nav_admin.jsp"%>
	<!-- 배경색 -->
	<form action="SearchAdminDriver">
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
							<!-- <p>기사님 목록 / admin_Driver.jsp / 사진은 버튼 누르면 팝업으로 띄우기 / 소제목 처리하기, 검색기능 넣기</p> -->
						</div>
						<hr>
					</div>

					<div class="row" id="content">
						<!-- <div id="content"> -->
						<div class="col-lg-3 sidebar">
							<a href="aMem.ad"><span class="sidebar_span">회원님 목록</span></a><br>
							<a href="aDri.ad"><span class="sidebar_span">: 기사님 목록</span></a><br>
							<a href="aRes.ad"><span class="sidebar_span">예약 내역</span></a><br>
							<a href="aJung.ad"><span class="sidebar_span">정산 내역</span></a><br>
							<a href="adRef.ad"><span class="sidebar_span">환불 내역</span></a><br>
							<!-- <a href="#"><span class="sidebar_span">채팅 내역</span></a> -->
						</div>

						<!-- list -->
						<div class="row" id="rowList">

							<!-- 검색기능 -->
							<div id="search">
								<select id="searchCondition" class="search" name="driverSearch">
									<option value="" selected="selected">선택</option>
									<option value="dNo">기사번호</option>
									<option value="dmNo">회원번호</option>
									<option value="mName">이름</option>
									<option value="capacity">차량 톤수</option>
									<option value="type">차종</option>
									<option value="carNo">차량번호</option>
								</select>
									<input type="text" name="content">
									<input type="submit" value="검색">
							</div>


							<div class="col-xs-12 col-md-12" id="table">
								<br>
								<!-- <table style="text-align: center" class="table table-striped table-hover text-center"> -->
								<table class="table table-striped table-hover text-center">
									<thead id="thead">
										<tr>
											<th>기사번호</th>
											<th>회원번호</th>
											<th>이름</th>
											<th>차량 톤수</th>
											<th>차종</th>
											<th>차량번호</th>
											<th>증명사진</th>
											<th>차량등록증</th>
										</tr>
									</thead>

									<tbody id="tbody">
										<c:forEach var="a" items="${ list }">
											<tr>
												<td>${ a.dNo }</td>
												<td>${ a.dmNo }</td>
												<td>${ a.regCardImgOrigin }</td>
												<td>${ a.capacity }</td>
												<td>${ a.type }</td>
												<td>${ a.carNo }</td>
												<td>
													<button class="imgBtn" id="idImgRename"
														value="resources/images/driver/id/${a.idImgRename}">상세보기</button>
													<%-- <button class="imgBtn" id="idImgRename" style="url('${pageContext.request.contextPath}/resources/images/driver/id/${a.idImgRename}');">가명</button> --%>
												</td>
												<td>
													<%-- <button class="imgBtn" id="regCardImgOrigin" style="url('${pageContext.request.contextPath}/resources/images/driver/id/${a.regCardImgOrigin}');">원명</button> --%>
													<button class="imgBtn" id="regCardImgRename"
														value="resources/images/driver/regCard/${a.regCardImgRename}">상세보기</button>
													<%-- <button id="popover_btn" data-toggle="popover" title="원명팝오버" data-content="url('${pageContext.request.contextPath}/resources/images/driver/id/${a.regCardImgRename}');" data-placement="bottom">팝오버</button> --%>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<%-- <button class="img-circle" id="popup" style="background-image: url('${pageContext.request.contextPath}/resources/images/driver/id/${a.idImgRename}');">pro_img</button> --%>

							<%-- <img src="imgs/file.jpg" />
	<img alt="gh1" src="${pageContext.request.contextPath}/resources/images/driver/id/${a.idImgRename}.jfif"/> --%>

							<script>
								$('.imgBtn')
										.popover(
												{
													html : true,
													trigger : 'hover focus',
													content : function() {
														var url = $(this).val();
														return '<img alt="호호1" src="'+url+'" />';
													}
												});
								//배열중에서 id는 안딤
								$('#regCardImgRename')
										.popover(
												{
													html : true,
													trigger : 'hover focus',
													content : function() {
														var url = $(this).val();
														return '<img alt="호호2" src="'+url+'" />';
													}
												});
							</script>

							<!-- 	
<script>

					// 팝오버을 실행하기 위해서 script에 popover함수를 실행해야 한다.
					$(function(){ 
						$('#idImgOrigin').popover({
							// fade 효과 사용 여부
							animation : true,
							// 팝오버을 나타낼 특정 요소
							container : false,
							// 지연 설정
							delay : {
								show : 500,
								hide : 100
							},
							// 템필릿
							html : false,
							// html false 경우 지정할 요소 selector
							selector : false,
							// html true일 경우 사용되는 popover 템플릿
							template : '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>',
							// 팝오버 트리거(반응) 이벤트
							trigger : 'hover focus',
							viewport : {
								selector : 'body',
								padding : 0
							},
						// 방향 (설정하면 요소의 data-placement 설정의 무효된다.)
						//placement: 'bottom',
						// 제목 (설정하면 요소의 title 설정의 무효된다.)
						//title: '',
						// 컨텐츠 값 (설정하면 요소의 data-content값은 무효된다.)
						// content: '',
						//sanitize: true,
						//sanitizeFn: null,
						//whiteList: ''
						});
					});
</script>
 -->

							<!-- '+$(this).data('img')+' -->
							<!-- <img alt="호" src="${pageContext.request.contextPath}/resources/images/driver/id/${a.idImgRename}"/> -->









							<!-- 페이징 처리 -->
							<div class="row text-center" style="height: 400px">
								<ul class="pagination ft_gr">

									<!-- << 처음  -->
									<li><c:if test="${ pi.currentPage eq 1 }">
											<a>&lt;&lt; &nbsp;</a>
										</c:if> <c:if test="${ pi.currentPage ne 1 }">
											<a href="aDri.ad?currentPage=1">&lt;&lt; &nbsp;</a>
										</c:if></li>

									<!-- < -->
									<li><c:if test="${ pi.currentPage ne 1 }">
											<c:url var="before" value="aDri.ad">
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
													href="<c:url var="pagination" value="aDri.ad">	
									<c:param name="currentPage" value="${ p }"/>
								</c:url>
						${ pagination }">${ p }</a>
											</c:if></li>
									</c:forEach>


									<!-- > -->
									<li><a
										href="
						<c:if test="${ pi.currentPage ne pi.maxPage }">
							<c:url var="after" value="aDri.ad">
								<c:param name="currentPage" value="${ pi.currentPage +1 }"/>
							</c:url>
						</c:if>
						${ after }">&gt;
											&nbsp;</a></li>

									<!-- >> 의도: 마지막 페이지에서는 >> 표시 사라짐(현재페이지가 끝 페이지임을 표시)-->
									<li><c:if test="${ pi.currentPage ne pi.maxPage }">
											<c:url var="lastPage" value="aDri.ad">
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
		</div>

	</form>

	<!-- Footer -->
	<%@ include file="../common/footer.jsp"%>


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