package com.kh.yongdali.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.yongdali.chat.model.service.ChatService;
import com.kh.yongdali.chat.msg.Message;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@RequestMapping("uChatView.ch")
	public String userChatView() {
		return "user/userChat";
	}
	
	@RequestMapping("aChatView.ch")
	public String adminChatView() {
		return "admin/adminChat";
	}
	
//	@RequestMapping("userSendChat.ch")
//	public String userInsertChat(Message m) {
//		int result = cService.userInsertChat(m);
//		
//	}
	
	@RequestMapping("userCreateChat.ch")
	public String userCreateChat(Message m) {
		int result = cService.userCreateChat(m);
		return "";
	}
	
}
