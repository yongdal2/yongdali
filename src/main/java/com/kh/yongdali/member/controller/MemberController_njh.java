package com.kh.yongdali.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.yongdali.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController_njh {
	@RequestMapping("home.do")
	public String home(Model model) {
		Member mem = (Member)model.getAttribute("loginUser");
		if(mem != null) {
			if(mem.getmSort().equals("사업자") ) {
				return "driver/driverMain";
			}else {
				return "user/home";
			}
		}else {
			return "user/home";
		}
	}
	
	
	@RequestMapping("reservation.do")
	public String reservation() {
		return "user/reservation";
	}
}
