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
	<script> <!-- 페이스북(FB) 아이디로 로그인-->
		// 1. 비동기화방식으로 SDK 불러오기
		(function(d, s, id){		
		   var js, fjs = d.getElementsByTagName(s)[0];
		   if (d.getElementById(id)) {return;}
		   js = d.createElement(s); js.id = id;
		   js.src = "https://connect.facebook.net/en_US/sdk.js";
		   fjs.parentNode.insertBefore(js, fjs);
		 }(document, 'script', 'facebook-jssdk'));
		
		// 2. SDK 로드 후 초기화(함수 실행)
		window.fbAsyncInit = function() {
		  FB.init({
		    appId      : '2281323032164175',
		    cookie     : true, 	
		    xfbml      : true,
		    version    : 'v6.0'
		  });
		};
		
	  	// 3. 페이스북 로그인
		fbLogin = function(){
			FB.login(function(res){
				console.log("login : ", res);
				
				// 4. 로그인(커넥션) 상태 확인
				if(res.status === 'connected'){
					
					// 5. 회원정보 호출 API
					FB.api('/me',{fields: 'email,name'} ,function(resp){
					    let email = resp.email;
					    let name = resp.name;
					   	
					   	$.ajax({
					   		url : "fbLoginAjax.me",
					   		type : "post",
					   		data : { email : email, name : name},
					   		success : function(value){
					   			console.log(value);
					   			if(value == 'facebook' || value == 'newMem'){
					   				location.href="home.do";
					   			}
					   			else if(value == 'naver'){
					   				alert("네이버 간편 가입 회원입니다. 네이버로 로그인하세요.");
					   			}
					   			else if(value =='kakao'){
					   				alert("카카오 간편 가입 회원입니다. 카카오로 로그인하세요.");
					   			}
					   			else{
					   				alert("용달이 회원입니다. 용달이로 로그인하세요.");
					   			}
					   		}, error : function(){
					       		var msg = "페이스북 간편 로그인 중 에러 발생!";
					       		location.href="error.ydl?msg="+msg;
					   		}
					   	})
					});
				}
			},{scope:'email'});
		};
	</script>	
	<!-- 카카오 아이디로 로그인 -->
	<script src="${contextPath}/resources/js/kakao.min.js"></script>
    <script>
        kakaoLogin = function(){
        	// 1. SDK 초기화
            Kakao.init('c2902431456434e92f377bfc927e6e09');
        	
        	// 2. 카카오 로그인
            Kakao.Auth.login({ 
                success: function() { 
                      // 3. 사용자 정보 추출 (사용자 API)
                      Kakao.API.request({ 
                    	    /* scope: 'email', */
                            url: '/v2/user/me', 
                            success: function(res) {                                   
                                  let email = res.kakao_account.email;
                                  let name = res.properties.nickname;
                                	  
                                  $.ajax({
      						   		url : "kakaoLogin.me",
      						   		type : "post",
      						   		data : { email : email, name : name},
      						   		success : function(value){
      						   			console.log(value);
      						   			if(value == 'kakao' || value == 'newMem'){
      						   				location.href="home.do";
      						   			}
      						   			else if(value == 'naver'){
      						   				alert("네이버 간편 가입 회원입니다. 네이버로 로그인하세요.");
      						   			}
      						   			else if(value =='facebook'){ 
      						   				alert("페이스북 간편 가입 회원입니다. 페이스북으로 로그인하세요.");
      						   			}
      						   			else{
      						   				alert("용달이 회원입니다. 용달이로 로그인하세요.");
      						   			}
      						   		}, error : function(){
      					        		var msg = "카카오 간편 로그인 중 에러 발생!";
      					        		location.href="error.ydl?msg="+msg;
      						   		}
      						   	})
                           }, 
                           fail: function(error) { 
                                 console.log(JSON.stringify(error)); 
                           } 
                       }); 
              }, 
              fail: function(err) { 
                    console.log(JSON.stringify(err)); 
              } 
            });
        }
    </script>
</head>

<body>
  <!-- 네이버 아이디로 로그인(네아로) -->
  <%
    String clientId = "CSQrLTztRmu9Z7lXy3kf";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8081/yongdali/naverLogin.me", "UTF-8");
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
        <div class="formRow">
            <div class="formRow--item">
                <!-- 이메일 -->
                <div class="emailWrap">
                    <div class="formRow--input-wrapper js-inputWrapper">
                        <input type="email" class="formRow--input js-input eng emailChk" name="mId" id="mId" placeholder="이메일"
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
        <div class="forgotSignIn">
            <a class="" href="findPwdView.me">비밀번호 재설정</a>
            <a class="" href="policyView.me">회원가입</a>
        </div>

        <div class="easyAccess">
            <h2 class="easyAccessTitle">간편 로그인</h2>
            <div class="easyAccessLogo">
                <img class="easyAccessBtn" src="${contextPath}/resources/images/login&signUp/facebookLogo.png" alt="페이스북" onclick="fbLogin();" id="test">
                <img class="easyAccessBtn" src="${contextPath}/resources/images/login&signUp/kakaoLogo.png" alt="카카오" onclick="kakaoLogin();">
                <img src="${contextPath}/resources/images/login&signUp/naverLogo.png" alt="네이버" onclick="window.open('<%=apiURL%>','NAVER','location = no, resizeable = no, width = 500, height = 500')">
            </div>
        </div>
    </div>
    <script>
    	/* $('#test').click(function(){
    		fbLogin();
    	}) */
    </script>
</body>
</html>