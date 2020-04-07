package com.kh.yongdali.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.yongdali.member.model.service.MemberService;
import com.kh.yongdali.member.model.vo.Member;

@SessionAttributes("loginUser")

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
		logger.debug("로그인을 시도한 회원 아이디 : " + m.getmId());
		Member loginUser = mService.loginMember(m); 
//		System.out.println(loginUser);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
//			return "redirect:index.jsp";

		}else {
			model.addAttribute("msg","로그인 실패!");
			return "common/errorPage";
		}	
	}
	
	@RequestMapping("logout.me")
	public String memberLogout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:home.do";
	}
	
}
