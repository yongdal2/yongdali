package com.kh.yongdali.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {
	
	/**
	 * 사용자 자주묻는 질문 페이지 연결
	 * @return
	 */
	@RequestMapping("uFaqView.fa")
	public String userFaqView() {
		return "user/notice/faq";
	}
	
	/**
	 * 기사 자주묻는 질문 페이지 연결
	 * @return
	 */
	@RequestMapping("dFaqView.fa")
	public String driverFaqView() {
		return "driver/notice/faq";
	}
}
