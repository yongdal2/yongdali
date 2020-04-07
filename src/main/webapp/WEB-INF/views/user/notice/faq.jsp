<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>용달이 | 사용자_자주 묻는 질문</title>
        
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/notice/User_Faq.css">
    

</head>

<body>
   <!-- Navigation -->

	<%@ include file="../../common/nav.jsp"%>
	
	<!-- main -->
    <div class="container">
        <div class="row">
            <h2 class="jal">고객센터</h3>
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-3 sidebar">
                <a href="uNoticeMain.no"><span class="sidebar_span">공지사항</span></a><br>
                <a href="uFaqView.fa"><span class="sidebar_span">자주 묻는 질문</span></a><br>
                <a href="User_Chat.html"><span class="sidebar_span"> 채팅</span></a>
            </div>
            <div class="col-lg-8 col-lg-offset-1">
                <h2 class="jal">자주 묻는 질문</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-3">
                <div class="faq_index">
                    <ul class="faq_index_ul">
                        <li id="resFaq" class="faq_index_li">예약</a></li>
                        <li id="delivFaq" class="faq_index_li">배송</a></li>
                        <li id="payFaq" class="faq_index_li">결제</a></li>
                        <li id="sDelFaq" class="faq_index_li">소형이사</a></li>
                        <li id="etcFaq" class="faq_index_li">기타문의</a></li>                         
                    </ul>
                </div>
                
<!-- 예약 -->
                <div id="resFaqDetail" class="form_area_wrap" style="display: block;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>용달이 운영 시간은 어떻게 되나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>[기사정보]기사님 위치나 연락서츨 알 수 있나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>화물 운송의 경우 기사님의 실시간 위치와 연락처는 시스템에서 제공하고 있지 않습니다.<br>
							통상 기사배차가 확정되면 기사님이 출발지에 확인차 연락드리고 있습니다.<br>
							기타 기사 정보는 용달이 서비스운영팀에 문의 해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>야간상차 및 익일하차도 가능한가요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>
                        	원하시는 상차시간과 하차시간을 입력해주시면 그 시간에 가능한 기사를 배차하여 보내드립니다.<br>
							야간 상차의 경우 시간요금이 일부 추가될 수 있고,<br>
							익일(익익일) 하차의 경우도 짐을 트럭에 보관하는 개념으로 추가요금이 발생합니다.<br>
							추가요금에 대해서는 차종, 옵션별로 상이하여 홈페이지의 예약하기 화면를 참고해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>기사배차가 안 될 수도 있나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>	트럭 배차는 트럭수요와 기사공급의 원칙에 따라 이루어지게 됩니다.<br>
							용달이은 평균적인 상황에서 고객님과 기사님 사이의 최적 운임을 제시하고 있지만,<br>
							심야, 악천후, 교통상황 등에 따라 제시된 운임으로 배차가 안되는 경우가 일부 발생합니다.<br>
							배차가 원활하지 않은 경우 용달이 서비스팀에서 따로 연락을 드려 대안을 말씀드리도록 하겠습니다.<br>
                        </p>
                    </div>
                </div>

<!-- 배송 -->
                <div id="delivFaqDetail" class="form_area_wrap" style="display: none;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>배송시간은 어떻게 되나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>	배송은 크게 상차시간, 운행시간, 하차시간으로 나눌 수 있습니다.<br>
							상차와 하차시간은 물건의 양과 처리방법(수작업, 지게차 등)에 따라 상이하며,<br>
							운행시간은 주행거리 및 도로사정에 따라 상이합니다.<br>
							시간이 중요한 경우, 용달이 서비스팀에 문의해주시면 최대한 처리하겠습니다.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>상하차 도움은 무슨 뜻인가요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>기사는 차량(트럭) 위에서 적재와 화물의 결박, 운행에 대한 것을 책임집니다.<br>
							상하차 도움은 사무실이나 창고 안에서 물건을 트럭까지 옮기는 경우 등<br>
							물건을 싣고(상차) 내리는(하차) 과정에서 기사의 도움이 필요한 경우를 말합니다.<br>
							기본적인 상하차 도움에 대한 금액은 용달이 시스템에서 제공하고 있으나,<br>
							물건의 양과무게, 난이도(계단이동)에 따라 상하차 요금은 달라질 수 있습니다.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>물건이 파손되었어요</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>용달이은 적재물 파손 및 분실에 대해 DB손해보험의 적재물배상책임보험(최대 1억원)에 가입되어 있습니다.<br>
							그러나 무엇보다 사고를 미연에 방지할 수 있도록 최선의 노력을 다 하겠습니다.<br>
                        </p>
                    </div>
                </div>

