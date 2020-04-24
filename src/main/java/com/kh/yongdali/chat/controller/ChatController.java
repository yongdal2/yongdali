package com.kh.yongdali.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String userCreateChat(Room r, Model model,HttpSession session) {
		
		
		// 현재 로그인한 아이디로 생성된 채팅방이 있는지 여부를 체크
		// 만약에 있으면 Roomno를 반환
		Room preRoom = cService.selectPreRoom(r);
		System.out.println(preRoom);
		if(preRoom != null) {
			return preRoom.getRoomNo();
		}else {
			int result = cService.userCreateChat(r);
			if(result > 0) {
				Room nowRoom = cService.selectNowRoom(r);		
				return nowRoom.getRoomNo();
			}else {
				return "fail";
			}
			
		}
		
		// 없으면 cService.userCreateChat(r)
		// 무조건 생성되는 
		
		//방금 생성한 방 가져오기
		//Room nowRoom = cService.selectNowRoom(r);	
		
		//if(result > 0) {
//			if(nowRoom != null) {
//				session.setAttribute("nowRoom", nowRoom);
//				/* model.addAttribute("nowRoom", nowRoom); */
//				System.out.println("NOW: "+ nowRoom);
//			}
		//	return nowRoom.getRoomNo();
		//}else {
		//	return "fail";
		//}
		//return "CR17";
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
