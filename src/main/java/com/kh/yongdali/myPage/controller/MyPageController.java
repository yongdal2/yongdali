package com.kh.yongdali.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.myPage.model.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService mpService;
	
	@RequestMapping("addrBook1.myp")
	public ModelAndView addrList(ModelAndView mv) {
		
		int listCount = mpService.getAddrListCount();
		System.out.println(listCount);
		
		return mv;
	}
}
