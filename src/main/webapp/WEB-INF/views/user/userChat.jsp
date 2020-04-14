<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- font 잘난체 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
	type="text/javascript"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="${contextPath}/resources/css/User_Chat.css">

</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="userInfo">
                <img src="${contextPath }/resources/images/ydl_logo/ydl_ic_gr(70X70).png" alt="">
                <div>
                    <h2>용달이</h2>
                    <h3>Live Chat</h3>
                </div>
            </div>
        </div>
    </nav>
    <div class="contentArea container-fluid">
        <div class="row">
            <div class="chat col-xs-12">
                <ul id="chat">
                    <li class="you">
                        <div class="entete">
                            <!-- <span class="status green"></span> -->
                            <h2>용달이</h2>
                            <h3>10:12AM, Today</h3>
                        </div>
                        <div class="message" id="youMsg">
                        </div>
                    </li>
                    <!-- <li class="me">
                        <div class="entete">
                            <h3>10:12AM, Today</h3>
                            <h2>유승제</h2>
                            <span class="status blue"></span>
                        </div>
                        <div class="message" id="meMsg">
                        </div>
                    </li> -->
                    <!-- <li class="you">
                        <div class="entete">
                            <span class="status green"></span>
                            <h2>용달이</h2>
                            <h3>10:12AM, Today</h3>
                        </div>
                        <div class="message">
                            자세한 내용은 '이용안내'를 참고 부탁드립니다.
                        </div>
                    </li>
                    <li class="me">
                        <div class="entete">
                            <h3>10:12AM, Today</h3>
                            <h2>유승제</h2>
                            <span class="status blue"></span>
                        </div>
                        <div class="message">
                            감사합니다.
                        </div>
                    </li>
                    <li class="you">
                        <div class="entete">
                            <span class="status green"></span>
                            <h2>용달이</h2>
                            <h3>10:12AM, Today</h3>
                        </div>
                        <div class="message">
                            즐거운 하루 되세염
                        </div>
                    </li>
                    <li class="me">
                        <div class="entete">
                            <h3>10:12AM, Today</h3>
                            <h2>유승제</h2>
                            <span class="status blue"></span>
                        </div>
                        <div class="message">
                            ㅂㅂ
                        </div>
                    </li> -->
                </ul>
            </div>
        </div>
    </div>
    <form action="">
        <div class="container">
            <div class="footer row">
                <div class="col-xs-10 col-lg-11">
                	<input type="text" id="sender" value="${sessionScope.loginUser.mName }" style="display: none;">
                    <textarea placeholder="궁금하신 점이 무엇인가요?" id="msgArea"></textarea>
                </div>
                <div class="col-xs-2 col-lg-1">
                    <button type="button" class="sendBtn" onclick="sendMessage();"><img src="${contextPath }/resources/images/chat/send.png"></button>
                	<button type="button" onclick="disconnect();">종료</button>
                </div>
            </div>
        </div>
    </form>
    <script>
    
    	$(function(){
    		openSocket();
    	});
    	var ws;
    	var meMsg = document.getElementById("meMsg");
    	var youMsg = document.getElementById("youMsg");
    	
    	function openSocket(){
			if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                
                return;
            }
			
			ws = new WebSocket("ws://192.168.110.45:8888/yongdali/kh.do");
	    	
    		ws.onopen = function(message){
	    		console.log("확인");
	    		youMsg.innerHTML += "용달이에 오신걸 환영합니다.";
	    	};
    	

    		
	    	
	    	ws.onmessage = function(event){
	    		var data = event.data;
	    		var sessionid = '${sessionScope.loginUser.mName}';
	    		var message = null;
	    		
	    		console.log(data);
	    		
	    		var strArray = data.split('|');
	    		
	    		for(var i = 0; i<strArray.length; i++){
	    			console.log('str['+i+']: ' + strArray[i]);
	    		}
	    		
	    		var currentuser_session = strArray[1];
	    		console.log('current session id : ' + currentuser_session);
	    		
	    		message = strArray[0];
	    		
	    		console.log("message1 : " + message);
	    		
	    		var today = new Date();
	    		
	    		var hours = today.getHours();
	    		var minutes = today.getMinutes();
	    		
	    		console.log(sessionid);
	    		console.log(currentuser_session);
	    		if(sessionid != currentuser_session){
	    			var printHTML = "<li class='you'>";
	    			printHTML += "<div class='entete'>";
	    			printHTML += "<h2>"+currentuser_session+"</h2>";
	    			printHTML += "<h3>"+hours+":"+minutes+"<h3>";
	    			printHTML += "<div class='message'id='youMsg'>"+message+"</div>";
	    			printHTML += "</div>";
	    			printHTML += "</li>";
	    			
	    			//$("#chat").append(printHTML);
	    		}else{
	    			var printHTML = "<li class='me'>";
	    			printHTML += "<div class='entete'>";
	    			printHTML += "<h3>"+hours+":"+minutes+"<h3>";
	    			printHTML += "<h2>"+currentuser_session+"</h2>";
	    			printHTML += "</div>";
	    			printHTML += "<div class='message' id='meMsg'>"+message+"</div>";
	    			printHTML += "</li>";
	    			
	    			//$("#chat").append(printHTML);
	    			
	    		} 
	    		
	    		
    			
    			writeResponse(printHTML);
	    		/* youMsg.innerHTML += message.data */
	    	};
	    	
	    	ws.onclose = function(message){
	    		youMsg.innerHTML += "용달이 채팅 종료";
	    	};
    	}
    	
    	
    	 function writeResponse(text){
    		$("#chat").append(text);
         }
    	
    	/* ws.onerror = function(message){
    		youMsg.innerHTML += "에러 발생";
    	}; */
    	
    	
    	
    	function sendMessage(){
    		/* var message = document.getElementById("msgArea");
    		
    		meMsg.innerHTML += message.value;
    		
    		ws.send(message.value);
    		
    		message.value = ""; */
    		var message = $("#msgArea").val()+"|"+$("#sender").val();
    		ws.send(message);
    		$("#msgArea").val("");

    	}
    	
    	function disconnect(){
            ws.close();
        }
    	
    	
    	
    </script>
</body>
</html>