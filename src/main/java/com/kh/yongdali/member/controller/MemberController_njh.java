package com.kh.yongdali.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController_njh {
	
	@RequestMapping("home.do")
	public String home() {
		return "user/home";
	}
	
	@RequestMapping("reservation.do")
	public String reservation() {
		return "user/reservation";
	}
}
