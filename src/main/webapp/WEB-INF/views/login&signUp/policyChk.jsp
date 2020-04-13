<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>용달이 | 약관동의</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/login&signUp.css">   
    <script src="http://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
    <script src="${contextPath}/resources/js/login&signUp.js"></script>
</head>
<body>
    <!-- logo header -->
    <div class="header agreeHeader">
        <a href="home.do">
            <img src="${contextPath}/resources/images/ydl_logo/ydl_lg_gr(150x50).png" alt="로고">
        </a>
    </div>

    <!-- content -->
    <div class="content signInAgree">
        <div class="policy">
            <div class="policy-header">
                <div>약관동의</div>
                <div class="chkAllDiv">
                    <!-- <label class="checkbox-wrap">
                        <input type="checkbox" name="" value="">
                        <i class="check-icon"></i>
                    </label> -->
                    <img src="${contextPath}/resources/images/login&signUp/unchecked-circle.png" alt="동의" id="chkAll" class="chkPolicy">
                    <div>모두 동의</div> 
                </div>
            </div>
            <div class="policy-list">
                <div>
                    <div>
                        <!-- <label class="checkbox-wrap">
                            <input type="checkbox" name="" value="">
                            <i class="check-icon"></i>
                        </label> -->
                        <img src="${contextPath}/resources/images/login&signUp/unchecked-circle.png" alt="동의" class="chkPolicy">
                        <div>원트럭 이용약관 동의 (필수)</div>
                    </div>
                    <span class="detail" id="viewYondaliPolicy">
                        <img src="${contextPath}/resources/images/magnifying-glass-black.svg" alt="상세보기">
                        <div>내용보기</div> 
                    </sapn>
                </div>
                <div>
                    <div class="chkBox">
                        <!-- <label class="checkbox-wrap">
                            <input type="checkbox" name="" value="">
                            <i class="check-icon"></i>
                        </label> -->
                        <img src="${contextPath}/resources/images/login&signUp/unchecked-circle.png" alt="동의" class="chkPolicy">
                        <div>개인정보 수집 및 이용에 관한 동의 (필수)</div>
                    </div>
                    <span class="detail" id="viewPersonalInfoPolicy">
                        <img src="${contextPath}/resources/images/magnifying-glass-black.svg" alt="상세보기">
                        <div>내용보기</div> 
                    </span>
                </div>
                <div>
                    <div class="chkBox">
                        <!-- <label class="checkbox-wrap">
                            <input type="checkbox" name="" value="">
                            <i class="check-icon"></i>
                        </label> -->
                        <form id="pushEnabledForm" method="get"><input type="hidden" name="pushEnabled" value="N"></form>
                        <img src="${contextPath}/resources/images/login&signUp/unchecked-circle.png" alt="동의" class="chkPolicy">
                        <div>SMS, 이메일을 통한 서비스 및 광고성 이벤트 정보 수신 동의 (선택)</div>
                    </div>
                </div>
            </div> 
        </div>
        <div class="easyEccess chooseSignIn">
            <div class="yongdalLogo"> 
                <h2 class="easyEccessTitle">용달이 회원가입</h2>
                <%-- <a href="${contextPath}/signUpView.me"><img src="${contextPath}/resources/images/ydl_logo/ydl_ic_gr(70X70).png" alt="용달이"></a> --%>
           		<img src="${contextPath}/resources/images/ydl_logo/ydl_ic_gr(70X70).png" alt="용달이" id="yongdaliSignUp">
            </div>
            <div class="easyEccessLogo">
                <h2 class="easyEccessTitle">간편 회원가입</h2>
                <a href="#"><img src="${contextPath}/resources/images/login&signUp/facebookLogo.png" alt="페이스북"></a>
                <a href="#"><img src="${contextPath}/resources/images/login&signUp/kakaoLogo.png" alt="카카오"></a>
                <a href="#"><img src="${contextPath}/resources/images/login&signUp/naverLogo.png" alt="네이버"></a>
            </div>
        </div>
    </div>

    <!-- The Modal -->
    <div id="yongdaliPolicy" class="modal">
        <!-- Modal content -->
        <!-- <div class="modal-content">
            <span class="close">&times;</span> -->
        <!-- <div width="50rem" height="40rem" class="BasicModal__ModalContainer-tt09z4-1 bdkJUD"> -->
        <div class="BasicModal__ModalContainer-tt09z4-1 bdkJUD modal-content">
            
            <div class="BasicModal__ModalHeader-tt09z4-2 kiqceJ">
                <h1>용달이 이용약관</h1>
                <span class="modalClose">&times;</span>
            </div>
            <div class="ServiceConsentModal__ServiceConsentWrapper-sc-17vjbzr-0 blblsU">
                <p class="title02">제 1 장 총 칙</p>
                <p class="title03">제1조(목적)</p>
                <p class="content01">이 약관은 ㈜KH(이하 ‘회사’라 함)이 제공하는 화물배차 플랫폼인 용달이 서비스(이하 ‘플랫폼’) 의 이용 및 이용하는 과정에 이용자에게
                    제공되는 일체의
                    정보에 대해 서비스 이용자와 회사의 관계를 설정함에 있습니다.</p>
                <p class="title03">제2조(용어의 정의)</p>
                <p class="content01">① ‘배송’이라 함은 배송화물을 이용자의 주택, 사무실 또는 기타의 장소에서 수탁하여 수하인의 주택, 사무실 또는 기타의 장소까지 배송하여
                    인도하는 것을
                    말합니다.</p>
                <p class="content01">② ‘배송기사’라 함은 화물차량을 이용한 배송을 영업으로 하는 자를 말합니다.</p>
                <p class="content01">③ ‘이용자’라 함은 배송기사에게 배송을 위탁하는 자를 말합니다.</p>
                <p class="content01">④ ‘수하인’이라 함은 이용자가 배송물의 수령자로 지정하는 자를 말합니다.</p>
                <p class="content01">⑤ ‘배송장’이라 함은 회사와 이용자 간의 배송계약의 성립과 내용을 증명하기 위하여 회사가 교부한 문서를 말합니다.</p>
                <p class="content01">⑥ ‘수탁’이라 함은 배송기사가 배송을 위하여 이용자로부터 배송물을 수령하는 것을말합니다.</p>
                <p class="content01">⑦ ‘인도’라 함은 배송기사가 수하인에게 배송장에 기재된 배송물을 넘겨주는 것을말합니다.</p>
                <p class="content01">⑧ ‘손해배상한도액’이라 함은 회사가 제공하는 플랫폼을 통한 서비스를 이용하는 중발생한 손해에 대하여 회사가 배상할 수 있는 최고한도액을
                    말합니다.</p>
                <p class="content01">⑨ ‘회원’이라 함은 서비스에 회원등록을 한 자로서, 계속적으로 회사가 제공하는 서비스를 이용할 수 있는 자를 말합니다.</p>
                <p class="content01">⑩ ‘비회원’이라 함은 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.</p>
                <p class="title03">제3조(약관 등의 명시와 설명 및 개정)</p>
                <p class="content01">① 회사는 이 약관의 내용과 상호 및 대표자 성명, 사업장 소재지 주소, 전화번호,팩스, E-mail, 사업자등록번호, 통신판매업 신고번호,
                    개인정보관리책임자 등을이용자가 쉽게 알 수 있도록 서비스의 초기 서비스화면에 게시합니다.</p>
                <p class="content01">② 회사는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」,
                    「전자서명법」,「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할수
                    있습니다.
                </p>
                <p class="content01">③ 회사는 관계 법령에 위배되지 않는 범위 내에서 본 약관을 수시로 개정할 수 있습니다. 이 경우 본 약관의 변경내용을 이용자가 알 수 있도록
                    회사
                    홈페이지에 게시하거나 기타의 방법으로 이용자에게 통지합니다.</p>
                <p class="title03">제4조(적용법규 등)</p>
                <p class="content01">이 약관에 규정되지 않은 사항에 대하여는 상법 등의 법규와 공정한 상관습에 따릅니다.</p>
                <p class="title02">제2장 서비스의 제공 및 변경</p>
                <p class="title03">제5조(서비스의 내용 및 이용료)</p>
                <p class="content02">① 회사는 다음과 같은 업무를 수행합니다.</p>
                <p class="content03">1. 화물배송을 이용하고자 하는 자와 배송기사의 중개</p>
                <p class="content03">2. 원활한 서비스를 위해 이용자와 배송기사의 정보 제공</p>
                <p class="content03">3. 기타 회사가 정하는 업무</p>
                <p class="content02">② 화물배송의 이용료는 회사가 정한 권장 운임과 이용자의 판단하에 추가적으로 적용하는 추가요금으로 구성됩니다. 회사가 제공하는 권장운임(기본
                    이용료)은
                    회사사정에 따라 변경될 수 있습니다.</p>
                <p class="title03">제6조(서비스 이용계약의 성립)</p>
                <p class="content03">① 이용자는 회사가 제공하는 플랫폼을 통해 화물배송에 필요한 정보를 입력하고 최종 확인 및 지급방법을 선택하여 배송 요청을 할 수 있습니다.
                </p>
                <p class="content03">② 회사가 이용자의 배송요청을 승낙하면 서비스의 이용계약이 성립됩니다.</p>
                <p class="content03">③ 회사는 다음과 같은 경우 이용자의 주문을 유보·거부할 수 있습니다.</p>
                <p class="content02">1. 필요한 정보를 모두 입력하지 아니하였을 때</p>
                <p class="content02">2. 신청서 내용이 사실과 다를 때</p>
                <p class="content02">3. 화물배송의 목적이 아닌 다른 목적이라 의심될 때</p>
                <p class="content02">4. 고가품 혹은 요청 차량으로 운송이 불가능한 크기의 화물 등일 때</p>
                <p class="content02">5. 공공질서 및 현행법에 위배되는 물품의 배송이라 의심될 때</p>
                <p class="title03">제7조(이용절차 및 개인정보 제공 동의 등)</p>
                <p class="content02">① 이용자는 회사의 플랫폼 상에서 다음과 같은 방법으로 화물배송 주문을 신청하며, 회사는 이용자가 주문을 함에 있어서 다음의 각 내용을 알기
                    쉽게 제공하여야
                    합니다.</p>
                <p class="content03">1. 출발지와 도착지의 검색 및 주소, 연락처 입력</p>
                <p class="content03">2. 배송하고자 하는 화물의 종류, 수량 입력</p>
                <p class="content03">3. 운송 형태에 대한 선택 (편도 혹은 왕복)</p>
                <p class="content03">4. 이용자의 자율적 판단하에 추가운임 입력</p>
                <p class="content03">5. 기타 요청사항 입력</p>
                <p class="content03">6. 약관 내용의 확인 및 동의</p>
                <p class="content03">7. 결제방법의 선택</p>
                <p class="content02">② 회사는 제3자에게 서비스 이용자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2) 개인정보를 제공받는 자의 개인정보
                    이용목적, 3)
                    제공하는개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 이용자에게 알리고 동의를 받아야 합니다.</p>
                <p class="content02">③ 회사가 제3자에게 서비스 이용자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보
                    취급위탁을 하는
                    업무의 내용을 이용자에게 알리고 동의를 받아야 합니다. 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및
                    정보보호 등에 관한
                    법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.</p>
                <p class="title03">제8조(개인정보보호)</p>
                <p class="content03">① 회사는 이용자의 개인정보 수집 시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.</p>
                <p class="content03">② 회사는 회원가입 시 서비스 이용계약에 필요한 정보를 미리 수집하지 않습니다.</p>
                <p class="content03">③ 회사는 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을고지하고 동의를 받습니다.</p>
                <p class="content03">④ 회사는 수집된 개인정보를 목적 외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는
                    이용·제공단계에서 당해
                    이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.</p>
                <p class="content03">⑤ 회사가 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처),
                    정보의 수집목적
                    및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은 자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조 제2항이
                    규정한 사항을 미리
                    명시하거나 고지해야 하며 이용자는 언제든지 이 동의를철회할 수 있습니다.</p>
                <p class="content03">⑥ 이용자는 언제든지 회사가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 회사는 이에 대해 지체 없이 필요한
                    조치를 취할
                    의무를집니다. 이용자가 오류의 정정을 요구한 경우에는 회사는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</p>
                <p class="content03">⑦ 회사는 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의
                    개인정보의 분실,
                    도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든책임을 집니다.</p>
                <p class="content03">⑧ 회사 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이
                    파기합니다.</p>
                <p class="title03">제9조(지급방법 및 환급)</p>
                <p class="content02">① 회사의 플랫폼을 통한 화물배송서비스 이용에 대한 대금지급 방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단, 회사는
                    이용자의 지급방법에
                    대하여 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.</p>
                <p class="content03">1. 수탁 시(선불), 인도 시(착불) 현금 지급</p>
                <p class="content03">2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제</p>
                <p class="content03">3. 온라인무통장입금</p>
                <p class="content03">4. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체</p>
                <p class="content03">5. 기타 회사가 제공하는 대금 지급방법 등</p>
                <p class="content02">② 회사는 이용자의 주문이 배송기사의 취소 등의 사유로 제공을 할 수 없을 때에는지체 없이 그 사유를 이용자에게 통지하고, 대금지급이 이루어진
                    경우에는
                    환급에필요한 조치를 취합니다.</p>
                <p class="title03">제10조(서비스 이용계약의 종료)</p>
                <p class="content02">① 서비스의 이용계약의 종료는 다음 각 호에 해당하는 경우 성립합니다.</p>
                <p class="content03">1. 이용자가 주문한 내용에 적합하게 배송이 완료된 경우</p>
                <p class="content03">2. 이용자가 주문을 취소한 경우</p>
                <p class="content03">3. 회사가 정한 서비스 제공 중단 사유의 발생 시</p>
                <p class="content02">② 이용자가 주문을 취소한 경우에는 배송기사가 배정 후 취소에 대해서는 회사는회사가 정한 소정의 취소 수수료를 이용자에게 청구할 수 있습니다.
                    이 경우
                    회사는 관련한 내용과 금액을 사전에 이용자가 알 수 있도록 게시합니다.</p>
                <p class="title03">제11조(서비스 제공의 중단)</p>
                <p class="content02">① 회사는 다음의 경우 서비스의 일부 또는 전부를 중지할 수 있습니다.</p>
                <p class="content03">1. 컴퓨터, 네트워크 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등부득이한 사유가 발생한 경우</p>
                <p class="content03">2. 정전, 서버 등 설비 용량의 한계에 도달한 경우, 기타 천재지변 등 불가항력적인 사유가 발생한 경우</p>
                <p class="content02">② 서비스 제공의 중단 시 회사는 고객들에게 해당 내용 및 중단 기간 등을 가능한방법으로 통지합니다.</p>
                <p class="title02">제3장 서비스의 이용</p>
                <p class="title03">제12조(이용자의 의무)</p>
                <p class="content02">이용자는 다음 행위를 하여서는 안 됩니다.</p>
                <p class="content03">1. 회원가입 또는 주문 시 허위 내용의 등록</p>
                <p class="content03">2. 타인의 정보 도용</p>
                <p class="content03">3. 회사 및 플랫폼의 저작권 등 지적재산권에 대한 침해</p>
                <p class="content03">4. 회사의 명예를 손상시키거나 업무를 방해하는 행위</p>
                <p class="content03">5. 기타 공공질서 및 미풍양속에 위반되는, 혹은 범죄와 결부된 행위</p>
                <p class="title03">제13조(회원가입)</p>
                <p class="content02">① 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</p>
                <p class="content02">② 회사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.</p>
                <p class="content03">1. 등록 내용에 허위, 기재누락, 오기가 있는 경우</p>
                <p class="content03">2. 기타 회사의 합리적인 판단 하에 회원가입을 제한하는 경우</p>
                <p class="content02">③ 회원가입계약의 성립 시기는 회사의 승낙이 회원에게 도달한 시점으로 합니다.</p>
                <p class="content02">④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.</p>
                <p class="title03">제14조(회원 탈퇴 및 자격 상실 등)</p>
                <p class="content02">① 회원은 회사에 언제든지 탈퇴를 요청할 수 있으며 회사는 즉시 회원탈퇴를 처리합니다.</p>
                <p class="content02">② 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원자격을 제한 및 정지시킬 수 있습니다.</p>
                <p class="content03">1. 가입 신청 시에 허위 내용을 등록한 경우</p>
                <p class="content03">2. 회사가 제공하는 플랫폼을 이용하여 서비스를 이용한 후 회원이 부담하는 채무를 기일 내에 지급하지 않는 경우</p>
                <p class="content03">3. 회사의 영업을 방해하거나 저작권 침해 등 전자상거래 질서를 위협하는 경우</p>
                <p class="content02">③ 회사가 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 회사는
                    회원자격을 상실시킬
                    수 있습니다.</p>
                <p class="content02">④ 회사가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의
                    기간을 정하여
                    소명할 기회를 부여합니다.</p>
                <p class="title03">제15조(회원에 대한 통지)</p>
                <p class="content02">① 회사가 회원에 대한 통지를 하는 경우, 회원이 회사와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</p>
                <p class="content02">② 회사는 불특정다수 회원에 대한 통지의 경우 1주일이상 회사의 홈페이지 등 서비스 제공 플랫폼에 게시함으로서 개별 통지에 갈음할 수
                    있습니다. 다만, 회원
                    본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</p>
                <p class="title03">제16조(회원의 아이디 및 비밀번호에 대한 의무)</p>
                <p class="content02">① 제17조의 경우를 제외한 아이디와 비밀번호에 관한 관리책임은 회원에게 있습니다.</p>
                <p class="content02">② 회원은 자신의 아이디 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</p>
                <p class="content02">③ 회원이 자신의 아이디 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는
                    그에
                    따라야합니다.</p>
                <p class="title03">제17조(저작권의 귀속 및 이용제한)</p>
                <p class="content02">① 회사가 제공하는 플랫폼 내의 모든 저작권 및 기타 지적재산권은 회사에 귀속합니다.</p>
                <p class="content02">② 이용자는 회사의 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로
                    이용하거나
                    제3자에게 이용하게 하여서는 안 됩니다.</p>
                <p class="title02">제4장 서비스의 책임과 범위</p>
                <p class="title03">제18조(서비스의 책임)</p>
                <p class="content02">① 회사는 화물배송의 이용자와 배송기사를 단순 중개하는 플랫폼 사업자로서 배송물건의 사고에 대한 책임은 회사가 부담하지 않습니다.</p>
                <p class="content02">② 고가품이나 취급상 주의를 필요로 하는 배송 대상물의 경우 이용자는 주문요청시 “배송 전달사항” 항목에 명시를 할 의무가 있으며, 회사 혹은
                    배송기사는
                    해당주문을 거절할 수 있습니다.</p>
                <p class="content02">③ 배송 과정 중 발생하는 파손, 분실 등 일체 사고에 대해서 회사는 이용자의 손실을 최소화하기 위한 합리적인 노력을 합니다. 그러나 어떠한
                    경우에도 배송
                    중발생하는 사고에 대하여 회사가 책임을 지거나 배상을 하지 아니합니다.</p>
                <p class="content02">④ 회사가 제공하는 플랫폼은 회사의 노력에도 불구하고 이용자의 컴퓨터, 모바일기기에서 호환되지 않을 수 있습니다. 또한, 바이러스나
                    악성프로그램으로부터
                    완벽하게 차단됨을 보장하지 않습니다.</p>
                <p class="content02">⑤ 회사는 다음 각 경우에 면책됩니다.</p>
                <p class="content03">1. 전시, 사변, 천재지변, 비상사태, 현재의 기술로는 해결이 불가능한 기술적 결함 기타 불가항력적 사유로 서비스를 제공할 수 없는 경우
                </p>
                <p class="content03">2. 회사는 기간통신 사업자 또는 위치정보사업자가 서비스를 중지하거나, 정상적으로 제공하지 아니하여 고객에게 손해가 발생한 경우에 대해서
                    회사의 고의또는
                    중대한 과실이 없는 경우</p>
                <p class="content03">3. 고객의 모바일 디바이스 환경으로 인하여 발생하는 제반 문제 또는 회사의 고의 또는 중대한 과실이 없는 네트워크 환경으로 인하여 발생하는
                    문제</p>
                <p class="content02">⑥ 본 조에서 언급한 내용과 별도로 회사가 최대로 책임질 수 있는 손해배상액은 일백만원(1,000,000원)을 초과하지 않습니다.</p>
                <p class="title03">제19조(운송 중 사고 배상 책임 및 면책)</p>
                <p class="content02">① 회사는 관련 법령 및 적재물배상책임보험 약관에 따라 화물운송 간 발생한 다음사고에 대하여 책임을 집니다. 다만, 이용자에게 그 사고 원인이
                    있는
                    경우에는예외로 합니다.</p>
                <p class="content03">1. 운송 중에 발생한 도난, 파손, 감량, 유출로 인한 사고.</p>
                <p class="content03">2. 운송 지연으로 인한 부패, 변질 사고 및 연착 사고.</p>
                <p class="content03">3. 화기, 인화 물질 및 약품 등으로 인한 사고.</p>
                <p class="content03">4. 차량 화재로 인한 사고.</p>
                <p class="content02">② 회사는 적재물배상책임보험 약관에 따라 다음 사유로 인한 손해는 보상하지 않습니다.</p>
                <p class="content03">1. 지진, 분화, 홍수, 해일 또는 이와 비슷한 천재지변으로 생긴 손해에 대한 배상책임</p>
                <p class="content03">2. 티끌, 먼지, 석면, 분진, 또는 소음으로 생긴 손해에 대한 배상책임</p>
                <p class="content03">3. 공해물질의 배출, 방출, 누출, 넘쳐흐름, 또는 유출로 생긴 손해에 대한 배상책임 및 오염제거비용</p>
                <p class="content03">4. 수탁화물의 하자, 자연소모 또는 성질로 인한 발화, 폭발, 뜸, 곰팡이, 부패, 변색, 향기의 변질, 녹과 기타 이와 유사한 사고로 생긴
                    손해에 대한
                    배상책임</p>
                <p class="content03">5. 차량의 덮개(차량에 부착된 덮개를 포함합니다) 또는 화물의 포장불완전(해당적재화물 자체의 포장불완전 및 적재화물의 결박 부적정 등을
                    포함)으로 생긴
                    손해 및 보장차량의 충돌이 수반되지 않은 경우 수탁화물의 충돌, 접촉으로 생긴 손해에 대한 배상책임</p>
                <p class="content03">6. 분실, 감량으로 생긴 손해에 대한 배상책임</p>
                <p class="content03">7. 기계류, 전자기기류 또는 이와 유사한 재물의 해체 또는 설치 중에 생긴 손해</p>
                <p class="content03">8. 수탁물이 수하인에게 인도된 후 14일을 초과하여 발견된 손해에 대한 배상책임</p>
                <p class="content02">③ 회사의 책임으로 인하여 발생한 사고의 배상 수준은 적재물배상책임보험 약관에따라 이용자의 피해 발생 금액 수준의 배상을 원칙으로 합니다.
                    피해 발생
                    금액수준은 손상 또는 분실된 부분에 한하여 감가상각을 적용하여 책정합니다.</p>
                <p class="title02">제5장 기 타</p>
                <p class="title03">제19조(분쟁해결)</p>
                <p class="content02">① 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하기 위하여 고객센터를설치․운영합니다.</p>
                <p class="content02">② 회사는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그
                    사유와 처리일정을
                    즉시 통보해 드립니다.</p>
                <p class="content02">③ 회사와 이용자 간에 발생한 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의
                    조정에 따를
                    수있습니다.</p>
                <p class="title03">제20조(재판권 및 준거법)</p>
                <p class="content02">① 회사와 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는
                    지방법원의 전속관할로
                    합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.</p>
                <p class="content02">② 회사와 이용자 간에 제기된 소송에는 한국법을 적용합니다.</p>
            </div>
        </div>
    </div>

    <div id="personalInfoPolicy" class="modal">
        <!-- Modal content -->
        <div class="BasicModal__ModalContainer-tt09z4-1 bdkJUD modal-content">
            <div class="BasicModal__ModalHeader-tt09z4-2 kiqceJ">
                <h1>개인정보 처리방침</h1>
                <span class="modalClose">&times;</span>
            </div>
            <div class="PersonalInfoCollectionModal__PersonalInfoCollectionModalWrapper-sc-1qkwz80-0 drszGh">
                <p class="">(주)KH(이하 ‘회사’)은 화물배차 플랫폼인 용달이을 운영함에 있어 귀하의 개인정보를 중요시하며 「개인정보보호법」, 「정보통신망 이용촉진 및 정보보호 등에
                    관한 법률」등의 관계법령을 준수하고 있습니다. 회사는 본 “개인정보의 취급방침”을 통하여회사가 귀하의 개인정보를 어떠한 목적으로 수집하고 활용하는지 알려드립니다.회사는 본 방침이 변경될
                    시 웹사이트 게시 또는 개별공지 등 가능한 방법으로 귀하에게 통지하겠습니다.</p>
                <p class="title02">개인정보 수집 및 이용 목적</p>
                <p class="content02">회사는 화물차를 이용한 배송(이하 ‘화물배송’)을 중개하는 사업자로서 화물배송 이용에 필요한 최소한의 개인정보를 수집하고 아래의 목적을 위해 활용합니다.
                </p>
                <p class="content02">1. 서비스의 제공</p>
                <p class="content03">① 화물배송 주문예약 및 원활한 배송 진행</p>
                <p class="content03">② 주문 및 배송현황 등 컨텐츠의 제공</p>
                <p class="content03">③ 요금, 수수료의 결제 및 정산</p>
                <p class="content03">④ 현금영수증, 세금계산서 등 증빙자료 발급</p>
                <p class="content02">2. 회원가입 및 관리</p>
                <p class="content03">① 회원제 서비스를 위한 본인확인, 개인식별, 불량회원의 부정이용 방지와 비인가 서비스 사용 방지, 가입의사 확인</p>
                <p class="content03">② 회원의 서비스 이용에 대한 분석</p>
                <p class="content03">③ 회원자격 유지·관리, 질의·건의·불만사항 등 민원처리</p>
                <p class="content03">④ 각종 고지사항 전달 등 정보제공</p>
                <p class="content02">3. 민원사무처리</p>
                <p class="content03">① 민원인의 신원 확인, 민원사항 확인</p>
                <p class="content03">② 사실조사를 위한 연락 및 통지, 민원 처리 결과 통보</p>
                <p class="content02">4. 마케팅 및 광고에 활용, 이벤트 등 광고성 정보전달</p>
                <p class="content03">① 신규 서비스(제품) 개발 및 맞춤 서비스 제공</p>
                <p class="content03">② 이벤트 및 광고성 정보 제공 및 참여기회 제공</p>
                <p class="content03">③ 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계</p>
                <p class="title02">수집하는 개인정보 항목</p>
                <p class="content02">회사가 수집하는 개인정보의 항목과 수집방법은 다음과 같습니다.</p>
                <p class="content02">1. 개인정보 수집항목</p>
                <p class="content03">① 고객 회원가입 시 제공받는 정보</p>
                <p class="content04">가. 일반회원 : 성명, 아이디, 휴대폰번호, 비밀번호, 이메일주소</p>
                <p class="content04">나. 기업회원 : 아이디, 이메일, 비밀번호, 휴대폰번호, 사업자명, 사업자등록번호, 법인등록번호, 대표자 성명, 사업장주소</p>
                <p class="content03">② 고객 서비스 이용 시 제공받는 정보</p>
                <p class="content04">: 출발지·도착지 주소, 송·수하인의 연락처, 결제방법 선택에 따른 정보</p>
                <p class="content03">③ 현금영수증 발급 시 제공받는 정보</p>
                <p class="content04">: 발급자 명의의 휴대폰번호 또는 사업자등록번호</p>
                <p class="content03">④ 기사 회원 등록 시 제공받는 정보</p>
                <p class="content04">: 아이디, 비밀번호, 성명, 주민등록번호, 휴대폰번호, 면허번호, 주소, 차량번호, 은행 계좌정보, 사업자등록번호 등 사업자 정보</p>
                <p class="content03">⑤ 자동 수집항목</p>
                <p class="content04">: 서비스 이용기록, 접속 로그, 쿠키, 접속 IP, 휴대폰 CID</p>
                <p class="content03">2. 개인정보 수집방법</p>
                <p class="content04">① 고객의 개인정보 수집방법</p>
                <p class="content04">홈페이지·모바일 어플리케이션에서의 회원가입, 이메일, 전화, 팩스, 우편</p>
                <p class="content03">② 기사의 개인정보 수집방법</p>
                <p class="content04">모바일 어플리케이션 회원가입, 대면전달, 메일, 전화, 팩스, 우편</p>
                <p class="title02">개인정보의 보유 및 이용기간</p>
                <p class="content02">회사는 고객 및 기사회원의 동의하에 수집된 개인정보는 이용 목적이 달성한 후 즉시 파기를 원칙으로 합니다. 고객회원 및 기사회원은 탈퇴 요청 시까지 수집한
                    개인정보를 안전한 방법으로 보관하며, 탈퇴 요청 시 회사는 해당 회원의 탈퇴처리를 완료한 그 즉시 개인정보를 파기합니다. 단, 법령에 의해 일정기간 보존해야만 하는 경우, 혹은 향후
                    분쟁방지를 위해 보존하는 개인정보의 종류, 근거 및 기간은 아래와같습니다.</p>
                <p class="content03">1. 계약 또는 청약철회 등에 관한 기록</p>
                <p class="content04">: 전자상거래 등에서의 소비자보호에 관한 법률, 5 년</p>
                <p class="content03">2. 대금결제 및 재화 등의 공급에 관한기록</p>
                <p class="content04">: 전자상거래 등에서의 소비자보호에 관한 법률, 5 년</p>
                <p class="content03">3. 소비자의 불만 또는 분쟁처리에 관한기록</p>
                <p class="content04">: 전자상거래 등에서의 소비자보호에 관한 법률, 3년</p>
                <p class="content03">4. 표시 광고에 관한 기록</p>
                <p class="content04">: 전자상거래 등에서의 소비자보호에 관한 법률, 6개월</p>
                <p class="content03">5. 전자금융거래에 관한 기록</p>
                <p class="content04">: 전자금융거래법, 5 년</p>
                <p class="content03">6. 서비스 방문기록, 접속로그, 접속IP</p>
                <p class="content04">: 통신비밀보호법, 3개월</p>
                <p class="content03">7. 본인확인에 관한 기록</p>
                <p class="content04">: 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 6개월</p>
                <p class="title02">개인정보의 제3자 제공 안내</p>
                <p class="content02">회사는 원칙적으로 회원의 개인정보를 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
                <p class="content03">① 회원이 사전에 동의한 경우</p>
                <p class="content03">② 법령에 의거하거나 수사목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>
                <p class="title02">개인정보 취급위탁 안내</p>
                <p class="content02">회사는 서비스의 원활한 제공을 위해 아래와 같이 업무를 위탁하고 있습니다.</p>
                <p class="content02">1. 위탁 대상자 : 배송서비스 제공하는 화물차량 기사 및 관련업체</p>
                <p class="content02">2. 위탁업무 내용 및 목적 : 배송서비스 제공 및 고객 피드백</p>
                <p class="content02">3. 제공하는 개인정보 항목 : 출발지·도착지의 주소, 송·수하인의 성명과 연락처</p>
                <p class="content02">4. 개인정보의 보유 및 이용기간 : 회원탈퇴 시까지 혹은 위탁계약 종료 시까지</p>
                <p class="title02">개인정보 책임자 및 연락처</p>
                <p class="content02">회사의 서비스를 이용하며 발생하는 모든 개인정보 관련 문의는 개인정보보호 책임자에게 신고하실 수 있습니다.</p>
                <p class="content02">개인정보 관리책임자</p>
                <p class="content02">성 명 : 유승제</p>
                <p class="content02">전화번호 : 02-1111-2222</p>
                <p class="content02">이 메 일: test1@khacademy.sample.kh</p>
            </div>
        </div>
    </div>
    
</body>

</html>