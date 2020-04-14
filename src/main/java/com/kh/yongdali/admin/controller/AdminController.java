package com.kh.yongdali.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	//드라이버 계정 계정정보
	@RequestMapping("adminHome.ydl")
	public String adminHomeView1() {
		return "admin/admin";
	}
	
	//회원님 목록
	@RequestMapping("admin_Mem.ydl")
	public String adminHomeView2() {
		return "admin/admin_Mem";
	}
	//기사님 목록
	@RequestMapping("admin_Driver.ydl")
	public String adminHomeView3() {
		return "admin/admin_Driver";
	}
	
	//예약 내역
	@RequestMapping("admin_Reser.ydl")
	public String adminHomeView4() {
		return "admin/admin_Reser";
	}
	//정산 내역
	@RequestMapping("admin_Cal.ydl")
	public String adminHomeView5() {
		return "admin/admin_Cal";
	}	
	//환불 내역
	@RequestMapping("admin_Refund.ydl")
	public String adminHomeView6() {
		return "admin/admin_Refund";
	}	
	//채팅 내역
	@RequestMapping("admin_ChatLog.ydl")
	public String adminHomeView7() {
		return "admin/admin_ChatLog";
	}	
	
	
	
}
