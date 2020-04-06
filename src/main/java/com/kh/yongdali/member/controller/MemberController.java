package com.kh.yongdali.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.yongdali.member.model.service.MemberService;
import com.kh.yongdali.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("loginView.me") 
	public String loginView() {
		return "login&signUp/login";
	}

	@RequestMapping("policyView.me")
	public String policyChk() {
		return "login&signUp/policyChk";
	}

	@RequestMapping("signUpView.me")
	public String signUpForm() {
		return "login&signUp/signUpForm";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(@ModelAttribute Member m, Model model) {
		logger.debug(m.getmId());
		Member loginUser = mService.loginMember(m); 
		
		System.out.println(loginUser);
		
		return null;
	}
}
