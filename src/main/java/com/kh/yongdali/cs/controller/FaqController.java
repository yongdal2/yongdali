package com.kh.yongdali.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {
	
	@RequestMapping("uFaqView.fa")
	public String userFaqView() {
		return "user/notice/faq";
	}
}
