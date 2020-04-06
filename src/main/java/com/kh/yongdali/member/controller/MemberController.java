package com.kh.yongdali.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("login.me") 
	public String loginView() {
		return "login&signUp/login";
	}

	@RequestMapping("policyChk.me")
	public String policyChk() {
		return "login&signUp/policyChk";
	}

	@RequestMapping("signUpForm.me")
	public String signUpForm() {
		return "login&signUp/signUpForm";
	}
}
