package com.kh.yongdali.chat.controller;

import java.util.Set;

import javax.websocket.Endpoint;
import javax.websocket.EndpointConfig;
import javax.websocket.MessageHandler;
import javax.websocket.Session;

public class ProgramicalEnpoint extends Endpoint{
	
	private Set<Session> openSession;
	
	public ProgramicalEnpoint() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void onOpen(Session arg0, EndpointConfig arg1) {
		// TODO Auto-generated method stub
		System.out.println("접속함!!");
		openSession=arg0.getOpenSessions();
		for(Session s : openSession) {
			System.out.println(s.getId());
		}
		try {
			//arg0.getBasicRemote().sendObject(new Message("yoo","",arg0.getId()));
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		arg0.addMessageHandler(new MessageHandler.Whole<String>(){
			@Override
			public void onMessage(String msg) {
				try {
					arg0.getBasicRemote().sendText(msg);
					
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		
	}

}
