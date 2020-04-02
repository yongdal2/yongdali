package com.kh.yongdali.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController_ssh {

	@RequestMapping("addrBook.mp")
	public String addrBookView() {
		
		return "user/myPage/addressBook";
	}
	
	
	//추후에 home.controller로 이동
	@RequestMapping("information.ydl")
	public String informationView( ) {
		return "user/information";
	}
	
}
