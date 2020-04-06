<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>용달이 | 로그인</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!-- warning icon -->
    <link rel="stylesheet" href="${contextPath}/resources/css/login&signUp.css">   
    <script src="//code.jquery.com/jquery-3.1.1.slim.min.js"></script>
    <script src="${contextPath}/resources/js/login&signUp.js"></script>

</head>

<body>
    <!-- logo header -->
    <div class="header">
        <a href="home.do">
            <img src="${contextPath}/resources/images/ydl_logo/ydl_lg_gr(150x50).png" alt="로고">
        </a>
    </div>

    <!-- content -->
    <div class="content loginContent">
        <form action="#" method="post" id="loginForm" novalidate>
            <div class="formRow">
                <div class="formRow--item">
                    <!-- 이메일 -->
                    <div class="emailWrap">
                        <div class="formRow--input-wrapper js-inputWrapper">
                            <input type="email" class="formRow--input js-input eng" name="loginEmail" placeholder="이메일"
                                maxlength="50">
                        </div>
                    </div>
                    <div id="emailMsg" class="msgBox"></div>
                    <div class="pwdWrap">
                        <div class="formRow--input-wrapper js-inputWrapper">
                            <input type="password" class="formRow--input js-input" name="loginPwd" placeholder="비밀번호"
                                maxlength="16" >
                        </div>
                    </div>
                    <div id="loginPwdMsg" class="msgBox"></div>
                </div>
            </div>
            <div class="btnArea">
                <button type="submit" class="submitBtn">로그인</button>
            </div>
        </form>
        <div class="forgotSignIn">
            <a class="" href="#">비밀번호 재설정</a>
            <a class="" href="policyChk.me">회원가입</a>
        </div>

        <div class="easyEccess">
            <h2 class="easyEccessTitle">간편 로그인</h2>
            <div class="easyEccessLogo">
                <a href="#"><img src="${contextPath}/resources/images/login&signUp/facebookLogo.png" alt="페이스북"></a>
                <a href="#"><img src="${contextPath}/resources/images/login&signUp/kakaoLogo.png" alt="카카오"></a>
                <a href="#"><img src="${contextPath}/resources/images/login&signUp/naverLogo.png" alt="네이버"></a>
            </div>
        </div>
    </div>
</body>

</html>