<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="AOS - Animate On Scroll library using CSS3">
    <meta name="keywords" content="AOS, animate on scroll, css3 scroll animations, simple scroll animations">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/userMyPage.css" />
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
   	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=03ea077d7ecc6636dffede985cc5c57d&libraries=services"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>

    <title>용달이 | 예약 내역</title>
</head>

<body>
	<c:import url="../../common/nav.jsp"/>
	<c:import url="../../user/myPage/userInfo.jsp"/>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 h2 jal">
				예약내역 <br> <br>
			</div>
			<!-- 필터 -->
			<div class="col-xs-2 col-md-2 text-center bszB1">
				<select class="form-control ft54" name="rStatus" id="rStatus">
					<option value="rst">상태별 조회</option>
					<option value="pay">결제완료</option>
					<option value="deal">배차완료</option>
					<option value="pick">상차완료</option>
					<option value="drop">하차완료</option>
					<option value="canc">취소</option>
				</select>
			</div>
			<div class="text-center"></div>
			<div class="col-xs-3 col-md-3 text-center bszB">
				<input placeholder="상차일" class="form-control ft54" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date" />
			</div>
			<div class="col-xs-3 col-md-3 text-center bszB">
				<input placeholder="하차일" class="form-control ft54" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date1" />
			</div>
			<div class="col-xs-3 col-md-3 text-center bszB">
				<input type="search" class="form-control ft54" placeholder="검색">
			</div>
			<div class="col-xs-1 col-md-1 bszB">
				<button class="btn btn_ydl sch">
					<span class="glyphicon glyphicon-search" style="font-size: 22px"></span>
				</button>
			</div>
			<div class="col-xs-12 col-md-12 tbPdR" >
				<Br>
				<table class="table table-hover text-center">
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
							<td>차량정보</td>
							<td>상세정보</td>
						</tr>
					</thead>
					<c:forEach var="r" items="${ rList }" varStatus="vs">
						<tr>
							<td>${ r.rNo }</td>
							<td>
							<c:choose>
							<c:when test="${r.payment.payYN == 'Y' && r.payment.cancYN == 'N' }">결제 완료</c:when>
							<c:when test="${r.payment.payYN == 'Y' && r.payment.cancYN == 'Y' }">취소</c:when>
							<c:when test="${r.payment.dealYN == 'Y' && r.payment.cancYN == 'N' }">배차 완료</c:when>
							<c:otherwise> nn</c:otherwise>
							</c:choose>

							</td>
 							<td>예약 일자</td>
 							<td>상차일</td>
 							<td>하차일</td>
							<td>출발지</td>
							<td>dd</td>
							<td>결제 금액</td>
							<td><button class="fas fa-truck btn_no" id="tInfo${ vs.index }" data-toggle="popover${ vs.index }"  title="차량정보" value="${ r.rDNo }"></button></td>
							<td><button class="btn btn_ydl_l" id="rDetailBtn${r.rNo }" value="${ r.rNo }" data-toggle="modal" data-target="#rDetail">상세정보 보기</button></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
		<script>
		
		$(document).ready(function(){
			
			$('[data-toggle*="popover"]').popover({
			    "html": true,
			    trigger: "hover",
			    "content": function(){
			        var dNo = $(this).val();
			        return dInfo(dNo);
			    }
			});
			function dInfo(dNo){
				$.ajax({
					url:"rDinfo.myp",
					data:{dNo:dNo},
					dataType:"json",
					success:function(d){
						dhtml ="";
						console.log(d);
						console.log(d.deal);
						if(d.deal =='Y'){
						var name = "<span>기사님 성함 : "+decodeURIComponent(d.name)+"</span><br>";
						var phone = d.phone;
						var carNo = decodeURIComponent(d.carNo);
						var img = "${pageContext.request.contextPath}/resources/images/driver/id/"+d.img;
						var type = decodeURIComponent(d.type);
						var capcacity = d.capacity;
						dhtml = name + phone;
						}else{
						dhtml = "<span class='na fw6'>아직 배차전 입니다.</span>"; 
						}
						
					},error:function(){
						console.log("aj실패")
					}
				}); 
				return dhtml;
			}
		    
		});
		</script>
		
		<div class="text-center">
		<img class="img-circle" src="">
		</div>
		
		<!-- <div class="img-circle" id="pro_img"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/driver/id/${driver.idImgRename}');">  -->
		<div class="row text-center">
			<ul class="pagination ft_gr">
				<li><a href="#"><<</a></li>
				<li><a href="#"><</a></li>
				<li><a href="#">1</a></li>
				<li class="active"><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">></a></li>
				<li><a href="#">>></a></li>
			</ul>
		</div>
		
		
		 <!-- 예약 상세보기 수정 -->
    <div class="modal fade" id="rDetail" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content center-block mdRSV">
                <br>
                <div class="modal-body na mb_pd">
                	
                    <div class="row  text-left center-block modalBaseRSV">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 fw6 pr23 ft18">
								<span class="h3 jal">예약 정보 상세 (<span id="rNo">rNo</span>)</span>
								<span class="" style="display: hidden;" id="rSt"></span>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                        </div>
                        <div class="row text-left pl23 pb5">
                            <div class="col-xs-12 col-md-12 addrLa lg">
								예약일자 : <span id="rDate"></span>
                            </div>
                            <div class="col-xs-6 col-md-6 p0mt10">
                            	<span class="h4 fw6">출발지 정보</span>
                            	<br><span class="small lg">이름</span><br>
                            	<span class="h4" id="startName"></span>
                            	<br><span class="small lg">연락처</span><br>
                            	<span class="h4" id="startPhone"></span>
                            	<br><span class="small lg">주소</span><br>
                            	<span class="h4" id="startAddr"></span>
                            	<br><span class="small lg">상차</span><br>
                            	<span class="h4" id="pick"></span>
                            	<br><span class="small lg">상차방법</span><br>
                            	<span class="h4" id="helpLoad"></span>
                            </div>
                            <div class="col-xs-6 col-md-6 p0mt10">
                            	<span class="h4 fw6">도착지 정보</span>
                            	<br><span class="small lg">이름</span><br>
                            	<span class="h4" id="endName"></span>
                            	<br><span class="small lg">연락처</span><br>
                            	<span class="h4" id="endPhone"> </span>
                            	<br><span class="small lg">주소</span><br>
                            	<span class="h4" id="endAddr"></span>
                            	<br><span class="small lg">상차</span><br>
                            	<span class="h4" id="drop"></span>
                            	<br><span class="small lg">상차방법</span><br>
                            	<span class="h4" id="helpUnload"></span>
                            </div>
                            <div class="col-xs-12 col-md-12 p0mt10">
	                            <br>
	                            <span class="h4 fw6" style="background: white;">짐 내역</span>
	                            <br><span class="h4 lg" id="luggage"></span>
	                            <br>
	                            <div id="rMG" style="height: 50px">
	                            <br><span class="h4 fw6" style="background: white;">전달 사항</span>
		                            <br><span class="h4 lg" id="rMSG"></span>&nbsp;&nbsp;
		                            <div class="far fa-edit hvDr" id="rmb1"></div>
	                            </div>
	                            <div id="rMG_E" style="display: none; height: 50px">
	                            <br><span class="h4 fw6" style="background: white;">전달 사항</span>
		                            <br><textarea rows="1" cols="60" style="font: 18px" id="nRmsg"></textarea>
		                            <div class="fas fa-edit hvDr" id="rmb2"></div>
	                            </div>
                            </div>
                            <div class="col-xs-12 col-md-12 p0mt10 text-right">
                            <br>
                            <div style="margin-right: 30px;">
                            	결제금액<span class="h3 fw6" id=amount></span>원
                            </div>
                            </div>
                            </div>
                        <div class="col-xs-12 col-md-12 text-center">
                            <button type="button" class="btn btn_ydl_l mdbtn" data-dismiss="modal" onclick="msgShow()">확인</button>
                            <button type="button" id="cancRSV" class="btn btn_ydl_lr mdbtn" data-dismiss="modal">예약 취소</button>
                        </div>
                        <div class="col-xs-12 col-md-12 text-center">
                        </div>
                            
                            
                            <script type="text/javascript">
                            $(document).ready(function(){
                            	$('#rmb1').click(function(){
                            	    $('[id*="rMG"]').toggle();
                            	    
                            	  });
                            	
                            	$('#rmb2').click(function(){
                            		var nRmsg = $('#nRmsg').val();
                            		var rNo = $('#rNo').text();
                            		console.log(nRmsg);
                            		console.log(rNo);
                            		$.ajax({
                    					url:"upRmsg.myp",
                    					data:{"rMsg":nRmsg,"rNo":rNo},
                    					success:function(data){
                    						console.log(data);	
	                            	    	$('#rMSG').html(decodeURIComponent(data).replace(/\+/g, " "));
	                            	    	$('[id*="rMG"]').toggle();
                    					},error:function(){
                    						console.log("aj실패")
                    					}
                    				}); 
                            	});
	                            $(function(){
	                    			$("button[id^='rDetailBtn']").on("click",function(){
	                    				$.ajax({
	                    					url:"rDetail.myp",
	                    					data:{rNo:$(this).val()},
	                    					dataType:"json",
	                    					success:function(r){
	                    						console.log(r);
	                    						$("#rNo").text(r.rNo);
	                    						$("#startName").text(r.startName);
	                    						$("#startPhone").text(r.startPhone);
	                    						$("#startAddr").text((r.startAddr).replace(",",""));
	                    						if(r.rightLoad==null){
		                    						$("#pick").text(r.startDate +" / "+ r.startTime);
	                    						}else{
		                    						$("#pick").text(r.rightUnload);
	                    						}
	                    						$("#helpLoad").text(r.helpLoad);
	                    						$("#endName").text(r.endName);
	                    						$("#endPhone").text(r.endPhone);
	                    						$("#endAddr").text((r.endAddr).replace(",",""));
	                    						if(r.rightUnload==null){
	                    						$("#drop").text(r.endDate +" / "+ r.endTime);
	                    						}else{
	                    						$("#drop").text(r.rightUnload);
	                    						}
	                    						$("#helpUnload").text(r.helpLoad);
	                    						$("#luggage").text(r.luggage);
	                    						if(r.msg==null){
	                    						$("#rMSG").text("");
	                    						$("#nRmsg").val("");
	                    						}else{
	                    						$("#rMSG").text(r.msg);
	                    						$("#nRmsg").val(r.msg);
	                    						}
	                    						$("#amount").text(r.amount);
	                    						$("#rDate").text(r.payment.enrollDate);
	                    					},error:function(){
	                    						console.log("aj실패")
	                    					}
	                    				});
	                    			});
	                    		});
	                            
	                            });
                            
	                            $("#cancRSV").on("click",function(){
	                            	var rNo = $("#rNo").text();
	                            	console.log("rNo!!"+rNo)
	                            	d_yn(rNo);
	                            });
	                            
	                            function msgShow() {
									$("#rMG").show();
									$("#rMG_E").hide();
								}
	                            
	                            function d_yn(rNo){
	                				$.ajax({
	                					url:"pDetail.myp",
	                					data:{rNo:rNo},
	                					dataType:"json",
	                					success:function(p){
	                						console.log(p);	
	                						if(p.dealYN=="Y"){
	                							var ccA = confirm( "배차가 완료된 예약입니다 취소하시겠습니까?");
	                							if(ccA){
	                								rsvCan(p.pRNo,'Y');
	                							}
	                						}else{
	                							var ccb =confirm("배차되지 않은 예약입니다. 취소하시겠습니까?");
	                							rsvCan(p.pRNo,'N');
	                						}
	                						
	                					},error:function(){
	                						console.log("aj실패")
	                					}
	                				}); 
	                				
	                			}
	                            
	                            function rsvCan(pRNo,dealYN){
	                				$.ajax({
	                					url:"rsvCan.myp",
	                					data:{pRNo:pRNo, dealYN:dealYN},
	                					success:function(p){
	                						if(p=='ok'){
	                						alert("예약이 취소되었습니다.");
	                						}
	                					},error:function(){
	                						console.log("aj실패")
	                					}
	                				}); 
	                				
	                			}
	                            
                            </script>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
	<c:import url="../../common/footer.jsp"/>
</body>

</html>