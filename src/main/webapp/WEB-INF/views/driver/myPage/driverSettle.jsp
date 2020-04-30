<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="AOS - Animate On Scroll library using CSS3">
<meta name="keywords"
	content="AOS, animate on scroll, css3 scroll animations, simple scroll animations">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myPage/driverMyPage.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myPage/userMyPage.css" />
<link
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<title>용달이 | 정산 내역</title>
</head>
<body>
	<c:import url="../../common/nav_driver.jsp" />
	<c:import url="../../driver/myPage/driverInfo.jsp" />
	
	<c:if test="${ pi.listCount eq 0 }">
	<div class="container">
		<div class="row text-center">
			<div class="col-xs-12 col-md-12 ">
				<div class="h2 jal" style="margin-top: 150px; margin-bottom: 150px;">정산내역이 존재하지 않습니다</div>
			</div>
		</div>
	</div>
	</c:if>
	<c:if test="${ pi.listCount > 0 }">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 h2 jal">
				정산 <br> <br>
			</div>
			<!-- 필터 -->
			<form id="filterForm">
			<div class="col-xs-2 col-md-2 text-center bszB1">
				<select class="form-control ft54" name="calStatus" id="calStatus">
					<option value="cal">정산별 조회</option>
					<option value="calcN">정산 전</option>
					<option value="calcY">정산 완료</option>
				</select>
			</div>
			<div class="col-xs-3 col-md-3 text-center bszB">
				<select class="form-control ft54" name="rsvStatus" id="rsvStatus">
					<option value="rsv">상태별 조회</option>
					<!-- <option value="pay">결제완료</option> 불피요--> 
					<option value="drop">배차완료</option>
					<option value="canc">취소</option>
				</select>
			</div>
			<div class="text-center"></div>
			<div class="col-xs-3 col-md-3 text-center bszB">
				<input placeholder="기간 검색 시작일" class="form-control ft54" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" name="stDate" id="stDate"/>
			</div>
			<div class="col-xs-3 col-md-3 text-center bszB">
				<input placeholder="기간 검색 종료일" class="form-control ft54" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" name="edDate" id="edDate"/>
			</div>
			<div class="col-xs-1 col-md-1 bszB">
				<button class="btn btn_ydl_r sch" id="fBtn">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</div>
			</form>
		</div>
		<div class="h2">
			<br>
		</div>
		<!-- 정산 테이블 -->
					<div class="col-xs-12 col-md-12 tbPdR" >
				<Br>
				<table class="table table-hover text-center noto">
					<thead>
						<tr>
							<td>예약 번호</td>
							<td>진행 상태</td>
 							<td>예약 일자</td>
 							<td>상차일</td>
 							<td>하차일</td>
							<td>출발지</td>
							<td>도착지</td>
							<td>결제 금액</td>
							<td>정산 금액</td>
							<td>정산 상태</td>
							<td>정산 일자</td>
						</tr>
					</thead>
					<c:forEach var="f" items="${ fList }" varStatus="vs">
								<c:set var="p" value="${ f.payment }"></c:set>
								<c:set var="cal" value="${ p.calculate }"></c:set>
								
								
						<tr>
							<td class="fw6">${ f.rNo }</td> <!-- 예약번호 -->
							<td><!-- 상태 -->
								<c:choose>
								<c:when test="${p.payYN eq 'Y' && p.cancYN eq 'Y' }"><span class="llg">취소</span></c:when>
								<c:when test="${p.payYN eq 'Y' && p.cancYN eq 'N' && f.dealYN eq 'N' }">결제 완료</c:when>
								<c:when test="${f.dealYN eq 'Y' && p.cancYN eq 'N' }">배차 완료</c:when>
								</c:choose>
							</td>
 							<td><c:out value="${fn:replace(p.enrollDate,'2020','20')}"/></td><!-- 예약일자 -->
 							<td>
							<c:choose>
							<c:when test="${f.rightLoad eq null}"><c:out value="${fn:replace(f.startDate,'2020','20')}"/></c:when>
							<c:otherwise>${f.rightLoad}</c:otherwise>
							</c:choose>
 							</td>
 							<td>
 							<c:choose>
							<c:when test="${f.rightLoad eq null}"><c:out value="${fn:replace(f.startDate,'2020','20')}"/></c:when>
							<c:otherwise>${f.rightLoad}</c:otherwise>
							</c:choose>
 							</td>
							<td>
							<c:out value="${fn:split(f.startAddr, ',')[0]}"/>
							</td>
							<td>
							<c:out value="${fn:split(f.endAddr, ',')[0]}"/>
							</td>
							<td>${ f.amount }원</td><!-- 계산금액  -->
							<td>${ cal.charge }원</td><!-- 정산금액  -->
							<td><c:choose>
								<c:when test="${p.calcYN eq 1}">정산완료</c:when>
								<c:when test="${p.calcYN eq 0}">정산 전</c:when>
							</c:choose> </td>
							<td><c:out value="${fn:replace(cal.calcDate,'2020','20')}"/></td><!-- 정산일자 -->
						</tr>
					</c:forEach>
				</table>
			</div>
		<!--  페이징 처리  -->
	    <div class="row text-center">
	    <ul class="pagination ft_gr">
	        <!-- << , < -->
	        <li>
	            <c:if test="${ pi.currentPage eq 1 }"><a>&lt;&lt; &nbsp;</a></c:if>
	            <c:if test="${ pi.currentPage ne 1 }"><a href="driverSettle.myp?currentPage=1">&lt;&lt; &nbsp;</a></c:if>
	        </li>
	        <li>
	            <c:if test="${ pi.currentPage ne 1 }">
	                <c:url var="before" value="driverSettle.myp">
	                    <c:param name="currentPage" value="${ pi.currentPage-1 }" />
	                </c:url>
	                <a href="${ before }">&lt; &nbsp;</a>
	            </c:if>
	            <c:if test="${ pi.currentPage eq 1 }">
	                <a> &lt; &nbsp;</a>
	            </c:if>
	        </li>
	
	        <!-- 페이지 -->
	        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	            <li>
	                <c:if test="${ p eq pi.currentPage }">
	                    <a style="color: rgb(241, 95, 95) !important;"><b>${ p }</b></a>
	                </c:if>
	                <c:if test="${ p ne pi.currentPage }">
	                    <a href="<c:url var="pagination" value="driverSettle.myp">	
								<c:param name="currentPage" value="${ p } "/>
							</c:url>
					${ pagination }">${ p }</a>
	                </c:if>
	            </li>
	        </c:forEach>
	        <!-- > -->
	        <li>
	            <a href="
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="driverSettle.myp">
							<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
						</c:url>
					</c:if>
					${ after }">&gt; &nbsp;</a>
	        </li>
	        <!-- >> 의도: 마지막 페이지에서는 >> 표시 사라짐(현재페이지가 끝 페이지임을 표시)-->
	        <li>
	            <c:if test="${ pi.currentPage ne pi.maxPage }">
	                <c:url var="lastPage" value="driverSettle.myp">
	                    <c:param name="currentPage" value="${ pi.maxPage }" />
	                </c:url>
	                <a href="${ lastPage }">&gt;&gt; &nbsp;</a>
	            </c:if>
	        </li>
	    </ul>
	</div>		
	</div>
	<script type="text/javascript">
	$("#fBtn").on("click",function(){
		if($('#stDate').val()==""){
			$('#stDate').val("2000-01-01");
		}
		if($('#edDate').val()==""){
			$('#edDate').val("2099-01-01");
		}
		
		$("#filterForm").attr("action","driverSettle.myp").submit();
	});
	</script>
	</c:if>
	<c:import url="../../common/footer.jsp" />
</body>

</html>