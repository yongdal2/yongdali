package com.kh.yongdali.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.yongdali.admin.model.service.AdminService;
import com.kh.yongdali.admin.model.vo.Calculate;
import com.kh.yongdali.admin.model.vo.DriSearchCondition;
import com.kh.yongdali.admin.model.vo.MemSearchCondition;
import com.kh.yongdali.admin.model.vo.RefSearchCondition;
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
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) { 
		// 현재 페이지가
		// 필요한데, 없어도
		// 되고, 있으면
		// 기본값 1 . 값은 currentPage로 들어옴.
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


	/**
	 * 환불내역
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
		
		/* System.out.println(list.get(0).getcalcYn()); */
		mv.addObject("pi",pi);
		mv.addObject("list",list);
		mv.setViewName("admin/admin_Refund");

		return mv;
	} 




	/**
	 * 정산내역
	 * @param mv
	 * @param currentPage
	 * @return
	 */
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
	            return "redirect:aRes.ad";
	         } else {
	            return "common/errorPage";
	         }
	      }else {
	         return "common/errorPage";
	      }
	      
	      
	   }
	

	/**
	 * 회원님 검색
	 * @param mv
	 * @param currentPage
	 * @param memberSearch
	 * @param content
	 * @param sc
	 * @return
	 */
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
			/* 등록일자를 검색하는 것보다 정렬하든지 없어도 됨
			 * }else if (memberSearch.equals("		")) { sc.setEnrollDate(content);
			 */
		}

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



	/**
	 * 기사님 검색
	 * @param mv
	 * @param currentPage
	 * @param driverSearch
	 * @param content
	 * @param sc
	 * @return
	 */
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
	
	
	/**
	 * 환불 검색
	 * @param mv
	 * @param currentPage
	 * @param refundSearch
	 * @param content
	 * @param sc
	 * @return
	 */
	@RequestMapping("SearchAdminRefund")
	public ModelAndView SearchAdminRefund(ModelAndView mv,
				@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
				@RequestParam(value = "refundSearch") String refundSearch,
				@RequestParam(value = "content") String content,
				RefSearchCondition sc) {
		
		if(refundSearch.equals("mNo")) {
			sc.setmNo(refundSearch);
		}else if(refundSearch.equals("rNo")) {
			sc.setrNo(refundSearch);
		}else if(refundSearch.equals("email")) {
			sc.setEmail(refundSearch);
		}else if(refundSearch.equals("mName")) {
			sc.setmName(refundSearch);
		}else if(refundSearch.equals("phone")) {
			sc.setPhone(refundSearch);
		}else if(refundSearch.equals("cancAmount")) {
			sc.setCancAmount(refundSearch);
//		}else if (refundSearch.equals("calcDate")) {
//			sc.setCalcDate(refundSearch); 가입일과 똑같음.
//		}
		}
		
		sc.setContent(content);
		
		int pageLimit =5;
		int boardLimit=10;
		
		int listCount = aService.refListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<adRefund> list = aService.searchAdminRefund(sc,pi); 

		System.out.println("searchAdminRefund : " + list);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("admin/admin_Refund");
		return mv;
	}
	
	
	

	/**
	 * 환불내역 환불버튼 ajax
	 * @param response
	 * @param rNo
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping("adminRefund.do")
	public void adminRefund(HttpServletResponse response, @RequestParam(value = "rNo")String rNo) throws JsonIOException, IOException{
		System.out.println(rNo);
		int result = aService.adminRefund(rNo);
		ArrayList<adRefund> list =null;
		if(result > 0) {
			list = aService.adminRefundList();
			System.out.println(list);
		}else {
			
		}
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}


}

