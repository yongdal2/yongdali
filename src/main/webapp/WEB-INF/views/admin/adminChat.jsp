<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	type="text/javascript"></script>
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="${contextPath }/resources/css/admin/Admin_Chat.css">
</head>
<body>
    <div class="container">
      <div class="row">
        <nav class="menu">
          <ul class="items">
            <li class="item">
              <img src="${contextPath}/resources/images/ydl_logo/ydl_ic_gr(70X70).png" style="width:50px; height:50px;">
            </li>
            <li class="item">
                <svg class="bi bi-chat-dots" width="44px" height="44px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color:rgb(87, 187, 138)">
                    <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 01.287.801 10.97 10.97 0 01-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 01.71-.074A8.06 8.06 0 008 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 01-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 00.244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 01-2.347-.306c-.52.263-1.639.742-3.468 1.105z" clip-rule="evenodd"/>
                    <path d="M5 8a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0z"/>
                  </svg>
            </li>

          </ul>
        </nav>
  
        <section class="discussions" id="chatList">
          <div class="discussion search">
            <div class="searchbar">
              <svg class="bi bi-search" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 011.415 0l3.85 3.85a1 1 0 01-1.414 1.415l-3.85-3.85a1 1 0 010-1.415z" clip-rule="evenodd"/>
                <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 100-11 5.5 5.5 0 000 11zM13 6.5a6.5 6.5 0 11-13 0 6.5 6.5 0 0113 0z" clip-rule="evenodd"/>
              </svg>
              <input type="text" placeholder="Search..."></input>
            </div>
          </div>
          <!-- <div class="discussion message-active" id="">
            <div class="photo">
              <div class="online"></div>
            </div>
            <div class="desc-contact">
              <p class="name">유승제</p>
              마지막 메시지
              <p class="message">마지막 메시지</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo">
              <div class="online"></div>
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo">
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo">
              <div class="online"></div>
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo">
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo">
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo">
              <div class="online"></div>
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div> -->
        </section>

        <section class="chat">
          <div class="header-chat">
            <img src="${contextPath }/resources/images/ydl_logo/ydl_ic_gr(70X70).png" style="width:50px; height:50px;">
            <p class="name">유승제</p>
            <button class="closeBtn" onclick="disconnect();">대화종료</button>
          </div>
          <div class="messages-chat">            
            <!-- <div class="message text-only">
              <div class="response" id="meMsg">
                <p class="text"></p>
              </div>
            </div>
            <p class="response-time time"></p> -->
            
            <!-- <div class="message" id="youMsg">
              <p class="text"> 마지막 메시지</p>
            </div>
            <p class="time"> 15:09PM Today</p> -->
          </div>
          <div class="footer-chat">
          	<input type="text" id="senderId" value="${sessionScope.loginUser.mId }" style="display: none;">
            <input type="text" id="senderName" value="${sessionScope.loginUser.mName }" style="display: none;">
            <input type="hidden" id="room"/>
    		<input type="hidden" id="receiveId"/>
            <input type="text" class="write-message" id="msgArea" placeholder="Type your message here"></input>
            <button class="sendBtn" onclick="sendMessage();">
              <svg class="bi bi-cursor" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M14.082 2.182a.5.5 0 01.103.557L8.528 15.467a.5.5 0 01-.917-.007L5.57 10.694.803 8.652a.5.5 0 01-.006-.916l12.728-5.657a.5.5 0 01.556.103zM2.25 8.184l3.897 1.67a.5.5 0 01.262.263l1.67 3.897L12.743 3.52 2.25 8.184z" clip-rule="evenodd"/>
              </svg>
            </button>
            
          </div>
        </section>
      </div>
    </div>
    
    <script>
	    var socket;//socket객체 보관용
		var connect=false;//연결이 되었는지
		var today = new Date();
		var hours = today.getHours();
		var minutes = today.getMinutes();
	
		$(function(){
			connectionSocket();
		})
		
		//message token구성
		function MessageFlag(id, room, msg, flag, receiveId){
			this.id=id;
			this.room=room;
			this.msg=msg;
			this.flag=flag;
			this.receiveId=receiveId;
		}
		
		function connectionSocket(){
			connect = true;
			socket = new WebSocket('ws://192.168.110.45:8888/yongdali/chatting');
			/* 페이지 접속한 session id */
			var sessionid = $("#senderId").val();
			
			socket.onopen = function(e){
//				socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#senderName").val(),"","createroom","")));

			}
			socket.onmessage = function(e){
				console.log(e.data);
				var data=JSON.parse(e.data);
				
				console.log("세션아이디:"+sessionid);
				console.log("받는아이디:"+data["receiveId"]);
				
				
				if(data["flag"]=="room"){
					var rooms = data['msg'].split(",");
					console.log(rooms);
					var printHTML = "<div class='discussion'>";
					printHTML += "<div class='photo'></div>";
					printHTML += "<div class='desc-contact'>";
					/* printHTML += "<p class='name' id='listName'></p>"; */
					printHTML += "</div>";
					printHTML += "</div>";
					
					$("#chatList").append(printHTML);
					 for(var i=0; i<rooms.length; i++){
						 $(".desc-contact").append($("<p class='name' id='listName'>").html(rooms[i]).click(function(){
							 $("#room").val($(this).html());
					 		 checkCurrentRoom(this);
						 }));
						/* $('#listName').html(rooms[i]); */
					}
				}
				
				if(data["flag"]!="room" && data["flag"]!="user"){
					if(sessionid == data["id"]){
						var printHTML = "<div class='message text-only'>";
		    			printHTML += "<div class='response' id='meMsg'>";
		    			printHTML += "<p class='text'>"+data["msg"]+"</p>";
		    			printHTML += "</div>";
		    			printHTML += "<p class='response-time time'>"+hours+":"+minutes+"</p>";
		    			printHTML += "</div>";
	    			}else{    			
	    				var printHTML = "<div class='message' id='youMsg'>";
		              	printHTML += "<div class='name'>";
		              	printHTML += "<h2>"+data["room"]+"</h2>";
		              	printHTML += "</div>";
		              	printHTML += "<div class='messageArea'>";
		    			printHTML += "<p class='text'>"+data["msg"]+"</p>";
		    			printHTML += "<p class='time'>"+hours+":"+minutes+"</p>";
		    			printHTML += "</div>";
		    			printHTML += "</div>";
	    			}
					writeResponse(printHTML);
				}
			
			}
		}
		function checkCurrentRoom(e){
			$(e).parent().find("p").css({background:"white"});
        	$(e).css({background:"lightgray"});
		}
		
		 function writeResponse(text){
			 $('.messages-chat').append(text);
	 		$(".messages-chat").scrollTop($(".messages-chat")[0].scrollHeight);
	    }
		
		function sendMessage(){
			socket.send(JSON.stringify(new MessageFlag($("#senderId").val(),$("#senderName").val(),$("#msgArea").val(),"msg",$("#room").val())));
			$("#msgArea").val("");
	
		}
		
		function disconnect(){
			socket.close();
	    }
    
    </script>
  </body>
</html>