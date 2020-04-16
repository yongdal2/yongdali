<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>용달이 | 사업자_자주 묻는 질문</title>

    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/notice/Driver_faq.css">

</head>

<body>
    <!-- Navigation -->

	<%@ include file="../../common/nav_driver.jsp"%>
	
	<!-- main -->
    <div class="content container">
        <div class="row">
            <h2 class="jal">고객센터</h3>
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-3 sidebar">
                <a href="dNoticeMain.no"><span class="sidebar_span">공지사항</span></a><br>
                <a href="dFaqView.fa"><span class="sidebar_span">자주 묻는 질문</span></a><br>
                <c:if test="${loginUser.mId eq 'admin@naver.com'}">
                	<a onclick="adminChat();"><span class="sidebar_span">채팅</span></a>
                </c:if>
                <c:if test="${loginUser.mId ne 'admin@naver.com' }">
                	<a onclick="chat();"><span class="sidebar_span"> 채팅</span></a>
                </c:if>
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
                <div id="resFaqDetail" class="form_area_wrap" style="display: block;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 운영 시간은 어떻게 되나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 운영 시간은 어떻게 되나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 운영 시간은 어떻게 되나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                </div>

                <div id="delivFaqDetail" class="form_area_wrap" style="display: none;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 배송 시간은 어떻게 되나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 배송 시간은 어떻게 되나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 배송 시간은 어떻게 되나요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                </div>

                <div id="payFaqDetail" class="form_area_wrap" style="display: none;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 결제 방식은?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 결제 방식은?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 결제 방식은?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                </div>

                <div id="sDelFaqDetail" class="form_area_wrap" style="display: none;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>소형 이사가 무엇인가요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>소형 이사가 무엇인가요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>소형 이사가 무엇인가요?</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                </div>

                <div id="etcFaqDetail" class="form_area_wrap" style="display: none;">
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 관리자가 누구인가여</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 관리자가 누구인가여</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
                        </p>
                    </div>
                    <div class="accordion"><img src="${contextPath}/resources/images/notice/Driver_Question.png">
                        <p>용달이 관리자가 누구인가여</p>
                    </div>
                    <div class="ydl_panel"><img src="${contextPath}/resources/images/notice/Driver_Answer.png">
                        <p>용달이 플랫폼은 완전 자동화로 365일 24시간 이용이 가능합니다.<br>
                            기사만 있다면 365일 24시간 가능합니다.<br>
                            콜센터(고객서비스팀)와 카카오채널의 운영시간은 아래와 같습니다.<br>
                            - 평일 08시~20시<br>
                            - 주말, 공휴일 09시~18시<br>
                            콜센터 운영시간 이외시간에 트럭배송이 필요하시면 미리 예약해주세요.<br>
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
                'background': 'rgb(241,95,95)',
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
                'background': 'rgb(241,95,95)',
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
                'background': 'rgb(241,95,95)',
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
                'background': 'rgb(241,95,95)',
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
                'background': 'rgb(241,95,95)',
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
        
        function chat(){
	    	window.open('chat.ch','tistory','width=500px, height=700px, scrollbars=no, resizable=no, toolbars=no, menubar=no')
	    }
        
        function adminChat(){
       		location.href="${contextPath}/adminChat.ch";
       	}
    </script>
</body>

</html>