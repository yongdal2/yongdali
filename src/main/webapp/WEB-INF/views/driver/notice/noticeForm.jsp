<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>용달이 | 사업자_공지사항 작성</title>

    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/notice/Driver_Notice_Form.css">
     <script type="text/javascript" src="${contextPath }/resources/js/ckeditor/ckeditor.js"></script>
    
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
                <a onclick="chat();"><span class="sidebar_span"> 채팅</span></a>
            </div>
            <div class="col-lg-8 col-lg-offset-1">
                <h2 class="jal">공지사항</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-3">
                <form action="dNinsert.no" method="post" id="notice" enctype="multipart/form-data" onsubmit="return validate();">
                    <div class="form_area_wrap">
                        <table class="form_table">
                            <colgroup>
                                <col width="15%">
                                <col width="85%">              
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>구분</td>
                                <td><select name="nSort" id="nSort">
                                    <option value="일반">일반</option>
                                    <option value="사업자" selected>사업자</option>
                                    <option value="공통">공통</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="nTitle" id="title" maxlength="30" placeholder="내용을 입력해주세요(최대 30자)">
                                    <!-- <span id="remaining">(<span id="tCount"></span>/<span id="tMax" value="30">30</span>)</span> -->
                                </td>
                            </tr>
                            <tr>
                                <td>작성자</td>
                                <!-- TODO value에 관리자 이름 갖고오기 ${loginUser.mName }-->
                                <td><input type="text" readonly name="nWriter" value=" ${loginUser.mName }"></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="nContent" id="editor1" maxlength="700"></textarea>
                                    <!-- <span id="remaining">(<span id="cCount"></span>/<span id="cMax" value="700">700</span>)</span></td> -->
                            </tr>
                            <tr>
                                <td>첨부파일</td>
                                <td><input type="file" name="uploadFile"></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="register">
                            <input type="submit" id="noticeForm" name="" value="등록">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<br>
    <br>
    <br>
	<!-- Footer -->
	<%@ include file="../../common/footer.jsp"%>
    <script>
	    function validate(){
			var title = document.getElementById("title");
			
			if ((title.value) == ""){
	            alert("제목을 입력해주세요!");
	            title.focus();
	            return false;
	        }
			
			if (CKEDITOR.instances.editor1.getData() == '') {
				alert("내용을 입력하세요!");
		        return false;
		    }
		}
    	$(function(){
    		CKEDITOR.replace( 'editor1');
	        /* $('#title').keydown(function(){
	            var maxlength = $('#tMax').val();
	            var inputlength = $(this).val().length;
	            var remain = 0 + inputlength;
	
	            $('#tCount').html(remain);
	
	            if(inputlength > maxlength){
	                $('#tCount').val($('#tCount').val().substring(0,30));
	
	            }
	        });
	
	        $('#content').keydown(function(){
	            var maxlength = $('#cMax').val();
	            var inputlength = $(this).val().length;
	            var remain = 0 + inputlength;
	
	            $('#cCount').html(remain);
	
	            if(inputlength > maxlength){
	                $('#cCount').val($('#cCount').val().substring(0,700));
	
	            }
	        }) */
    })
    
    function chat(){
	    	window.open('chat.ch','tistory','width=500px, height=700px, scrollbars=no, resizable=no, toolbars=no, menubar=no')
	    }
    </script>
</body>
</html>