<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>용달이 | 채팅</title>
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
                <img src="${contextPath }/resources/images/ydl_logo/ydl_ic_gr(70X70).png" alt="" id="logo" onclick="createRoom();">
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
                    
                </ul>
            </div>
        </div>
    </div>
    <form action="">
        <div class="container">
            <div class="footer row">
                <div class="col-xs-10 col-lg-11">
                	<input type="hidden" id="senderId" value="${sessionScope.loginUser.mId }" >
                	<input type="hidden" id="senderName" value="${sessionScope.loginUser.mName }" >
                	<input type="hidden" id="room" style="display:none;">
                	<input type="text" id="receiveId" style="display: none;">
                	<input type="hidden" id="roomNo" value="${sessionScope.nowRoom.roomNo }">
                	<input type="text" class="write-message" id="msgArea" placeholder="Type your message here"></input>
                </div>
                <div class="col-xs-2 col-lg-1">
                    <button type="button" class="sendBtn" onclick="sendMessage();"><img src="${contextPath }/resources/images/chat/send.png"></button>
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
		function MessageFlag(id, roomName, msg, flag, receiveId,roomNo){
			this.id=id;
			this.roomName=roomName;
			this.msg=msg;
			this.flag=flag;
			this.receiveId=receiveId;
			this.roomNo=roomNo;
		}
    	
    	function connectionSocket(){
    		connect = true;
    		socket = new WebSocket('ws://192.168.20.3:8081/yongdali/chatting');
    		/* 페이지 접속한 session id */
    		var sessionid = $("#senderId").val();
    		var sessionName = $("#senderName").val();
    		
    		socket.onopen = function(e){    			
    			var flag = "createroom";
    			var roomNo = $("#roomNo");
    			
    			// 기존에 나눴던 대화 목록 가져오기 ajax
    			$.ajax({
    			url:"chkPreMessage.ch",
    			dataType:"json",
    			data:{id:sessionid},
    			success:function(data){
    				
						console.log(data);
						roomNo.val(data["roomNo"]);
	    				// 접속한아이디
	    		   		 var senderId = $("#senderId").val();
	    	    		// 방이름(접속한사람이름)
	    		   		 var roomName = $("#senderName").val();
	    	    		// 받는 사람 아이디(고정)
	    		   		 var receiveId = "admin@naver.com";
	    	    		// 메시지
	    		   		 var msg = senderId + "님이 재접속하셨습니다.";
	    	    		// 구분
	    		   		 var flag = "msg";

						 var nullRoom = data["nullRoom"];
						
						if(data["msg"]){
		    				$('#logo').attr('onclick', '');//createRoom() 비활성화
							var message = data["msg"];
							for(var i in message){
								var $sessionid = message[i].id;
								
								if($sessionid == sessionid){
				    				var printHTML = "<li class='me'>";
				        			printHTML += "<div class='entete'>";
				        			printHTML += "<h3>"+hours+":"+minutes+"<h3>";
				        			printHTML += "<h2>"+sessionName+"</h2>";
				        			printHTML += "</div>";
				        			printHTML += "<div class='message' id='meMsg'>"+ message[i].msg+"</div>";
				        			printHTML += "</li>";
				    			}else{    
				        			var printHTML = "<li class='you'>";
					    			printHTML += "<div class='entete'>";
					    			printHTML += "<h2>관리자</h2>";
					    			printHTML += "<h3>"+hours+":"+minutes+"<h3>";
					    			printHTML += "</div>";
					    			printHTML += "<div class='message'id='youMsg'>"+ message[i].msg+"</div>";	    			
					    			printHTML += "</li>";	
				    			}
								writeResponse(printHTML);
							}
							socket.send(JSON.stringify(new MessageFlag(senderId,roomName,msg,flag,receiveId,roomNo.val())));
						}else if(data["nullRoom"]){
							alert("용달이 트럭을 클릭해주세요!");
						}
    					//roomNo.val(data);
    			},error:function(){
    				console.log("전송실패");
    			}
    		})
    		}
    		socket.onmessage = function(e){
    			console.log(e.data);
    			var data=JSON.parse(e.data);
    			
    			console.log("세션아이디:"+sessionid);
    			console.log("세션이름:"+sessionName);
    			console.log("받는아이디:"+data["receiveId"]);
    			console.log($("#roomNo").val());

    			if(data["flag"]!="room" && data["flag"]!="user"){
    				if(sessionid == data["id"]){
	    				var printHTML = "<li class='me'>";
	        			printHTML += "<div class='entete'>";
	        			printHTML += "<h3>"+hours+":"+minutes+"<h3>";
	        			printHTML += "<h2>"+sessionName+"</h2>";
	        			printHTML += "</div>";
	        			printHTML += "<div class='message' id='meMsg'>"+data["msg"]+"</div>";
	        			printHTML += "</li>";
	    			}else{    
	    				if(data["id"]=="admin@naver.com" && data["receiveId"]==sessionName){
		        			var printHTML = "<li class='you'>";
			    			printHTML += "<div class='entete'>";
			    			printHTML += "<h2>관리자</h2>";
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
     		$(".contentArea").scrollTop($(".contentArea")[0].scrollHeight);
     	
          }
    	
    	 // 메시지 보내기 클릭
    	function sendMessage(){
    		// 접속한아이디
	   		 var senderId = $("#senderId").val();
    		// 방이름(접속한사람이름)
	   		 var roomName = $("#senderName").val();
    		// 받는 사람 아이디(고정)
	   		 var receiveId = "admin@naver.com";
    		// 메시지
	   		 var msg = $("#msgArea").val();
    		// 구분
	   		 var flag = "msg";
    		// 방번호
	   		 var roomNo = $("#roomNo").val();
    		console.log("roomNo :" +roomNo);
    		//socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#senderName").val(),$("#msgArea").val(),"msg",$("#receiveId").val())));
    		//											          아이디				     방이름(닉네임)              msg          flag		   메시지 받는 사람
    		//socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#room").val(),$("#msgArea").val(),"msg","admin@naver.com")));

    		socket.send(JSON.stringify(new MessageFlag(senderId,roomName,msg,flag,receiveId,roomNo)));
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
			$("#room").val($("#senderName").val());
			
			// 접속한아이디
			var senderId = $("#senderId").val();
			// 접속한사람이름(방이름으로)
			var roomName = $("#room").val();
			// 받는사람아이디(고정)
			var receiveId = "admin@naver.com";
			// 구분
			var flag = "createroom";
			// 방번호
			var roomNo = $("#roomNo");
			console.dir("test : " + roomNo);
			
			
			// 서블릿 > 
			$.ajax({
    			url:"userCreateChat.ch",
    			data:{id:senderId, roomName:roomName, receiveId:receiveId, flag:flag},
    			success:function(data){
    				 roomNo.val(data);
    				 console.log("처음roomNo뭐야!!!"+roomNo.val());
												//	          아이디				     방이름(닉네임)       msg     flag		   메시지 받는 사람
			    	socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#senderName").val(),"","createroom","admin@naver.com",roomNo.val())));
    			},error:function(){
    				console.log("전송실패");
    			}
    		})
    		
    		$('#logo').attr('onclick', '');//createRoom() 비활성화
			
    	}

    	
    	
    </script>
</body>
</html>