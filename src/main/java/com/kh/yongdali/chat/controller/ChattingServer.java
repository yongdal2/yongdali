package com.kh.yongdali.chat.controller;

import java.util.HashSet;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.chat.msg.Message;
import com.kh.yongdali.chat.msg.MessageDecoder;
import com.kh.yongdali.chat.msg.MessageEncoder;
@ServerEndpoint(
		value="/chatting",
		encoders = {MessageEncoder.class},
		decoders = {MessageDecoder.class}
		)

@Controller
public class ChattingServer {
	
	
	@RequestMapping(value="chat.ch")
	 public ModelAndView getChatViewPage(ModelAndView mav) {
	    mav.setViewName("user/userChat");
	    return mav;
	 }
	 
	 @RequestMapping(value="adminChat.ch")
	 public ModelAndView getAdminChatViewPage(ModelAndView mav) {
		 mav.setViewName("admin/adminChat");
		 return mav;
	 }
	
	@OnOpen
	public void open(Session session, EndpointConfig conf) {
		session.getMaxBinaryMessageBufferSize();
		//session에 사용자 정보에 대한 내용을 넣을수 있는 userProperties가 있는데
		//session은 브라우저를 새로고침할때마다 생성되기 때문에 잘 세션값을 고정으로 가지지 않음
		//session은 접속자를 의미하고 접속자를 관리하기 위해서는 session 관리가 중요함.
		//세션을 관리하는 방법에는 두가지가 있음 
		//첫번째는 별도의 session을 관리할 수 있는 객체(Map, List)등을 활용하는것이고
		//두번째는 session.getOpenSessions()함수를 이용하여 처리하는 방법이 있음
		//두번째는 별도의 객체를 통해 관리할 필요가 없어 편리하므로 그걸 이용해서 구현하겠음.
		
		
		//생성된 채팅방 가져오기
		String rooms=checkRooms(session);
		//사용자 가져오기
		String users=checkUser(session);
		
		try {
			//session.getBasicRemote().sendObject(new Message("admin","",rooms, "room"));//방현황 전송
			//session.getBasicRemote().sendObject(new Message("admin","",users, "user"));//userg현황전송

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	@OnMessage
	public void messageObj(Session session, Message msg) {
		System.out.println("session : " + session);
		//session으로 socket session관리하기
		session.getUserProperties().put("msg",msg);

		//생성된 채팅방 가져오기 
		String rooms=checkRooms(session);
		//사용자 가져오기
		String users=checkUser(session);
		//*메세지를 문자로 전송하기 때문에 문자자료형을 사용함
		
		//message를 하는 기준값 현재는 room, user, msg, file로 구분되어있음.
		String flag=msg.getFlag();
		try {
			if(flag.equals("msg")) {
				for(Session s : session.getOpenSessions()) {
					Message m=(Message)(s.getUserProperties().get("msg"));
					//s.getBasicRemote().sendObject(new Message("admin","",rooms, "room"));//방현황 전송
					//s.getBasicRemote().sendObject(new Message("admin","",users, "user"));//userg현황전송
					if(m!=null) {
						System.out.println("세션접속 ID : "+m.getId());
						System.out.println("받는사람 : "+m.getReceiveId());
						System.out.println("m : " + m);
						
						System.out.println("msg세션접속id : " + msg.getId());
						System.out.println("msg받는사람 : " + msg.getReceiveId());
						System.out.println("msg : " + msg);
//						System.out.println(m);
						// 세션 접속 아이디 = 메시지를 받는 사람
//						if(m.getId().equals(msg.getReceiveId())){
//							s.getBasicRemote().sendObject(msg);
//						}
//						// 메시지를 받는 사람=admin@naver.com && 세션 접속한 방 = 메시지 준 방
//						else if(msg.getReceiveId().equals("admin@naver.com")&&m.getRoom().equals(msg.getRoom())){
//							s.getBasicRemote().sendObject(msg);
//						}
//						// 메시지를 보낸 아이디 != 메시지를 받는 사람
//						else if(!msg.getId().equals(msg.getReceiveId())){
//							s.getBasicRemote().sendObject(new Message("admin","",rooms, "room"));//방현황 전송
//							s.getBasicRemote().sendObject(new Message("admin","",users, "user"));//userg현황전송
//							s.getBasicRemote().sendObject(msg);
//						}
						if(msg.getReceiveId().equals("admin@naver.com")) {
							s.getBasicRemote().sendObject(msg);
						}else if(!msg.getId().equals(msg.getReceiveId())) {
							s.getBasicRemote().sendObject(msg);
						}
						else if(m.getRoomName().equals(msg.getReceiveId())) {
							//s.getBasicRemote().sendObject(new Message("admin","",rooms, "room"));//방현황 전송
							s.getBasicRemote().sendObject(new Message("admin","",users, "user"));//userg현황전송
							s.getBasicRemote().sendObject(msg);
						}
						
						
					}
				}
			}
			else if(flag.equals("createroom")) {//채팅만들고 현황전송하기.!
				for(Session s : session.getOpenSessions()) {
					s.getBasicRemote().sendObject(new Message("admin","",rooms, "room"));//방현황 전송
					s.getBasicRemote().sendObject(new Message("admin","",users, "user"));//userg현황전송
				}
			}
		}catch (Exception e) {
			e.printStackTrace();	
		}
	}
	
	@OnClose
	public void close(Session session, CloseReason reason) {
		
	}
	private String checkRooms(Session session) {
		//채팅방 확인하기
		Set<String> rooms=new HashSet<String>();
		for(Session s : session.getOpenSessions()) {
			Message m=(Message)(s.getUserProperties().get("msg"));
			if(m!=null) {
				rooms.add(m.getRoomName());
			}
		}
		String[] roomStr=new String[rooms.size()];
		rooms.toArray(roomStr);
		return String.join(",", rooms);
	}
	
	private String checkUser(Session session) {
		//채팅방 확인하기
		Set<String> users=new HashSet<String>();
		for(Session s : session.getOpenSessions()) {
			Message m=(Message)(s.getUserProperties().get("msg"));
			if(m!=null) {
				users.add(m.getId());
			}
		}
		String[] usersStr=new String[users.size()];
		users.toArray(usersStr);
		return String.join(",", users);
	}
	
	

}
