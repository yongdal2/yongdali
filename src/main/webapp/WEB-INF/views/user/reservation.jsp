<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>용달이 | 예약하기</title>
    
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css"/>
    <!-- map API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=03ea077d7ecc6636dffede985cc5c57d&libraries=services"></script>
	
    <!-- font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"/>
    <link type="text/css" rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"/>

</head>
<body>
	<!-- header -->
	<c:import url="../common/home_nav.jsp"/>
	
	<!-- body -->
    <div id="body-div" class="container">
        <div>
            <h2 style="font-family: 'yg-jalnan';">용달이 예약이요~</h2><hr style="border-color: black;">
        </div>
        <div style="display: flex;">
            <div>
                <div id="line1">
                    <div class="edge11">
                        <div class="title11">
                            <label id="carGuide1">
                                <img src="${pageContext.request.contextPath}/resources/images/reservation/question-mark.svg" alt="안내">
                                <span id="carGuide-ment">차량 안내가 필요하신가요?</span>
                            </label>
                           	 차량 정보
                        </div>
                        <div id="carOption-div" class="content22">
                            <select name="" id="sl1" onchange="cl1();" required>
                                <option class="opt1" value="" disabled selected>톤수 선택</option>
                                <option class="opt2" value="1톤">1톤</option>
                                <option class="opt2" value="1.4톤">1.4톤</option>
                                <option class="opt2" value="2.5톤">2.5톤</option>
                                <option class="opt2" value="3.5톤">3.5톤</option>
                                <option class="opt2" value="5톤">5톤</option>
                            </select>

                            <select name="" id="sl2" onchange="cl2();" required>
                                <option class="opt1" value="" disabled selected>차종 선택</option>
                                <option class="opt2" value="카고">카고</option>
                                <option class="opt2" value="호루">호루</option>
                                <option class="opt2" value="탑차">탑차</option>
                                <option class="opt2" value="윙바디">윙바디</option>
                                <option class="opt2" value="리프트">리프트</option>
                            </select>
                        </div>
                    </div>
                    <div class="edge11">
                        <div class="title11">
                            <label id="myBtn11">
                                <img src="${pageContext.request.contextPath}/resources/images/reservation/round-add.svg" alt="안내">
                                <span id="load-title">이삿짐 선택</span>
                            </label>
                           	 이삿짐
                        </div>
                        <div id="load-content-div" class="content22">
                            <textarea name="" id="load-content-area" cols="64" rows="3" placeholder="이삿짐 품목을 선택해주세요." readonly required></textarea>
                        </div>
                        <!-- Modal -->
                        <div id="myModal11" class="modal11">
                            <!-- Modal content -->
                            <div class="modal-content11">
                                <span class="close11" style="width: 30px;">&times;</span>
                                <div id="selectLoad-div">
                                    <div id="selectLoad-title-div">
                                        <span id="selectLoad-title">이삿짐 선택</span>
                                    </div>
                                    <div id="selectLoad-topic">
                                        <div>
                                            <button id="funiture11" class="move-topic1">가구</button>
                                        </div>
                                        <div>
                                            <button id="appliance11" class="move-topic1">가전</button>
                                        </div>
                                        <div>
                                            <button id="etc11" class="move-topic1">기타</button>
                                        </div>
                                    </div>
                                    <!-- 가구 -->
                                    <div id="funiture22" class="move-topic11" style="display: block;">
                                        <div class="move-topic22">
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">침대(매트리스만)</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">침대(매트리스만+프레임)</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">수납장</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">신발장</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">화장대</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">책상</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">의자</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">소파</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">식탁</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">옷장</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">싱크대</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 가전 -->
                                    <div id="appliance22" class="move-topic11">
                                        <div class="move-topic22">
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">컴퓨터/노트북</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">모니터</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">프린터</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">에어컨</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">냉장고</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">TV</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">세탁기</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">공기청정기</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">청소기</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">오븐/전자레인지</div>
                                            </div>
                                            <div class="move-content11">
                                                <div class="move-content111">
                                                    <div class="move-content1111 minus11"><img src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="" class="move-minus-img"></div>
                                                    <span class="move-content1112">0</span>
                                                    <div class="move-content1111 plus11" ><img src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>
                                                </div>
                                                <div class="move-content112">밥솥</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 기타 -->
                                    <div id="etc22" class="move-topic11">
                                        <div id="div11" class="move-topic22">
                                            <div style="height: 50px;" align="center">
                                                <div id="addList-btn">항목 추가</div>
                                            </div>
                                            <div class="move-content11">
                                                <div id="capacity-div" class="move-content111">
                                                    <div class="move-content1111 minus11">
                                                        <img class="move-minus-img" src="${pageContext.request.contextPath}/resources/images/reservation/iconfinder_minus_172505.png" alt="">
                                                    </div>
                                                    <span class="move-content1113">0</span>
                                                    <div class="move-content1111 plus11">
                                                        <img class="move-plus-img" src="${pageContext.request.contextPath}/resources/images/reservation/add_plus-512.png" alt="">
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;<div id="xmark-div" class="item1"><img id="xmark-img" src="${pageContext.request.contextPath}/resources/images/reservation/x-mark.png" alt=""></div>
                                                </div>
                                                <div style="height: 35px;"><input id="writeLoad" class="move-content113" type="text"></div>
                                            </div>
                                    
                                        </div>
                                    </div>
                                    <div align="center">
                                        <button id="loadBtn">선택하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="line2">
                    <div class="edge11">
                        <div class="title11">출발지 정보</div>
                        <div id="startAddr-div" class="content22">
                            <div id="searchAddr-div1">
                                <div id="searchAddr-div11">
                                    <input id="startAddr" type="text" placeholder="주소 검색 (주소, 건물명)" onclick="searchStartAddr();" readonly required>
                                    <img src="${pageContext.request.contextPath}/resources/images/reservation/magnifying-glass-black.svg" alt="검색" onclick="searchStartAddr();" style="cursor: pointer;">
                                </div>
                                <input id="startDetailAddr" type="text" placeholder="상세 주소" required>
                            </div>
                            <div>
                                <input id="startPhone" type="text" placeholder="연락처" onKeyup="inputPhoneNumber(this);" maxlength="13" required>
                            </div>
                            <div align="left">
                                <label id="start-check" class="checkbox-wrap">
                                    <input id="checkLoad1" type="checkbox" name="" value="">
                                    <i class="check-icon" style="margin-top: 2px;"></i>
                                    <div style="font-size: 16px;">&nbsp;&nbsp;바로 상차</div>
                                </label>
                            </div>
                            <div style="display: flex;">
                                <div id="start-date-div" class="input-group date">
                                    <input id="datepicker1" type="text" placeholder="날짜 선택" required>
                                    <div id="dt1" class="input-group-addon">
                                      <span class="glyphicon glyphicon-th" style="color: white;"></span>
                                    </div>
                                </div>
                                <div>
                                    <select name="" id="sl3" onchange="cl3();" required>
                                        <option class="opt3" value="" disabled selected>시간 선택</option>
                                        <option class="opt4" value="00:00">00시 00분</option>
                                        <option class="opt4" value="00:30">00시 30분</option>
                                        <option class="opt4" value="01:00">01시 00분</option>
                                        <option class="opt4" value="01:30">01시 30분</option>
                                        <option class="opt4" value="02:00">02시 00분</option>
                                        <option class="opt4" value="02:30">02시 30분</option>
                                        <option class="opt4" value="03:00">03시 00분</option>
                                        <option class="opt4" value="03:30">03시 30분</option>
                                        <option class="opt4" value="04:00">04시 00분</option>
                                        <option class="opt4" value="04:30">04시 30분</option>
                                        <option class="opt4" value="05:00">05시 00분</option>
                                        <option class="opt4" value="05:30">05시 30분</option>
                                        <option class="opt4" value="06:00">06시 00분</option>
                                        <option class="opt4" value="06:30">06시 30분</option>
                                        <option class="opt4" value="07:00">07시 00분</option>
                                        <option class="opt4" value="07:30">07시 30분</option>
                                        <option class="opt4" value="08:00">08시 00분</option>
                                        <option class="opt4" value="08:30">08시 30분</option>
                                        <option class="opt4" value="09:00">09시 00분</option>
                                        <option class="opt4" value="09:30">09시 30분</option>
                                        <option class="opt4" value="10:00">10시 00분</option>
                                        <option class="opt4" value="10:30">10시 30분</option>
                                        <option class="opt4" value="11:00">11시 00분</option>
                                        <option class="opt4" value="11:30">11시 30분</option>
                                        <option class="opt4" value="12:00">12시 00분</option>
                                        <option class="opt4" value="12:30">12시 30분</option>
                                        <option class="opt4" value="13:00">13시 00분</option>
                                        <option class="opt4" value="13:30">13시 30분</option>
                                        <option class="opt4" value="14:00">14시 00분</option>
                                        <option class="opt4" value="14:30">14시 30분</option>
                                        <option class="opt4" value="15:00">15시 00분</option>
                                        <option class="opt4" value="15:30">15시 30분</option>
                                        <option class="opt4" value="16:00">16시 00분</option>
                                        <option class="opt4" value="16:30">16시 30분</option>
                                        <option class="opt4" value="17:00">17시 00분</option>
                                        <option class="opt4" value="17:30">17시 30분</option>
                                        <option class="opt4" value="18:00">18시 00분</option>
                                        <option class="opt4" value="18:30">18시 30분</option>
                                        <option class="opt4" value="19:00">19시 00분</option>
                                        <option class="opt4" value="19:30">19시 30분</option>
                                        <option class="opt4" value="20:00">20시 00분</option>
                                        <option class="opt4" value="20:30">20시 30분</option>
                                        <option class="opt4" value="21:00">21시 00분</option>
                                        <option class="opt4" value="21:30">21시 30분</option>
                                        <option class="opt4" value="22:00">22시 00분</option>
                                        <option class="opt4" value="22:30">22시 30분</option>
                                        <option class="opt4" value="23:00">23시 00분</option>
                                        <option class="opt4" value="23:30">23시 30분</option>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <p class="load-method-title" align="left">상차 방법</p>
                                <div>
                                    <input type="radio" id="help1" name="helper1" required>
                                    <label class="load-method-label" for="help1" id="help11">상차 도움 필요함</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" id="help2" name="helper1">
                                    <label class="load-method-label" for="help2" id="help22">상차 도움 필요 없음</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="edge11">
                        <div class="title11">도착지 정보</div>
                        <div id="endAddr-div" class="content22">
                            <div id="searchAddr-div2">
                                <div id="searchAddr-div22">
                                    <input id="endAddr" type="text" placeholder="주소 검색 (주소, 건물명)" onclick="searchEndAddr();" readonly required>
                                    <img src="${pageContext.request.contextPath}/resources/images/reservation/magnifying-glass-black.svg" alt="검색" onclick="searchEndAddr();" style="cursor: pointer;">
                                </div>
                                <input id="endDetailAddr" type="text" placeholder="상세 주소" required>
                            </div>
                            <div>
                                <input id="endPhone" type="text" placeholder="연락처" onKeyup="inputPhoneNumber(this);" required>
                            </div>
                            <div align="left">
                                <label id="end-check" class="checkbox-wrap">
                                    <input id="checkLoad2" type="checkbox" name="" value="">
                                    <i class="check-icon" style="margin-top: 2px;"></i>
                                    <div style="font-size: 16px;">&nbsp;&nbsp;바로 하차</div>
                                </label>
                            </div>
                            <div style="display: flex;">
                                <div id="end-date-div" class="input-group date">
                                    <input id="datepicker2" type="text" placeholder="날짜 선택" required>
                                    <div id="dt2" class="input-group-addon">
                                      <span class="glyphicon glyphicon-th" style="color: white;"></span>
                                    </div>
                                </div>
                                <div>
                                    <select name="" id="sl4" onchange="cl4();" required>
                                        <option class="opt3" value="" disabled selected>시간 선택</option>
                                        <option class="opt4" value="00:00">00시 00분</option>
                                        <option class="opt4" value="00:30">00시 30분</option>
                                        <option class="opt4" value="01:00">01시 00분</option>
                                        <option class="opt4" value="01:30">01시 30분</option>
                                        <option class="opt4" value="02:00">02시 00분</option>
                                        <option class="opt4" value="02:30">02시 30분</option>
                                        <option class="opt4" value="03:00">03시 00분</option>
                                        <option class="opt4" value="03:30">03시 30분</option>
                                        <option class="opt4" value="04:00">04시 00분</option>
                                        <option class="opt4" value="04:30">04시 30분</option>
                                        <option class="opt4" value="05:00">05시 00분</option>
                                        <option class="opt4" value="05:30">05시 30분</option>
                                        <option class="opt4" value="06:00">06시 00분</option>
                                        <option class="opt4" value="06:30">06시 30분</option>
                                        <option class="opt4" value="07:00">07시 00분</option>
                                        <option class="opt4" value="07:30">07시 30분</option>
                                        <option class="opt4" value="08:00">08시 00분</option>
                                        <option class="opt4" value="08:30">08시 30분</option>
                                        <option class="opt4" value="09:00">09시 00분</option>
                                        <option class="opt4" value="09:30">09시 30분</option>
                                        <option class="opt4" value="10:00">10시 00분</option>
                                        <option class="opt4" value="10:30">10시 30분</option>
                                        <option class="opt4" value="11:00">11시 00분</option>
                                        <option class="opt4" value="11:30">11시 30분</option>
                                        <option class="opt4" value="12:00">12시 00분</option>
                                        <option class="opt4" value="12:30">12시 30분</option>
                                        <option class="opt4" value="13:00">13시 00분</option>
                                        <option class="opt4" value="13:30">13시 30분</option>
                                        <option class="opt4" value="14:00">14시 00분</option>
                                        <option class="opt4" value="14:30">14시 30분</option>
                                        <option class="opt4" value="15:00">15시 00분</option>
                                        <option class="opt4" value="15:30">15시 30분</option>
                                        <option class="opt4" value="16:00">16시 00분</option>
                                        <option class="opt4" value="16:30">16시 30분</option>
                                        <option class="opt4" value="17:00">17시 00분</option>
                                        <option class="opt4" value="17:30">17시 30분</option>
                                        <option class="opt4" value="18:00">18시 00분</option>
                                        <option class="opt4" value="18:30">18시 30분</option>
                                        <option class="opt4" value="19:00">19시 00분</option>
                                        <option class="opt4" value="19:30">19시 30분</option>
                                        <option class="opt4" value="20:00">20시 00분</option>
                                        <option class="opt4" value="20:30">20시 30분</option>
                                        <option class="opt4" value="21:00">21시 00분</option>
                                        <option class="opt4" value="21:30">21시 30분</option>
                                        <option class="opt4" value="22:00">22시 00분</option>
                                        <option class="opt4" value="22:30">22시 30분</option>
                                        <option class="opt4" value="23:00">23시 00분</option>
                                        <option class="opt4" value="23:30">23시 30분</option>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <p class="load-method-title" align="left">하차 방법</p>
                                <div>
                                    <input type="radio" id="help3" name="helper2" required>
                                    <label for="help3" class="load-method-label">하차 도움 필요함</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" id="help4" name="helper2">
                                    <label for="help4" class="load-method-label">하차 도움 필요 없음</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="line3">
                    <div class="edge11">
                        <div class="title11">
                            <label id="upload-label">
                                <img src="${pageContext.request.contextPath}/resources/images/reservation/round-add.svg" alt="안내">
                                <span id="upload-title">파일 첨부</span>
                                <input type="file" style="display: none;">
                            </label>
                                                     첨부 파일
                        </div>
                        <div id="upload-div" class="content22">
                            <div id="upload-area">
                                <div id="upload-capa" align="left">0MB / 10MB</div>
                            </div>
                        </div>
                    </div>
                    <div class="edge11">
                        <div class="title11">전달 사항</div>
                        <div id="delivery-div" class="content22">
                            <textarea id="delivery-area" cols="64" rows="2" placeholder="기사님에게 전달되는 내용입니다.&#13;&#10;(물품 종류와 크기, 경유지 정보 등)"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="edge22">
                    <div class="title11">
                        <span id="charge1">0원</span>
                                            최종 결제 금액
                    </div>
                    <div id="charge-content" class="content22">
                        <div class="charge-line">
                            <div class="charge-content-div">
                                <span id="carInfo" class="charge-content"></span>
                            </div>
                            <div align="left">
                                <span class="charge-title">차량 정보</span>
                            </div>
                        </div>
                        <div class="charge-line">
                            <div class="charge-content-div">
                                <span id="distanceCharge" class="charge-content"></span>
                            </div>
                            <div align="left">
                                <span class="charge-title">거리</span>
                            </div>
                        </div>
                        <div class="charge-line">
                            <div class="charge-content-div">
                                <span class="charge-content">상차 (일요일), 하차 (화요일)</span>
                            </div>
                            <div align="left">
                                <span class="charge-title">요일 옵션</span>
                            </div>
                        </div>
                        <div class="charge-line">
                            <div class="charge-content-div">
                                <span class="charge-content">예</span>
                            </div>
                            <div align="left">
                                <span class="charge-title">하차 예약</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="booking-div">
                    <br>
                    <button id="booking-btn">예약 하기</button>
                </div>
            </div>
        </div>
    </div>
    <div id="myModal12">
		<div id="layer">
			<img id="searchAddr" src="https://t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>    
    </div>
    <!-- javascript files -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>
    <!-- footer -->
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>
