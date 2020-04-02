package com.kh.yongdali.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.member.model.service.MemberService_lth;

@Controller
public class MemberController_lth {
	
	/* 탐희 _공지사항 */
//	@Autowired
//	private MemberService_lth mServiceL;
//	
//	@RequestMapping("noticeMain.no")
//	public ModelAndView noticeMain(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage ) {
//		
//		System.out.println(currentPage);
//		
//		int listCount = mServiceL.getListCount();
//		
//		System.out.println(listCount);
//		
//		return mv;
//	}
	
	@RequestMapping("noticeMain.no")
	public String noticeMain() {
		return "user/notice/notice";
	}
	
}
