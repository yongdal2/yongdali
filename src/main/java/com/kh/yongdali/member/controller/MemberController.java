package com.kh.yongdali.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("policyChk.me")
	public String policyChk() {
		return "login&signUp/policyChk";
	}
	
//	@RequestMapping("login&signUp.me")
//	public String 
}
