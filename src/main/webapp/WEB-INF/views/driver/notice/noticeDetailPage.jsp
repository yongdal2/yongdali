<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>용달이 | 사업자_공지사항 상세페이지</title>

    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/notice/Driver_Notice_DetailPage.css">

    
</head>
<body>
	<!-- Navigation -->

	<%@ include file="../../common/nav_driver.jsp"%>
	
	<!-- main -->
    <div class="container">
        <div class="row">
            <h2 class="jal">고객센터</h3>
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-3 sidebar">
                <a href="Driver_Notice.html"><span class="sidebar_span">공지사항</span></a><br>
                <a href="Driver_Faq.html"><span class="sidebar_span">자주 묻는 질문</span></a><br>
                <a href=""><span class="sidebar_span"> 채팅</span></a>
            </div>
            <div class="col-lg-8 col-lg-offset-1">
                <h2 class="jal">공지사항</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-3">
                <div class="text_area">
                    <div class="text_area_wrap">
                        <div class="text_area_tit">
                            <h4>제목입니다.</h4>
                            <ul class="title_ul">
                                <li>
                                <span class="regist_Day_area">등록일<em class="regist_day">2020.02.27</em></span>
                                <span class="write_tit_area">작성자<em class="write">관리자</em></span>
                                </li>
                            </ul>
                        </div>
                        <div class="detail_text_area">
                            <p>어쩌고저쩌고</p>
                        </div>
                        <div class="file_area">
                            <ul>
                                <li>
                                    <div class="left">첨부파일</div>
                                    <div class="file">jinyeong.png</div>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                    <div class="pagemove_area_wrap">
                        <ul>
                            <li>
                                <a href="">
                                    <div class="left next">이전글</div>
                                    <div class="tit">이전글 입니다아아</div>
                                    <div class="date">2019-12-13</div>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <div class="left prev">다음글</div>
                                    <div class="tit">다음글 입니당아당</div>
                                    <div class="date">2020-01-17</div>
                                </a>
                            </li>
                        </ul>
                        <div class="editDelete">
                            <button id="editBtn" onclick="location.href='' ">수정</button>
                            <button id="deleteBtn" onclick="location.href='' ">삭제</button>
                        </div>
                        <div class="list">
                            <button id="listbtn" onclick="location.href='Driver_Notice.html' ">목록</button>
                        </div>
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
        
    </script>
</body>
</html>