package com.kh.yongdali.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.yongdali.chat.model.service.ChatService;
import com.kh.yongdali.chat.msg.Message;
import com.kh.yongdali.chat.msg.Room;

@SessionAttributes("nowRoom")
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
	
	@RequestMapping("userCreateChat.ch")
	@ResponseBody
	public String userCreateChat(Room r, Model model,SessionStatus status) {
		System.out.println(r);
		int result = cService.userCreateChat(r);
		Room nowRoom = cService.selectNowRoom(r);	
		
		if(result > 0) {
			if(nowRoom != null) {
				model.addAttribute("nowRoom", nowRoom);
				System.out.println(nowRoom);
			}
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@RequestMapping("userSendMessage.ch")
	@ResponseBody
	public String userInsertChat(Message m) {
		int result = cService.userInsertMessage(m);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
}
