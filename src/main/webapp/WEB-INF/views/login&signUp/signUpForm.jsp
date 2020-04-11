<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>용달이 | 회원가입</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!-- warning icon -->
    <link rel="stylesheet" href="${contextPath}/resources/css/login&signUp.css">    
    <script src='https://kit.fontawesome.com/a076d05399.js'></script><!-- eye icon -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/js/login&signUp.js"></script>
    
</head>
<body>
    <!-- logo header -->
    <div class="header">
        <a href="home.do">
            <img src="${contextPath}/resources/images/ydl_logo/ydl_lg_gr(150x50).png" alt="로고">
        </a>
    </div>

    <!-- content -->
    <div class="content">
        <form action="#" method="post" id="sigInForm" novalidate>
            <div class="formRow">
                <div class="formRow--item">
                    <!-- 이메일 -->
                    <div class="emailWrap">
                        <div class="formRow--input-wrapper js-inputWrapper">
                            <input type="email" id="email" class="formRow--input js-input eng" name="mId" placeholder="이메일" maxlength="50">
                        </div>
                        <div id="emailMsg" class="msgBox"></div>
                        <div class="formRow--input-wrapper js-inputWrapper" id="verifyWrap">
                            <input type="text" class="formRow--input js-input" name="verify" placeholder="인증번호 입력">
                            <button type="button" id="btn_verify">인증번호 받기</button>
                        </div>
                        <div id="veriMsg" class="msgBox" ></div>
                    </div>       
                    <!-- 비밀번호 -->
                    <div class="pwdWrap" >
                        <div class="formRow--input-wrapper js-inputWrapper pwd">
                            <input type="password" class="formRow--input js-input" name="pwd" 
                                    placeholder="비밀번호" maxlength="16">
                        </div>
                        <div class="formRow--input-wrapper js-inputWrapper pwd">
                            <input type="password" class="formRow--input js-input" name="pwdChk" 
                                    placeholder="비밀번호 확인" maxlength="16">
                        </div>                        
                        <i class='far fa-eye-slash' id="showPwd"></i>
                    </div>
                    <div id="pwdMsg" class="msgBox"></div>
                    <!-- 이름 -->
                    <div class="formRow--input-wrapper js-inputWrapper">
                        <input type="text" class="formRow--input js-input" name="name" placeholder="이름">
                    </div>
                    <div id="nameMsg" class="msgBox" ></div>
                    <!-- 전화번호 -->
                    <div class="phoneWrap">
                        <div id="nation">
                            <select class="formRow--input js-input" name="nation" placeholder="">
                                <option value="KR" selected>한국</option>
                                <option value="GB">영국</option>
                                <option value="FR">프랑스</option>
                                <option value="FI">핀란드</option>
                            </select>
                        </div>
                        <div class="formRow--input-wrapper js-inputWrapper">
                            <input type="text" class="formRow--input js-input" name="phone"
                                placeholder="휴대폰 번호" maxlength="13" >
                        </div>
                    </div>
                    <div id="phoneMsg" class="msgBox" ></div>
                    <!-- Push 알림 설정 -->
                    <input type="hidden" name="pushEnabled" value="${ pushEnabled }">
                    
                    <!-- (사업자)기사 정보 -->
                    <hr>
                    <div class="bizRow" id="slecBiz">
                        <img src="${contextPath}/resources/images/login&signUp/round-add.svg" alt="더하기">
                        <div>사업자(기사)로 가입하기</div>                            
                    </div>
                    <div class="bizForm">
                        <div class="bizRow guide">
                            <img src="${contextPath}/resources/images/login&signUp/round-question.png" alt="물음표">
                            <div>차량 안내가 필요하신가요?</div>
                        </div>
                        <div class="bizWrap">
                            <div class="formRow--input-wrapper js-inputWrapper carInfo">
                                <select class="formRow--input js-input" name="carCapcity" placeholder="톤수">
                                    <option hidden></option>
                                    <option value="1">1</option>
                                    <option value="1.4">1.4</option>
                                    <option value="2.5">2.5</option>
                                    <option value="3.5">3.5</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="formRow--input-wrapper js-inputWrapper carInfo">
                                <select class="formRow--input js-input" name="carType" placeholder="차종">
                                    <option hidden></option>
                                    <option value="카고">카고</option>
                                    <option value="호루">호루</option>
                                    <option value="탑">탑</option>
                                    <option value="윙바디">윙바디</option>
                                    <option value="리프트 카고">리프트 카고</option>
                                </select>
                            </div>
                            <div class="formRow--input-wrapper js-inputWrapper">
                                <input type="text" class="formRow--input js-input" name="carNo" placeholder="차량번호" maxlength="8">
                            </div>
                        </div>
                        <div id="bizFormMsg1" class="msgBox"></div>
                        <div class="bizWrap2">
                            <div class="formRow--input-wrapper js-inputWrapper carInfo">
                                <div class="formRow--input js-input signInImgWrap" name="idImg" placeholder="">
                                    <div class="signInImg"></div>
                                    <p>증명사진</p>
                                    
                                </div>         
                                <div class="formRow--input js-input signInImgWrap" name="regCard" placeholder="">
                                    <div class="signInImg"></div>
                                    <p>차량등록증</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btnArea">
                <button type="button" class="submitBtn" id="signUpBtn">가입하기</button>
            </div>
        </form>
    </div>

        <!-- The Modal -->
        <div id="carInfo" class="modal">

            <!-- Modal content -->
            <div class="VeSAx"></div>
            <div width="44rem" class="ewJflR modal-content">
                <div class="kiqceJ" style="padding: 0px; padding-left: 20px;">
                    <h1>차량 안내</h1>
                    <span class="modalClose">&times;</span>
                </div>
                <div class="kzYmMD">
                    <div class="ixeUWC">
                        <p name="info" class="cCvWPY">차량 형태</p>
                        <p name="weight" class="dpmSTb">적재 크기</p>
                    </div>
                    <div class="fGXWzu">
                        <div class="yHNZG"><img
                                src="${contextPath}/resources/images/truck/cargo-image.png">
                            <p class="title">카고</p>
                            <div class="description">
                                <p>- 흔히 알고 있는 일반적인 형태의 트럭</p>
                                <p>- 적재함이 오픈되어 있어 적재물 파악이 쉬움</p>
                                <p>- 비나 눈 등 날씨의 영향으로부터 적재물을 보호하기 어려움</p>
                            </div>
                        </div>
                        <div class="yHNZG"><img
                                src="${contextPath}/resources/images/truck/horu-image.png">
                            <p class="title">호루</p>
                            <div class="description">
                                <p>- 가죽이나 비닐 등의 덮개가 씌워져 있는 트럭</p>
                                <p>- 비나 눈 등 날씨의 영향으로부터 적재물을 보호할 수 있음</p>
                            </div>
                        </div>
                        <div class="yHNZG"><img
                                src="${contextPath}/resources/images/truck/top-image.png">
                            <p class="title">탑차</p>
                            <div class="description">
                                <p> - 적재함이 사각 형태로 막혀 있고, 잠금장치가 있는 트럭</p>
                                <p>- 날씨, 도난, 파손 등 외부의 영향으로부터 보호할 수 있음</p>
                                <p>- 식자재, 택배 물품 등의 운반에 주로 쓰임</p>
                            </div>
                        </div>
                        <div class="yHNZG"><img
                                src="${contextPath}/resources/images/truck/wingbody-image.png">
                            <p class="title">윙바디</p>
                            <div class="description">
                                <p>- 적재함을 날개처럼 양쪽으로 개폐할 수 있는 트럭</p>
                                <p>- 날씨, 도난, 파손 등 외부의 영향으로부터 보호할 수 있음</p>
                                <p>- 또한 지게차를 이용한 상하차가 용이함</p>
                            </div>
                        </div>
                        <div class="yHNZG"><img
                                src="${contextPath}/resources/images/truck/lift-image.png">
                            <p class="title">리프트</p>
                            <div class="description">
                                <p>- 무거운 제품의 상하차를 위해 리프팅 장비를 탑재한 트럭</p>
                                <p>- 대형 가전제품과 가구, 오토바이 등의 상하차에 주로 쓰임</p>
                            </div>
                        </div>
                    </div>
                    <div class="ezDdUH">
                        <br>
                        <img src="${contextPath}/resources/images/truck/carrying-capacity-image.png">
                        <br><br>
                        <div>
                            <div class="PKvoC">
                                <p>톤수</p>
                                <p>가로</p>
                                <p>세로</p>
                                <p>높이</p>
                            </div>
                            <div class="hiFyFn">
                                <p class="bold">1톤</p>
                                <p>160 cm</p>
                                <p>280 cm</p>
                                <p>180 cm</p>
                            </div>
                            <div class="hiFyFn">
                                <p class="bold">1.4톤</p>
                                <p>170 cm</p>
                                <p>310 cm</p>
                                <p>180 cm</p>
                            </div>
                            <div class="hiFyFn">
                                <p class="bold">2.5톤</p>
                                <p>180 cm</p>
                                <p>430 cm</p>
                                <p>200 cm</p>
                            </div>
                            <div class="hiFyFn">
                                <p class="bold">3.5톤</p>
                                <p>200 cm</p>
                                <p>460 cm</p>
                                <p>200 cm</p>
                            </div>
                            <div class="hiFyFn">
                                <p class="bold">5톤</p>
                                <p>230 cm</p>
                                <p>620 cm</p>
                                <p>230 cm</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>

</html>