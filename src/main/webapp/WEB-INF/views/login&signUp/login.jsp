<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 네이버 아이디로 로그인(네아로) -->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>용달이 | 로그인</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!-- warning icon -->
    <link rel="stylesheet" href="${contextPath}/resources/css/login&signUp.css">   
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/js/login&signUp.js"></script>
</head>

<body>
	  <!-- 네이버 아이디로 로그인(네아로) -->
	  <%
	    String clientId = "CSQrLTztRmu9Z7lXy3kf";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:8081/yongdali/home.do", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	 %>

	<!-- interceptor용 (메인페이지 예약하러가기 클릭 시) -->
	<script>
		$(function(){
			var msg = "<%= request.getAttribute("msg")%>";
			if(msg != "null"){
				alert(msg)
			}
		})
	</script>	

    <!-- logo header -->
    <div class="header">
        <a href="home.do">
            <img src="${contextPath}/resources/images/ydl_logo/ydl_lg_gr(150x50).png" alt="로고">
        </a>
    </div>

    <!-- content -->
    <div class="content loginContent">
        <!-- <form action="login.do" method="post" id="loginForm" novalidate> -->
            <div class="formRow">
                <div class="formRow--item">
                    <!-- 이메일 -->
                    <div class="emailWrap">
                        <div class="formRow--input-wrapper js-inputWrapper">
                            <input type="email" class="formRow--input js-input eng" name="mId" id="mId" placeholder="이메일"
                                maxlength="50">
                        </div>
                    </div>
                    <div id="emailMsg" class="msgBox"></div>
                    <div class="pwdWrap">
                        <div class="formRow--input-wrapper js-inputWrapper">
                            <input type="password" class="formRow--input js-input" name="pwd" id="pwd" placeholder="비밀번호"
                                maxlength="16" >
                        </div>
                    </div>
                    <div id="pwdMsg" class="msgBox"></div>
                </div>
            </div>
            <div class="btnArea">
                <button type="button" class="submitBtn" id="loginBtn">로그인</button>
            </div>
        <!-- </form> -->
        <div class="forgotSignIn">
            <a class="" href="#">비밀번호 재설정</a>
            <a class="" href="policyView.me">회원가입</a>
        </div>

        <div class="easyEccess">
            <h2 class="easyEccessTitle">간편 로그인</h2>
            <div class="easyEccessLogo">
                <a href="#"><img src="${contextPath}/resources/images/login&signUp/facebookLogo.png" alt="페이스북"></a>
                <a href="#"><img src="${contextPath}/resources/images/login&signUp/kakaoLogo.png" alt="카카오"></a>
                <a href="<%=apiURL%>"><img src="${contextPath}/resources/images/login&signUp/naverLogo.png" alt="네이버"></a>
            </div>
        </div>
    </div>
</body>

</html>