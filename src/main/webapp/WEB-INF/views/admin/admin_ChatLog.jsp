<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>용달이 | 관리자 페이지</title>

<!-- Custom Css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/admin/admin.css">


</head>

<body>
	<!-- Navigation -->
	<%@ include file="../common/nav_admin.jsp"%>
	<!-- 배경색 -->
<!-- <div style="width: 100%; height: 100%; background: rgb(233, 246, 240); padding-top: 30px; padding-top: 30px;"> -->
	<div style="width: 100%; height: 100%; padding-top: 30px; padding-top: 30px;">

		<!-- main -->
		<!-- <div class="container"> -->
		<div class="content container">
			<div class="row">
				<h2 class="jal">관리자 페이지</h2>
				<p>채팅 내역 / admin_ChatLog.jsp / 컬럼명 선정</p>
				<hr>
			</div>
			
			<div class="row" id="content">
			<!-- <div id="content"> -->
				<div class="col-lg-3 sidebar">
					<a href="#"><span class="sidebar_span">회원님 목록</span></a><br>
					<a href="#"><span class="sidebar_span">기사님 목록</span></a><br>
					<a href="#"><span class="sidebar_span">예약 내역</span></a><br>
					<a href="#"><span class="sidebar_span">정산 내역</span></a><br> 
					<a href="#"><span class="sidebar_span">환불 내역</span></a><br> 
					<a href="#"><span class="sidebar_span">채팅 내역</span></a>
				</div>

			<!-- list -->
			<div class="row" id="rowList">
				<div class="col-xs-12 col-md-12" id="table">
					<br>
					<table class="table table-striped table-hover text-center">
						<thead id="thead">
							<tr>
								<td>회원번호</td>
								<td>--</td>
								<!-- <td>비밀번호</td> -->
								<td>--</td>
								<td>--</td>
								<td>--</td>
								<td>--</td>
								<td>--</td>
								<td>--</td>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr>
								<td>M2</td>
								<td>mem01@naver.com</td>
								<td>홍멤버</td>
								<td>01022222222</td>
								<td>일반</td>
								<td>정상</td>
								<td>Y</td>
								<td>200318</td>
							</tr>
							<tr>
								<td>M3</td>
								<td>biz01@naver.com</td>
								<td>김거상</td>
								<td>01033333333</td>
								<td>사업자</td>
								<td>정상</td>
								<td>N</td>
								<td>200318</td>
							</tr>
							<tr>
								<td>M4</td>
								<td>biz02@naver.com</td>
								<td>최거상</td>
								<td>01044444444</td>
								<td>사업자</td>
								<td>정상</td>
								<td>N</td>
								<td>200318</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row text-center" style="height: 400px">
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
	</div>
</div>

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