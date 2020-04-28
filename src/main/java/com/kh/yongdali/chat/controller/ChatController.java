package com.kh.yongdali.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.yongdali.chat.model.service.ChatService;
import com.kh.yongdali.chat.msg.Message;
import com.kh.yongdali.chat.msg.Room;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.common.Pagination;
import com.kh.yongdali.cs.model.vo.Notice;

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
	
	/**
	 * 사용자 채팅방 생성
	 * @param r
	 * @param model
	 * @param session
	 * @return
	 */
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
	
	
	/**
	 * 메시지 보내기
	 * @param m
	 * @return
	 */
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
	
	/**
	 * 현재 방에 이전 메시지 있는지 
	 * @param response
	 * @param r
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping(value="chkPreMessage.ch")
	public void preMessageChk(HttpServletResponse response, Room r) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		System.out.println("r: " + r);
		Room preRoom = cService.selectPreRoom(r);
		System.out.println("preRoom : " + preRoom );
		Map message = new HashMap();
		
		if(preRoom != null) {
			ArrayList<Message> m = cService.selectPreMessage(preRoom.getRoomNo());
			message.put("msg",m);
			message.put("roomNo",preRoom.getRoomNo());
		}else {
			String nullRoom = "nullRoom";
			message.put("nullRoom",nullRoom);
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(message,response.getWriter());
		
		
	}
	
	/**
	 * 관리자 채팅방 내에서 사용자 채팅방 메시지 찾기
	 * @param response
	 * @param r
	 * @throws IOException 
	 * @throws JsonIOException 
	 */
	@RequestMapping(value="adChkPreMessage.ch")
	public void adPreMessageChk(HttpServletResponse response, Room r) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		System.out.println("관리자채팅방 내 사용자방번호 : " + r.getRoomNo());
		ArrayList<Message> preMsg = cService.selectPreMessage(r.getRoomNo());
		Map message = new HashMap();
		if(!preMsg.isEmpty()) {
			message.put("preMsg", preMsg);			
		}else {
			String nullMsg = "nullMsg";
			message.put("nullMsg", nullMsg);
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(message, response.getWriter());
	}
	
	/**
	 * 관리자 채팅방 내 채팅 리스트들 불러오기
	 * @param response
	 * @param r
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping(value="adChkPreRoom.ch")
	public void adPreRoomChk(HttpServletResponse response, Room r) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<Room> preRoom = cService.selectAdPreRoom(r);
		System.out.println("관리자 preRoom : " + preRoom);
		Map room1 = new HashMap();
		if(!preRoom.isEmpty()) {
			room1.put("preRoom", preRoom);
		}else {
			String nullRoom ="nullRoom";
			room1.put("nullRoom", nullRoom);
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(room1, response.getWriter());
		
	}
	
	
	
}
