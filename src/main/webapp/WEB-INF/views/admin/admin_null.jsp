<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>용달이 | 관리자 페이지</title>
        
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/admin.css">
    

</head>

<body>
   <!-- Navigation -->
	<%@ include file="../common/nav_admin.jsp"%>
	
	<!-- main -->
    <div class="container">
        <div class="row">
            <div class="col-lg-3 sidebar">
                <h2 class="jal">관리자 페이지</h2>
                <p>삭제 예정 페이지/ 참고용/admin_null.jsp</p>
            </div>
                <a href="Driver_Notice.html"><span class="sidebar_span">회원 확인</span></a>
                <a href="Driver_Faq.html"><span class="sidebar_span">내역 확인</span></a><br>
                <a href="#"><span class="sidebar_span1">회원님 목록</span></a>
                <a href="#"><span class="sidebar_span1">기사님 목록</span></a>
        </div>
   	    <hr>
	<!-- list -->
    <div class="row" style="margin: 20px;">
        <div class="col-xs-12 col-md-12" id="table">
            <Br>
            <table class="table table-striped table-hover text-center">
                <thead id="thead">
                    <tr>
                        <td>회원번호</td>
                        <td>회원ID(이메일)</td>
                        <td>비밀번호</td>
                        <td>이름</td>
                        <td>휴대폰번호</td>
                        <td>M_SORT</td>
                        <td>M_STATUS</td>
                        <td>가입일</td>
                    </tr>
                </thead>
                <tbody id="tbody">
                    <tr>
                        <td>089</td>
                        <td>하차 완료</td>
                        <td>2020.01.12</td>
                        <td>부산시123</td>
                        <td>제주시 1234</td>
                        <td>123,000,34</td>
                        <td>라보99ton</td>
                    </tr>
                    <tr>
                        <td>089</td>
                        <td>하차 완료</td>
                        <td>2020.01.12</td>
                        <td>부산시123</td>
                        <td>제주시 1234</td>
                        <td>123,000,34</td>
                        <td>라보99ton</td>
                    </tr>
                    <tr>
                        <td>089</td>
                        <td>하차 완료</td>
                        <td>2020.01.12</td>
                        <td>부산시123</td>
                        <td>제주시 1234</td>
                        <td>123,000,34</td>
                        <td>라보99ton</td>
                    </tr>
                </tbody>    
            </table>
        </div>
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
    </div>
    </div>

	<br>
    <br>
    <br>

	<!-- Footer -->
	<%@ include file="../common/footer.jsp"%>
	
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