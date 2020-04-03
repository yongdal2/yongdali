<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>용달이 | 사용자_공지사항</title>
    
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/notice/User_Notice.css">

</head>
<body>
    <!-- Navigation -->
	
	<c:import url="../../common/nav.jsp"/>
	<%-- <%@ include file="../../common/nav.jsp"%> --%>
	
	<!-- main -->
    <div class="container">
        <div class="row">
            <h3 class="jal">고객센터</h3>
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-3 sidebar">
                <a href="noticeMain.no"><span class="sidebar_span">공지사항</span></a><br>
                <a href="User_Faq.html"><span class="sidebar_span">자주 묻는 질문</span></a><br>
                <a href=""><span class="sidebar_span"> 채팅</span></a>
            </div>
            <div class="col-lg-8 col-lg-offset-1">
                <h3 class="jal">공지사항</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-3">
                <div class="tbl_wrap div">
                    <table class="tbl">
                        <colgroup>
                            <col width="70%">
                            <col width="15%">    
                            <col width="15%">           
                        </colgroup>
                        <thead>
                        <tr>
                            <th>내용</th>
                            <th>작성일</th>
                            <th>작성자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="n" items="${ list }">                        
                        <tr>
                            <td>
                            	<c:url var="ndetail" value="ndetail.no">
                            		<c:param name="nNo" value="${n.nNo }"/>
                            		<c:param name="currentPage" value="${pi.currentPage }"/>
                            	</c:url>
                            	<a href="${ndetail }">${n.nTitle}</a>
                            </td>
                            <td>${ n.nCreateDate }</td>
                            <td>${ n.nWriter }</td>
                        </tr>
                        </c:forEach>                                        
                    </table>
                </div>
                <div class="pagination">
                    <span class="inner_paging"> 
                     <!-- 이전 -->
                     <c:if test="${pi.currentPage eq 1 }">
                     	&laquo;
                     </c:if>
                     <c:if test="${pi.currentPage ne 1 }">
                     	<c:url var="before" value="noticeMain.no">
                     		<c:param name="currentPage" value="${pi.currentPage - 1 }"/>
                     	</c:url>
                     	<a href="${ before }">&laquo;</a>
                     </c:if>
                     
                     <!-- 페이지 -->
                     <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                     	
                     
                     </c:forEach>
                     
                    
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">&raquo;</a>
                    </span>
                </div>
                <div class="search_write" align="center">
                    <form id="search-box">
                        <input id="search-form" type="text" placeholder="Search">
                        <button id="search-button" type="submit">검색</button>
                    </form>
                    <div class="admin_write">
                        <button id="admin_write_btn" onclick="location.href='User_Notice_Form.html';">작성하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
	<%@ include file="../../common/footer.jsp"%>

    <script>
        
    </script>
</body>
</html>