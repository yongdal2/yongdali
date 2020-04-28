package com.kh.yongdali.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yongdali.admin.model.service.AdminService;
import com.kh.yongdali.admin.model.vo.Calculate;
import com.kh.yongdali.admin.model.vo.DriSearchCondition;
import com.kh.yongdali.admin.model.vo.MemSearchCondition;
import com.kh.yongdali.admin.model.vo.adRefund;
import com.kh.yongdali.common.PageInfo;
import com.kh.yongdali.common.Pagination;
import com.kh.yongdali.driver.model.vo.Driver;
import com.kh.yongdali.member.model.vo.Member;
import com.kh.yongdali.reservation.model.vo.Reservation;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;

	/**
	 * Member List
	 * 
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("aMem.ad")
	public ModelAndView adminMemList(ModelAndView mv, // " currentPage" 주의
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) { // 현재 페이지가
		// 필요한데, 없어도
		// 되고, 있으면
		// 기본값 1

		System.out.println("memberCurrentPage : " + currentPage);

		int listCount = aService.getMemListCount();

		System.out.println("memberListCount : " + listCount);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);

		// (int currentPage, int listCount, int pageLimit, int boardLimit)

		ArrayList<Member> list = aService.selectMemList(pi);
		System.out.println("memberList : " + list);
		// ---------------------------------------------------
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("admin/admin_Mem"); // .jsp

		return mv;

	}


	/**
	 * Driver List
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("aDri.ad")
	public ModelAndView adminDriList(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		System.out.println("driverCurrentPage : " + currentPage);

		int listCount = aService.getDriListCount();

		System.out.println("driverListCount : " + listCount);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<Driver> list = aService.selectDriList(pi);
		System.out.println("driverList : " + list);
		// ---------------------------------------------------
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("admin/admin_Driver"); // .jsp

		return mv;
	}



	// 드라이버 계정 계정정보
	@RequestMapping("adminHome.ydl")
	public String adminHomeView1() {
		return "admin/admin";
	}

	// 회원님 목록
	@RequestMapping("admin_Mem.ydl")
	public String adminHomeView2() {
		return "admin/admin_Mem";
	}

	// 기사님 목록
	@RequestMapping("admin_Driver.ydl")
	public String adminHomeView3() {
		return "admin/admin_Driver";
	}

	// 예약 내역
	@RequestMapping("aRes.ad")
	public ModelAndView adminReserView(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		int listCount = aService.reserCount();

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);
		ArrayList<Reservation> list = aService.reserList(pi);

		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("admin/admin_Reser");
		return mv;
	}

	// 환불 내역
	//	@RequestMapping("admin_Refund.ydl")
	//	public String adminHomeView6() {
	//		return "admin/admin_Refund";
	//	}

	/**
	 * admin Refund list
	 * @param mv
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("adRef.ad")
	public ModelAndView adminRefundView(ModelAndView mv, 
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		System.out.println("refundCurrentPage : " + currentPage);
		int listCount = aService.refundCount();
		System.out.println("refundlistCount : " + listCount);
		//======================================


		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);
		ArrayList<adRefund> list = aService.adRefundList(pi);
		mv.addObject("pi",pi);
		mv.addObject("list",list);
		mv.setViewName("admin/admin_Refund");

		return mv;
	} 




	// 채팅 내역
	@RequestMapping("admin_ChatLog.ydl")
	public String adminHomeView7() {
		return "admin/admin_ChatLog";
	}

	@RequestMapping("aJung.ad")
	public ModelAndView jungsanView(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		int listCount = aService.getJungListCount();

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<Calculate> list = aService.calList(pi);

		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("admin/admin_Cal");
		return mv;
	}

	/*
	 * @RequestMapping("Jungsan.do") public String jungsan(String rNo) {
	 * 
	 * int result = aService.jungsan(rNo);
	 * 
	 * if (result > 0) { // 나의 예약페이지로 이동 return "admin/admin_Reser"; } else { return
	 * "common/errorPage"; } }
	 */

	@RequestMapping("Jungsan.do")
	   public String jungsan(String rNo) {

	      int result1 = aService.jungsan(rNo);

	      if(result1>0) {
	         int result2 = aService.junsan2(rNo);
	         
	         if (result2 > 0) {
	            return "admin/admin_Reser";
	         } else {
	            return "common/errorPage";
	         }
	      }else {
	         return "common/errorPage";
	      }
	      
	      
	   }
	

	@RequestMapping("SearchAdminMember")
	public ModelAndView SearchAdminMember(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "memberSearch") String memberSearch, 
			@RequestParam(value = "content") String content,
			MemSearchCondition sc) {

		System.out.println(memberSearch);
		System.out.println(content);


		if(memberSearch.equals("mNo")) {
			sc.setmNo(memberSearch); //content

		}else if(memberSearch.equals("mId")){
			sc.setmId(memberSearch);
		}else if(memberSearch.equals("pwd")) {
			sc.setPwd(memberSearch);
		}else if (memberSearch.equals("mName")) {
			sc.setmName(memberSearch);
		}else if (memberSearch.equals("phone")) {
			sc.setPhone(memberSearch);
		}else if (memberSearch.equals("mSort")) {
			sc.setmSort(memberSearch);
		}else if (memberSearch.equals("mStatus")) {
			sc.setmStatus(memberSearch);
		}else if (memberSearch.equals("signupType")) {
			sc.setSignupType(memberSearch);
		}else if (memberSearch.equals("pushEnabled")) {
			sc.setPushEnabled(memberSearch);
		}
		//		}else if (memberSearch.equals("enrollDate")) {
		//			sc.setEnrollDate(content); DATE타입..
		//		}

		sc.setContent(content);

		int pageLimit = 5;
		int boardLimit = 10;

		int listCount = aService.getMemListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<Member> list = aService.searchMemberList(pi, sc);

		System.out.println("searchMemberlist : " + list);

		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("admin/admin_Mem");
		return mv;
	}



	@RequestMapping("SearchAdminDriver")
	public ModelAndView SearchAdminDriver(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "driverSearch") String driverSearch,
			@RequestParam(value = "content") String content,
			DriSearchCondition sc) {

		if(driverSearch.equals("dNo")) {
			sc.setdNo(driverSearch);
		}else if(driverSearch.equals("dmNo")) {
			sc.setDmNo(driverSearch);
		}else if(driverSearch.equals("mName")) {
			sc.setmName(driverSearch);
		}else if(driverSearch.equals("capacity")) {
			sc.setCapacity(driverSearch);
		}else if(driverSearch.equals("type")) {
			sc.setType(driverSearch);
		}else if(driverSearch.equals("carNo")) {
			sc.setCarNo(driverSearch);
		}

		sc.setContent(content);


		int pageLimit =5;
		int boardLimit=10;

		int listCount = aService.getDriListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<Driver> list = aService.searchDriverList(sc,pi); 

		System.out.println("searchDriverlist : " + list);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("admin/admin_Driver");
		return mv; 

	}




}

