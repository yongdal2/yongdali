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
                <img src="${contextPath }/resources/images/ydl_logo/ydl_ic_gr(70X70).png" alt="" onclick="createRoom();">
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
                    <!-- <li class="you">
                        <div class="entete">
                            <span class="status green"></span>
                            <h2>용달이</h2>
                            <h3>10:12AM, Today</h3>
                        </div>
                        <div class="message" id="youMsg">
                        </div>
                    </li> -->
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
                	<input type="hidden" id="senderId" value="${sessionScope.loginUser.mId }" style="display: none;">
                	<input type="hidden" id="senderName" value="${sessionScope.loginUser.mName }" style="display: none;">
                	<input type="hidden" id="room" style="display:none;">
                	<input type="text" id="receiveId" style="display: none;">
                	<input type="hidden" id="roomNo" value="${sessionScope.nowRoom.roomNo }" style="display: none;">
                	<input type="text" class="write-message" id="msgArea" placeholder="Type your message here"></input>
                    <!-- <textarea placeholder="궁금하신 점이 무엇인가요?" id="msgArea"></textarea> -->
                </div>
                <div class="col-xs-2 col-lg-1">
                    <button type="button" class="sendBtn" onclick="sendMessage();"><img src="${contextPath }/resources/images/chat/send.png"></button>
                	<button type="button" onclick="disconnect();">종료</button>
                </div>
            </div>
        </div>
    </form>
    <script>
	    var socket;//socket객체 보관용
		var connect=false;//연결이 되었는지
		var today = new Date();
    	var hours = today.getHours();
		var minutes = today.getMinutes();
    
    	$(function(){
    		connectionSocket();
    		
    		$('#msgArea').keypress(function(event){
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if(keycode == '13'){
                	$('.sendBtn').trigger("click");
                }
            }); 

    	})
		
    	//message token구성
		function MessageFlag(id, roomName, msg, flag, receiveId){
			this.id=id;
			this.roomName=roomName;
			this.msg=msg;
			this.flag=flag;
			this.receiveId=receiveId;
		}
    	
    	function connectionSocket(){
    		connect = true;
    		socket = new WebSocket('ws://192.168.25.20:8888/yongdali/chatting');
    		/* 페이지 접속한 session id */
    		var sessionid = $("#senderId").val();
    		var sessionName = $("#senderName").val();
    		
    		socket.onopen = function(e){
    			//socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#senderName").val(),"","createroom",$("#receiveId").val())));
    			//											          아이디				     방이름(닉네임)       msg     flag		   메시지 받는 사람
    			//socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#senderName").val(),"","createroom","admin@naver.com")));
    		}
    		socket.onmessage = function(e){
    			console.log(e.data);
    			var data=JSON.parse(e.data);
    			
    			console.log("세션아이디:"+sessionid);
    			console.log("받는아이디:"+data["receiveId"]);

    			if(data["flag"]!="room" && data["flag"]!="user"){
    				if(sessionid == data["id"]){
	    				var printHTML = "<li class='me'>";
	        			printHTML += "<div class='entete'>";
	        			printHTML += "<h3>"+hours+":"+minutes+"<h3>";
	        			printHTML += "<h2>"+data["roomName"]+"</h2>";
	        			printHTML += "</div>";
	        			printHTML += "<div class='message' id='meMsg'>"+data["msg"]+"</div>";
	        			printHTML += "</li>";
	    			}else{    
	    				if(data["id"]=="admin@naver.com" && data["receiveId"]==sessionName){
		        			var printHTML = "<li class='you'>";
			    			printHTML += "<div class='entete'>";
			    			printHTML += "<h2>"+data["roomName"]+"</h2>";
			    			printHTML += "<h3>"+hours+":"+minutes+"<h3>";
			    			printHTML += "</div>";
			    			printHTML += "<div class='message'id='youMsg'>"+data["msg"]+"</div>";	    			
			    			printHTML += "</li>";	
	    					
	    				}
	    			}
    				
    			}
    			writeResponse(printHTML);
    			
    		}
    		
    	}
    	
    	 function writeResponse(text){
     		$("#chat").append(text);
     		$("#chat").scrollTop($("#chat")[0].scrollHeight);
          }
    	
    	 // 메시지 보내기 클릭
    	function sendMessage(){
	   		 var senderId = $("#senderId").val();
	   		 var roomName = $("#room").val();
	   		 var receiveId = "admin@naver.com";
	   		 var msg = $("#msgArea").val();
	   		 var flag = "msg";
	   		 var roomNo = $("#roomNo").val();
    		//socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#senderName").val(),$("#msgArea").val(),"msg",$("#receiveId").val())));
    		//											          아이디				     방이름(닉네임)              msg          flag		   메시지 받는 사람
    		//socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#room").val(),$("#msgArea").val(),"msg","admin@naver.com")));
    		socket.send(JSON.stringify(new MessageFlag(senderId,roomName,msg,flag,receiveId)));
    		$("#msgArea").val("");
    		    		
	   		 
    		 $.ajax({
    			url:"userSendMessage.ch",
    			data:{id:senderId, roomName:roomName, msg:msg, flag:flag, roomNo:roomNo},
    			success:function(data){
    				if(data=="success"){
    					console.log(data);
    				}
    			},error:function(){
    				console.log("전송실패");
    			}
    		})
    	}
    	
    	// 방생성 클릭
    	function createRoom(){
												//	          아이디				     방이름(닉네임)       msg     flag		   메시지 받는 사람
    		socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#senderName").val(),"","createroom","admin@naver.com")));
			$("#room").val($("#senderName").val());
			
			var senderId = $("#senderId").val();
			var roomName = $("#room").val();
			var receiveId = "admin@naver.com";
			var flag = "createroom";
			var roomNo = $("#roomNo");
			// 서블릿 > 
			$.ajax({
    			url:"userCreateChat.ch",
    			data:{id:senderId, roomName:roomName, receiveId:receiveId, flag:flag},
    			success:function(data){
    				roomNo.val("${sessionScope.nowRoom.roomNo}");
    				if(data=="success"){
    					console.log(data);
    				}
    			},error:function(){
    				console.log("전송실패");
    			}
    		})
			
    	}
    	
    	function disconnect(){
    		socket.close();
        }
    	
    	
    </script>
</body>
</html>