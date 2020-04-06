<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>용달이 | 사용자_공지사항 작성</title>
    
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/notice/User_Notice_Form.css">


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
                <a href="noticeMain.no"><span class="sidebar_span">공지사항</span></a><br>
                <a href="User_Faq.html"><span class="sidebar_span">자주 묻는 질문</span></a><br>
                <a href onclick="window.open('User_Chat.html','tistory','width=500px, height=700px, scrollbars=no, resizable=no, toolbars=no, menubar=no')"><span class="sidebar_span"> 채팅</span></a>
            </div>
            <div class="col-lg-8 col-lg-offset-1">
                <h2 class="jal">공지사항</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-3">
                <form action="ninsert.no" method="post" enctype="multipart/form-data">
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
                                    <option value="사업자">사업자</option>
                                    <option value="공통">공통</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="nTitle" id="title" maxlength="30" placeholder="내용을 입력해주세요(최대 30자)">
                                    <span id="remaining">(<span id="tCount"></span>/<span id="tMax" value="30">30</span>)</span>
                                </td>
                            </tr>
                            <tr>
                                <td>작성자</td>
                                <!-- 관리자 이름 갖고오기 -->
                                <td>관리자</td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="nContent" id="content" maxlength="700"></textarea>
                                    <span id="remaining">(<span id="cCount"></span>/<span id="cMax" value="700">700</span>)</span></td>
                            </tr>
                            <tr>
                                <td>첨부파일</td>
                                <td><input type="file" name="uploadFile"></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="register">
                            <input type="submit" name="" value="등록">
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
    $(function(){
        $('#title').keydown(function(){
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
        })
    })
    </script>
</body>
</html>