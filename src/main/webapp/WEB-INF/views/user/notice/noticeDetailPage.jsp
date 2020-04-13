<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>용달이 | 사용자_공지사항 상세페이지</title>

    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/notice/User_Notice_DetailPage.css">


</head>
<body>
    <!-- Navigation -->

	<%@ include file="../../common/nav.jsp"%>
	
	<!-- main -->
    <div class="content container">
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
                <h2 class="jal">공지사항</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-3">
                <div class="text_area">
                    <div class="text_area_wrap">
                        <div class="text_area_tit">
                            <h4>${n.nTitle}</h4>
                            <ul class="title_ul">
                                <li>
                                <span class="regist_Day_area">등록일<em class="regist_day">${n.nCreateDate }</em></span>
                                <span class="write_tit_area">작성자<em class="write">${n.nWriter }</em></span>
                                </li>
                            </ul>
                        </div>
                        <div class="detail_text_area">
                            <p>${n.nContent }</p>
                        </div>
                        <c:if test="${!empty n.nImgOrigin }">
	                        <div class="file_area">
	                            <ul>
	                                <li>
	                                	
		                                    <div class="left">첨부파일</div>
		                                    <div class="file"><a href="${contextPath }/resources/nuploadFiles/${n.nImgRename}" download="${n.nImgOrigin }">${n.nImgOrigin }</a></div>                                    
	                                </li>
	                            </ul>
	                        </div>
                        </c:if>
                    </div>
                    <div class="pagemove_area_wrap">
                        <ul>
                            <li>
                            	<c:if test="${!empty pre }">
	                                <a href="uNdetail.no?nNo=${pre.nNo }&currentPage=${currentPage }">
	                                    <div class="left prev">이전글</div>
	                                    <div class="tit">${pre.nTitle }</div>
	                                    <div class="date">${pre.nCreateDate }</div>
	                                </a>
                                </c:if>
                                <c:if test="${empty pre }">
                                	<a>
	                                    <div class="left prev">이전글</div>
	                                    <div class="tit">이전 글이 없습니다.</div>
	                                    <div class="date"></div>
	                                </a>
                                </c:if>
                            </li>
                            <li> 
                            	<c:if test="${!empty next }">
	                                <a href="uNdetail.no?nNo=${next.nNo }&currentPage=${currentPage }">
	                                    <div class="left next">다음글</div>
	                                    <div class="tit">${next.nTitle }</div>
	                                    <div class="date">${next.nCreateDate}</div>
	                                </a>
                                </c:if>
                                <c:if test="${empty next }">
                                	<a>
	                                	<div class="left next">다음글</div>
	                                    <div class="tit">다음 글이 없습니다.</div>
	                                    <div class="date"> </div>
                                    </a>
                                </c:if>
                            </li>
                        </ul>
                        <!-- TODO 관리자만 뜨도록 하기 -->
                        <div class="editDelete">
                        	<c:url var="uNupview" value="uNupview.no">
                        		<c:param name="nNo" value="${n.nNo }"/>
                        	</c:url>
                        	<c:url var="uNdelete" value="uNdelete.no">
                        		<c:param name="nNo" value="${n.nNo }"/>
                        	</c:url>
                        	<c:if test="${loginUser.mId eq 'admin@naver.com'}">
                            <button id="editBtn" onclick="location.href='${uNupview}' ">수정</button>
                            <button id="deleteBtn" onclick="deleteNotice();">삭제</button>
                            </c:if>
                        </div>
                        <div class="list">
	                        <c:url var="nlist" value="uNoticeMain.no">
								<c:param name="currentPage" value="${ currentPage}"/>
							</c:url>
                            <button id="listbtn" onclick="location.href='${nlist}' ">목록</button>
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
        function deleteNotice(){
        	var result = window.confirm("삭제하시겠습니까?");
        	
        	if(result){
        		location.href="${uNdelete}";
        	}
        }
        
        
        
        
    </script>
</body>
</html>