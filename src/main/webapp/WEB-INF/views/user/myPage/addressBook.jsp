<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>

<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="AOS - Animate On Scroll library using CSS3">
    <meta name="keywords" content="AOS, animate on scroll, css3 scroll animations, simple scroll animations">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/userMyPage.css" />
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>용달이 | 예약 내역</title>
</head>

<body>
    <c:import url="../../common/nav.jsp" />
    <c:import url="../../user/myPage/userInfo.jsp" />
    
    <div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 h2 jal">주소록</div>
			<div class="col-xs-12 col-md-12 na">
				<div class="row na mb30">
					<div class="col-xs-9 col-md-10 h4">배송지 목록(${ listCount })</div>
					<div class="col-xs-3 col-md-2 text-center">
						<button class="btn btn_ydl_l" data-toggle="modal"
							data-target="#addAddr">배송지 추가</button>
					</div>
					<div class="col-xs-12 col-md-12 text-center noto">
						<div class="col-xs-12 col-md-12">
							<div class="row fw6 addrHbt">
								<div class="col-xs-2 col-md-2">배송지</div>
								<div class="col-xs-5 col-md-5">주소</div>
								<div class="col-xs-2 col-md-2">연락처</div>
								<div class="col-xs-3 col-md-3">수정 · 삭제</div>
							</div>
							<c:forEach var="a" items="${ aList }" varStatus="vs">
								<div class="row small addrBbt">
									<div class="col-xs-2 col-md-2">
										<span>${ a.aPlace }</span> <br> <span>${ a.aName }</span>
									</div>
									<div class="col-xs-5 col-md-5">
										<c:forEach var="addr" items="${fn:split(a.aAddress, ',')}">
											<span>${ addr }</span>
											<br>
										</c:forEach>
									</div>
									<div class="col-xs-2 col-md-2">
										<span>${ a.aPhone } </span>
									</div>
									<div class="col-xs-3 col-md-3">
										<button class="btn btn-sm btn_ydl" id="editAddrBtn${vs.index}" data-toggle="modal"
											data-target="#editAddr" value="${ a.aNo }">수정</button>
										<button class="btn btn-sm" id="deleteAddrBtn${vs.index}" value="${a.aNo }">삭제</button>
									</div>
								</div>
							</c:forEach>
							<script>
							$(function(){
								$("button[id^='editAddrBtn']").on("click",function(){
									$.ajax({
										url:"getUpAddr.myp",
										data:{aNo:$(this).val()},
										dataType:"json",
										success:function(data){
											console.log(data);
											$("#edAno").val(data.aNo);
											$("#edPlace").val(decodeURIComponent(data.aPlace).replace(/\+/g, " "));
											$("#edName").val(decodeURIComponent(data.aName));
											$("#edAdr_address").val(decodeURIComponent(data.aAddr1).replace(/\+/g, " "));
											$("#edAdr_detail").val(decodeURIComponent(data.aAddr2).replace(/\+/g, " "));
											$("#edPhone").val(decodeURIComponent(data.aPhone));
										},error:function(){
											console.log("aj실패")
										}
									});
								});
							});
							
							$(function(){
								$("button[id^='deleteAddrBtn']").on("click",function(){
									var aNo = $(this).val();
									console.log(aNo);
									var delA = confirm( "삭제하시겠습니까?");
									if(delA){
										
										document.location.href ="dAddr.myp";
									}else{
										alert("윽");
									}
									
							});
							});
							</script>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

    <!-- 주소 추가 -->
    <div class="modal fade" id="addAddr" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content center-block mdC">
                <br>
                <div class="modal-body noto mb_pd pt0">
                <form id="inAddrForm" method="post">
                    <div class="row  text-left center-block modalBaseAd">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 fw6 pr23 fw6 ft18">
								배송지 정보 상세
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                        </div>
                        <hr>
                        <div class="row text-left pl23">
                            <div class="col-xs-3 col-md-3 addrLa">
								배송지명<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5 p0mt10">
                                <input type="text" class="form-control noto addrIp" id="adPlace" name="adPlace">
                            </div>
                        </div>

                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-3 col-md-3 addrLa">
								수령인<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5 p0mt10">
                                <input type="text" class="form-control noto" id="adName" name="adName">
                            </div>
                        </div>
                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-3 col-md-3 addrLa">
                                	주소<span class="red"> *</span>
                            </div>
                            <div class="col-xs-6 col-md-6 p0mt10">
                                <input type="text" class="form-control noto addrIp" id="adAdr_address" name="adAdr_address">
                            </div>
                            <div class="col-xs-2 col-md-2 btn btn_ydl_l searchAddrBtn" id="searchAddr1btn" data-toggle="modal" data-target="#adSearchAddr" onclick="adSearchAddr()">
								주소 검색
                            </div>
                        </div>
                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-3 col-md-3 addrLa">
                                <span class="red"> </span>
                            </div>
                            <div class="col-xs-8 col-md-8 p0mt10">
                                <input type="text" class="form-control noto addrIp" id="adAdr_detail" name="adAdr_detail" placeholder="상세주소를 입력해 주세요.">
                            </div>
                        </div>
                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-3 col-md-3 addrLa">
								연락처<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5 p0mt10">
                                <input type="text" class="form-control noto addrIp" id="adPhone" name="adPhone">
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-12 p0mt10" id="pwCheckText"></div>
                        <div class="col-xs-12 col-md-12 text-center">
                            <button type="button" class="btn mdbtn lg" data-dismiss="modal">취소</button>
                            <button type="submit" id="btnInAddr" class="btn btn_ydl mdbtn" data-dismiss="modal">배송지 추가</button>
                        </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 주소 수정 -->
    <div class="modal fade" id="editAddr" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content center-block mdC">
                <br>
                <div class="modal-body noto mb_pd">
                	<form id="upAddrForm" method="post">
                    <div class="row  text-left center-block modalBaseAd">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 fw6 pr23 ft18">
								배송지 정보 상세
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                        </div>
                        <hr>

                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-3 col-md-3 addrLa">
								배송지명<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5 p0mt10">
                                <input type="text" class="form-control noto addrIp" id="edPlace" name="edPlace">
                            </div>
                        </div>

                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-3 col-md-3 addrLa">
								수령인<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5 p0mt10">
                                <input type="text" class="form-control noto addrIp" id="edName" name="edName">
                            </div>
                        </div>
                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-3 col-md-3 addrLa">
                                	주소<span class="red"> *</span>
                            </div>
                            <div class="col-xs-6 col-md-6 p0mt10">
                                <input type="text" class="form-control noto addrIp" id="edAdr_address" name="edAdr_address">
                            </div>
                            <div class="col-xs-2 col-md-2 btn btn_ydl_l searchAddrBtn" onclick="edSearchAddr()">
								주소 검색
                            </div>
                        </div>
                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-3 col-md-3 addrLa">
                                <span class="red"> </span>
                            </div>
                            <div class="col-xs-8 col-md-8 p0mt10">
                                <input type="text" class="form-control noto addrIp" id="edAdr_detail" name="edAdr_detail" placeholder="상세주소를 입력해 주세요.">
                            </div>
                        </div>
                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-3 col-md-3 addrLa">
								연락처<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5 p0mt10">
                                <input type="text" class="form-control noto addrIp" id="edPhone" name="edPhone">
                            </div>
                            	<input type="hidden" id="edAno" name="edAno">
                        </div>
                        <div class="col-xs-12 col-md-12 text-center">
                            <button type="button" class="btn mdbtn lg" data-dismiss="modal">취소</button>
                            <button type="submit" id="btnUpAddr" class="btn btn_ydl mdbtn" data-dismiss="modal">배송지 수정</button>
                        </div>
                        <div class="col-xs-12 col-md-12 text-center">
                        </div>
                    </div>
                	</form>
                </div>
            </div>
        </div>
    </div>
    <script>
    	$("#btnUpAddr").on("click",function(){
    		$("#upAddrForm").attr("action","uAddr.myp").submit();
    	});
    	$("#btnInAddr").on("click",function(){
    		$("#inAddrForm").attr("action","iAddr.myp").submit();
    	});
    </script>
    <!-- 배송지 주소 추가 주소 검색 모달 -->
	<div id=modalAd class="modalAddr">
		<div id="layerAd">
			<img id="btncloseLayerAd" src="https://t1.daumcdn.net/postcode/resource/images/close.png" onclick="closeDaumPostcodeAd()" alt="닫기 버튼">
		</div>		
	</div>
	<!-- 배송지 주소 수정 주소 검색 모달 -->
	<div id="modalEd" class="modalAddr">
		<div id="layerEd">
			<img id="btncloseLayerEd" src="https://t1.daumcdn.net/postcode/resource/images/close.png" onclick="closeDaumPostcodeEd()" alt="닫기 버튼">
		</div>		
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myPage/userAddrBook.js"></script>
	<c:import url="../../common/footer.jsp" />
</body>
</html>