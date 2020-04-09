package com.kh.yongdali.chat.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class WebSocketConfig implements WebSocketConfigurer{

	@Autowired
	private EchoHandler echoHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(echoHandler, "/echo").setAllowedOrigins("*").withSockJS()
		.setInterceptors(new HttpSessionHandshakeInterceptor())
		.setClientLibraryUrl("http://localhost:8080/resources/js/sockjs.js");
	}

}
