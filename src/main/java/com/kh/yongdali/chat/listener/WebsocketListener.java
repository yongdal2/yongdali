package com.kh.yongdali.chat.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.websocket.Decoder;
import javax.websocket.DeploymentException;
import javax.websocket.Encoder;
import javax.websocket.server.ServerContainer;
import javax.websocket.server.ServerEndpointConfig;

import com.kh.yongdali.chat.controller.ProgramicalEnpoint;
import com.kh.yongdali.chat.msg.MessageDecoder;
import com.kh.yongdali.chat.msg.MessageEncoder;

@WebListener
public class WebsocketListener implements ServletContextListener{

	public WebsocketListener() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ServerContainer container=(ServerContainer)sce.getServletContext().getAttribute("javax.websocket.server.ServerContainer");
    	try {
    		container.addEndpoint(getEndpoint());
    		System.out.println("실행"+container);
    	} catch (DeploymentException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}
	
	private ServerEndpointConfig getEndpoint() {
    	//server구성하기
    	ServerEndpointConfig.Builder build=ServerEndpointConfig.Builder.create(ProgramicalEnpoint.class, "/programic");
    	//websocketServerEndpoint객체, mapping주소 등록
    	List<Class<? extends Encoder>> addEncoders=new ArrayList();
    	addEncoders.add(MessageEncoder.class);
    	//객체 전송에 필요한 endcoder등록
    	List<Class<? extends Decoder>> addDecoders=new ArrayList();
    	addDecoders.add(MessageDecoder.class);
    	//객체받을 때 필요한 decoder등록
    	build.encoders(addEncoders);
    	build.decoders(addDecoders);	
    			
    	return build.build();
    }

}
