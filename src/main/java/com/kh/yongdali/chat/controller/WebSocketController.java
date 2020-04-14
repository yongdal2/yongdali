/*package com.kh.yongdali.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ServerEndpoint(value="/kh.do")
public class WebSocketController{
	private static final List<Session> sessionList=new ArrayList<Session>();
//	private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);

	 public WebSocketController() {
	        System.out.println("웹소켓(서버) 객체생성");
	 }
	 
	 @RequestMapping(value="chat.ch")
	 public ModelAndView getChatViewPage(ModelAndView mav) {
	    mav.setViewName("user/userChat");
	    return mav;
	 }
	 
//	// 메시지에서 유저 명을 취득하기 위한 정규식 표현
//	 private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");
//	 // WebSocket으로 브라우저가 접속하면 요청되는 함수
//	 
//	 @OnOpen
//	 public void handleOpen(Session userSession) {
//	 // 클라이언트가 접속하면 WebSocket세션을 리스트에 저장한다.
//		 sessionList.add(userSession);
//	 // 콘솔에 접속 로그를 출력한다.
//		 System.out.println("client is now connected...");
//		 
//	 }
//	 
//	 // WebSocket으로 메시지가 오면 요청되는 함수
//	 @OnMessage
//	 public void handleMessage(String message, Session userSession) throws IOException {
//		// 메시지 내용을 콘솔에 출력한다.
//		 System.out.println(message);
//		 
//		//　초기 유저 명
//		 String name = "anonymous";
//		 // 메시지로 유저 명을 추출한다.
//		 Matcher matcher = pattern.matcher(message);
//		 // 메시지 예: {{유저명}}메시지
//		 if (matcher.find()) {
//			 name = matcher.group();
//			 System.out.println(name);
//		 }
//		 
//		// 클로져를 위해 변수의 상수화
//		 final String msg = message.replaceAll(pattern.pattern(), "");
//		 final String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
//		 // session관리 리스트에서 Session을 취득한다.
//		 sessionList.forEach(session -> {
//			 // 리스트에 있는 세션과 메시지를 보낸 세션이 같으면 메시지 송신할 필요없다.
//			 if (session == userSession) {
//				 return;
//			 }
//			 
//			 try {
//				 // 리스트에 있는 모든 세션(메시지 보낸 유저 제외)에 메시지를 보낸다. (형식: 유저명 => 메시지)
//				 session.getBasicRemote().sendText(username + " => " + msg);
//			 } catch (IOException e) {
//				 // 에러가 발생하면 콘솔에 표시한다.
//				 e.printStackTrace();
//			 }
//		 });
//
//
//	 }
//	 // WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
//	 @OnClose
//	 public void handleClose(Session userSession) {
//	 // session 리스트로 접속 끊은 세션을 제거한다.
//		 sessionList.remove(userSession);
//	 // 콘솔에 접속 끊김 로그를 출력한다.
//		 System.out.println("client is now disconnected...");
//	 }

	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 @OnOpen // 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제없이 들어왔을 떄 실행하는 메소드
	    public void onOpen(Session session) {
	        //logger.info("Open session id:"+session.getId());
	        try {
	            final Basic basic=session.getBasicRemote();
//	            basic.sendText("Connection Established");
	            System.out.println("잘 들어옴");
	        }catch (Exception e) {
	            // TODO: handle exception
	            System.out.println(e.getMessage());
	        }
	        sessionList.add(session);
	    }
	    /*
	     * 모든 사용자에게 메시지를 전달한다.
	     * @param self
	     * @param message
	     */
	    private void sendAllSessionToMessage(Session self,String message) {
	    	System.out.println(message);
	        try {
	            for(Session session : WebSocketController.sessionList) {
	                if(!self.getId().equals(session.getId())) {
	                    session.getBasicRemote().sendText(message.split(",")[1]+" : "+message);
	                }
	            }
	        }catch (Exception e) {
	            // TODO: handle exception
	            System.out.println(e.getMessage());
	        }
	    }
	    @OnMessage // 클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드
	    public void onMessage(String message,Session session) {
	        //logger.info("Message From "+message.split(",")[1] + ": "+message.split(",")[0]);
	        try {
	            final Basic basic=session.getBasicRemote();
	            basic.sendText(message);
	        }catch (Exception e) {
	            // TODO: handle exception
	            System.out.println(e.getMessage());
	        }
	        sendAllSessionToMessage(session, message);
	    }
	    @OnError // 에러
	    public void onError(Throwable e,Session session) {
	        
	    }
	    @OnClose // 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드
	    public void onClose(Session session) {
	        //logger.info("Session "+session.getId()+" has ended");
	        sessionList.remove(session);
	    }
	 
	 
	 
}
*/