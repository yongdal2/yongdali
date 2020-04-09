package com.kh.yongdali.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping("uChatView.ch")
	public String userChatView() {
		return "user/userChat";
	}
	
	@RequestMapping("aChatView.ch")
	public String adminChatView() {
		return "admin/adminChat";
	}
}
