<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>용달이 | 사업자_공지사항</title>

    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/notice/Driver_Notice.css">


</head>
<body>

	<!-- Navigation -->
	<c:import url="../../common/nav_driver.jsp"/>
	
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
                <a onclick="chat();"><span class="sidebar_span"> 채팅</span></a>
            </div>
            <div class="col-lg-8 col-lg-offset-1">
                <h2 class="jal">공지사항</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-3">
                <div class="tbl_wrap div">
                    <table class="tbl" id="tbl">
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
                        <tbody id="listBody">
                        <%-- <c:forEach var="n" items="${ list }">
                        <tr>
                            <td>
                            	<c:url var="ndetail" value="dNdetail.no">
                            		<c:param name="nNo" value="${ n.nNo }"/>
                            		<c:param name="currentPage" value="${ pi.currentPage }"/>
                            	</c:url>
                            	<a href="${ndetail }">${n.nTitle }</a>
                            </td>
                            <td>${ n.nCreateDate }</td>
                            <td>${ n.nWriter }</td>
                        </tr>
                        </c:forEach>    --%>           
                        </tbody>                                 
                    </table>
                </div>
                <div class="pagination">
                    <span class="inner_paging"> 
                     <!-- 이전 -->
                     <%-- <c:if test="${pi.currentPage eq 1 }">
                     	<a>&laquo;</a>
                     </c:if>
                     <c:if test="${pi.currentPage ne 1 }">
	                     <c:if test="${!empty list }">
		                     	<c:url var="before" value="dNsearch.no">
		                     		<c:param name="currentPage" value="${pi.currentPage -1 }"/>
									<c:param name="keyword" value="${keyword }"/>
		                     	</c:url>
	                     </c:if>
	                     <c:if test="${empty list }">
	                     	<c:url var="before" value="dNoticeMain.no">
                     			<c:param name="currentPage" value="${pi.currentPage - 1 }"/>
                     		</c:url>
	                     </c:if>                     	
                     	<a href="${ before }">&laquo;</a>
                     </c:if>
                     
                     <!-- 페이지 -->
                     <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                     	<c:if test="${p eq pi.currentPage }">
                     		<a class="active">${p}</a>
                     	</c:if>
                     	<c:if test="${p ne pi.currentPage }">
                     		<c:if test="${!empty list }">
                     			<c:url var="pagination" value="dNsearch.no">
                     				<c:param name="currentPage" value="${p }"/>
									<c:param name="keyword" value="${keyword }"/>
                     			</c:url>
                     		</c:if>
                     		<c:if test="${empty list }">
	                     		<c:url var="pagination" value="dNoticeMain.no">
	                     			<c:param name="currentPage" value="${p }"/>
	                     		</c:url>
                     		</c:if>
                     		<a href="${pagination }">${ p }</a>
                     	</c:if>
                     
                     </c:forEach>
                     
                     <!-- 다음 -->
                     <c:if test="${pi.currentPage eq pi.maxPage }">
                     	<a>&raquo;</a>
                     </c:if>
                     <c:if test="${pi.currentPage ne pi.maxPage}">
                     	<c:if test="${!empty list }">
                     		<c:url var="after" value="dNsearch.no">
                     			<c:param name="currentPage" value="${pi.currentPage + 1 }"/>
								<c:param name="keyword" value="${keyword }"/>
                     		</c:url>
                     	</c:if>
                     	<c:if test="${empty list }">
	                     	<c:url var="after" value="dNoticeMain.no">
	                     		<c:param name="currentPage" value="${pi.currentPage + 1 }"/>
	                     	</c:url>
                     	</c:if>
                     	<a href="${after }">&raquo;</a>
                     </c:if> --%>
                    </span>
                </div>
                <div class="search_write" align="center">
                    <div id="search-box" >
                        <input id="search-form" name="keyword" type="text" placeholder="Search">
                        <button id="search-button">검색</button>
                    </div>
                    <!-- 관리자일 경우 뜨는 곳 -->
                    <c:if test="${loginUser.mId eq 'admin@naver.com'}">
                    <div class="admin_write">
                        <button id="admin_write_btn" onclick="location.href='dNinsertView.no';">작성하기</button>
                    </div>
                    </c:if>
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
    $(function(){
   		noticeList(1);
   		
   		$("#listBody").mouseenter(function(){
   			$('.ndetail').click(function(){
   				var nNo = $(this).parent().siblings(":eq(0)").val();
   				var currentPage = $(".active").text();
   				
   				location.href="${contextPath}/dNdetail.no?nNo="+nNo+"&currentPage="+currentPage;
   			})
   		})
   		
   		$('#search-form').keypress(function(event){
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if(keycode == '13'){
            	$('#search-button').trigger("click");
            }
        }); 
   		
   		$('#search-button').click(function(){
   			searchList(1);
    	});
   		
   		
   		
   	});
   	
   	
   	function noticeList(page){
   		$.ajax({
   			url:"dNoticeList.no",
   			dataType:"json",
   			data:{
   				currentPage:page
   				},
   			success:function(data){
   				console.log(data);
   				
   				$tableBody = $("#tbl tbody");
   				$tableBody.html("");
   				
   				var list = data["list"];
   				
   				for(var i in list){
   					var $tr = $("<tr>");
   					var $td1 = $("<td>");
   					var $td2 = $("<td>");
   					var $td3 = $("<td>");
   					var $nNo = list[i].nNo;
   					
   					var $a = $("<a class='ndetail'>").text(list[i].nTitle);
   					var $hidden = $("<input type='hidden'>");
   					
   					$hidden.attr("value",$nNo);
   					
   					$td1.append($a);
   					$td2.text(list[i].nCreateDate);
   					$td3.text(list[i].nWriter);
   					
   					$tr.append($hidden);
   					$tr.append($td1);
   					$tr.append($td2);
   					$tr.append($td3);
   					
   					$tableBody.append($tr);
   				}
   				
   				$('.inner_paging').empty();
   				
   				var pi = data["pi"];
   				var currentPage = pi["currentPage"];
   				var listCount = pi["listCount"];
   				var pageLimit = pi["pageLimit"];
   				var maxPage = pi["maxPage"];
   				var startPage = pi["startPage"];
   				var endPage = pi["endPage"];
   				var boardLimit = pi["boardLimit"];
   				
   				console.log(startPage);
   				console.log(endPage);
   				console.log(currentPage);
   				       
   				/* 이전 */
   				if(currentPage > 1){
   					var $backPage = $("<a onclick='noticeList("+(currentPage -1)+");'>").html('&laquo;');
   				}else{
   					var $backPage = $("<a>").html('&laquo;');
   				}
   				$('.inner_paging').append($backPage);
   				
   				/* 페이지 */
   				for(var p =startPage; p<= endPage; p++){
   					if(p==currentPage){
   						var $pPage = $("<a class='active'>").text(p);
   					}else{
   						var $pPage = $("<a onclick='noticeList("+p+");'>").text(p);
   					}
   					$('.inner_paging').append($pPage);
   				}
   				
   				/* 다음 */
   				if(currentPage != maxPage){
   					var $nextPage = $("<a onclick='noticeList("+(currentPage + 1)+");'>").html('&raquo;');       					
   				}else{
   					var $nextPage = $("<a>").html('&raquo;');
   				}
   			
   				$('.inner_paging').append($nextPage);
   			}
   		})
   	};
   	
   	function searchList(page){
   		$.ajax({
   			url:"dNsearch.no",
   			dataType:"json",
   			data:{
   				currentPage: page,
   				keyword:$('#search-form').val()
   			},
   			success:function(data){
   				console.log(data);
   				
   				$tableBody = $("#tbl tbody");
   				$tableBody.html("");
   				
   				var list = data["list"];
   				
   				for(var i in list){
   					var $tr = $("<tr>");
   					var $td1 = $("<td>");
   					var $td2 = $("<td>");
   					var $td3 = $("<td>");
   					var $nNo = list[i].nNo;
   					
   					var $a = $("<a class='ndetail'>").text(list[i].nTitle);
   					var $hidden = $("<input type='hidden'>");
   					
   					$hidden.attr("value",$nNo);
   					
   					$td1.append($a);
   					$td2.text(list[i].nCreateDate);
   					$td3.text(list[i].nWriter);
   					
   					$tr.append($hidden);
   					$tr.append($td1);
   					$tr.append($td2);
   					$tr.append($td3);
   					
   					$tableBody.append($tr);
   				}
   				
   				$('.inner_paging').empty();
   				
   				var pi = data["pi"];
   				var currentPage = pi["currentPage"];
   				var listCount = pi["listCount"];
   				var pageLimit = pi["pageLimit"];
   				var maxPage = pi["maxPage"];
   				var startPage = pi["startPage"];
   				var endPage = pi["endPage"];
   				var boardLimit = pi["boardLimit"];
   				
   				console.log(startPage);
   				console.log(endPage);
   				console.log(currentPage);
   				       
   				/* 이전 */
   				if(currentPage > 1){
   					var $backPage = $("<a onclick='searchList("+(currentPage -1)+");'>").html('&laquo;');
   				}else{
   					var $backPage = $("<a>").html('&laquo;');
   				}
   				$('.inner_paging').append($backPage);
   				
   				/* 페이지 */
   				for(var p =startPage; p<= endPage; p++){
   					if(p==currentPage){
   						var $pPage = $("<a class='active'>").text(p);
   					}else{
   						var $pPage = $("<a onclick='searchList("+p+");'>").text(p);
   					}
   					$('.inner_paging').append($pPage);
   				}
   				
   				/* 다음 */
   				if(currentPage != maxPage){
   					var $nextPage = $("<a onclick='searchList("+(currentPage + 1)+");'>").html('&raquo;');       					
   				}else{
   					var $nextPage = $("<a>").html('&raquo;');
   				}
   			
   				$('.inner_paging').append($nextPage);
   			}
   		})
   	};
   	
   	function chat(){
    	window.open('chat.ch','tistory','width=500px, height=700px, scrollbars=no, resizable=no, toolbars=no, menubar=no')
    }
    </script>
</body>
</html>