<!-- 결제 -->
                <div id="payFaqDetail" class="form_area_wrap" style="display: none;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>배송운임은 어떻게 결정되나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>차종별로 배송운임은 크게 세가지로 구성되어 있습니다.<br><br>
							- 거리요금: 택시요금과 유사하게 기본요금과 거리에 따른 운임으로 책정됩니다.<br>
							- 시간추가: 야간이나 주말 상하차의 경우, 상차와 하차일이 다른 경우 등 상하차 시간과 관련된 추가요금입니다.<br>
							- 상하차추가: 기사가 상하차 시 기본책임 이외의 배송물품의 운반에 대한 추가비용입니다.<br><br>
							용달이은 고객님과 트럭기사를 가장 효율적으로 매칭해줄 수 있는 최적요금을 제시하고 있습니다.<br>
							운임 및 배송에 대한 데이터를 다양한 기법으로 분석하여 주기적으로 운임을 조정하고 있습니다.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>용달이 결제 방식은?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>카드결제 : 카드 결제를 선택하시고 예약을 완료하시면 결제링크를 보내드립니다.<br>
                        	**카드결제의 경우, 결제가 확인된 이후 예약이 접수됩니다.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>미리 결제했는데 취소를 해야해요</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>기사가 배정되기 전에는 언제라도 추가적인 비용없이 취소가 가능합니다.<br>
							하지만, 기사배정 이후나 기사가 출발지에 도착한 이후 취소가 된다면 부득이 일부 취소수수료가 부과됩니다.<br>
							(예약시간 1시간전 취소 : 5천원, 예약시간 30분전 취소 : 1만원, 상차지 도착 후 취소: 50%)<br>
							결제가 이루어진 후 취소해야할 경우에는<br>
							콜센터에서 취소비를 제외한 금액에 대해  승인취소를 해드립니다.<br>
                        </p>
                    </div>
                </div>

<!-- 소형이사 -->
                <div id="sDelFaqDetail" class="form_area_wrap" style="display: none;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>소형 이사가 무엇인가요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>소형이사는 원룸, 고시원, 자취/하숙방 등 차량 1대로 이동이 가능한 수준의 이사를 말합니다.<br>
							소형이사에 제공되는 차량은 다마스, 라보, 1톤, 1.4톤, 총 4종류가 있으며<br>
							고객과 기사님이 함께 이사짐을 운반하는 기준으로 금액이 책정되어있습니다.<br>
							최대한 저렴하게 제공하는 만큼 포장과 정리/배치는 고객님이 직접 하셔야 합니다.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>이삿짐 수량에 대한 안내</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>현장에서 가장 많이 발생하는 갈등이 예약시 기입했던 이사짐보다 더 많은 경우입니다.<br>
							이 경우 부득이 추가금이 발생합니다.<br>
							또한 예약한 차량에 다 실리지 않을 경우엔 더 큰 비용이 들기 때문에 가능한 정확하고 자세하게 선택/기입해주시기를 요청드립니다.<br>
							이사짐 선택 창에 없는 물건들은 요청사항에 추가적으로 기입해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>이사차량에 같이 타고 이동할 수 있나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>용달이 소형이사는 기본적으로 차량에 1인 동승을 제공합니다.<br>
							(다마스와 라보는 1인 동승만 가능, 1톤차량은 2인 가능하나 차량마다 다름)<br>
							2인 이상 동승 시에는 기사의 확인이 필요하니 서비스운영팀에 문의해주세요.<br>
                        </p>
                    </div>
                </div>


