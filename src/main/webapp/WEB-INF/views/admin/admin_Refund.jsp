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


</head>

<body>
	<!-- Navigation -->
	<%@ include file="../common/nav_admin.jsp"%>
	<!-- 배경색 -->
	
		<div id="backg">
			<!-- <div style="width: 100%; height: 100%; padding-top: 30px; padding-top: 30px;"> -->

			<!-- main -->
			<div id="white">
				<!-- 하얀 테두리 -->
				<div class="content container">
					<div class="row">
						<div id=title>
							<h2 class="jal">
								<a href="aMem.ad">관리자 페이지</a>
							</h2>
						</div>
						<hr>
					</div>


					
					<div class="row" id="content">
						<!-- <div id="content"> -->
						<div class="col-lg-3 sidebar">
							<a href="aMem.ad"><span class="sidebar_span">회원님 목록</span></a><br>
							<a href="aDri.ad"><span class="sidebar_span">기사님 목록</span></a><br>
							<a href="aRes.ad"><span class="sidebar_span">예약 내역</span></a><br>
							<a href="aJung.ad"><span class="sidebar_span">정산 내역</span></a><br>
							<a href="adRef.ad"><span class="sidebar_span">: 환불 내역</span></a><br>
							<!-- <a href="#"><span class="sidebar_span">채팅 내역</span></a> -->
						</div>

						<!-- list -->
						<div class="row" id="rowList">

							<!-- 검색기능 -->
							<form action="SearchAdminRefund" onsubmit="false">
							<div id="search">
								<select id="searchCondition" class="search" name="refundSearch">
									<option value="" selected="selected">선택</option>
									<option value="mNo">회원번호</option>
									<option value="rNo">결제번호</option>
									<option value="email">회원ID(이메일)</option>
									<option value="mName">이름</option>
									<option value="phone">휴대폰번호</option>
									<option value="cancAmount">환불금액</option>
								</select>
										<input type="text" name="content">
										<input type="submit" value="검색">
							</div>
							</form>

							<div class="col-xs-12 col-md-12" id="table">
								<br>
								<!-- <table style="text-align: center" class="table table-striped table-hover text-center"> -->
								<table id="rtable"class="table table-striped table-hover text-center">
									<thead id="thead" class="thead">
										<tr>
											<th>회원번호</th>
											<th>결제번호</th>
											<th>회원ID(이메일)</th>
											<th>이름</th>
											<th>휴대폰번호</th>
											<th>환불금액</th>
											<th>환불</th>
											<th>환불일자</th>
										</tr>
									</thead>
									<c:forEach var="a" items="${ list }">
										<tbody  class="tbody">	
											<tr class="tTr">
												<td>${ a.mNo }</td>
												<td>${ a.rNo }</td>
												<td>${ a.email }</td>
												<td>${ a.mName }</td>
												<td>${ a.phone }</td>
												<td>${ a.cancAmount }</td>
												<c:choose>
													<c:when test="${a.calcYn eq 1}">
														<td><input type="button" value="환불하기" onclick="button(this.value,'${a.rNo}')"></td>
														<td> - </td>
													</c:when>
													<c:when test="${a.calcYn eq 2}">
														<td>환불 완료</td>
														<td>${ a.calcDate }</td>
													</c:when>
												</c:choose>
												
											</tr>
										</tbody>	
									</c:forEach>
								</table>
							</div>
							
							<script>
								function button(value,rNo){
									console.log(value);
									console.log(rNo);
									
									/* ajax로 값 받아오기 전 */
									if(value == "환불하기"){
										
										 if (confirm("환불 하시겠습니까?") == true){    //확인
											refund(rNo);
										 }else{   //취소
											return false;
										 }
										
									}
									
								}
								/* ajax */
								function check(rNo){
									 if (confirm("환불 하시겠습니까?") == true){    //확인
										 refund(rNo);
									 }else{   //취소
									     return false;
									 }
									
								}
								
								function refund(rNo){
									console.log(rNo);
									$.ajax({
										url:"adminRefund.do",
										type:"post",
										data:{rNo:rNo},
										
										success:function(data){
											
											$('.thead').remove(); 
											$('.tbody').remove();
											
											listText = "";
											
											listText += "<thead id='thead' class='thead'>";
											listText += "<tr>";
											listText += "<th>회원번호</th>";
											listText += "<th>결제번호</th>";
											listText += "<th>회원ID(이메일)</th>";
											listText += "<th>이름</th>";
											listText += "<th>휴대폰번호</th>";
											listText += "<th>환불금액</th>";
											listText += "<th>환불</th>";
											listText += "<th>환불일자</th>";
											listText += "</tr>";
											listText += "</thead>";
											
											listText += "<tbody class='tbody'>";
											for(var i=0; i<data.length; i++){
												listText += "<tr class='tTr'>";
												listText += "<td>"+data[i].mNo+"</td>";
												listText += "<td>"+data[i].rNo+"</td>";
												listText += "<td>"+data[i].email+"</td>";
												listText += "<td>"+data[i].mName+"</td>";
												listText += "<td>"+data[i].phone+"</td>";
												listText += "<td>"+data[i].cancAmount+"</td>";
												if(data[i].calcYn == 1){
													listText += "<td><input type='button' value='환불하기' onclick='check("+'"'+data[i].rNo+'"'+")'></td>";
													listText += "<td> - </td>";
												}else if(data[i].calcYn == 2){
													listText += "<td>환불완료</td>";
													listText += "<td>"+data[i].calcDate+"</td>";
												}
												
												listText += "<td></td>";
												listText += "</tr>";
											}
											listText += "</tbody>";
											$('#rtable').html(listText);
											
											console.log(data);
										},error:function(){
											
										}
									});
									
								}
							</script>

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
						</div>
						<!--  -->
					</div>
				</div>
				<!-- 하얀테두리 -->


			</div>
		</div>
	

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