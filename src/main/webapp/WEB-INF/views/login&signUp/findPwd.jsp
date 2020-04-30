<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>용달이 | 비밀번호 찾기</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!-- warning icon -->
    <link rel="stylesheet" href="${contextPath}/resources/css/login&signUp.css">    
    <script src='https://kit.fontawesome.com/a076d05399.js'></script><!-- eye icon -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/js/login&signUp.js"></script>
</head>
<body>
    <!-- logo header -->
    <div class="header findPwdHeader">
        <a href="home.do">
            <img src="${contextPath}/resources/images/ydl_logo/ydl_lg_gr(150x50).png" alt="로고">
        </a>
    </div>

    <!-- content -->
    <div class="content">
        <form action="findPwd.me" method="post" id="findPwdForm" enctype="multipart/form-data" novalidate>
        	<input type="hidden" name="signupType" value="용달이">
            <div class="formRow">
                <div class="formRow--item">
                    <!-- 이메일 -->
                    <div class="emailWrap">
                        <div class="formRow--input-wrapper js-inputWrapper">
                            <input type="email" id="findPwd_email" class="formRow--input js-input eng emailChk" name="mId" placeholder="이메일" maxlength="50">
                        </div>
                        <div id="emailMsg" class="msgBox"></div>
                       	<div class="successMsgBox"><input type="hidden" name="isVerified" value="N">* 인증번호 확인 완료</div>
                        <div class="formRow--input-wrapper js-inputWrapper" id="verifyWrap">
                            <input type="text" class="formRow--input js-input" name="inputVeriCode" placeholder="인증번호 입력" maxlength="6">
                            <button type="button" class="verifyBtn" id="btn_findPwd_VeriCode">인증번호 받기</button>
                            <button type="button" class="verifyBtn" id="btn_findPwd_verify">확인</button>
                            <button type="button" class="verifyBtn" id="btn_findPwd_resend">재전송</button>
                        </div>
                        <div id="veriMsg" class="msgBox" ></div>
                    </div>       
                    <!-- 비밀번호 -->
                    <div class="pwdWrap" >
                        <div class="formRow--input-wrapper js-inputWrapper pwd">
                            <input type="password" class="formRow--input js-input" id="signUpPwd" name="pwd" 
                                    placeholder="비밀번호" maxlength="16">
                        </div>
                        <div class="formRow--input-wrapper js-inputWrapper pwd">
                            <input type="password" class="formRow--input js-input" id="signUpPwdChk" name="pwdChk" 
                                    placeholder="비밀번호 확인" maxlength="16">
                        </div>                        
                        <i class='far fa-eye-slash' id="showPwd"></i>
                    </div>
                    <div id="pwdMsg" class="msgBox"></div>
                </div>
            </div>
            <div class="btnArea">
                <button type="button" class="submitBtn" id="btn_submit_findPwdForm">비밀번호 재설정</button>
            </div>
        </form>
    </div>
</body>

</html>