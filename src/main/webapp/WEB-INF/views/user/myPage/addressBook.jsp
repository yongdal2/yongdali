<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

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
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>용달이 | 예약 내역</title>
</head>

<body>
    <c:import url="../../common/nav.jsp" />
    <c:import url="../../user/myPage/userInfo.jsp" />
    
    
    
    
    
    <div class="container">
        <div class="row">
            <div class="h2 jal">마이페이지(주소록)</div>
            <hr>
            <div class="row na" style="margin-bottom: 30px">
                <div class="col-xs-10 col-md-10 h4">배송지 목록</div>
                <div class="col-xs-2 col-md-2 text-center">
                    <button class="btn btn_ydl_l" data-toggle="modal" data-target="#addAddr">배송지 추가</button>
                </div>
                <div class="col-xs-12 col-md-12 text-center noto">
                    <div class="col-xs-12 col-md-12">
                        <div class="row fw6" style="border-top: black solid 1px; border-bottom: 1px solid #dedede; padding: 10px;">
                            <div class="col-xs-2 col-md-2">배송지</div>
                            <div class="col-xs-5 col-md-5">주소</div>
                            <div class="col-xs-2 col-md-2">연락처</div>
                            <div class="col-xs-3 col-md-3">수정 · 삭제</div>
                        </div>
                        <div class="row small" style="border-bottom: 1px solid #dedede; padding: 10px;">
                            <div class="col-xs-2 col-md-2">
                                <span>회사</span>
                                <br> <span>도로리</span>
                            </div>
                            <div class="col-xs-5 col-md-5">
                                <span>강남구 대치동 123-556로 24번지</span>
                                <br>
                                <span>123층 12호</span>
                            </div>
                            <div class="col-xs-2 col-md-2">
                                <span>02-222-2222</span>
                                <br> <span>010-2711-1111</span>
                            </div>
                            <div class="col-xs-3 col-md-3">
                                <button class="btn btn-sm btn_ydl" data-toggle="modal" data-target="#editAddr">수정</button>
                                <button class="btn btn-sm">삭제</button>
                            </div>
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
            <div class="modal-content center-block" style="max-width: 440px;">
                <br>
                <div class="modal-body noto mb_pd" style="padding-top: 0px">
                    <div class="row  text-left center-block" style="border: 1px solid #dedede; border-radius: 16px; padding: 23px; background: #fff; width: 100%; max-width: 420px;">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 fw6" style="padding-right: 23px; font-size: 18px; font-weight: 600;">
								배송지 정보 상세
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                        </div>
                        <hr style="">
                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
								배송지명<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="#3" style="width: 100%; height: 35px;">
                            </div>
                        </div>

                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
								수령인<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="#4" style="width: 100%; height: 35px;" >
                            </div>
                        </div>
                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
                                	주소<span class="red"> *</span>
                            </div>
                            <div class="col-xs-6 col-md-6" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="adAdr_address" style="width: 100%; height: 35px;" placeholder="주소1">
                            </div>
                            <div class="col-xs-2 col-md-2 btn btn_ydl_l" id="searchAddr1btn" style="padding: 0; margin-top: 10px; height: 35px; line-height: 35px;" data-toggle="modal" data-target="#adSearchAddr" onclick="adSearchAddr()">
								주소 검색
                            </div>
                        </div>
                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
                                <span class="red"> </span>
                            </div>
                            <div class="col-xs-8 col-md-8" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="adAdr_detail" style="width: 100%; height: 35px;" placeholder="상세주소를 입력해 주세요.">
                            </div>
                        </div>
                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
								연락처<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="#8" style="width: 100%; height: 35px;">
                            </div>
                        </div>
                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
								연락처2</div>
                            <div class="col-xs-5 col-md-5" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="#9" style="width: 100%; height: 35px;">
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-12" id="pwCheckText" style="padding: 0; margin-top: 5px; display: none;"></div>
                        <div class="col-xs-12 col-md-12 text-center">
                            <button type="button" class="btn" data-dismiss="modal" style="margin: 20px 10px 0px 10px; color: gray;">취소</button>
                            <button type="submit" class="btn btn_ydl" data-dismiss="modal" style="margin: 20px 10px 0px 10px;">배송지 추가</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 주소 수정 -->
    <div class="modal fade" id="editAddr" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content center-block" style="max-width: 440px;">
                <br>
                <div class="modal-body noto mb_pd" style="padding-top: 0px">
                    <div class="row  text-left center-block" style="border: 1px solid #dedede; border-radius: 16px; padding: 23px; background: #fff; width: 100%; max-width: 420px;">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 fw6" style="padding-right: 23px; font-size: 18px; font-weight: 600;">
								배송지 정보 상세
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                        </div>
                        <hr style="">

                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
								배송지명<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="#13" style="width: 100%; height: 35px;">
                            </div>
                        </div>

                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
								수령인<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="#14" style="width: 100%; height: 35px;" >
                            </div>
                        </div>
                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
                                	주소<span class="red"> *</span>
                            </div>
                            <div class="col-xs-6 col-md-6" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="edAdr_address" style="width: 100%; height: 35px;" placeholder="주소1">
                            </div>
                            <div class="col-xs-2 col-md-2 btn btn_ydl_l" style="padding: 0; margin-top: 10px; height: 35px; line-height: 35px;" onclick="edSearchAddr()">
								주소 검색
                            </div>
                        </div>
                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
                                <span class="red"> </span>
                            </div>
                            <div class="col-xs-8 col-md-8" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="edAdr_detail" style="width: 100%; height: 35px;" placeholder="상세주소를 입력해 주세요.">
                            </div>
                        </div>
                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
								연락처<span class="red"> *</span>
                            </div>
                            <div class="col-xs-5 col-md-5" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="#18" style="width: 100%; height: 35px;">
                            </div>
                        </div>
                        <div class="row text-left" style="padding-left: 23px; padding-bottom: 5px;">
                            <div class="col-xs-3 col-md-3" style="padding: 0; margin-top: 16px; font-size: 14px; line-height: 24px;">
								연락처2</div>
                            <div class="col-xs-5 col-md-5" style="padding: 0; margin-top: 10px;">
                                <input type="text" class="form-control noto" id="#19" style="width: 100%; height: 35px;">
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-12 text-center">
                            <button type="button" class="btn" data-dismiss="modal" style="margin: 20px 10px 0px 10px; color: gray;">취소</button>
                            <button type="submit" class="btn btn_ydl" data-dismiss="modal" style="margin: 20px 10px 0px 10px;">배송지 추가</button>
                        </div>
                        <div class="col-xs-12 col-md-12 text-center">
                            <button type="button" class="btn" data-dismiss="modal" style="margin: 20px 10px 0px 10px; color: gray;">취소</button>
                            <button type="submit" class="btn btn_ydl" data-dismiss="modal" style="margin: 20px 10px 0px 10px;">배송지 추가</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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