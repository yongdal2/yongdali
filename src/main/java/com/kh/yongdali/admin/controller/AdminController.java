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
	//회원정보
	@RequestMapping("admin_Mem.ydl")
	public String adminHomeView2() {
		return "admin/admin_Mem";
	}
	 
}