<!-- 기타 문의 -->
                <div id="etcFaqDetail" class="form_area_wrap" style="display: none;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>현장에서 기사가 추가요금을 요구해요</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>기본적으로 용달이은 기사님의 요구에 의해 추가금이 발생하지 않도록 노력하고 있습니다.<br>
							하지만, 용달이 예약시 요청 내용과 다른 점이 있다면 부득이 추가금이 발생할 수 있습니다.<br>
							예를 들어, 배송물품 추가, 예약되지 않은 동승, 20분이상 대기, 주차비 등이 추가금 발생의 주된 이유입니다.<br>
							추가금 요구를 포함한 모든 배송간 분쟁은 원칙적으로 용달이 서비스팀을 통해서 협의해주시면 됩니다.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/question.png">
                        <p>용달이 관리자가 누구인가여</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/answer.png">
                        <p>비밀입니다.<br>
                        </p>
                    </div>
                </div>
            </div>
            
        </div>
        
    </div>
    <br>
    <br>
    <br>

	<!-- Footer -->
	<%@ include file="../../common/footer.jsp"%>
	
    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }
            });
        }

        $('#resFaq').click(function(){
            $(this).css({
                'background': 'rgb(87, 187, 138)',
                'color':'white'
            });
            $('.faq_index_ul li:not(:contains("예약"))').css({
                'background':'rgb(231, 230, 230)',
                'color':'black'
            });
            $('#resFaqDetail').css({
                'display':'block'
            })
            $('#delivFaqDetail').css({
                'display':'none'
            })
            $('#payFaqDetail').css({
                'display':'none'
            })
            $('#sDelFaqDetail').css({
                'display':'none'
            })
            $('#etcFaqDetail').css({
                'display':'none'
            })
        });
        $('#delivFaq').click(function(){
            $(this).css({
                'background': 'rgb(87, 187, 138)',
                'color':'white',
            });
            $('.faq_index_ul li:not(:contains("배송"))').css({
                'background':'rgb(231, 230, 230)',
                'color':'black'
            });
            $('#resFaqDetail').css({
                'display':'none'
            })
            $('#delivFaqDetail').css({
                'display':'block'
            })
            $('#payFaqDetail').css({
                'display':'none'
            })
            $('#sDelFaqDetail').css({
                'display':'none'
            })
            $('#etcFaqDetail').css({
                'display':'none'
            })
        });
        $('#payFaq').click(function(){
            $(this).css({
                'background': 'rgb(87, 187, 138)',
                'color':'white',
            });
            $('.faq_index_ul li:not(:contains("결제"))').css({
                'background':'rgb(231, 230, 230)',
                'color':'black'
            });
            $('#resFaqDetail').css({
                'display':'none'
            })
            $('#delivFaqDetail').css({
                'display':'none'
            })
            $('#payFaqDetail').css({
                'display':'block'
            })
            $('#sDelFaqDetail').css({
                'display':'none'
            })
            $('#etcFaqDetail').css({
                'display':'none'
            })
        });
        $('#sDelFaq').click(function(){
            $(this).css({
                'background': 'rgb(87, 187, 138)',
                'color':'white',
            });
            $('.faq_index_ul li:not(:contains("소형이사"))').css({
                'background':'rgb(231, 230, 230)',
                'color':'black'
            });
            $('#resFaqDetail').css({
                'display':'none'
            })
            $('#delivFaqDetail').css({
                'display':'none'
            })
            $('#payFaqDetail').css({
                'display':'none'
            })
            $('#sDelFaqDetail').css({
                'display':'block'
            })
            $('#etcFaqDetail').css({
                'display':'none'
            })
        });
        $('#etcFaq').click(function(){
            $(this).css({
                'background': 'rgb(87, 187, 138)',
                'color':'white',
            });
            $('.faq_index_ul li:not(:contains("기타"))').css({
                'background':'rgb(231, 230, 230)',
                'color':'black'
            });
            $('#resFaqDetail').css({
                'display':'none'
            })
            $('#delivFaqDetail').css({
                'display':'none'
            })
            $('#payFaqDetail').css({
                'display':'none'
            })
            $('#sDelFaqDetail').css({
                'display':'none'
            })
            $('#etcFaqDetail').css({
                'display':'block'
            })
        });
    </script>
</body>

</html>