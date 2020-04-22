package com.kh.yongdali.admin.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.admin.model.service.AdminService;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.common.Pagination;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	/**
	 * Member List
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("aMem.ad")
	public ModelAndView adminMemList(ModelAndView mv, //" currentPage" 주의
								@RequestParam(value= "currentPage", required = false, defaultValue = "1") 
								int currentPage) { //현재 페이지가 필요한데, 없어도 되고, 있으면 기본값 1
		
		System.out.println("currentPage : " + currentPage);
		
		int listCount = aService.getMemListCount();
		
		System.out.println("listCount : " + listCount);
		
		
		int pageLimit =5;
		int boardLimit=7;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);
		
		//(int currentPage, int listCount, int pageLimit, int boardLimit)
		
		ArrayList<Member> list = aService.selectMemList(pi);
		System.out.println(list);
		//---------------------------------------------------
		mv.addObject("list", list); 
		mv.addObject("pi", pi);
		mv.setViewName("admin/admin_Mem"); //.jsp
		
		return mv;
		
		
	}

	/**
	 * Driver List
	 * @param mv
	 * @return
	 */
	@RequestMapping("aDri.ad")
	public ModelAndView adminDriList(ModelAndView mv,
									@RequestParam(value = "currentPage", required = false, defaultValue = "1") 
									int currentPage) {
		System.out.println("currentPAge : " + currentPage);
		
		int listCount = aService.getDriListCount();
		
		System.out.println("listCount : " + listCount);
		
		int pageLimit =5;
		int boardLimit=7;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);
		
		ArrayList<Driver> list = aService.selectDriList(pi);
		System.out.println(list);
		//---------------------------------------------------
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("admin/admin_Driver"); //.jsp
		
		return mv;	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//드라이버 계정 계정정보
	@RequestMapping("adminHome.ydl")
	public String adminHomeView1() {
		return "admin/admin";
	}
	
	//회원님 목록
	@RequestMapping("admin_Mem.ydl")
	public String adminHomeView2() {
		return "admin/admin_Mem";
	}
	
	
	
	
	
	//기사님 목록
	@RequestMapping("admin_Driver.ydl")
	public String adminHomeView3() {
		return "admin/admin_Driver";
	}
	
	//예약 내역
	@RequestMapping("admin_Reser.ydl")
	public String adminHomeView4() {
		return "admin/admin_Reser";
	}
	//정산 내역
	@RequestMapping("admin_Cal.ydl")
	public String adminHomeView5() {
		return "admin/admin_Cal";
	}	
	//환불 내역
	@RequestMapping("admin_Refund.ydl")
	public String adminHomeView6() {
		return "admin/admin_Refund";
	}	
	//채팅 내역
	@RequestMapping("admin_ChatLog.ydl")
	public String adminHomeView7() {
		return "admin/admin_ChatLog";
	}	
	
	
	
}
