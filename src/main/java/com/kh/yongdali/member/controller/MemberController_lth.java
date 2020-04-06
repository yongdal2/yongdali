package com.kh.yongdali.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.common.Notice;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.common.Pagination;
import com.kh.yongdali.member.model.service.MemberService_lth;

@Controller
public class MemberController_lth {
	
	/* 탐희 _공지사항 */
	@Autowired
	private MemberService_lth mServiceL;
	
	@RequestMapping("noticeMain.no")
	public ModelAndView noticeMain(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage ) {
		
		System.out.println(currentPage);
		
		int listCount = mServiceL.getListCount();
		
		System.out.println(listCount);
		
		int pageLimit = 5;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,pageLimit,boardLimit );
		
		ArrayList<Notice> list = mServiceL.selectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("user/notice/notice");
		return mv;
	}
	
	@RequestMapping("ndetail.no")
	public ModelAndView noticeDetail(ModelAndView mv, String nNo, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		Notice n = mServiceL.selectNoticeDetail(nNo);
		
		Notice pre = mServiceL.selectPreList(nNo);
		
		Notice next = mServiceL.selectNextList(nNo);
		
		if(n != null) {
			mv.addObject("n",n).addObject("currentPage",currentPage)
			.addObject("pre",pre).addObject("next",next).setViewName("user/notice/noticeDetailPage");
		}else {
			System.out.println("공지사항 상세 조회 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("ninsertView.no")
	public String noticeInsertView() {
		return "user/notice/noticeForm";
	}
	

	
}
