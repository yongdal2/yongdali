//package com.kh.yongdali.chat.controller;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.websocket.OnClose;
//import javax.websocket.OnError;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.RemoteEndpoint.Basic;
//import javax.websocket.Session;
//import javax.websocket.server.ServerEndpoint;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//@ServerEndpoint(value="/kh.do")
//public class WebSocketController{
//	private static final List<Session> sessionList=new ArrayList<Session>();
////	private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
//
//	 public WebSocketController() {
//	        System.out.println("웹소켓(서버) 객체생성");
//	 }
//	 
//	 @RequestMapping(value="chat.ch")
//	 public ModelAndView getChatViewPage(ModelAndView mav) {
//	    mav.setViewName("user/userChat");
//	    return mav;
//	 }
//	 
//	 @RequestMapping(value="adminChat.ch")
//	 public ModelAndView getAdminChatViewPage(ModelAndView mav) {
//		 mav.setViewName("admin/adminChat");
//		 return mav;
//	 }
//
//
//	 @OnOpen // 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제없이 들어왔을 떄 실행하는 메소드
//	    public void onOpen(Session session) {
//	        //logger.info("Open session id:"+session.getId());
//	        try {
//	            final Basic basic=session.getBasicRemote();
////	            basic.sendText("Connection Established");
//	            System.out.println("잘 들어옴");
//	        }catch (Exception e) {
//	            // TODO: handle exception
//	            System.out.println(e.getMessage());
//	        }
//	        sessionList.add(session);
//	    }
//	    /*
//	     * 모든 사용자에게 메시지를 전달한다.
//	     * @param self
//	     * @param message
//	     */
//	    private void sendAllSessionToMessage(Session self,String message) {
//	    	System.out.println("message : " + message);
//	        try {
//	            for(Session session : WebSocketController.sessionList) {
//	            	System.out.println("getId : " + session.getId());
//	            	System.out.println("selfid : " + self.getId());
//	                if(!self.getId().equals(session.getId())) {
//	                   // session.getBasicRemote().sendText(message.split("|")[1]+" : "+message);
//	                    session.getBasicRemote().sendText(message.split("|")[1]+message);
//	                	
//	                }
//	            }
//	        }catch (Exception e) {
//	            // TODO: handle exception
//	            System.out.println(e.getMessage());
//	        }
//	    }
//	    @OnMessage // 클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드
//	    public void onMessage(String message,Session session) {
//	        //logger.info("Message From "+message.split(",")[1] + ": "+message.split(",")[0]);
//	        try {
//	            final Basic basic=session.getBasicRemote();
//	            basic.sendText(message);
//	        }catch (Exception e) {
//	            // TODO: handle exception
//	            System.out.println(e.getMessage());
//	        }
//	        sendAllSessionToMessage(session, message);
//	    }
//	    @OnError // 에러
//	    public void onError(Throwable e,Session session) {
//	        
//	    }
//	    @OnClose // 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드
//	    public void onClose(Session session) {
//	        //logger.info("Session "+session.getId()+" has ended");
//	        sessionList.remove(session);
//	    }
//	 
//	 
//	 
//}
